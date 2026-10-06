package org.techhub.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.techhub.model.Property;
import org.techhub.service.PropertyService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/property")
public class PropertyController {

    private PropertyService propertyService;

    public PropertyController(
            PropertyService propertyService) {

        this.propertyService = propertyService;
    }

    // =========================
    // ADMIN - ADD PROPERTY
    // =========================

    @GetMapping("/add")
    public String showAddPropertyForm(
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        model.addAttribute(
                "property",
                new Property());

        return "propertyForm";
    }

    // =========================
    // ADMIN - SAVE PROPERTY
    // =========================

    @PostMapping("/save")
    public String saveProperty(
            Property property,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        String error =
                validateProperty(property);

        if (error != null) {

            model.addAttribute(
                    "error",
                    error);

            model.addAttribute(
                    "property",
                    property);

            return "propertyForm";
        }

        propertyService.addProperty(property);

        return "redirect:/property/list";
    }

    // =========================
    // ADMIN - LIST PROPERTIES
    // =========================

    @GetMapping("/list")
    public String getAllProperties(
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        List<Property> properties =
                propertyService.getAllProperties();

        model.addAttribute(
                "properties",
                properties);

        return "properties";
    }

    // =========================
    // ADMIN - EDIT PROPERTY
    // =========================

    @GetMapping("/edit")
    public String editProperty(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        Property property =
                propertyService.getPropertyById(id);

        if (property == null) {

            return "redirect:/property/list";
        }

        model.addAttribute(
                "property",
                property);

        return "propertyForm";
    }

    // =========================
    // ADMIN - UPDATE PROPERTY
    // =========================

    @PostMapping("/update")
    public String updateProperty(
            Property property,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        String error =
                validateProperty(property);

        if (error != null) {

            model.addAttribute(
                    "error",
                    error);

            model.addAttribute(
                    "property",
                    property);

            return "propertyForm";
        }

        propertyService.updateProperty(property);

        return "redirect:/property/list";
    }

    // =========================
    // ADMIN - DELETE PROPERTY
    // =========================

    @GetMapping("/delete")
    public String deleteProperty(
            @RequestParam("id") int id,
            Model model,
            HttpSession session) {

        if (session.getAttribute(
                "adminUsername") == null) {

            return "redirect:/admin/login";
        }

        try {

            propertyService.deleteProperty(id);

            return "redirect:/property/list";

        } catch (Exception e) {

            List<Property> properties =
                    propertyService.getAllProperties();

            model.addAttribute(
                    "properties",
                    properties);

            model.addAttribute(
                    "error",
                    "Property cannot be deleted because rooms are already linked to this property.");

            return "properties";
        }
    }

    // =========================
    // PROPERTY VALIDATION
    // =========================

    private String validateProperty(
            Property property) {

        // =========================
        // PROPERTY NAME
        // =========================

        if (property.getPropertyName() == null ||
                property.getPropertyName()
                        .trim()
                        .isEmpty()) {

            return "Property name is required.";
        }

        String propertyName =
                property.getPropertyName().trim();

        if (propertyName.length() < 2) {

            return "Property name must contain at least 2 characters.";
        }

        if (propertyName.length() > 100) {

            return "Property name must not exceed 100 characters.";
        }

        property.setPropertyName(propertyName);

        // =========================
        // ADDRESS
        // =========================

        if (property.getAddress() == null ||
                property.getAddress()
                        .trim()
                        .isEmpty()) {

            return "Property address is required.";
        }

        String address =
                property.getAddress().trim();

        if (address.length() > 255) {

            return "Property address must not exceed 255 characters.";
        }

        property.setAddress(address);

        // =========================
        // OWNER NAME
        // =========================

        if (property.getOwnerName() == null ||
                property.getOwnerName()
                        .trim()
                        .isEmpty()) {

            return "Owner name is required.";
        }

        String ownerName =
                property.getOwnerName().trim();

        if (ownerName.length() < 2) {

            return "Owner name must contain at least 2 characters.";
        }

        if (ownerName.length() > 100) {

            return "Owner name must not exceed 100 characters.";
        }

        if (!ownerName.matches(
                "^[A-Za-z ]+$")) {

            return "Owner name can contain only letters and spaces.";
        }

        property.setOwnerName(ownerName);

        // =========================
        // CONTACT NUMBER
        // =========================

        if (property.getContactNumber() == null ||
                property.getContactNumber()
                        .trim()
                        .isEmpty()) {

            return "Contact number is required.";
        }

        String contactNumber =
                property.getContactNumber().trim();

        if (!contactNumber.matches(
                "^[0-9]{10}$")) {

            return "Contact number must contain exactly 10 digits.";
        }

        property.setContactNumber(contactNumber);

        return null;
    }
}