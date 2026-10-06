package org.techhub.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.techhub.model.Admin;
import org.techhub.service.AdminDashboardService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private AdminDashboardService adminDashboardService;

    public AdminController(
            AdminDashboardService adminDashboardService) {

        this.adminDashboardService =
                adminDashboardService;
    }


    // =====================================================
    // ADMIN LOGIN PAGE
    // =====================================================

    @GetMapping("/login")
    public String showLoginPage(Model model) {

        model.addAttribute(
                "admin",
                new Admin());

        return "adminLogin";
    }


    // =====================================================
    // ADMIN LOGIN
    // =====================================================

    @PostMapping("/login")
    public String loginAdmin(
            Admin admin,
            Model model,
            HttpSession session) {

        if ("admin".equals(admin.getUsername())
                && "admin".equals(admin.getPassword())) {

            session.setAttribute(
                    "adminUsername",
                    admin.getUsername());

            return "redirect:/admin/dashboard";
        }


        model.addAttribute(
                "error",
                "Invalid username or password");

        model.addAttribute(
                "admin",
                admin);

        return "adminLogin";
    }


    // =====================================================
    // ADMIN DASHBOARD
    // =====================================================

    @GetMapping("/dashboard")
    public String showDashboard(
            Model model,
            HttpSession session) {

        // Check Admin Login
        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }


        // =================================================
        // BASIC COUNTS
        // =================================================

        int totalStudents =
                adminDashboardService
                        .getTotalStudents();

        int totalProperties =
                adminDashboardService
                        .getTotalProperties();

        int totalRooms =
                adminDashboardService
                        .getTotalRooms();

        int totalAllocations =
                adminDashboardService
                        .getTotalAllocations();

        int pendingPayments =
                adminDashboardService
                        .getPendingPayments();

        int openComplaints =
                adminDashboardService
                        .getOpenComplaints();


        // =================================================
        // ROOM STATUS
        // =================================================

        int availableRooms =
                adminDashboardService
                        .getAvailableRooms();

        int fullRooms =
                adminDashboardService
                        .getFullRooms();


        // =================================================
        // PAYMENT STATUS
        // =================================================

        int paidPayments =
                adminDashboardService
                        .getPaidPayments();

        int pendingPaymentRecords =
                adminDashboardService
                        .getPendingPaymentRecords();


        // =================================================
        // COMPLAINT STATUS
        // =================================================

        int openComplaintRecords =
                adminDashboardService
                        .getOpenComplaintRecords();

        int inProgressComplaints =
                adminDashboardService
                        .getInProgressComplaints();

        int resolvedComplaints =
                adminDashboardService
                        .getResolvedComplaints();


        // =================================================
        // VISITOR STATUS
        // =================================================

        int activeVisitors =
                adminDashboardService
                        .getActiveVisitors();


        // =================================================
        // SEND BASIC COUNTS TO JSP
        // =================================================

        model.addAttribute(
                "totalStudents",
                totalStudents);

        model.addAttribute(
                "totalProperties",
                totalProperties);

        model.addAttribute(
                "totalRooms",
                totalRooms);

        model.addAttribute(
                "totalAllocations",
                totalAllocations);

        model.addAttribute(
                "pendingPayments",
                pendingPayments);

        model.addAttribute(
                "openComplaints",
                openComplaints);


        // =================================================
        // SEND ROOM STATUS TO JSP
        // =================================================

        model.addAttribute(
                "availableRooms",
                availableRooms);

        model.addAttribute(
                "fullRooms",
                fullRooms);


        // =================================================
        // SEND PAYMENT STATUS TO JSP
        // =================================================

        model.addAttribute(
                "paidPayments",
                paidPayments);

        model.addAttribute(
                "pendingPaymentRecords",
                pendingPaymentRecords);


        // =================================================
        // SEND COMPLAINT STATUS TO JSP
        // =================================================

        model.addAttribute(
                "openComplaintRecords",
                openComplaintRecords);

        model.addAttribute(
                "inProgressComplaints",
                inProgressComplaints);

        model.addAttribute(
                "resolvedComplaints",
                resolvedComplaints);


        // =================================================
        // SEND VISITOR STATUS TO JSP
        // =================================================

        model.addAttribute(
                "activeVisitors",
                activeVisitors);


        return "adminDashboard";
    }


    // =====================================================
    // ADMIN LOGOUT
    // =====================================================

    @GetMapping("/logout")
    public String logout(
            HttpSession session) {

        session.invalidate();

        return "redirect:/admin/login";
    }

}