package org.techhub.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.RentPayment;
import org.techhub.model.RoomAllocation;
import org.techhub.service.RentPaymentService;
import org.techhub.service.RoomAllocationService;
import org.techhub.service.RoomService;
import org.techhub.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/payment")
public class RentPaymentController {


private RentPaymentService paymentService;

private RoomAllocationService allocationService;

private StudentService studentService;

private RoomService roomService;


// =====================================================
// CONSTRUCTOR
// =====================================================

public RentPaymentController(
        RentPaymentService paymentService,
        RoomAllocationService allocationService,
        StudentService studentService,
        RoomService roomService) {

    this.paymentService = paymentService;

    this.allocationService = allocationService;

    this.studentService = studentService;

    this.roomService = roomService;
}


// =====================================================
// ADMIN - ADD PAYMENT FORM
// =====================================================

@GetMapping("/add")
public String showAddPaymentForm(
        Model model,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    model.addAttribute(
            "payment",
            new RentPayment());


    loadPaymentFormData(model);


    return "paymentForm";
}


// =====================================================
// ADMIN - SAVE PAYMENT
// =====================================================

@PostMapping("/save")
public String savePayment(
        RentPayment payment,
        Model model,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    String error =
            validatePayment(payment);


    if (error != null) {

        model.addAttribute(
                "payment",
                payment);


        loadPaymentFormData(model);


        model.addAttribute(
                "error",
                error);


        return "paymentForm";
    }


    int result =
            paymentService.addPayment(payment);


    if (result <= 0) {

        model.addAttribute(
                "payment",
                payment);


        loadPaymentFormData(model);


        model.addAttribute(
                "error",
                "Unable to save payment.");


        return "paymentForm";
    }


    return "redirect:/payment/list";
}


// =====================================================
// ADMIN - PAYMENT LIST
// =====================================================

@GetMapping("/list")
public String getAllPayments(
        Model model,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    List<RentPayment> payments =
            paymentService.getAllPayments();


    model.addAttribute(
            "payments",
            payments);


    loadPaymentFormData(model);


    return "payments";
}


// =====================================================
// STUDENT - MY PAYMENTS
// =====================================================

@GetMapping("/my")
public String getMyPayments(
        Model model,
        HttpSession session) {

    // =========================
    // STUDENT LOGIN CHECK
    // =========================

    if (!isStudentLoggedIn(session)) {

        return "redirect:/student/login";
    }


    // =========================
    // GET STUDENT ID
    // ONLY FROM SESSION
    // =========================

    Integer studentId =
            (Integer) session.getAttribute(
                    "studentId");


    if (studentId == null) {

        session.invalidate();

        return "redirect:/student/login";
    }


    // =========================
    // GET ONLY LOGGED-IN
    // STUDENT PAYMENTS
    // =========================

    List<RentPayment> payments =
            paymentService
            .getPaymentsByStudentId(
                    studentId);


    // =========================
    // LOAD ALLOCATIONS
    // REQUIRED TO FIND ROOM
    // =========================

    List<RoomAllocation> allocations =
            allocationService
            .getAllAllocations();


    // =========================
    // LOAD ROOMS
    // REQUIRED TO GET RENT
    // =========================

    model.addAttribute(
            "payments",
            payments);


    model.addAttribute(
            "allocations",
            allocations);


    model.addAttribute(
            "rooms",
            roomService.getAllRooms());


    return "studentPayments";
}


// =====================================================
// ADMIN - EDIT PAYMENT
// =====================================================

@GetMapping("/edit")
public String editPayment(
        @RequestParam("id") int id,
        Model model,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    RentPayment payment =
            paymentService
            .getPaymentById(id);


    if (payment == null) {

        return "redirect:/payment/list";
    }


    model.addAttribute(
            "payment",
            payment);


    loadPaymentFormData(model);


    return "paymentForm";
}


// =====================================================
// ADMIN - UPDATE PAYMENT
// =====================================================

@PostMapping("/update")
public String updatePayment(
        RentPayment payment,
        Model model,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    String error =
            validatePayment(payment);


    if (error != null) {

        model.addAttribute(
                "payment",
                payment);


        loadPaymentFormData(model);


        model.addAttribute(
                "error",
                error);


        return "paymentForm";
    }


    int result =
            paymentService
            .updatePayment(payment);


    if (result <= 0) {

        model.addAttribute(
                "payment",
                payment);


        loadPaymentFormData(model);


        model.addAttribute(
                "error",
                "Unable to update payment.");


        return "paymentForm";
    }


    return "redirect:/payment/list";
}


// =====================================================
// ADMIN - DELETE PAYMENT
// =====================================================

@GetMapping("/delete")
public String deletePayment(
        @RequestParam("id") int id,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    paymentService.deletePayment(id);


    return "redirect:/payment/list";
}


// =====================================================
// PAYMENT VALIDATION
// =====================================================

private String validatePayment(
        RentPayment payment) {


    // =========================
    // 1. CHECK ALLOCATION
    // =========================

    if (payment.getAllocationId() <= 0) {

        return "Please select a valid room allocation.";
    }


    // =========================
    // 2. GET ALLOCATION
    // =========================

    RoomAllocation allocation =
            allocationService
            .getAllocationById(
                    payment.getAllocationId());


    // =========================
    // 3. CHECK ALLOCATION EXISTS
    // =========================

    if (allocation == null) {

        return "Selected room allocation does not exist.";
    }


    // =========================
    // 4. PAYMENT ONLY FOR
    // ACTIVE ALLOCATION
    // =========================

    if (!"Active".equals(
            allocation.getStatus())) {

        return "Payment can only be added for an active room allocation.";
    }


    // =========================
    // 5. CHECK AMOUNT
    // =========================

    if (payment.getAmount() <= 0) {

        return "Payment amount must be greater than ₹0.";
    }


    // =========================
    // 6. CHECK PAYMENT DATE
    // =========================

    if (payment.getPaymentDate() == null) {

        return "Payment date is required.";
    }


    // =========================
    // 7. CHECK MONTH/YEAR
    // =========================

    if (payment.getMonthYear() == null
            || payment.getMonthYear()
                    .trim()
                    .isEmpty()) {

        return "Month and Year is required.";
    }


    // =========================
    // 8. CHECK PAYMENT STATUS
    // =========================

    if (payment.getPaymentStatus() == null
            || payment.getPaymentStatus()
                    .trim()
                    .isEmpty()) {

        return "Payment status is required.";
    }


    // =========================
    // 9. ALLOW ONLY
    // PAID OR PENDING
    // =========================

    if (!"Paid".equals(
                payment.getPaymentStatus())
            && !"Pending".equals(
                payment.getPaymentStatus())) {

        return "Invalid payment status.";
    }


    // =========================
    // 10. DUPLICATE PAYMENT
    // CHECK
    // =========================

    if (payment.getId() <= 0) {


        // ADD PAYMENT

        int count =
                paymentService
                .getPaymentCountByAllocationAndMonth(
                        payment.getAllocationId(),
                        payment.getMonthYear()
                                .trim());


        if (count > 0) {

            return "A payment for this allocation and month/year already exists.";
        }


    } else {


        // UPDATE PAYMENT

        int count =
                paymentService
                .getPaymentCountByAllocationAndMonthExcludingId(
                        payment.getAllocationId(),
                        payment.getMonthYear()
                                .trim(),
                        payment.getId());


        if (count > 0) {

            return "A payment for this allocation and month/year already exists.";
        }
    }


    return null;
}


// =====================================================
// ADMIN LOGIN CHECK
// =====================================================

private boolean isAdminLoggedIn(
        HttpSession session) {

    return session.getAttribute(
            "adminUsername") != null;
}


// =====================================================
// STUDENT LOGIN CHECK
// =====================================================

private boolean isStudentLoggedIn(
        HttpSession session) {

    return session.getAttribute(
            "studentId") != null;
}


// =====================================================
// LOAD PAYMENT FORM DATA
// =====================================================

private void loadPaymentFormData(
        Model model) {

    model.addAttribute(
            "allocations",
            allocationService
            .getAllAllocations());


    model.addAttribute(
            "students",
            studentService
            .getAllStudents());


    model.addAttribute(
            "rooms",
            roomService
            .getAllRooms());
}

}
