package org.rda.pojo;

public class City {
	private int id;
	private String name;
	private double longitude;
	private double latitude;
	private int isCenter;
	private int distinctId;

	public City(int id, String name, double longitude, double latitude, int isCenter, int distinctId) {
		super();
		this.id = id;
		this.name = name;
		this.longitude = longitude;
		this.latitude = latitude;
		this.isCenter = isCenter;
		this.distinctId = distinctId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public int getIsCenter() {
		return isCenter;
	}

	public void setIsCenter(int isCenter) {
		this.isCenter = isCenter;
	}

	public int getDistinctId() {
		return distinctId;
	}

	public void setDistinctId(int distinctId) {
		this.distinctId = distinctId;
	}

	public City() {
		// TODO Auto-generated constructor stub
	}

}
