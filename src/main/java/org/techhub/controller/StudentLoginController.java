package org.techhub.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.techhub.model.Student;
import org.techhub.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/student")
public class StudentLoginController {

    @Autowired
    private StudentService studentService;


    // ================= STUDENT LOGIN PAGE =================

    @GetMapping("/login")
    public String login(Model model) {

        model.addAttribute("student", new Student());

        return "studentLogin";
    }


    // ================= STUDENT LOGIN =================

    @PostMapping("/login")
    public String loginStudent(
            Student student,
            Model model,
            HttpSession session) {

        Student existingStudent =
                studentService.getStudentByEmail(
                        student.getEmail());

        if (existingStudent != null) {

            // Create student session
            session.setAttribute(
                    "studentId",
                    existingStudent.getId());

            session.setAttribute(
                    "studentName",
                    existingStudent.getName());

            session.setAttribute(
                    "studentEmail",
                    existingStudent.getEmail());

            // Redirect to student dashboard
            return "redirect:/student/dashboard";
        }

        model.addAttribute(
                "error",
                "Student not found. Please check your email.");

        model.addAttribute(
                "student",
                student);

        return "studentLogin";
    }


    // ================= STUDENT LOGOUT =================

    @GetMapping("/logout")
    public String logout(HttpSession session) {

        // Remove student session completely
        session.invalidate();

        return "redirect:/student/login";
    }
}