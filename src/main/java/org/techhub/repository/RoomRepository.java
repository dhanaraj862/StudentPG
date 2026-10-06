package org.techhub.repository;

import java.util.List;

import org.techhub.model.Room;

public interface RoomRepository {

    
    int addRoom(Room room);

    List<Room> getAllRooms();

    Room getRoomById(int id);

    int updateRoom(Room room);

    int deleteRoom(int id);

    int updateRoomStatus(int roomId,String status);

    int getActiveAllocationCount(int roomId);

}