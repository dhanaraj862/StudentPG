package org.techhub.repository;

import java.util.List;

import org.techhub.model.Visitor;

public interface VisitorRepository {

    int addVisitor(Visitor visitor);

    List<Visitor> getAllVisitors();

    Visitor getVisitorById(int id);

    List<Visitor> getVisitorsByStudentId(int studentId);

    int updateVisitor(Visitor visitor);

    int deleteVisitor(int id);
}