package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.Visitor;

@Repository
public class VisitorRepositoryImpl implements VisitorRepository {

    private JdbcTemplate jdbcTemplate;

    public VisitorRepositoryImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public int addVisitor(Visitor visitor) {

        String sql = "INSERT INTO visitors "
                + "(student_id, visitor_name, relation, entry_time, exit_time) "
                + "VALUES (?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                visitor.getStudentId(),
                visitor.getVisitorName(),
                visitor.getRelation(),
                visitor.getEntryTime(),
                visitor.getExitTime()
        );
    }

    @Override
    public List<Visitor> getAllVisitors() {

        String sql = "SELECT * FROM visitors";

        return jdbcTemplate.query(
                sql,
                new VisitorRowMapper()
        );
    }

    @Override
    public Visitor getVisitorById(int id) {

        String sql = "SELECT * FROM visitors WHERE id = ?";

        return jdbcTemplate.queryForObject(
                sql,
                new VisitorRowMapper(),
                id
        );
    }

    @Override
    public List<Visitor> getVisitorsByStudentId(int studentId) {

        String sql = "SELECT * FROM visitors WHERE student_id = ?";

        return jdbcTemplate.query(sql, new RowMapper<Visitor>() {

            @Override
            public Visitor mapRow(ResultSet rs, int rowNum)
                    throws SQLException {

                Visitor visitor = new Visitor();

                visitor.setId(rs.getInt("id"));
                visitor.setStudentId(rs.getInt("student_id"));
                visitor.setVisitorName(rs.getString("visitor_name"));
                visitor.setRelation(rs.getString("relation"));
                visitor.setEntryTime(rs.getTimestamp("entry_time"));
                visitor.setExitTime(rs.getTimestamp("exit_time"));

                return visitor;
            }
        }, studentId);
    }
    
    @Override
    public int updateVisitor(Visitor visitor) {

        String sql = "UPDATE visitors SET "
                + "student_id = ?, "
                + "visitor_name = ?, "
                + "relation = ?, "
                + "entry_time = ?, "
                + "exit_time = ? "
                + "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                visitor.getStudentId(),
                visitor.getVisitorName(),
                visitor.getRelation(),
                visitor.getEntryTime(),
                visitor.getExitTime(),
                visitor.getId()
        );
    }

    @Override
    public int deleteVisitor(int id) {

        String sql = "DELETE FROM visitors WHERE id = ?";

        return jdbcTemplate.update(sql, id);
    }

    private static class VisitorRowMapper
            implements RowMapper<Visitor> {

        @Override
        public Visitor mapRow(
                ResultSet rs,
                int rowNum) throws SQLException {

            Visitor visitor = new Visitor();

            visitor.setId(rs.getInt("id"));

            visitor.setStudentId(
                    rs.getInt("student_id"));

            visitor.setVisitorName(
                    rs.getString("visitor_name"));

            visitor.setRelation(
                    rs.getString("relation"));

            visitor.setEntryTime(
                    rs.getTimestamp("entry_time"));

            visitor.setExitTime(
                    rs.getTimestamp("exit_time"));

            return visitor;
        }
    }
}