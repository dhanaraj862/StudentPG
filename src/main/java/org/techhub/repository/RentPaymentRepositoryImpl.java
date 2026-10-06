package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.RentPayment;

@Repository
public class RentPaymentRepositoryImpl
implements RentPaymentRepository {


private JdbcTemplate jdbcTemplate;

public RentPaymentRepositoryImpl(
        JdbcTemplate jdbcTemplate) {

    this.jdbcTemplate = jdbcTemplate;
}

private RowMapper<RentPayment> rowMapper =
        new RowMapper<RentPayment>() {

    @Override
    public RentPayment mapRow(
            ResultSet rs,
            int rowNum)
            throws SQLException {

        RentPayment payment =
                new RentPayment();

        payment.setId(
                rs.getInt("id"));

        payment.setAllocationId(
                rs.getInt("allocation_id"));

        payment.setAmount(
                rs.getDouble("amount"));

        payment.setPaymentDate(
                rs.getDate("payment_date"));

        payment.setMonthYear(
                rs.getString("month_year"));

        payment.setPaymentStatus(
                rs.getString("payment_status"));

        return payment;
    }
};

@Override
public int addPayment(
        RentPayment payment) {

    String sql =
            "INSERT INTO rent_payments " +
            "(allocation_id, amount, " +
            "payment_date, month_year, " +
            "payment_status) " +
            "VALUES (?, ?, ?, ?, ?)";

    return jdbcTemplate.update(
            sql,
            payment.getAllocationId(),
            payment.getAmount(),
            payment.getPaymentDate(),
            payment.getMonthYear(),
            payment.getPaymentStatus()
    );
}

@Override
public List<RentPayment>
        getAllPayments() {

    String sql =
            "SELECT * " +
            "FROM rent_payments";

    return jdbcTemplate.query(
            sql,
            rowMapper);
}

@Override
public RentPayment
        getPaymentById(int id) {

    String sql =
            "SELECT * " +
            "FROM rent_payments " +
            "WHERE id = ?";

    List<RentPayment> payments =
            jdbcTemplate.query(
                    sql,
                    rowMapper,
                    id);

    if (payments.isEmpty()) {
        return null;
    }

    return payments.get(0);
}

@Override
public List<RentPayment>
        getPaymentsByStudentId(
                int studentId) {

    String sql =
            "SELECT rp.* " +
            "FROM rent_payments rp " +
            "INNER JOIN room_allocations ra " +
            "ON rp.allocation_id = ra.id " +
            "WHERE ra.student_id = ?";

    return jdbcTemplate.query(
            sql,
            rowMapper,
            studentId);
}

@Override
public int updatePayment(
        RentPayment payment) {

    String sql =
            "UPDATE rent_payments SET " +
            "allocation_id = ?, " +
            "amount = ?, " +
            "payment_date = ?, " +
            "month_year = ?, " +
            "payment_status = ? " +
            "WHERE id = ?";

    return jdbcTemplate.update(
            sql,
            payment.getAllocationId(),
            payment.getAmount(),
            payment.getPaymentDate(),
            payment.getMonthYear(),
            payment.getPaymentStatus(),
            payment.getId()
    );
}

@Override
public int deletePayment(int id) {

    String sql =
            "DELETE FROM rent_payments " +
            "WHERE id = ?";

    return jdbcTemplate.update(
            sql,
            id);
}

/*
 * Check whether a payment already exists
 * for the same allocation and month/year.
 */
@Override
public int getPaymentCountByAllocationAndMonth(
        int allocationId,
        String monthYear) {

    String sql =
            "SELECT COUNT(*) " +
            "FROM rent_payments " +
            "WHERE allocation_id = ? " +
            "AND month_year = ?";

    Integer count =
            jdbcTemplate.queryForObject(
                    sql,
                    Integer.class,
                    allocationId,
                    monthYear);

    return count != null ? count : 0;
}

/*
 * Used while updating a payment.
 *
 * The current payment ID is excluded
 * from the duplicate check.
 */
@Override
public int getPaymentCountByAllocationAndMonthExcludingId(
        int allocationId,
        String monthYear,
        int paymentId) {

    String sql =
            "SELECT COUNT(*) " +
            "FROM rent_payments " +
            "WHERE allocation_id = ? " +
            "AND month_year = ? " +
            "AND id <> ?";

    Integer count =
            jdbcTemplate.queryForObject(
                    sql,
                    Integer.class,
                    allocationId,
                    monthYear,
                    paymentId);

    return count != null ? count : 0;
}

}
