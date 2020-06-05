package net.benedykt.room.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import net.benedykt.room.model.Building;

class BuildingDAOImplTest {


	private DriverManagerDataSource dataSource;
	private BuildingDAO dao;
	
	@BeforeEach
	void setupBeforeEach() {
		dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://localhost:3306/light_management");
		dataSource.setUsername("root");
		dataSource.setPassword("");
		
		dao = new BuildingDAOImpl(dataSource);
	}
	
	
	@Test
	void testBuildingDAOImpl() {
		fail("Not yet implemented");
	}

	
	@Test
	void testSave() {
		
		Building building = new Building("sypialnia", "nic ciekawego", true, "polanokiegho");
		int result = dao.save(building);
		
		assertTrue(result > 0);			
	}

	
	@Test
	void testUpdate() {
		Building building = new Building(11, "jadalnia", "Ciekawe", true, "abcd");
		int result = dao.update(building);
		
		assertTrue(result > 0);	
	}

	
	@Test
	void testGet() {
		Integer buildingId = 11;
		Building building = dao.get(buildingId);
		
		if(building != null) {
			System.out.println(building.toString());
		}
		
		assertNotNull(building);
	}
	

	@Test
	void testDelete() {
		Integer id = 11;
		int result = dao.delete(id);
				
		assertTrue(result > 0);
	}

	
	@Test
	void testList() {
		List<Building> listBuildings = dao.list();
		for(Building aBuilding : listBuildings) {
			System.out.println(aBuilding.toString());
		}
		
		assertTrue(!listBuildings.isEmpty());
	}
	

}
