package org.techhub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import org.techhub.model.Student;
import org.techhub.repository.StudentRepository;

@Service
public class StudentServiceImpl
        implements StudentService {

    private StudentRepository studentRepository;

    public StudentServiceImpl(
            StudentRepository studentRepository) {

        this.studentRepository =
                studentRepository;
    }

    // =========================
    // ADD STUDENT
    // =========================

    @Override
    public int addStudent(
            Student student) {

        return studentRepository
                .addStudent(student);
    }

    // =========================
    // GET ALL STUDENTS
    // =========================

    @Override
    public List<Student> getAllStudents() {

        return studentRepository
                .getAllStudents();
    }

    // =========================
    // GET STUDENT BY ID
    // =========================

    @Override
    public Student getStudentById(
            int id) {

        return studentRepository
                .getStudentById(id);
    }

    // =========================
    // GET STUDENT BY EMAIL
    // =========================

    @Override
    public Student getStudentByEmail(
            String email) {

        return studentRepository
                .getStudentByEmail(email);
    }

    // =========================
    // UPDATE STUDENT
    // =========================

    @Override
    public int updateStudent(
            Student student) {

        return studentRepository
                .updateStudent(student);
    }

    // =========================
    // DELETE STUDENT
    // =========================

    @Override
    public int deleteStudent(
            int id) {

        return studentRepository
                .deleteStudent(id);
    }

    // =========================
    // CHECK EMAIL COUNT
    // =========================
    // Used while adding a new student

    @Override
    public int getStudentCountByEmail(
            String email) {

        return studentRepository
                .getStudentCountByEmail(
                        email);
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

        return studentRepository
                .getStudentCountByEmailExcludingId(
                        email,
                        studentId);
    }
}