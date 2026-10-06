package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.Room;

@Repository
public class RoomRepositoryImpl implements RoomRepository {

    private JdbcTemplate jdbcTemplate;


    public RoomRepositoryImpl(
            JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;
    }


    // =========================
    // ROW MAPPER
    // =========================

    private RowMapper<Room> rowMapper =
            new RowMapper<Room>() {

        @Override
        public Room mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            Room room = new Room();

            room.setId(
                    rs.getInt("id"));

            room.setPropertyId(
                    rs.getInt("property_id"));

            room.setRoomNumber(
                    rs.getString("room_number"));

            room.setCapacity(
                    rs.getInt("capacity"));

            room.setSharingType(
                    rs.getString("sharing_type"));

            room.setRentAmount(
                    rs.getDouble("rent_amount"));

            room.setStatus(
                    rs.getString("status"));

            return room;
        }
    };


    // =========================
    // ADD ROOM
    // =========================

    @Override
    public int addRoom(Room room) {

        String sql =
                "INSERT INTO rooms " +
                "(property_id, room_number, capacity, " +
                "sharing_type, rent_amount, status) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                room.getPropertyId(),
                room.getRoomNumber(),
                room.getCapacity(),
                room.getSharingType(),
                room.getRentAmount(),
                room.getStatus()
        );
    }


    // =========================
    // GET ALL ROOMS
    // =========================

    @Override
    public List<Room> getAllRooms() {

        String sql =
                "SELECT * FROM rooms";

        return jdbcTemplate.query(
                sql,
                rowMapper);
    }


    // =========================
    // GET ROOM BY ID
    // =========================

    @Override
    public Room getRoomById(int id) {

        String sql =
                "SELECT * FROM rooms WHERE id = ?";

        List<Room> rooms =
                jdbcTemplate.query(
                        sql,
                        rowMapper,
                        id);

        if (rooms.isEmpty()) {
            return null;
        }

        return rooms.get(0);
    }


    // =========================
    // UPDATE ROOM
    // =========================

    @Override
    public int updateRoom(Room room) {

        String sql =
                "UPDATE rooms SET " +
                "property_id = ?, " +
                "room_number = ?, " +
                "capacity = ?, " +
                "sharing_type = ?, " +
                "rent_amount = ?, " +
                "status = ? " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                room.getPropertyId(),
                room.getRoomNumber(),
                room.getCapacity(),
                room.getSharingType(),
                room.getRentAmount(),
                room.getStatus(),
                room.getId()
        );
    }


    // =========================
    // DELETE ROOM
    // =========================

    @Override
    public int deleteRoom(int id) {

        String sql =
                "DELETE FROM rooms " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                id);
    }


    // =========================
    // UPDATE ROOM STATUS
    // =========================

    @Override
    public int updateRoomStatus(
            int roomId,
            String status) {

        String sql =
                "UPDATE rooms " +
                "SET status = ? " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                status,
                roomId);
    }


    // =========================
    // GET ACTIVE ALLOCATION COUNT
    // =========================

    @Override
    public int getActiveAllocationCount(
            int roomId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM room_allocations " +
                "WHERE room_id = ? " +
                "AND status = 'Active'";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        roomId);

        return count != null ? count : 0;
    }

}