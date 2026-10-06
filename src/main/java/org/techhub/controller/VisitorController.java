package org.techhub.controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Visitor;
import org.techhub.service.StudentService;
import org.techhub.service.VisitorService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/visitor")
public class VisitorController {

    private VisitorService visitorService;
    private StudentService studentService;

    // =====================================================
    // CONSTRUCTOR
    // =====================================================

    public VisitorController(
            VisitorService visitorService,
            StudentService studentService) {

        this.visitorService = visitorService;
        this.studentService = studentService;
    }

    // =====================================================
    // ADMIN - ADD VISITOR
    // =====================================================

    @GetMapping("/add")
    public String showAddVisitorForm(
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        model.addAttribute(
                "visitor",
                new Visitor());

        model.addAttribute(
                "students",
                studentService.getAllStudents());

        return "visitorForm";
    }

    // =====================================================
    // ADMIN - SAVE VISITOR
    // =====================================================

    @PostMapping("/save")
    public String saveVisitor(
            @RequestParam("studentId") int studentId,
            @RequestParam("visitorName") String visitorName,
            @RequestParam("relation") String relation,
            @RequestParam("entryTime") String entryTime,
            @RequestParam(
                    value = "exitTime",
                    required = false) String exitTime,
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        // =================================================
        // DIAGNOSTIC OUTPUT
        // =================================================

        System.out.println("========== VISITOR SAVE ==========");
        System.out.println("Student ID : " + studentId);
        System.out.println("Visitor    : " + visitorName);
        System.out.println("Relation   : " + relation);
        System.out.println("Entry Time : " + entryTime);
        System.out.println("Exit Time  : " + exitTime);
        System.out.println("==================================");

        try {

            Visitor visitor = new Visitor();

            visitor.setStudentId(studentId);
            visitor.setVisitorName(visitorName);
            visitor.setRelation(relation);

            // Convert HTML datetime-local value
            // Example: 2026-09-18T15:30
            if (entryTime != null
                    && !entryTime.trim().isEmpty()) {

                visitor.setEntryTime(
                        Timestamp.valueOf(
                                convertDateTime(entryTime)));
            }

            if (exitTime != null
                    && !exitTime.trim().isEmpty()) {

                visitor.setExitTime(
                        Timestamp.valueOf(
                                convertDateTime(exitTime)));
            }

            // =================================================
            // VALIDATION
            // =================================================

            String error =
                    validateVisitor(visitor);

            if (error != null) {

                loadVisitorFormData(
                        model,
                        visitor);

                model.addAttribute(
                        "error",
                        error);

                return "visitorForm";
            }

            // =================================================
            // SAVE
            // =================================================

            int result =
                    visitorService.addVisitor(visitor);

            if (result <= 0) {

                loadVisitorFormData(
                        model,
                        visitor);

                model.addAttribute(
                        "error",
                        "Unable to save visitor.");

                return "visitorForm";
            }

            return "redirect:/visitor/list";

        } catch (IllegalArgumentException e) {

            e.printStackTrace();

            Visitor visitor =
                    new Visitor();

            visitor.setStudentId(studentId);
            visitor.setVisitorName(visitorName);
            visitor.setRelation(relation);

            loadVisitorFormData(
                    model,
                    visitor);

            model.addAttribute(
                    "error",
                    "Invalid date/time format. Please select a valid date and time.");

            return "visitorForm";

        } catch (Exception e) {

            e.printStackTrace();

            Visitor visitor =
                    new Visitor();

            visitor.setStudentId(studentId);
            visitor.setVisitorName(visitorName);
            visitor.setRelation(relation);

            loadVisitorFormData(
                    model,
                    visitor);

            model.addAttribute(
                    "error",
                    "Unable to save visitor: "
                            + e.getMessage());

            return "visitorForm";
        }
    }

    // =====================================================
    // ADMIN - LIST VISITORS
    // =====================================================

    @GetMapping("/list")
    public String getAllVisitors(
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        List<Visitor> visitors =
                visitorService.getAllVisitors();

        model.addAttribute(
                "visitors",
                visitors);

        model.addAttribute(
                "students",
                studentService.getAllStudents());

        return "visitors";
    }

    // =====================================================
    // STUDENT - MY VISITORS
    // =====================================================

    @GetMapping("/my")
    public String getMyVisitors(
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

        List<Visitor> visitors =
                visitorService.getVisitorsByStudentId(
                        studentId);

        model.addAttribute(
                "visitors",
                visitors);

        return "studentVisitors";
    }

    // =====================================================
    // STUDENT - ADD VISITOR
    // =====================================================

    @GetMapping("/student/add")
    public String showStudentVisitorForm(
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

        Visitor visitor =
                new Visitor();

        visitor.setStudentId(studentId);

        model.addAttribute(
                "visitor",
                visitor);

        return "studentVisitorForm";
    }

    // =====================================================
    // STUDENT - SAVE VISITOR
    // =====================================================

    @PostMapping("/student/save")
    public String saveStudentVisitor(
            @RequestParam("visitorName") String visitorName,
            @RequestParam("relation") String relation,
            @RequestParam("entryTime") String entryTime,
            @RequestParam(
                    value = "exitTime",
                    required = false) String exitTime,
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

        System.out.println("========== STUDENT VISITOR SAVE ==========");
        System.out.println("Student ID : " + studentId);
        System.out.println("Visitor    : " + visitorName);
        System.out.println("Relation   : " + relation);
        System.out.println("Entry Time : " + entryTime);
        System.out.println("Exit Time  : " + exitTime);
        System.out.println("==========================================");

        try {

            Visitor visitor =
                    new Visitor();

            visitor.setStudentId(studentId);
            visitor.setVisitorName(visitorName);
            visitor.setRelation(relation);

            if (entryTime != null
                    && !entryTime.trim().isEmpty()) {

                visitor.setEntryTime(
                        Timestamp.valueOf(
                                convertDateTime(entryTime)));
            }

            if (exitTime != null
                    && !exitTime.trim().isEmpty()) {

                visitor.setExitTime(
                        Timestamp.valueOf(
                                convertDateTime(exitTime)));
            }

            String error =
                    validateVisitor(visitor);

            if (error != null) {

                model.addAttribute(
                        "visitor",
                        visitor);

                model.addAttribute(
                        "error",
                        error);

                return "studentVisitorForm";
            }

            int result =
                    visitorService.addVisitor(visitor);

            if (result <= 0) {

                model.addAttribute(
                        "visitor",
                        visitor);

                model.addAttribute(
                        "error",
                        "Unable to save visitor.");

                return "studentVisitorForm";
            }

            return "redirect:/visitor/my";

        } catch (Exception e) {

            e.printStackTrace();

            Visitor visitor =
                    new Visitor();

            visitor.setStudentId(studentId);
            visitor.setVisitorName(visitorName);
            visitor.setRelation(relation);

            model.addAttribute(
                    "visitor",
                    visitor);

            model.addAttribute(
                    "error",
                    "Unable to save visitor: "
                            + e.getMessage());

            return "studentVisitorForm";
        }
    }

    // =====================================================
    // ADMIN - EDIT VISITOR
    // =====================================================

    @GetMapping("/edit")
    public String editVisitor(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        Visitor visitor =
                visitorService.getVisitorById(id);

        if (visitor == null) {
            return "redirect:/visitor/list";
        }

        model.addAttribute(
                "visitor",
                visitor);

        model.addAttribute(
                "students",
                studentService.getAllStudents());

        return "visitorForm";
    }

    // =====================================================
    // ADMIN - UPDATE VISITOR
    // =====================================================

    @PostMapping("/update")
    public String updateVisitor(
            @RequestParam("id") int id,
            @RequestParam("studentId") int studentId,
            @RequestParam("visitorName") String visitorName,
            @RequestParam("relation") String relation,
            @RequestParam("entryTime") String entryTime,
            @RequestParam(
                    value = "exitTime",
                    required = false) String exitTime,
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        try {

            Visitor visitor =
                    new Visitor();

            visitor.setId(id);
            visitor.setStudentId(studentId);
            visitor.setVisitorName(visitorName);
            visitor.setRelation(relation);

            if (entryTime != null
                    && !entryTime.trim().isEmpty()) {

                visitor.setEntryTime(
                        Timestamp.valueOf(
                                convertDateTime(entryTime)));
            }

            if (exitTime != null
                    && !exitTime.trim().isEmpty()) {

                visitor.setExitTime(
                        Timestamp.valueOf(
                                convertDateTime(exitTime)));
            }

            String error =
                    validateVisitor(visitor);

            if (error != null) {

                loadVisitorFormData(
                        model,
                        visitor);

                model.addAttribute(
                        "error",
                        error);

                return "visitorForm";
            }

            int result =
                    visitorService.updateVisitor(
                            visitor);

            if (result <= 0) {

                loadVisitorFormData(
                        model,
                        visitor);

                model.addAttribute(
                        "error",
                        "Unable to update visitor.");

                return "visitorForm";
            }

            return "redirect:/visitor/list";

        } catch (Exception e) {

            e.printStackTrace();

            Visitor visitor =
                    new Visitor();

            visitor.setId(id);
            visitor.setStudentId(studentId);
            visitor.setVisitorName(visitorName);
            visitor.setRelation(relation);

            loadVisitorFormData(
                    model,
                    visitor);

            model.addAttribute(
                    "error",
                    "Unable to update visitor: "
                            + e.getMessage());

            return "visitorForm";
        }
    }

    // =====================================================
    // ADMIN - DELETE VISITOR
    // =====================================================

    @GetMapping("/delete")
    public String deleteVisitor(
            @RequestParam("id") int id,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        visitorService.deleteVisitor(id);

        return "redirect:/visitor/list";
    }

    // =====================================================
    // LOAD VISITOR FORM DATA
    // =====================================================

    private void loadVisitorFormData(
            Model model,
            Visitor visitor) {

        model.addAttribute(
                "visitor",
                visitor);

        model.addAttribute(
                "students",
                studentService.getAllStudents());
    }

    // =====================================================
    // DATE/TIME CONVERSION
    // =====================================================

    private String convertDateTime(
            String value) {

        if (value == null
                || value.trim().isEmpty()) {

            return null;
        }

        // HTML datetime-local:
        // 2026-09-18T15:30
        //
        // Timestamp.valueOf requires:
        // 2026-09-18 15:30:00

        if (value.length() == 16
                && value.charAt(10) == 'T') {

            return value.replace(
                    'T',
                    ' ') + ":00";
        }

        return value.replace(
                'T',
                ' ');
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
    // VISITOR VALIDATION
    // =====================================================

    private String validateVisitor(
            Visitor visitor) {

        // 1. STUDENT

        if (visitor.getStudentId() <= 0) {

            return "Please select a valid student.";
        }

        if (studentService.getStudentById(
                visitor.getStudentId()) == null) {

            return "Selected student does not exist.";
        }

        // 2. VISITOR NAME

        if (visitor.getVisitorName() == null
                || visitor.getVisitorName()
                        .trim()
                        .isEmpty()) {

            return "Visitor name is required.";
        }

        if (visitor.getVisitorName()
                .trim()
                .length() > 100) {

            return "Visitor name must not exceed 100 characters.";
        }

        // 3. RELATION

        if (visitor.getRelation() == null
                || visitor.getRelation()
                        .trim()
                        .isEmpty()) {

            return "Visitor relation is required.";
        }

        if (visitor.getRelation()
                .trim()
                .length() > 50) {

            return "Visitor relation must not exceed 50 characters.";
        }

        // 4. ENTRY TIME

        if (visitor.getEntryTime() == null) {

            return "Entry time is required.";
        }

        // 5. EXIT TIME

        Timestamp entryTime =
                visitor.getEntryTime();

        Timestamp exitTime =
                visitor.getExitTime();

        if (exitTime != null) {

            if (!exitTime.after(entryTime)) {

                return "Exit time must be after entry time.";
            }
        }

        return null;
    }
}