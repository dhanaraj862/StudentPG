package org.techhub.service;

import java.util.List;

import org.techhub.model.RoomAllocation;

public interface RoomAllocationService {

    int addAllocation(
            RoomAllocation allocation);

    List<RoomAllocation> getAllAllocations();

    RoomAllocation getAllocationById(
            int id);

    List<RoomAllocation> getAllocationsByStudentId(
            int studentId);

    int updateAllocation(
            RoomAllocation allocation);

    int deleteAllocation(
            int id);

}