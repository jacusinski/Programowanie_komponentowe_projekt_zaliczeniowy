package net.benedykt.room.model;

public class User {
	
	private Integer userId;
	private String userName;
	private String userDescription;
	private Integer userTypeId;
	private boolean userStatus;
	private String userLogin;
	private String userPassword;


	
	public User(Integer userId, String userName, String userDescription, Integer userTypeId, boolean userStatus, String userLogin, String userPassword) {
		this(userName, userDescription, userTypeId, userStatus, userLogin, userPassword);
		this.userId = userId;
	}
	
	
	public User(String userName, String userDescription, Integer userTypeId, boolean userStatus, String userLogin, String userPassword) {
		this.userName = userName;
		this.userDescription = userDescription;
		this.userTypeId = userTypeId;
		this.userStatus = userStatus;
		this.userLogin = userLogin;
		this.userPassword = userPassword;
	}
	
	public User() {}

	

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserDescription() {
		return userDescription;
	}
	public void setUserDescription(String userDescription) {
		this.userDescription = userDescription;
	}
	public Integer getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}
	public boolean getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(boolean userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserLogin() {
		return userLogin;
	}
	public void setUserLogin(String userLogin) {
		this.userLogin = userLogin;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}


	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userDescription=" + userDescription
				+ ", userTypeId=" + userTypeId + ", userStatus=" + userStatus + ", userLogin=" + userLogin
				+ ", userPassword=" + userPassword + "]";
	}


	
	
}
