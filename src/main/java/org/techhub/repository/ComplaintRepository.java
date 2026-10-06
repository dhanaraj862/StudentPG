package org.techhub.repository;

import java.util.List;

import org.techhub.model.Complaint;

public interface ComplaintRepository {

    int addComplaint(Complaint complaint);

    List<Complaint> getAllComplaints();

    Complaint getComplaintById(int id);

    List<Complaint> getComplaintsByStudentId(int studentId);

    int updateComplaint(Complaint complaint);

    int deleteComplaint(int id);
}