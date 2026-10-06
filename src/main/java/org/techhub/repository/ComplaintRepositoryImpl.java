package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.Complaint;

@Repository
public class ComplaintRepositoryImpl implements ComplaintRepository {

    private JdbcTemplate jdbcTemplate;

    public ComplaintRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int addComplaint(Complaint complaint) {

        String sql = "INSERT INTO complaints "
                + "(student_id, category, description, status) "
                + "VALUES (?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                complaint.getStudentId(),
                complaint.getCategory(),
                complaint.getDescription(),
                complaint.getStatus()
        );
    }

    @Override
    public List<Complaint> getAllComplaints() {

        String sql = "SELECT * FROM complaints";

        return jdbcTemplate.query(
                sql,
                new ComplaintRowMapper()
        );
    }

    @Override
    public Complaint getComplaintById(int id) {

        String sql = "SELECT * FROM complaints WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                new ComplaintRowMapper(),
                id
        );
    }

    @Override
    public List<Complaint> getComplaintsByStudentId(int studentId) {

        String sql = "SELECT * FROM complaints WHERE student_id = ?";

        return jdbcTemplate.query(sql, new RowMapper<Complaint>() {

            @Override
            public Complaint mapRow(ResultSet rs, int rowNum)
                    throws SQLException {

                Complaint complaint = new Complaint();

                complaint.setId(rs.getInt("id"));
                complaint.setStudentId(rs.getInt("student_id"));
                complaint.setCategory(rs.getString("category"));
                complaint.setDescription(rs.getString("description"));
                complaint.setStatus(rs.getString("status"));
                complaint.setCreatedAt(
                        rs.getTimestamp("created_at"));

                return complaint;
            }
        }, studentId);
    }
    
    @Override
    public int updateComplaint(Complaint complaint) {

        String sql = "UPDATE complaints SET "
                + "student_id = ?, "
                + "category = ?, "
                + "description = ?, "
                + "status = ? "
                + "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                complaint.getStudentId(),
                complaint.getCategory(),
                complaint.getDescription(),
                complaint.getStatus(),
                complaint.getId()
        );
    }

    @Override
    public int deleteComplaint(int id) {

        String sql = "DELETE FROM complaints WHERE id = ?";

        return jdbcTemplate.update(sql, id);
    }

    private static class ComplaintRowMapper
            implements RowMapper<Complaint> {

        @Override
        public Complaint mapRow(
                ResultSet rs,
                int rowNum) throws SQLException {

            Complaint complaint = new Complaint();

            complaint.setId(rs.getInt("id"));

            complaint.setStudentId(
                    rs.getInt("student_id"));

            complaint.setCategory(
                    rs.getString("category"));

            complaint.setDescription(
                    rs.getString("description"));

            complaint.setStatus(
                    rs.getString("status"));

            complaint.setCreatedAt(
                    rs.getTimestamp("created_at"));

            return complaint;
        }
    }
}