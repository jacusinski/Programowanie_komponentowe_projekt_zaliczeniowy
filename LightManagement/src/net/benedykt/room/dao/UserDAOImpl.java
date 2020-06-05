package net.benedykt.room.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

import net.benedykt.room.model.User;

public class UserDAOImpl implements UserDAO{

	
	private JdbcTemplate jdbcTemplate;
	
	public UserDAOImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public int save(User user) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
        String sql = "INSERT INTO users (userName, userDescription, userTypeId, userStatus, userLogin, userPassword, userDateOfCreation, userDateOfModification) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";    
        return jdbcTemplate.update(sql, 
        		user.getUserName(), 
        		user.getUserDescription(), 
        		user.getUserTypeId(),
        		user.getUserStatus(),
        		user.getUserLogin(),
        		user.getUserPassword(),
        		sqlCurrentTime,
        		sqlCurrentTime
        		);	
	}

	
	@Override
	public int update(User user) {
		java.util.Date date = new java.util.Date();
		java.sql.Timestamp sqlCurrentTime = new java.sql.Timestamp(date.getTime());
		
		String sql = "UPDATE users SET userName=?, userDescription=?, usertypeId=?, userStatus=?, userLogin=?, userPassword=?, userDateOfModification=? WHERE userId=?";	
		return jdbcTemplate.update(sql, 
				user.getUserName(), 
				user.getUserDescription(), 
				user.getUserTypeId(),
				user.getUserStatus(),
				user.getUserLogin(),
				user.getUserPassword(),
				sqlCurrentTime,
				user.getUserId()
				);
	}

	
	@Override
	public User get(Integer userId) {
		String sql = "SELECT * FROM users WHERE userId=" + userId;
		
		ResultSetExtractor<User> extractor = new ResultSetExtractor<User>() {
	    	 
	        @Override
	        public User extractData(ResultSet rs) throws SQLException, DataAccessException {
	            if (rs.next()) {
	            	
	                String userName = rs.getString("userName");
	                String userDescription = rs.getString("userDescription");
	                Integer userTypeId = rs.getInt("userTypeId");
	                Boolean userStatus = rs.getBoolean("userStatus");
	                String userLogin = rs.getString("userLogin");
	                String userPassword = rs.getString("userPassword");

	                return new User(userId, userName, userDescription, userTypeId, userStatus, userLogin, userPassword);
	            }
	 
	            return null;
	        }	 
	    };
	    
	    return jdbcTemplate.query(sql, extractor);
	}

	
	@Override
	public int delete(Integer userId) {
		String sql = "DELETE FROM users WHERE userId=" + userId;
		return jdbcTemplate.update(sql);
	}

	
	@Override
	public List<User> list() {
		String sql = "SELECT * FROM users";
		
		RowMapper<User> rowMapper = new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {

				Integer userId = rs.getInt("userId");
				String userName = rs.getString("userName");
				String userDescription = rs.getString("userDescription");
                Integer userTypeId = rs.getInt("userTypeId");
				Boolean userStatus = rs.getBoolean("userStatus");
				String userLogin = rs.getString("userLogin");
				String userPassword = rs.getString("userPassword");

				return new User(userId, userName, userDescription, userTypeId, userStatus, userLogin, userPassword);
			}
			
		};
		
		return jdbcTemplate.query(sql, rowMapper);
	}
	
	
}
