package org.techhub.repository;

public interface AdminDashboardRepository {

    int getTotalStudents();

    int getTotalProperties();

    int getTotalRooms();

    int getTotalAllocations();

    int getPendingPayments();

    int getOpenComplaints();

    // Room Status
    int getAvailableRooms();

    int getFullRooms();

    // Payment Status
    int getPaidPayments();

    int getPendingPaymentRecords();

    // Complaint Status
    int getOpenComplaintRecords();

    int getInProgressComplaints();

    int getResolvedComplaints();

    // Visitor Status
    int getActiveVisitors();

}