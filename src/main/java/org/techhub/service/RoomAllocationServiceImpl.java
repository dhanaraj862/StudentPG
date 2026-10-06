package org.techhub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import org.techhub.model.Room;
import org.techhub.model.RoomAllocation;
import org.techhub.repository.RoomAllocationRepository;
import org.techhub.repository.RoomRepository;

@Service
public class RoomAllocationServiceImpl
implements RoomAllocationService {


private RoomAllocationRepository allocationRepository;

private RoomRepository roomRepository;

public RoomAllocationServiceImpl(
        RoomAllocationRepository allocationRepository,
        RoomRepository roomRepository) {

    this.allocationRepository =
            allocationRepository;

    this.roomRepository =
            roomRepository;
}

@Override
public int addAllocation(
        RoomAllocation allocation) {

    // Check whether the selected room exists
    Room room =
            roomRepository.getRoomById(
                    allocation.getRoomId());

    if (room == null) {
        return 0;
    }

    // Default status to Active
    if (allocation.getStatus() == null
            || allocation.getStatus().trim().isEmpty()) {

        allocation.setStatus("Active");
    }

    /*
     * Prevent the same student from having
     * more than one active room allocation.
     */
    if ("Active".equals(
            allocation.getStatus())) {

        int activeStudentAllocation =
                allocationRepository
                .getActiveAllocationCountByStudentId(
                        allocation.getStudentId());

        if (activeStudentAllocation > 0) {
            return 0;
        }
    }

    /*
     * Check room capacity before creating
     * an Active allocation.
     */
    if ("Active".equals(
            allocation.getStatus())) {

        int activeCount =
                roomRepository
                .getActiveAllocationCount(
                        allocation.getRoomId());

        if (activeCount >= room.getCapacity()) {

            roomRepository.updateRoomStatus(
                    allocation.getRoomId(),
                    "Full");

            return 0;
        }
    }

    int result =
            allocationRepository
            .addAllocation(allocation);

    if (result > 0) {

        updateRoomStatus(
                allocation.getRoomId());
    }

    return result;
}

@Override
public List<RoomAllocation>
        getAllAllocations() {

    return allocationRepository
            .getAllAllocations();
}

@Override
public RoomAllocation
        getAllocationById(int id) {

    return allocationRepository
            .getAllocationById(id);
}

@Override
public List<RoomAllocation>
        getAllocationsByStudentId(
                int studentId) {

    return allocationRepository
            .getAllocationsByStudentId(
                    studentId);
}

@Override
public int updateAllocation(
        RoomAllocation allocation) {

    // Get existing allocation
    RoomAllocation oldAllocation =
            allocationRepository
            .getAllocationById(
                    allocation.getId());

    if (oldAllocation == null) {
        return 0;
    }

    // Check whether the new room exists
    Room newRoom =
            roomRepository.getRoomById(
                    allocation.getRoomId());

    if (newRoom == null) {
        return 0;
    }

    // Default status to Active
    if (allocation.getStatus() == null
            || allocation.getStatus().trim().isEmpty()) {

        allocation.setStatus("Active");
    }

    /*
     * Prevent a student from having
     * another active allocation.
     *
     * The current allocation itself is
     * excluded from the count.
     */
    if ("Active".equals(
            allocation.getStatus())) {

        List<RoomAllocation> studentAllocations =
                allocationRepository
                .getAllocationsByStudentId(
                        allocation.getStudentId());

        int activeStudentAllocation = 0;

        for (RoomAllocation existingAllocation
                : studentAllocations) {

            if (existingAllocation.getId()
                    != allocation.getId()
                    && "Active".equals(
                            existingAllocation.getStatus())) {

                activeStudentAllocation++;
            }
        }

        if (activeStudentAllocation > 0) {
            return 0;
        }
    }

    /*
     * Check capacity of the new room.
     */
    if ("Active".equals(
            allocation.getStatus())) {

        int activeCount =
                roomRepository
                .getActiveAllocationCount(
                        allocation.getRoomId());

        /*
         * If the allocation is already active
         * in the same room, exclude itself.
         */
        if (oldAllocation.getRoomId()
                == allocation.getRoomId()
                && "Active".equals(
                        oldAllocation.getStatus())) {

            activeCount--;
        }

        if (activeCount >= newRoom.getCapacity()) {

            roomRepository.updateRoomStatus(
                    allocation.getRoomId(),
                    "Full");

            return 0;
        }
    }

    // Update allocation
    int result =
            allocationRepository
            .updateAllocation(
                    allocation);

    /*
     * Recalculate status of both rooms.
     *
     * This is important when the student
     * changes from one room to another.
     */
    if (result > 0) {

        updateRoomStatus(
                oldAllocation.getRoomId());

        updateRoomStatus(
                allocation.getRoomId());
    }

    return result;
}

@Override
public int deleteAllocation(int id) {

    // Get allocation before deleting it
    RoomAllocation allocation =
            allocationRepository
            .getAllocationById(id);

    if (allocation == null) {
        return 0;
    }

    int roomId =
            allocation.getRoomId();

    // Delete allocation
    int result =
            allocationRepository
            .deleteAllocation(id);

    /*
     * Recalculate room status after
     * allocation is deleted.
     */
    if (result > 0) {

        updateRoomStatus(roomId);
    }

    return result;
}

/*
 * Automatically update room status
 * according to active allocations.
 */
private void updateRoomStatus(
        int roomId) {

    Room room =
            roomRepository
            .getRoomById(roomId);

    if (room == null) {
        return;
    }

    int activeCount =
            roomRepository
            .getActiveAllocationCount(
                    roomId);

    if (activeCount >= room.getCapacity()) {

        roomRepository.updateRoomStatus(
                roomId,
                "Full");

    } else {

        roomRepository.updateRoomStatus(
                roomId,
                "Available");
    }
}

}
