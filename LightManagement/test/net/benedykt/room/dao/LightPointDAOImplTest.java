package net.benedykt.room.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import net.benedykt.room.model.LightPoint;

class LightPointDAOImplTest {

	private DriverManagerDataSource dataSource;
	private LightPointDAO dao;
	
	@BeforeEach
	void setupBeforeEach() {
		dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/light_management");
		dataSource.setUsername("root");
		dataSource.setPassword("");
		
		dao = new LightPointDAOImpl(dataSource);
	}
	

	
	@Test
	void testSave() {
		
		LightPoint lightPoint = new LightPoint("kinkiet", "nic ciekawego", true, 4, 4, 2);
		int result = dao.save(lightPoint);
		
		assertTrue(result > 0);
	}

	
	@Test
	void testUpdate() {
		LightPoint lightPoint = new LightPoint(1, "br", "rtbrt", true, 4, 3, 3);
		int result = dao.update(lightPoint);
		
		assertTrue(result > 0);
	}

	
	@Test
	void testGet() {
		Integer lightPointId = 1;
		LightPoint lightPoint = dao.get(lightPointId);
		
		if(lightPoint != null) {
			System.out.println(lightPoint.toString());
		}
		
		assertNotNull(lightPoint);
	}

	
	@Test
	void testDelete() {
		Integer id = 16;
		int result = dao.delete(id);
				
		assertTrue(result > 0);
	}

	
	@Test
	void testList() {
		List<LightPoint> listlightPoints = dao.list();
		for(LightPoint aLightPoint : listlightPoints) {
			System.out.println(aLightPoint.toString());
		}
		
		assertTrue(!listlightPoints.isEmpty());
	}

}
