package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.RoomAllocation;

@Repository
public class RoomAllocationRepositoryImpl
implements RoomAllocationRepository {


private JdbcTemplate jdbcTemplate;

public RoomAllocationRepositoryImpl(
        JdbcTemplate jdbcTemplate) {

    this.jdbcTemplate = jdbcTemplate;
}

private RowMapper<RoomAllocation> rowMapper =
        new RowMapper<RoomAllocation>() {

    @Override
    public RoomAllocation mapRow(
            ResultSet rs,
            int rowNum)
            throws SQLException {

        RoomAllocation allocation =
                new RoomAllocation();

        allocation.setId(
                rs.getInt("id"));

        allocation.setStudentId(
                rs.getInt("student_id"));

        allocation.setRoomId(
                rs.getInt("room_id"));

        allocation.setAllocationDate(
                rs.getDate("allocation_date"));

        allocation.setCheckoutDate(
                rs.getDate("checkout_date"));

        allocation.setStatus(
                rs.getString("status"));

        return allocation;
    }
};

@Override
public int addAllocation(
        RoomAllocation allocation) {

    String sql =
            "INSERT INTO room_allocations " +
            "(student_id, room_id, " +
            "allocation_date, checkout_date, status) " +
            "VALUES (?, ?, ?, ?, ?)";

    return jdbcTemplate.update(
            sql,
            allocation.getStudentId(),
            allocation.getRoomId(),
            allocation.getAllocationDate(),
            allocation.getCheckoutDate(),
            allocation.getStatus()
    );
}

@Override
public List<RoomAllocation>
        getAllAllocations() {

    String sql =
            "SELECT * " +
            "FROM room_allocations";

    return jdbcTemplate.query(
            sql,
            rowMapper);
}

@Override
public RoomAllocation
        getAllocationById(int id) {

    String sql =
            "SELECT * " +
            "FROM room_allocations " +
            "WHERE id = ?";

    List<RoomAllocation> allocations =
            jdbcTemplate.query(
                    sql,
                    rowMapper,
                    id);

    if (allocations.isEmpty()) {
        return null;
    }

    return allocations.get(0);
}

@Override
public List<RoomAllocation>
        getAllocationsByStudentId(
                int studentId) {

    String sql =
            "SELECT * " +
            "FROM room_allocations " +
            "WHERE student_id = ?";

    return jdbcTemplate.query(
            sql,
            rowMapper,
            studentId);
}

@Override
public int updateAllocation(
        RoomAllocation allocation) {

    String sql =
            "UPDATE room_allocations SET " +
            "student_id = ?, " +
            "room_id = ?, " +
            "allocation_date = ?, " +
            "checkout_date = ?, " +
            "status = ? " +
            "WHERE id = ?";

    return jdbcTemplate.update(
            sql,
            allocation.getStudentId(),
            allocation.getRoomId(),
            allocation.getAllocationDate(),
            allocation.getCheckoutDate(),
            allocation.getStatus(),
            allocation.getId()
    );
}

@Override
public int deleteAllocation(int id) {

    String sql =
            "DELETE FROM room_allocations " +
            "WHERE id = ?";

    return jdbcTemplate.update(
            sql,
            id);
}

@Override
public int getActiveAllocationCountByStudentId(
        int studentId) {

    String sql =
            "SELECT COUNT(*) " +
            "FROM room_allocations " +
            "WHERE student_id = ? " +
            "AND status = 'Active'";

    Integer count =
            jdbcTemplate.queryForObject(
                    sql,
                    Integer.class,
                    studentId);

    return count != null ? count : 0;
}

}
