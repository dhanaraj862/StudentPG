package org.techhub.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDashboardRepositoryImpl
        implements AdminDashboardRepository {

    private JdbcTemplate jdbcTemplate;

    public AdminDashboardRepositoryImpl(
            JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;
    }


    // =====================================================
    // BASIC COUNTS
    // =====================================================

    @Override
    public int getTotalStudents() {

        String sql =
                "SELECT COUNT(*) FROM students";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getTotalProperties() {

        String sql =
                "SELECT COUNT(*) FROM properties";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getTotalRooms() {

        String sql =
                "SELECT COUNT(*) FROM rooms";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getTotalAllocations() {

        String sql =
                "SELECT COUNT(*) FROM room_allocations";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getPendingPayments() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM rent_payments " +
                "WHERE payment_status = 'Pending'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getOpenComplaints() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM complaints " +
                "WHERE status = 'Open'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    // =====================================================
    // ROOM STATUS
    // =====================================================

    @Override
    public int getAvailableRooms() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM rooms " +
                "WHERE status = 'Available'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getFullRooms() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM rooms " +
                "WHERE status = 'Full'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    // =====================================================
    // PAYMENT STATUS
    // =====================================================

    @Override
    public int getPaidPayments() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM rent_payments " +
                "WHERE payment_status = 'Paid'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getPendingPaymentRecords() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM rent_payments " +
                "WHERE payment_status = 'Pending'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    // =====================================================
    // COMPLAINT STATUS
    // =====================================================

    @Override
    public int getOpenComplaintRecords() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM complaints " +
                "WHERE status = 'Open'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getInProgressComplaints() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM complaints " +
                "WHERE status = 'In_Progress'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    @Override
    public int getResolvedComplaints() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM complaints " +
                "WHERE status = 'Resolved'";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }


    // =====================================================
    // VISITOR STATUS
    // =====================================================

    @Override
    public int getActiveVisitors() {

        String sql =
                "SELECT COUNT(*) " +
                "FROM visitors " +
                "WHERE exit_time IS NULL";

        return jdbcTemplate.queryForObject(
                sql,
                Integer.class);
    }

}