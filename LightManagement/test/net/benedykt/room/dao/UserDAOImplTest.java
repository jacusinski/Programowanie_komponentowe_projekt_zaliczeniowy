package net.benedykt.room.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import net.benedykt.room.model.User;

class UserDAOImplTest {

	private DriverManagerDataSource dataSource;
	private UserDAO dao;
	
	
	@BeforeEach
	void setupBeforeEach() {
		dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/light_management");
		dataSource.setUsername("root");
		dataSource.setPassword("");
		
		dao = new UserDAOImpl(dataSource);
	}
	

	@Test
	void testSave() {
		
		User user = new User("janek", "placek", 1, true, "bbb", "hhh");
		int result = dao.save(user);
		
		assertTrue(result > 0);
	}
	

	@Test
	void testUpdate() {
		User user = new User(5, "janek", "placek", 1, true, "bbb", "hhh");
		int result = dao.update(user);
		
		assertTrue(result > 0);
	}

	
	@Test
	void testGet() {
		Integer userId = 3;
		User user = dao.get(userId);
		
		if(user != null) {
			System.out.println(user.toString());
		}
		
		assertNotNull(user);
	}
	

	@Test
	void testDelete() {
		Integer id = 11;
		int result = dao.delete(id);
				
		assertTrue(result > 0);
	}

	
	@Test
	void testList() {
		List<User> listUsers = dao.list();
		for(User aUser : listUsers) {
			System.out.println(aUser.toString());
		}
		
		assertTrue(!listUsers.isEmpty());
	}

}
