package net.benedykt.room.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.benedykt.room.model.Room;

public class RoomDAOImpl implements RoomDAO{

	
	private JdbcTemplate jdbcTemplate;
	
	public RoomDAOImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public int save(Room room) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
        String sql = "INSERT INTO rooms (roomName, roomDescription, roomStatus, buildingId, roomDateOfCreation, roomDateOfModification) VALUES (?, ?, ?, ?, ?, ?)";    
        return jdbcTemplate.update(sql, 
        		room.getRoomName(), 
        		room.getRoomDescription(), 
        		room.getRoomStatus(),
        		room.getBuildingId(),
        		sqlCurrentTime,
        		sqlCurrentTime
        		);	
	}

	
	@Override
	public int update(Room room) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
		String sql = "UPDATE rooms SET roomName=?, roomDescription=?, roomStatus=?, buildingId=?, roomDateOfModification=? WHERE roomId=?";	
		return jdbcTemplate.update(sql, 
				room.getRoomName(), 
				room.getRoomDescription(), 
				room.getRoomStatus(),
				room.getBuildingId(),
				sqlCurrentTime,
				room.getRoomId()
				);
	}

	
	@Override
	public Room get(Integer roomId) {
		String sql = "SELECT * FROM rooms WHERE roomId=" + roomId;
		
		ResultSetExtractor<Room> extractor = new ResultSetExtractor<Room>() {
	    	 
	        @Override
	        public Room extractData(ResultSet rs) throws SQLException, DataAccessException {
	            if (rs.next()) {
	            	
	                String roomName = rs.getString("roomName");
	                String roomDescription = rs.getString("roomDescription");
	                Boolean roomStatus = rs.getBoolean("roomStatus");
	                Integer buildingId = rs.getInt("buildingId");


	                return new Room(roomId, roomName, roomDescription, roomStatus, buildingId);
	            }
	 
	            return null;
	        }	 
	    };
	    
	    return jdbcTemplate.query(sql, extractor);
	}

	
	@Override
	public int delete(Integer roomId) {
		String sql = "DELETE FROM rooms WHERE roomId=" + roomId;
		return jdbcTemplate.update(sql);
	}

	
	@Override
	public List<Room> list() {
		String sql = "SELECT * FROM rooms";
		
		RowMapper<Room> rowMapper = new RowMapper<Room>() {

			@Override
			public Room mapRow(ResultSet rs, int rowNum) throws SQLException {

				Integer roomId = rs.getInt("roomId");
				String roomName = rs.getString("roomName");
				String roomDescription = rs.getString("roomDescription");
				Boolean roomStatus = rs.getBoolean("roomStatus");
                Integer buildingId = rs.getInt("buildingId");

				return new Room(roomId, roomName, roomDescription, roomStatus, buildingId);
			}
			
		};
		
		return jdbcTemplate.query(sql, rowMapper);
	}
	
	
}
