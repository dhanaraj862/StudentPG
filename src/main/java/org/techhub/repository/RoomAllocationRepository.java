package org.techhub.repository;

import java.util.List;

import org.techhub.model.RoomAllocation;

public interface RoomAllocationRepository {

int addAllocation(RoomAllocation allocation);

List<RoomAllocation> getAllAllocations();

RoomAllocation getAllocationById(int id);

List<RoomAllocation> getAllocationsByStudentId(int studentId);

int updateAllocation(RoomAllocation allocation);

int deleteAllocation(int id);

int getActiveAllocationCountByStudentId(int studentId);

}
