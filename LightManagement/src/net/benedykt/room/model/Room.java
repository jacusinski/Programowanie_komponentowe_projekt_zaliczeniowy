package net.benedykt.room.model;

public class Room {
	
	private Integer roomId;
	private String roomName;
	private String roomDescription;
	private boolean roomStatus;
	private Integer buildingId;

	
	public Room(Integer roomId, String roomName, String roomDescription, boolean roomStatus, Integer buildingId) {
		this(roomName, roomDescription, roomStatus, buildingId);
		this.roomId = roomId;
	}
	
	
	public Room(String roomName, String roomDescription, boolean roomStatus, Integer buildingId) {
		this.roomName = roomName;
		this.roomDescription = roomDescription;
		this.roomStatus = roomStatus;
		this.buildingId = buildingId;
	}
	
	public Room() {}
	
	
	public Integer getRoomId() {
		return roomId;
	}
	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomDescription() {
		return roomDescription;
	}
	public void setRoomDescription(String roomDescription) {
		this.roomDescription = roomDescription;
	}
	public boolean getRoomStatus() {
		return roomStatus;
	}
	public void setRoomStatus(boolean roomStatus) {
		this.roomStatus = roomStatus;
	}
	public Integer getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}


	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roomName=" + roomName + ", roomDescription=" + roomDescription
				+ ", roomStatus=" + roomStatus + ", buildingId=" + buildingId + "]";
	}



	
	
	
	
}
