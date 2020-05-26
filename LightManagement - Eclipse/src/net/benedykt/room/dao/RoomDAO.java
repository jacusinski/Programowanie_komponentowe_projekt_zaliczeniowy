package net.benedykt.room.dao;

import java.util.List;

import net.benedykt.room.model.Room;

public interface RoomDAO {
	
	public int save(Room room);
	
	public int update(Room room);

	public Room get(Integer roomId);
	
	public int delete(Integer roomId);
	
	public List<Room> list();


}
