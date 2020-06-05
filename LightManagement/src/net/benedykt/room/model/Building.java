package net.benedykt.room.model;

public class Building {
	
	private Integer buildingId;
	private String buildingName;
	private String buildingDescription;
	private boolean buildingStatus;
	private String buildingAddress;
	
	
	public Building(Integer buildingId, String buildingName, String buildingDescription, boolean buildingStatus, String buildingAddress) {
		
		this(buildingName, buildingDescription, buildingStatus, buildingAddress);
		this.buildingId = buildingId;
	}
	
	public Building(String buildingName, String buildingDescription, boolean buildingStatus, String buildingAddress) {
		this.buildingName = buildingName;
		this.buildingDescription = buildingDescription;
		this.buildingStatus = buildingStatus;
		this.buildingAddress = buildingAddress;
	}
	
	public Building() {}

	public Integer getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	public String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(String buildingName) {
		this.buildingName = buildingName;
	}

	public String getBuildingDescription() {
		return buildingDescription;
	}

	public void setBuildingDescription(String buildingDescription) {
		this.buildingDescription = buildingDescription;
	}

	public boolean getBuildingStatus() {
		return buildingStatus;
	}

	public void setBuildingStatus(boolean buildingStatus) {
		this.buildingStatus = buildingStatus;
	}

	public String getBuildingAddress() {
		return buildingAddress;
	}

	public void setBuildingAddress(String buildingAddress) {
		this.buildingAddress = buildingAddress;
	}

	@Override
	public String toString() {
		return "Building [buildingId=" + buildingId + ", buildingName=" + buildingName + ", buildingDescription="
				+ buildingDescription + ", buildingStatus=" + buildingStatus + ", buildingAddress=" + buildingAddress
				+ "]";
	}
	
	
	
	


}
