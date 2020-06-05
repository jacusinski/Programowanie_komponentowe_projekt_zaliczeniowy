package net.benedykt.room.dao;

import java.util.List;

import net.benedykt.room.model.LightPoint;

public interface LightPointDAO {
	
	public int save(LightPoint lightPoint);
	
	public int update(LightPoint lightPoint);

	public LightPoint get(Integer lightPointId);
	
	public int delete(Integer lightPointId);
	
	public List<LightPoint> list();

}
