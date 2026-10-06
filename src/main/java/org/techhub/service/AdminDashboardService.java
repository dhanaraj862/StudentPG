package org.techhub.service;

public interface AdminDashboardService {

    // =====================================================
    // BASIC COUNTS
    // =====================================================

    int getTotalStudents();

    int getTotalProperties();

    int getTotalRooms();

    int getTotalAllocations();

    int getPendingPayments();

    int getOpenComplaints();


    // =====================================================
    // ROOM STATUS
    // =====================================================

    int getAvailableRooms();

    int getFullRooms();


    // =====================================================
    // PAYMENT STATUS
    // =====================================================

    int getPaidPayments();

    int getPendingPaymentRecords();


    // =====================================================
    // COMPLAINT STATUS
    // =====================================================

    int getOpenComplaintRecords();

    int getInProgressComplaints();

    int getResolvedComplaints();


    // =====================================================
    // VISITOR STATUS
    // =====================================================

    int getActiveVisitors();

}