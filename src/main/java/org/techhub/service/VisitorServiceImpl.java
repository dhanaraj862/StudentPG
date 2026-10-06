package org.techhub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import org.techhub.model.Visitor;
import org.techhub.repository.VisitorRepository;

@Service
public class VisitorServiceImpl implements VisitorService {

    private VisitorRepository visitorRepo;

    public VisitorServiceImpl(
            VisitorRepository visitorRepo) {

        this.visitorRepo = visitorRepo;
    }

    @Override
    public int addVisitor(Visitor visitor) {

        return visitorRepo.addVisitor(visitor);
    }

    @Override
    public List<Visitor> getAllVisitors() {

        return visitorRepo.getAllVisitors();
    }

    @Override
    public Visitor getVisitorById(int id) {

        return visitorRepo.getVisitorById(id);
    }

    @Override
    public List<Visitor> getVisitorsByStudentId(int studentId) {

        return visitorRepo.getVisitorsByStudentId(studentId);
    }
    
    @Override
    public int updateVisitor(Visitor visitor) {

        return visitorRepo.updateVisitor(visitor);
    }

    @Override
    public int deleteVisitor(int id) {

        return visitorRepo.deleteVisitor(id);
    }
}