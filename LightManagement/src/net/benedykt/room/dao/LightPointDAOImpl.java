package net.benedykt.room.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.benedykt.room.model.LightPoint;

public class LightPointDAOImpl implements LightPointDAO{

	
	private JdbcTemplate jdbcTemplate;
	
	public LightPointDAOImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public int save(LightPoint lightPoint) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
        String sql = "INSERT INTO lightpoints (lightPointName, lightPointDescription, lightPointStatus, roomId, lightId, bulbId, lightPointDateOfCreation, lightPointDateOfModification) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";    
        return jdbcTemplate.update(sql, 
        		lightPoint.getLightPointName(), 
        		lightPoint.getLightPointDescription(), 
        		lightPoint.getLightPointStatus(),
        		lightPoint.getRoomId(),
        		lightPoint.getLightId(),
        		lightPoint.getBulbId(),
        		sqlCurrentTime,
        		sqlCurrentTime
        		);	
	}

	
	@Override
	public int update(LightPoint lightPoint) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
		String sql = "UPDATE lightpoints SET lightPointName=?, lightPointDescription=?, lightPointStatus=?, roomId=?, lightId=?, bulbId=?, lightPointDateOfModification=? WHERE lightPointId=?";	
		return jdbcTemplate.update(sql, 
				lightPoint.getLightPointName(), 
				lightPoint.getLightPointDescription(), 
				lightPoint.getLightPointStatus(),
				lightPoint.getRoomId(),
				lightPoint.getLightId(),
				lightPoint.getBulbId(),
				sqlCurrentTime,
				lightPoint.getLightPointId()
				);
	}

	
	@Override
	public LightPoint get(Integer lightPointId) {
		String sql = "SELECT * FROM lightpoints WHERE lightPointId=" + lightPointId;
		
		ResultSetExtractor<LightPoint> extractor = new ResultSetExtractor<LightPoint>() {
	    	 
	        @Override
	        public LightPoint extractData(ResultSet rs) throws SQLException, DataAccessException {
	            if (rs.next()) {
	            	
	                String lightPointName = rs.getString("lightPointName");
	                String lightPointDescription = rs.getString("lightPointDescription");
	                Boolean lightPointStatus = rs.getBoolean("lightPointStatus");
	                Integer roomId = rs.getInt("roomId");
	                Integer lightId = rs.getInt("lightId");
	                Integer bulbId = rs.getInt("bulbId");


	                return new LightPoint(lightPointId, lightPointName, lightPointDescription, lightPointStatus, roomId, lightId, bulbId);
	            }
	 
	            return null;
	        }	 
	    };
	    
	    return jdbcTemplate.query(sql, extractor);
	}

	
	@Override
	public int delete(Integer lightPointId) {
		String sql = "DELETE FROM lightpoints WHERE lightPointId=" + lightPointId;
		return jdbcTemplate.update(sql);
	}

	
	@Override
	public List<LightPoint> list() {
		String sql = "SELECT * FROM lightpoints";
		
		RowMapper<LightPoint> rowMapper = new RowMapper<LightPoint>() {

			@Override
			public LightPoint mapRow(ResultSet rs, int rowNum) throws SQLException {

				Integer lightPointId = rs.getInt("lightPointId");
				String lightPointName = rs.getString("lightPointName");
				String lightPointDescription = rs.getString("lightPointDescription");
				Boolean lightPointStatus = rs.getBoolean("lightPointStatus");
                Integer roomId = rs.getInt("roomId");
                Integer lightId = rs.getInt("lightId");
                Integer bulbId = rs.getInt("bulbId");

				return new LightPoint(lightPointId, lightPointName, lightPointDescription, lightPointStatus, roomId, lightId, bulbId);
			}
			
		};
		
		return jdbcTemplate.query(sql, rowMapper);
	}
	
	
}
