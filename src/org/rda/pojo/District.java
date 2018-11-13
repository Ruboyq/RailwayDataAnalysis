package org.rda.pojo;

public class District {
	private int id;
	private double longitude;
	private double latitude;
	private float radius;
 
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public float getRadius() {
		return radius;
	}

	public void setRadius(float radius) {
		this.radius = radius;
	}

	public District(int id, double longitude, double latitude, float radius) {
		super();
		this.id = id;
		this.longitude = longitude;
		this.latitude = latitude;
		this.radius = radius;
	}

	public District() {
	}
	
	public String toString() {
		return id+","+longitude+","+latitude+", ";
	}

}
