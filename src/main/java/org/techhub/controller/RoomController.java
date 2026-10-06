package org.techhub.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Room;
import org.techhub.service.PropertyService;
import org.techhub.service.RoomService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/room")
public class RoomController {

    private RoomService roomService;

    private PropertyService propertyService;

    // =========================
    // CONSTRUCTOR
    // =========================

    public RoomController(
            RoomService roomService,
            PropertyService propertyService) {

        this.roomService =
                roomService;

        this.propertyService =
                propertyService;
    }

    // =========================
    // ADMIN - ADD ROOM
    // =========================

    @GetMapping("/add")
    public String showAddRoomForm(
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        model.addAttribute(
                "room",
                new Room());

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());

        return "roomForm";
    }

    // =========================
    // ADMIN - SAVE ROOM
    // =========================

    @PostMapping("/save")
    public String saveRoom(
            Room room,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        // =========================
        // VALIDATE CAPACITY
        // =========================

        if (room.getCapacity() <= 0) {

            model.addAttribute(
                    "room",
                    room);

            model.addAttribute(
                    "properties",
                    propertyService.getAllProperties());

            model.addAttribute(
                    "error",
                    "Room capacity must be greater than 0.");

            return "roomForm";
        }

        // =========================
        // VALIDATE RENT
        // =========================

        if (room.getRentAmount() < 0) {

            model.addAttribute(
                    "room",
                    room);

            model.addAttribute(
                    "properties",
                    propertyService.getAllProperties());

            model.addAttribute(
                    "error",
                    "Rent amount cannot be negative.");

            return "roomForm";
        }

        roomService.addRoom(room);

        return "redirect:/room/list";
    }

    // =========================
    // ADMIN - LIST ROOMS
    // =========================

    @GetMapping("/list")
    public String getAllRooms(
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        List<Room> rooms =
                roomService.getAllRooms();

        model.addAttribute(
                "rooms",
                rooms);

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());

        return "rooms";
    }

    // =========================
    // ADMIN - EDIT ROOM
    // =========================

    @GetMapping("/edit")
    public String editRoom(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        Room room =
                roomService.getRoomById(id);

        if (room == null) {

            return "redirect:/room/list";
        }

        model.addAttribute(
                "room",
                room);

        model.addAttribute(
                "properties",
                propertyService.getAllProperties());

        return "roomForm";
    }

    // =========================
    // ADMIN - UPDATE ROOM
    // =========================

    @PostMapping("/update")
    public String updateRoom(
            Room room,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        // =========================
        // VALIDATE CAPACITY
        // =========================

        if (room.getCapacity() <= 0) {

            model.addAttribute(
                    "room",
                    room);

            model.addAttribute(
                    "properties",
                    propertyService.getAllProperties());

            model.addAttribute(
                    "error",
                    "Room capacity must be greater than 0.");

            return "roomForm";
        }

        // =========================
        // VALIDATE RENT
        // =========================

        if (room.getRentAmount() < 0) {

            model.addAttribute(
                    "room",
                    room);

            model.addAttribute(
                    "properties",
                    propertyService.getAllProperties());

            model.addAttribute(
                    "error",
                    "Rent amount cannot be negative.");

            return "roomForm";
        }

        int result =
                roomService.updateRoom(room);

        if (result <= 0) {

            model.addAttribute(
                    "room",
                    room);

            model.addAttribute(
                    "properties",
                    propertyService.getAllProperties());

            model.addAttribute(
                    "error",
                    "Unable to update room.");

            return "roomForm";
        }

        return "redirect:/room/list";
    }

    // =========================
    // ADMIN - DELETE ROOM
    // =========================

    @GetMapping("/delete")
    public String deleteRoom(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        try {

            roomService.deleteRoom(id);

            return "redirect:/room/list";

        } catch (Exception e) {

            List<Room> rooms =
                    roomService.getAllRooms();

            model.addAttribute(
                    "rooms",
                    rooms);

            model.addAttribute(
                    "properties",
                    propertyService.getAllProperties());

            model.addAttribute(
                    "error",
                    "Room cannot be deleted because this room has existing allocation records.");

            return "rooms";
        }
    }
}