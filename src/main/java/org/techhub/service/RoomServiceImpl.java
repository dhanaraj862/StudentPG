package org.techhub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import org.techhub.model.Room;
import org.techhub.repository.RoomRepository;

@Service
public class RoomServiceImpl
        implements RoomService {

    private RoomRepository roomRepository;


    // =========================
    // CONSTRUCTOR
    // =========================

    public RoomServiceImpl(
            RoomRepository roomRepository) {

        this.roomRepository =
                roomRepository;
    }


    // =========================
    // ADD ROOM
    // =========================

    @Override
    public int addRoom(Room room) {

        /*
         * New rooms are created with
         * Available status by default.
         */

        if (room.getStatus() == null
                || room.getStatus().trim().isEmpty()) {

            room.setStatus("Available");
        }


        return roomRepository.addRoom(room);
    }


    // =========================
    // GET ALL ROOMS
    // =========================

    @Override
    public List<Room> getAllRooms() {

        return roomRepository
                .getAllRooms();
    }


    // =========================
    // GET ROOM BY ID
    // =========================

    @Override
    public Room getRoomById(int id) {

        return roomRepository
                .getRoomById(id);
    }


    // =========================
    // UPDATE ROOM
    // =========================

    @Override
    public int updateRoom(Room room) {

        /*
         * First update the room details.
         */

        int result =
                roomRepository
                .updateRoom(room);


        /*
         * If update is successful,
         * recalculate room status.
         */

        if (result > 0) {

            updateRoomStatus(
                    room.getId());
        }


        return result;
    }


    // =========================
    // DELETE ROOM
    // =========================

    @Override
    public int deleteRoom(int id) {

        return roomRepository
                .deleteRoom(id);
    }


    // =========================
    // UPDATE ROOM STATUS
    // =========================

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