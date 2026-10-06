package org.techhub.repository;

import java.util.List;

import org.techhub.model.Student;

public interface StudentRepository {

	int addStudent(Student student);

	List<Student> getAllStudents();

	Student getStudentById(int id);

	Student getStudentByEmail(String email);

	int updateStudent(Student student);

	int deleteStudent(int id);

	// Check email while adding a new student
	int getStudentCountByEmail(String email);

	// Check email while updating a student
	// Excludes the current student's ID
	int getStudentCountByEmailExcludingId(String email, int studentId);
}