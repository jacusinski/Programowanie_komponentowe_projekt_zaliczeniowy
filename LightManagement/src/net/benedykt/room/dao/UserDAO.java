package net.benedykt.room.dao;

import java.util.List;

import net.benedykt.room.model.User;


public interface UserDAO {

	public int save(User user);
	
	public int update(User user);

	public User get(Integer userId);
	
	public int delete(Integer user);
	
	public List<User> list();

}
