package org.techhub.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import org.techhub.model.Student;

@Repository
public class StudentRepositoryImpl
        implements StudentRepository {

    private JdbcTemplate jdbcTemplate;

    public StudentRepositoryImpl(
            JdbcTemplate jdbcTemplate) {

        this.jdbcTemplate = jdbcTemplate;
    }

    // =========================
    // ROW MAPPER
    // =========================

    private RowMapper<Student> rowMapper =
            new RowMapper<Student>() {

        @Override
        public Student mapRow(
                ResultSet rs,
                int rowNum)
                throws SQLException {

            Student student =
                    new Student();

            student.setId(
                    rs.getInt("id"));

            student.setName(
                    rs.getString("name"));

            student.setEmail(
                    rs.getString("email"));

            student.setMobile(
                    rs.getString("mobile"));

            student.setGuardianMobile(
                    rs.getString("guardian_mobile"));

            student.setAddress(
                    rs.getString("address"));

            student.setIdProof(
                    rs.getString("id_proof"));

            return student;
        }
    };

    // =========================
    // ADD STUDENT
    // =========================

    @Override
    public int addStudent(
            Student student) {

        String sql =
                "INSERT INTO students " +
                "(name, email, mobile, " +
                "guardian_mobile, address, id_proof) " +
                "VALUES (?, ?, ?, ?, ?, ?)";

        return jdbcTemplate.update(
                sql,
                student.getName(),
                student.getEmail(),
                student.getMobile(),
                student.getGuardianMobile(),
                student.getAddress(),
                student.getIdProof()
        );
    }

    // =========================
    // GET ALL STUDENTS
    // =========================

    @Override
    public List<Student> getAllStudents() {

        String sql =
                "SELECT * FROM students";

        return jdbcTemplate.query(
                sql,
                rowMapper);
    }

    // =========================
    // GET STUDENT BY ID
    // =========================

    @Override
    public Student getStudentById(
            int id) {

        String sql =
                "SELECT * " +
                "FROM students " +
                "WHERE id = ?";

        List<Student> students =
                jdbcTemplate.query(
                        sql,
                        rowMapper,
                        id);

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }

    // =========================
    // GET STUDENT BY EMAIL
    // =========================
    // Used for Student Login

    @Override
    public Student getStudentByEmail(
            String email) {

        String sql =
                "SELECT * " +
                "FROM students " +
                "WHERE email = ?";

        List<Student> students =
                jdbcTemplate.query(
                        sql,
                        rowMapper,
                        email);

        if (students.isEmpty()) {
            return null;
        }

        return students.get(0);
    }

    // =========================
    // UPDATE STUDENT
    // =========================

    @Override
    public int updateStudent(
            Student student) {

        String sql =
                "UPDATE students SET " +
                "name = ?, " +
                "email = ?, " +
                "mobile = ?, " +
                "guardian_mobile = ?, " +
                "address = ?, " +
                "id_proof = ? " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                student.getName(),
                student.getEmail(),
                student.getMobile(),
                student.getGuardianMobile(),
                student.getAddress(),
                student.getIdProof(),
                student.getId()
        );
    }

    // =========================
    // DELETE STUDENT
    // =========================

    @Override
    public int deleteStudent(
            int id) {

        String sql =
                "DELETE FROM students " +
                "WHERE id = ?";

        return jdbcTemplate.update(
                sql,
                id);
    }

    // =========================
    // CHECK EMAIL COUNT
    // =========================
    // Used while adding a new student

    @Override
    public int getStudentCountByEmail(
            String email) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM students " +
                "WHERE email = ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        email);

        return count != null ? count : 0;
    }

    // =========================
    // CHECK EMAIL COUNT
    // EXCLUDING CURRENT STUDENT
    // =========================
    // Used while updating a student

    @Override
    public int getStudentCountByEmailExcludingId(
            String email,
            int studentId) {

        String sql =
                "SELECT COUNT(*) " +
                "FROM students " +
                "WHERE email = ? " +
                "AND id <> ?";

        Integer count =
                jdbcTemplate.queryForObject(
                        sql,
                        Integer.class,
                        email,
                        studentId);

        return count != null ? count : 0;
    }
}