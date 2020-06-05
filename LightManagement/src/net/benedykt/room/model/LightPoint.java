package net.benedykt.room.model;

public class LightPoint {
	
	private Integer lightPointId;
	private String lightPointName;
	private String lightPointDescription;
	private boolean lightPointStatus;
	private Integer roomId;
	private Integer lightId;
	private Integer bulbId;


	
	public LightPoint(Integer lightPointId, String lightPointName, String lightPointDescription, boolean lightPointStatus,
			Integer roomId, Integer lightId, Integer bulbId) {
		this(lightPointName, lightPointDescription, lightPointStatus, roomId, lightId, bulbId);
		this.lightPointId = lightPointId;
	}

	public LightPoint(String lightPointName, String lightPointDescription, boolean lightPointStatus,
			Integer roomId, Integer lightId, Integer bulbId) {
		this.lightPointName = lightPointName;
		this.lightPointDescription = lightPointDescription;
		this.lightPointStatus = lightPointStatus;
		this.roomId = roomId;
		this.lightId = lightId;
		this.bulbId = bulbId;
	}
	
	public LightPoint() {}
	

	public Integer getLightPointId() {
		return lightPointId;
	}

	public void setLightPointId(Integer lightPointId) {
		this.lightPointId = lightPointId;
	}

	public String getLightPointName() {
		return lightPointName;
	}

	public void setLightPointName(String lightPointName) {
		this.lightPointName = lightPointName;
	}

	public String getLightPointDescription() {
		return lightPointDescription;
	}

	public void setLightPointDescription(String lightPointDescription) {
		this.lightPointDescription = lightPointDescription;
	}

	public boolean getLightPointStatus() {
		return lightPointStatus;
	}

	public void setLightPointStatus(boolean lightPointStatus) {
		this.lightPointStatus = lightPointStatus;
	}

	public Integer getRoomId() {
		return roomId;
	}

	public void setRoomId(Integer roomId) {
		this.roomId = roomId;
	}

	public Integer getLightId() {
		return lightId;
	}

	public void setLightId(Integer lightId) {
		this.lightId = lightId;
	}

	public Integer getBulbId() {
		return bulbId;
	}

	public void setBulbId(Integer bulbId) {
		this.bulbId = bulbId;
	}

	@Override
	public String toString() {
		return "LightPoint [lightPointId=" + lightPointId + ", lightPointName=" + lightPointName
				+ ", lightPointDescription=" + lightPointDescription + ", lightPointStatus=" + lightPointStatus
				+ ", roomId=" + roomId + ", lightId=" + lightId + ", bulbId=" + bulbId + "]";
	}

	
	

	


}
