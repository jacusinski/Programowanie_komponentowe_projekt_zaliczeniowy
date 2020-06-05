package net.benedykt.room.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import net.benedykt.room.model.Room;

class RoomDAOTest {

	private DriverManagerDataSource dataSource;
	private RoomDAO dao;
	
	
	@BeforeEach
	void setupBeforeEach() {
		dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/light_management");
		dataSource.setUsername("root");
		dataSource.setPassword("");
		
		dao = new RoomDAOImpl(dataSource);
	}
	
	
	
	@Test
	void testSave() {
		
		Room room = new Room("sypialnia", "nic ciekawego", true, 4);
		int result = dao.save(room);
		
		assertTrue(result > 0);
	}

	
	
	@Test
	void testUpdate() {
		Room room = new Room(13, "jadalnia", "Ciekawe", true, 4);
		int result = dao.update(room);
		
		assertTrue(result > 0);
	}
	
	

	@Test
	void testGet() {
		Integer roomId = 2;
		Room room = dao.get(roomId);
		
		if(room != null) {
			System.out.println(room.toString());
		}
		
		assertNotNull(room);
	}
	
	

	@Test
	void testDelete() {
		Integer id = 11;
		int result = dao.delete(id);
				
		assertTrue(result > 0);
	}
	
	

	@Test
	void testList() {
		List<Room> listRooms = dao.list();
		for(Room aRoom : listRooms) {
			System.out.println(aRoom.toString());
		}
		
		assertTrue(!listRooms.isEmpty());
	}
	

}
