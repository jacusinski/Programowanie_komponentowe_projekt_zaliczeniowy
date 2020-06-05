package net.benedykt.room.dao;

import java.util.List;

import net.benedykt.room.model.Building;

public interface BuildingDAO {
	
	public int save(Building building);
	
	public int update(Building building);

	public Building get(Integer buildingId);
	
	public int delete(Integer buildingId);
	
	public List<Building> list();

}
