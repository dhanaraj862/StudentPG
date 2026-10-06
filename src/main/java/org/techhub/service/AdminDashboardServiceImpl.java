package org.techhub.service;

import org.springframework.stereotype.Service;
import org.techhub.repository.AdminDashboardRepository;

@Service
public class AdminDashboardServiceImpl
        implements AdminDashboardService {

    private AdminDashboardRepository adminDashboardRepo;

    public AdminDashboardServiceImpl(
            AdminDashboardRepository adminDashboardRepo) {

        this.adminDashboardRepo = adminDashboardRepo;
    }


    // =====================================================
    // BASIC COUNTS
    // =====================================================

    @Override
    public int getTotalStudents() {

        return adminDashboardRepo.getTotalStudents();
    }


    @Override
    public int getTotalProperties() {

        return adminDashboardRepo.getTotalProperties();
    }


    @Override
    public int getTotalRooms() {

        return adminDashboardRepo.getTotalRooms();
    }


    @Override
    public int getTotalAllocations() {

        return adminDashboardRepo.getTotalAllocations();
    }


    @Override
    public int getPendingPayments() {

        return adminDashboardRepo.getPendingPayments();
    }


    @Override
    public int getOpenComplaints() {

        return adminDashboardRepo.getOpenComplaints();
    }


    // =====================================================
    // ROOM STATUS
    // =====================================================

    @Override
    public int getAvailableRooms() {

        return adminDashboardRepo.getAvailableRooms();
    }


    @Override
    public int getFullRooms() {

        return adminDashboardRepo.getFullRooms();
    }


    // =====================================================
    // PAYMENT STATUS
    // =====================================================

    @Override
    public int getPaidPayments() {

        return adminDashboardRepo.getPaidPayments();
    }


    @Override
    public int getPendingPaymentRecords() {

        return adminDashboardRepo
                .getPendingPaymentRecords();
    }


    // =====================================================
    // COMPLAINT STATUS
    // =====================================================

    @Override
    public int getOpenComplaintRecords() {

        return adminDashboardRepo
                .getOpenComplaintRecords();
    }


    @Override
    public int getInProgressComplaints() {

        return adminDashboardRepo
                .getInProgressComplaints();
    }


    @Override
    public int getResolvedComplaints() {

        return adminDashboardRepo
                .getResolvedComplaints();
    }


    // =====================================================
    // VISITOR STATUS
    // =====================================================

    @Override
    public int getActiveVisitors() {

        return adminDashboardRepo
                .getActiveVisitors();
    }

}