package org.rda.pojo;

public class City {
	private int id;
	private String name;
	private double longitude;
	private double latitude;
	private int isCenter;
	private int distinctId;
	private int carNum;
	private float tonnage;
	public City(int id, String name, double longitude, double latitude, int isCenter, int distinctId, int carNum,
			float tonnage) {
		super();
		this.id = id;
		this.name = name;
		this.longitude = longitude;
		this.latitude = latitude;
		this.isCenter = isCenter;
		this.distinctId = distinctId;
		this.carNum = carNum;
		this.tonnage = tonnage;
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
	public int getCarNum() {
		return carNum;
	}
	public void setCarNum(int carNum) {
		this.carNum = carNum;
	}
	public float getTonnage() {
		return tonnage;
	}
	public void setTonnage(float tonnage) {
		this.tonnage = tonnage;
	}
	public String toString() {
		return longitude+","+latitude+","+name+","+carNum+","+tonnage;
	}
	public City() {
		super();
		// TODO Auto-generated constructor stub
	}
}
