package org.techhub.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Complaint;
import org.techhub.service.ComplaintService;
import org.techhub.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/complaint")
public class ComplaintController {


private ComplaintService complaintService;

private StudentService studentService;


// =====================================================
// CONSTRUCTOR
// =====================================================

public ComplaintController(
        ComplaintService complaintService,
        StudentService studentService) {

    this.complaintService =
            complaintService;

    this.studentService =
            studentService;
}


// =====================================================
// ADMIN - LIST COMPLAINTS
// ADMIN CAN ONLY VIEW AND HANDLE COMPLAINTS
// =====================================================

@GetMapping("/list")
public String getAllComplaints(
        Model model,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    List<Complaint> complaints =
            complaintService
            .getAllComplaints();


    model.addAttribute(
            "complaints",
            complaints);


    model.addAttribute(
            "students",
            studentService
            .getAllStudents());


    return "complaints";
}


// =====================================================
// ADMIN - UPDATE COMPLAINT STATUS
// =====================================================

@PostMapping("/status")
public String updateComplaintStatus(
        @RequestParam("id") int id,
        @RequestParam("status") String status,
        Model model,
        HttpSession session) {

    if (!isAdminLoggedIn(session)) {

        return "redirect:/admin/login";
    }


    // =========================
    // VALIDATE STATUS
    // =========================

    if (!"Open".equals(status)
            && !"In_Progress".equals(status)
            && !"Resolved".equals(status)) {

        model.addAttribute(
                "error",
                "Invalid complaint status.");

        return loadAdminComplaints(
                model,
                session);
    }


    // =========================
    // GET EXISTING COMPLAINT
    // =========================

    Complaint complaint =
            complaintService
            .getComplaintById(id);


    if (complaint == null) {

        model.addAttribute(
                "error",
                "Complaint not found.");

        return loadAdminComplaints(
                model,
                session);
    }


    // =========================
    // UPDATE ONLY STATUS
    // =========================

    complaint.setStatus(status);


    int result =
            complaintService
            .updateComplaint(complaint);


    if (result <= 0) {

        model.addAttribute(
                "error",
                "Unable to update complaint status.");

        return loadAdminComplaints(
                model,
                session);
    }


    model.addAttribute(
            "message",
            "Complaint status updated successfully.");


    return loadAdminComplaints(
            model,
            session);
}


// =====================================================
// STUDENT - MY COMPLAINTS
// =====================================================

@GetMapping("/my")
public String getMyComplaints(
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
    // STUDENT COMPLAINTS
    // =========================

    List<Complaint> complaints =
            complaintService
            .getComplaintsByStudentId(
                    studentId);


    model.addAttribute(
            "complaints",
            complaints);


    return "studentComplaints";
}


// =====================================================
// STUDENT - ADD COMPLAINT
// =====================================================

@GetMapping("/student/add")
public String showStudentComplaintForm(
        Model model,
        HttpSession session) {

    // =========================
    // STUDENT LOGIN CHECK
    // =========================

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


    Complaint complaint =
            new Complaint();


    // Always use logged-in student's ID
    complaint.setStudentId(studentId);


    // New student complaints are Open
    complaint.setStatus("Open");


    model.addAttribute(
            "complaint",
            complaint);


    return "studentComplaintForm";
}


// =====================================================
// STUDENT - SAVE COMPLAINT
// =====================================================

@PostMapping("/student/save")
public String saveStudentComplaint(
        Complaint complaint,
        Model model,
        HttpSession session) {

    // =========================
    // STUDENT LOGIN CHECK
    // =========================

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


    // =========================
    // ALWAYS USE LOGGED-IN
    // STUDENT ID
    // =========================

    complaint.setStudentId(studentId);


    // =========================
    // NEW COMPLAINTS ARE OPEN
    // =========================

    complaint.setStatus("Open");


    // =========================
    // VALIDATE COMPLAINT
    // =========================

    String error =
            validateComplaint(complaint);


    if (error != null) {

        model.addAttribute(
                "complaint",
                complaint);


        model.addAttribute(
                "error",
                error);


        return "studentComplaintForm";
    }


    // =========================
    // SAVE COMPLAINT
    // =========================

    int result =
            complaintService
            .addComplaint(complaint);


    if (result <= 0) {

        model.addAttribute(
                "complaint",
                complaint);


        model.addAttribute(
                "error",
                "Unable to submit complaint.");


        return "studentComplaintForm";
    }


    return "redirect:/complaint/my";
}


// =====================================================
// ADMIN - LOAD COMPLAINTS
// =====================================================

private String loadAdminComplaints(
        Model model,
        HttpSession session) {

    List<Complaint> complaints =
            complaintService
            .getAllComplaints();


    model.addAttribute(
            "complaints",
            complaints);


    model.addAttribute(
            "students",
            studentService
            .getAllStudents());


    return "complaints";
}


// =====================================================
// SECURITY HELPERS
// =====================================================

private boolean isAdminLoggedIn(
        HttpSession session) {

    return session.getAttribute(
            "adminUsername") != null;
}


private boolean isStudentLoggedIn(
        HttpSession session) {

    return session.getAttribute(
            "studentId") != null;
}


// =====================================================
// COMPLAINT VALIDATION
// =====================================================

private String validateComplaint(
        Complaint complaint) {

    // =========================
    // 1. VALIDATE STUDENT
    // =========================

    if (complaint.getStudentId() <= 0) {

        return "Please select a valid student.";
    }


    if (studentService.getStudentById(
            complaint.getStudentId()) == null) {

        return "Selected student does not exist.";
    }


    // =========================
    // 2. VALIDATE CATEGORY
    // =========================

    if (complaint.getCategory() == null
            || complaint.getCategory()
                    .trim()
                    .isEmpty()) {

        return "Complaint category is required.";
    }


    if (complaint.getCategory()
            .trim()
            .length() > 50) {

        return "Complaint category must not exceed 50 characters.";
    }


    // =========================
    // 3. VALIDATE DESCRIPTION
    // =========================

    if (complaint.getDescription() == null
            || complaint.getDescription()
                    .trim()
                    .isEmpty()) {

        return "Complaint description is required.";
    }


    if (complaint.getDescription()
            .trim()
            .length() > 255) {

        return "Complaint description must not exceed 255 characters.";
    }


    // =========================
    // 4. VALIDATE STATUS
    // =========================

    if (complaint.getStatus() == null
            || complaint.getStatus()
                    .trim()
                    .isEmpty()) {

        return "Complaint status is required.";
    }


    if (!"Open".equals(
                complaint.getStatus())
            && !"In_Progress".equals(
                complaint.getStatus())
            && !"Resolved".equals(
                complaint.getStatus())) {

        return "Invalid complaint status.";
    }


    return null;
}

}
