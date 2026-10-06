package org.techhub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import org.techhub.model.Complaint;
import org.techhub.repository.ComplaintRepository;

@Service
public class ComplaintServiceImpl implements ComplaintService {

    private ComplaintRepository complaintRepo;

    public ComplaintServiceImpl(
            ComplaintRepository complaintRepo) {

        this.complaintRepo = complaintRepo;
    }

    @Override
    public int addComplaint(Complaint complaint) {

        return complaintRepo.addComplaint(complaint);
    }

    @Override
    public List<Complaint> getAllComplaints() {

        return complaintRepo.getAllComplaints();
    }

    @Override
    public Complaint getComplaintById(int id) {

        return complaintRepo.getComplaintById(id);
    }

    @Override
    public List<Complaint> getComplaintsByStudentId(int studentId) {

        return complaintRepo.getComplaintsByStudentId(studentId);
    }
    
    @Override
    public int updateComplaint(Complaint complaint) {

        return complaintRepo.updateComplaint(complaint);
    }

    @Override
    public int deleteComplaint(int id) {

        return complaintRepo.deleteComplaint(id);
    }
}