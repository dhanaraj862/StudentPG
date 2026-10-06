package org.techhub.service;

import java.util.List;

import org.techhub.model.Room;

public interface RoomService 
{

    int addRoom(Room room);

    List<Room> getAllRooms();

    Room getRoomById(int id);

    int updateRoom(Room room);

    int deleteRoom(int id);
}