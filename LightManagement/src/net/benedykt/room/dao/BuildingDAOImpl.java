package net.benedykt.room.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.benedykt.room.model.Building;

public class BuildingDAOImpl implements BuildingDAO {

	
	
	private JdbcTemplate jdbcTemplate;
	
	public BuildingDAOImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public int save(Building building) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
        String sql = "INSERT INTO buildings (buildingName, buildingDescription, buildingStatus," + 
        			" buildingAddress, buildingDateOfCreation, buildingDateOfModification) VALUES (?, ?, ?, ?, ?, ?)";    
        return jdbcTemplate.update(sql, 
        		building.getBuildingName(), 
        		building.getBuildingDescription(), 
        		building.getBuildingStatus(),
        		building.getBuildingAddress(),
        		sqlCurrentTime,
        		sqlCurrentTime
        		);
	}
	

	@Override
	public int update(Building building) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
		String sql = "UPDATE buildings SET buildingName=?, buildingDescription=?, buildingStatus=?, buildingAddress=?, buildingDateOfModification=? WHERE buildingId=?";	
		return jdbcTemplate.update(sql, 
				building.getBuildingName(), 
				building.getBuildingDescription(), 
				building.getBuildingStatus(),
				building.getBuildingAddress(),
				sqlCurrentTime,
				building.getBuildingId()
				);
	}

	
	@Override
	public Building get(Integer buildingId) {
		String sql = "SELECT * FROM buildings WHERE buildingId=" + buildingId;
		
		ResultSetExtractor<Building> extractor = new ResultSetExtractor<Building>() {
	    	 
	        @Override
	        public Building extractData(ResultSet rs) throws SQLException, DataAccessException {
	            if (rs.next()) {
	            	
	                String buildingName = rs.getString("buildingName");
	                String buildingDescription = rs.getString("buildingDescription");
	                Boolean buildingStatus = rs.getBoolean("buildingStatus");
	                String buildingAddress = rs.getString("buildingAddress");


	                return new Building(buildingId, buildingName, buildingDescription, buildingStatus, buildingAddress);
	            }
	 
	            return null;
	        }	 
	    };
	    
	    return jdbcTemplate.query(sql, extractor);
	}

	
	@Override
	public int delete(Integer buildingId) {
		String sql = "DELETE FROM buildings WHERE buildingId=" + buildingId;
		return jdbcTemplate.update(sql);
	}

	
	@Override
	public List<Building> list() {
		String sql = "SELECT * FROM buildings";
		
		RowMapper<Building> rowMapper = new RowMapper<Building>() {

			@Override
			public Building mapRow(ResultSet rs, int rowNum) throws SQLException {

				Integer buildingId = rs.getInt("buildingId");
				String buildingName = rs.getString("buildingName");
				String buildingDescription = rs.getString("buildingDescription");
				Boolean buildingStatus = rs.getBoolean("buildingStatus");
				String buildingAddress = rs.getString("buildingAddress");
                
				return new Building(buildingId, buildingName, buildingDescription, buildingStatus, buildingAddress);
			}
			
		};
		
		return jdbcTemplate.query(sql, rowMapper);
	}

}
