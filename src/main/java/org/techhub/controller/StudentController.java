package org.techhub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Student;
import org.techhub.model.RoomAllocation;
import org.techhub.model.RentPayment;
import org.techhub.model.Complaint;
import org.techhub.model.Visitor;

import org.techhub.service.StudentService;
import org.techhub.service.RoomAllocationService;
import org.techhub.service.RentPaymentService;
import org.techhub.service.ComplaintService;
import org.techhub.service.VisitorService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private RoomAllocationService allocationService;

    @Autowired
    private RentPaymentService paymentService;

    @Autowired
    private ComplaintService complaintService;

    @Autowired
    private VisitorService visitorService;


    // =====================================================
    // ADMIN - STUDENT MANAGEMENT
    // =====================================================


    // =====================================================
    // ADD STUDENT PAGE
    // =====================================================

    @GetMapping("/add")
    public String addStudentPage(
            Model model,
            HttpSession session) {

        if (session.getAttribute("adminUsername") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute(
                "student",
                new Student());

        return "studentForm";
    }


    // =====================================================
    // SAVE STUDENT
    // =====================================================

    @PostMapping("/save")
    public String saveStudent(
            Student student,
            Model model,
            HttpSession session) {

        if (session.getAttribute("adminUsername") == null) {
            return "redirect:/admin/login";
        }

        // Validate student
        String validationError =
                validateStudent(student);

        if (validationError != null) {

            model.addAttribute(
                    "error",
                    validationError);

            model.addAttribute(
                    "student",
                    student);

            return "studentForm";
        }


        // Clean and normalize email
        student.setEmail(
                student.getEmail()
                        .trim()
                        .toLowerCase());


        // Check duplicate email
        if (studentService
                .getStudentCountByEmail(
                        student.getEmail()) > 0) {

            model.addAttribute(
                    "error",
                    "Email address is already registered.");

            model.addAttribute(
                    "student",
                    student);

            return "studentForm";
        }


        // Clean other fields
        student.setName(
                student.getName().trim());

        student.setMobile(
                student.getMobile().trim());

        if (student.getGuardianMobile() != null) {

            student.setGuardianMobile(
                    student.getGuardianMobile().trim());
        }

        if (student.getAddress() != null) {

            student.setAddress(
                    student.getAddress().trim());
        }

        if (student.getIdProof() != null) {

            student.setIdProof(
                    student.getIdProof().trim());
        }


        studentService.addStudent(student);

        return "redirect:/student/list";
    }


    // =====================================================
    // STUDENT LIST
    // =====================================================

    @GetMapping("/list")
    public String listStudents(
            Model model,
            HttpSession session) {

        if (session.getAttribute("adminUsername") == null) {
            return "redirect:/admin/login";
        }

        List<Student> students =
                studentService.getAllStudents();

        model.addAttribute(
                "students",
                students);

        return "students";
    }


    // =====================================================
    // EDIT STUDENT
    // ADMIN + STUDENT
    // =====================================================

    @GetMapping("/edit")
    public String editStudent(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {


        // -------------------------------------------------
        // ADMIN CAN EDIT ANY STUDENT
        // -------------------------------------------------

        if (session.getAttribute("adminUsername") != null) {

            Student student =
                    studentService.getStudentById(id);

            if (student == null) {
                return "redirect:/student/list";
            }

            model.addAttribute(
                    "student",
                    student);

            return "studentForm";
        }


        // -------------------------------------------------
        // STUDENT CAN EDIT ONLY OWN PROFILE
        // -------------------------------------------------

        if (!isStudentLoggedIn(session)) {
            return "redirect:/student/login";
        }


        Integer studentId =
                (Integer) session.getAttribute(
                        "studentId");


        if (studentId == null
                || studentId != id) {

            return "redirect:/student/profile";
        }


        Student student =
                studentService.getStudentById(id);


        if (student == null) {
            return "redirect:/student/profile";
        }


        model.addAttribute(
                "student",
                student);

        return "studentForm";
    }


    // =====================================================
    // UPDATE STUDENT
    // =====================================================

    @PostMapping("/update")
    public String updateStudent(
            Student student,
            Model model,
            HttpSession session) {


        boolean isAdmin =
                session.getAttribute(
                        "adminUsername") != null;


        boolean isStudent =
                isStudentLoggedIn(session);


        // Neither admin nor student is logged in
        if (!isAdmin && !isStudent) {
            return "redirect:/student/login";
        }


        // -------------------------------------------------
        // STUDENT CAN UPDATE ONLY OWN PROFILE
        // -------------------------------------------------

        if (isStudent && !isAdmin) {

            Integer studentId =
                    (Integer) session.getAttribute(
                            "studentId");


            if (studentId == null
                    || studentId != student.getId()) {

                return "redirect:/student/profile";
            }
        }


        // -------------------------------------------------
        // VALIDATE STUDENT
        // -------------------------------------------------

        String validationError =
                validateStudent(student);


        if (validationError != null) {

            model.addAttribute(
                    "error",
                    validationError);

            model.addAttribute(
                    "student",
                    student);

            return "studentForm";
        }


        // -------------------------------------------------
        // NORMALIZE EMAIL
        // -------------------------------------------------

        student.setEmail(
                student.getEmail()
                        .trim()
                        .toLowerCase());


        // -------------------------------------------------
        // CHECK DUPLICATE EMAIL
        // EXCLUDING CURRENT STUDENT
        // -------------------------------------------------

        if (studentService
                .getStudentCountByEmailExcludingId(
                        student.getEmail(),
                        student.getId()) > 0) {

            model.addAttribute(
                    "error",
                    "Email address is already registered by another student.");

            model.addAttribute(
                    "student",
                    student);

            return "studentForm";
        }


        // -------------------------------------------------
        // CLEAN OTHER FIELDS
        // -------------------------------------------------

        student.setName(
                student.getName().trim());

        student.setMobile(
                student.getMobile().trim());

        if (student.getGuardianMobile() != null) {

            student.setGuardianMobile(
                    student.getGuardianMobile().trim());
        }

        if (student.getAddress() != null) {

            student.setAddress(
                    student.getAddress().trim());
        }

        if (student.getIdProof() != null) {

            student.setIdProof(
                    student.getIdProof().trim());
        }


        // -------------------------------------------------
        // UPDATE DATABASE
        // -------------------------------------------------

        studentService.updateStudent(student);


        // -------------------------------------------------
        // UPDATE SESSION
        // -------------------------------------------------

        if (isStudent && !isAdmin) {

            session.setAttribute(
                    "studentName",
                    student.getName());

            session.setAttribute(
                    "studentEmail",
                    student.getEmail());
        }


        // -------------------------------------------------
        // REDIRECT
        // -------------------------------------------------

        if (isAdmin) {
            return "redirect:/student/list";
        }


        return "redirect:/student/profile";
    }


    // =====================================================
    // DELETE STUDENT
    // ADMIN ONLY
    // =====================================================

    @GetMapping("/delete")
    public String deleteStudent(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {


        if (session.getAttribute("adminUsername") == null) {
            return "redirect:/admin/login";
        }


        try {

            studentService.deleteStudent(id);

        } catch (Exception e) {

            model.addAttribute(
                    "students",
                    studentService.getAllStudents());

            model.addAttribute(
                    "error",
                    "Student cannot be deleted because related records exist.");

            return "students";
        }


        return "redirect:/student/list";
    }


    // =====================================================
    // STUDENT DASHBOARD
    // =====================================================

    @GetMapping("/dashboard")
    public String studentDashboard(
            Model model,
            HttpSession session) {


        // -------------------------------------------------
        // CHECK STUDENT LOGIN
        // -------------------------------------------------

        if (!isStudentLoggedIn(session)) {
            return "redirect:/student/login";
        }


        // -------------------------------------------------
        // GET LOGGED-IN STUDENT ID
        // -------------------------------------------------

        Integer studentId =
                (Integer) session.getAttribute(
                        "studentId");


        if (studentId == null) {

            session.invalidate();

            return "redirect:/student/login";
        }


        // -------------------------------------------------
        // GET STUDENT DETAILS
        // -------------------------------------------------

        Student student =
                studentService.getStudentById(
                        studentId);


        if (student == null) {

            session.invalidate();

            return "redirect:/student/login";
        }


        // =================================================
        // LOAD DASHBOARD DATA
        // =================================================


        // Room Allocations
        List<RoomAllocation> allocations =
                allocationService
                        .getAllocationsByStudentId(
                                studentId);


        // Rent Payments
        List<RentPayment> payments =
                paymentService
                        .getPaymentsByStudentId(
                                studentId);


        // Complaints
        List<Complaint> complaints =
                complaintService
                        .getComplaintsByStudentId(
                                studentId);


        // Visitors
        List<Visitor> visitors =
                visitorService
                        .getVisitorsByStudentId(
                                studentId);


        // =================================================
        // DASHBOARD COUNTS
        // =================================================


        int totalAllocations =
                allocations != null
                        ? allocations.size()
                        : 0;


        int totalPayments =
                payments != null
                        ? payments.size()
                        : 0;


        int totalComplaints =
                complaints != null
                        ? complaints.size()
                        : 0;


        int totalVisitors =
                visitors != null
                        ? visitors.size()
                        : 0;


        // =================================================
        // CURRENT ROOM
        // =================================================

        RoomAllocation currentRoom = null;


        if (allocations != null) {

            for (RoomAllocation allocation
                    : allocations) {

                if ("Active".equalsIgnoreCase(
                        allocation.getStatus())) {

                    currentRoom = allocation;

                    break;
                }
            }
        }


        // =================================================
        // PAYMENT STATUS
        // =================================================

        int pendingPayments = 0;


        if (payments != null) {

            for (RentPayment payment
                    : payments) {

                if ("Pending".equalsIgnoreCase(
                        payment.getPaymentStatus())) {

                    pendingPayments++;
                }
            }
        }


        // =================================================
        // COMPLAINT STATUS
        // =================================================

        int openComplaints = 0;


        if (complaints != null) {

            for (Complaint complaint
                    : complaints) {

                if ("Open".equalsIgnoreCase(
                        complaint.getStatus())) {

                    openComplaints++;
                }
            }
        }


        // =================================================
        // ACTIVE VISITORS
        // =================================================

        int activeVisitors = 0;


        if (visitors != null) {

            for (Visitor visitor
                    : visitors) {

                if (visitor.getExitTime() == null) {

                    activeVisitors++;
                }
            }
        }


        // =================================================
        // SEND DATA TO JSP
        // =================================================


        model.addAttribute(
                "student",
                student);


        model.addAttribute(
                "allocations",
                allocations);


        model.addAttribute(
                "payments",
                payments);


        model.addAttribute(
                "complaints",
                complaints);


        model.addAttribute(
                "visitors",
                visitors);


        model.addAttribute(
                "totalAllocations",
                totalAllocations);


        model.addAttribute(
                "totalPayments",
                totalPayments);


        model.addAttribute(
                "totalComplaints",
                totalComplaints);


        model.addAttribute(
                "totalVisitors",
                totalVisitors);


        model.addAttribute(
                "currentRoom",
                currentRoom);


        model.addAttribute(
                "pendingPayments",
                pendingPayments);


        model.addAttribute(
                "openComplaints",
                openComplaints);


        model.addAttribute(
                "activeVisitors",
                activeVisitors);


        return "studentDashboard";
    }


    // =====================================================
    // STUDENT PROFILE
    // =====================================================

    @GetMapping("/profile")
    public String studentProfile(
            Model model,
            HttpSession session) {


        if (!isStudentLoggedIn(session)) {
            return "redirect:/student/login";
        }


        Integer studentId =
                (Integer) session.getAttribute(
                        "studentId");


        if (studentId == null) {

            session.invalidate();

            return "redirect:/student/login";
        }


        Student student =
                studentService.getStudentById(
                        studentId);


        if (student == null) {

            session.invalidate();

            return "redirect:/student/login";
        }


        model.addAttribute(
                "student",
                student);


        return "studentProfile";
    }


    // =====================================================
    // STUDENT SECURITY HELPER
    // =====================================================

    private boolean isStudentLoggedIn(
            HttpSession session) {

        return session.getAttribute(
                "studentId") != null;
    }


    // =====================================================
    // STUDENT VALIDATION
    // =====================================================

    private String validateStudent(
            Student student) {


        // =================================================
        // NAME
        // =================================================

        if (student.getName() == null
                || student.getName()
                        .trim()
                        .isEmpty()) {

            return "Student name is required.";
        }


        String name =
                student.getName().trim();


        if (name.length() < 2
                || name.length() > 100) {

            return "Student name must be between 2 and 100 characters.";
        }


        if (!name.matches(
                "[a-zA-Z ]+")) {

            return "Student name can contain only letters and spaces.";
        }


        // =================================================
        // EMAIL
        // =================================================

        if (student.getEmail() == null
                || student.getEmail()
                        .trim()
                        .isEmpty()) {

            return "Email address is required.";
        }


        String email =
                student.getEmail().trim();


        if (email.length() > 100) {

            return "Email address cannot exceed 100 characters.";
        }


        if (!email.matches(
                "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) {

            return "Please enter a valid email address.";
        }


        // =================================================
        // MOBILE
        // =================================================

        if (student.getMobile() == null
                || student.getMobile()
                        .trim()
                        .isEmpty()) {

            return "Mobile number is required.";
        }


        if (!student.getMobile()
                .trim()
                .matches(
                        "\\d{10}")) {

            return "Mobile number must contain exactly 10 digits.";
        }


        // =================================================
        // GUARDIAN MOBILE
        // =================================================

        if (student.getGuardianMobile() != null
                && !student.getGuardianMobile()
                        .trim()
                        .isEmpty()) {


            if (!student.getGuardianMobile()
                    .trim()
                    .matches(
                            "\\d{10}")) {

                return "Guardian mobile number must contain exactly 10 digits.";
            }
        }


        // =================================================
        // ADDRESS
        // =================================================

        if (student.getAddress() != null
                && student.getAddress()
                        .length() > 255) {

            return "Address cannot exceed 255 characters.";
        }


        // =================================================
        // ID PROOF
        // =================================================

        if (student.getIdProof() != null
                && student.getIdProof()
                        .length() > 100) {

            return "ID proof cannot exceed 100 characters.";
        }


        return null;
    }

}