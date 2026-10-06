package org.techhub.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.RoomAllocation;
import org.techhub.service.PropertyService;
import org.techhub.service.RoomAllocationService;
import org.techhub.service.RoomService;
import org.techhub.service.StudentService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/allocation")
public class RoomAllocationController {

    private RoomAllocationService allocationService;
    private StudentService studentService;
    private RoomService roomService;
    private PropertyService propertyService;

    public RoomAllocationController(
            RoomAllocationService allocationService,
            StudentService studentService,
            RoomService roomService,
            PropertyService propertyService) {

        this.allocationService = allocationService;
        this.studentService = studentService;
        this.roomService = roomService;
        this.propertyService = propertyService;
    }

    // =========================
    // ADD ALLOCATION FORM
    // =========================

    @GetMapping("/add")
    public String showAddAllocationForm(
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        model.addAttribute(
                "allocation",
                new RoomAllocation());

        model.addAttribute(
                "students",
                studentService.getAllStudents());

        model.addAttribute(
                "rooms",
                roomService.getAllRooms());

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());

        return "allocationForm";
    }


    // =========================
    // SAVE ALLOCATION
    // =========================

    @PostMapping("/save")
    public String saveAllocation(
            @RequestParam("studentId") int studentId,
            @RequestParam("roomId") int roomId,
            @RequestParam("allocationDate") String allocationDate,
            @RequestParam(
                    value = "checkoutDate",
                    required = false) String checkoutDate,
            @RequestParam("status") String status,
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        System.out.println("========== ALLOCATION SAVE ==========");
        System.out.println("Student ID     : " + studentId);
        System.out.println("Room ID        : " + roomId);
        System.out.println("Allocation Date: " + allocationDate);
        System.out.println("Checkout Date  : " + checkoutDate);
        System.out.println("Status         : " + status);
        System.out.println("=====================================");

        try {

            RoomAllocation allocation =
                    new RoomAllocation();

            allocation.setStudentId(studentId);
            allocation.setRoomId(roomId);

            Date allocationSqlDate =
                    Date.valueOf(allocationDate);

            allocation.setAllocationDate(
                    allocationSqlDate);

            if (checkoutDate != null
                    && !checkoutDate.trim().isEmpty()) {

                Date checkoutSqlDate =
                        Date.valueOf(checkoutDate);

                allocation.setCheckoutDate(
                        checkoutSqlDate);
            }

            allocation.setStatus(status);


            // Check date
            if (allocation.getCheckoutDate() != null
                    && allocation.getCheckoutDate()
                            .before(allocation.getAllocationDate())) {

                loadAllocationFormData(
                        model,
                        allocation);

                model.addAttribute(
                        "error",
                        "Checkout date cannot be before allocation date.");

                return "allocationForm";
            }


            // Save allocation
            int result =
                    allocationService.addAllocation(
                            allocation);


            if (result <= 0) {

                loadAllocationFormData(
                        model,
                        allocation);

                List<RoomAllocation> studentAllocations =
                        allocationService
                                .getAllocationsByStudentId(
                                        allocation.getStudentId());

                boolean hasActiveAllocation =
                        false;

                for (RoomAllocation existingAllocation
                        : studentAllocations) {

                    if ("Active".equals(
                            existingAllocation.getStatus())) {

                        hasActiveAllocation = true;
                        break;
                    }
                }


                if (hasActiveAllocation) {

                    model.addAttribute(
                            "error",
                            "This student already has an active room allocation.");

                } else {

                    model.addAttribute(
                            "error",
                            "Selected room is full or does not exist.");
                }

                return "allocationForm";
            }

            return "redirect:/allocation/list";

        } catch (IllegalArgumentException e) {

            e.printStackTrace();

            RoomAllocation allocation =
                    new RoomAllocation();

            allocation.setStudentId(studentId);
            allocation.setRoomId(roomId);
            allocation.setStatus(status);

            loadAllocationFormData(
                    model,
                    allocation);

            model.addAttribute(
                    "error",
                    "Invalid date format. Please select a valid date.");

            return "allocationForm";

        } catch (Exception e) {

            e.printStackTrace();

            RoomAllocation allocation =
                    new RoomAllocation();

            allocation.setStudentId(studentId);
            allocation.setRoomId(roomId);
            allocation.setStatus(status);

            loadAllocationFormData(
                    model,
                    allocation);

            model.addAttribute(
                    "error",
                    "Unable to save allocation: "
                            + e.getMessage());

            return "allocationForm";
        }
    }


    // =========================
    // LIST ALLOCATIONS
    // =========================

    @GetMapping("/list")
    public String getAllAllocations(
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        List<RoomAllocation> allocations =
                allocationService.getAllAllocations();

        model.addAttribute(
                "allocations",
                allocations);

        model.addAttribute(
                "students",
                studentService.getAllStudents());

        model.addAttribute(
                "rooms",
                roomService.getAllRooms());

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());

        return "allocations";
    }


    // =========================
    // STUDENT ALLOCATIONS
    // =========================

    @GetMapping("/my")
    public String getMyAllocations(
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

        List<RoomAllocation> allocations =
                allocationService
                        .getAllocationsByStudentId(
                                studentId);

        model.addAttribute(
                "allocations",
                allocations);

        model.addAttribute(
                "rooms",
                roomService.getAllRooms());

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());

        return "studentAllocations";
    }


    // =========================
    // EDIT ALLOCATION
    // =========================

    @GetMapping("/edit")
    public String editAllocation(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        RoomAllocation allocation =
                allocationService.getAllocationById(id);

        if (allocation == null) {
            return "redirect:/allocation/list";
        }

        model.addAttribute(
                "allocation",
                allocation);

        model.addAttribute(
                "students",
                studentService.getAllStudents());

        model.addAttribute(
                "rooms",
                roomService.getAllRooms());

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());

        return "allocationForm";
    }


    // =========================
    // UPDATE ALLOCATION
    // =========================

    @PostMapping("/update")
    public String updateAllocation(
            @RequestParam("id") int id,
            @RequestParam("studentId") int studentId,
            @RequestParam("roomId") int roomId,
            @RequestParam("allocationDate") String allocationDate,
            @RequestParam(
                    value = "checkoutDate",
                    required = false) String checkoutDate,
            @RequestParam("status") String status,
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        try {

            RoomAllocation allocation =
                    new RoomAllocation();

            allocation.setId(id);
            allocation.setStudentId(studentId);
            allocation.setRoomId(roomId);

            allocation.setAllocationDate(
                    Date.valueOf(allocationDate));

            if (checkoutDate != null
                    && !checkoutDate.trim().isEmpty()) {

                allocation.setCheckoutDate(
                        Date.valueOf(checkoutDate));
            }

            allocation.setStatus(status);


            if (allocation.getCheckoutDate() != null
                    && allocation.getCheckoutDate()
                            .before(allocation.getAllocationDate())) {

                loadAllocationFormData(
                        model,
                        allocation);

                model.addAttribute(
                        "error",
                        "Checkout date cannot be before allocation date.");

                return "allocationForm";
            }


            int result =
                    allocationService
                            .updateAllocation(
                                    allocation);


            if (result <= 0) {

                loadAllocationFormData(
                        model,
                        allocation);

                List<RoomAllocation> studentAllocations =
                        allocationService
                                .getAllocationsByStudentId(
                                        allocation.getStudentId());

                boolean hasActiveAllocation =
                        false;

                for (RoomAllocation existingAllocation
                        : studentAllocations) {

                    if (existingAllocation.getId()
                            != allocation.getId()
                            && "Active".equals(
                                    existingAllocation.getStatus())) {

                        hasActiveAllocation = true;
                        break;
                    }
                }


                if (hasActiveAllocation) {

                    model.addAttribute(
                            "error",
                            "This student already has another active room allocation.");

                } else {

                    model.addAttribute(
                            "error",
                            "Unable to update allocation. Check room capacity or room details.");
                }

                return "allocationForm";
            }

            return "redirect:/allocation/list";

        } catch (Exception e) {

            e.printStackTrace();

            RoomAllocation allocation =
                    new RoomAllocation();

            allocation.setId(id);
            allocation.setStudentId(studentId);
            allocation.setRoomId(roomId);
            allocation.setStatus(status);

            loadAllocationFormData(
                    model,
                    allocation);

            model.addAttribute(
                    "error",
                    "Unable to update allocation: "
                            + e.getMessage());

            return "allocationForm";
        }
    }


    // =========================
    // DELETE ALLOCATION
    // =========================

    @GetMapping("/delete")
    public String deleteAllocation(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {

        if (!isAdminLoggedIn(session)) {
            return "redirect:/admin/login";
        }

        try {

            allocationService.deleteAllocation(id);

            return "redirect:/allocation/list";

        } catch (Exception e) {

            List<RoomAllocation> allocations =
                    allocationService.getAllAllocations();

            model.addAttribute(
                    "allocations",
                    allocations);

            model.addAttribute(
                    "students",
                    studentService.getAllStudents());

            model.addAttribute(
                    "rooms",
                    roomService.getAllRooms());

            model.addAttribute(
                    "properties",
                    propertyService.getAllProperties());

            model.addAttribute(
                    "error",
                    "Allocation cannot be deleted because rent payment records are linked to this allocation.");

            return "allocations";
        }
    }


    // =========================
    // LOAD FORM DATA
    // =========================

    private void loadAllocationFormData(
            Model model,
            RoomAllocation allocation) {

        model.addAttribute(
                "allocation",
                allocation);

        model.addAttribute(
                "students",
                studentService.getAllStudents());

        model.addAttribute(
                "rooms",
                roomService.getAllRooms());

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());
    }


    // =========================
    // SESSION CHECKS
    // =========================

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
}