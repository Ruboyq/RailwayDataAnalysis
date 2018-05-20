package org.rda.pojo;

public class RailwayCity {
	private String fromCity;
	private String toCity;
	private int carNum;
	private float tonnage;
	private double fromLongitude;
    private double fromLatitude;
	private double toLongitude;
	private double toLatitude;
	private float benefit;
	private String date;
	public String getFromCity() {
		return fromCity;
	}
	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}
	public String getToCity() {
		return toCity;
	}
	public void setToCity(String toCity) {
		this.toCity = toCity;
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
	public double getFromLongitude() {
		return fromLongitude;
	}
	public void setFromLongitude(double fromLongitude) {
		this.fromLongitude = fromLongitude;
	}
	public double getFromLatitude() {
		return fromLatitude;
	}
	public void setFromLatitude(double fromLatitude) {
		this.fromLatitude = fromLatitude;
	}
	public double getToLongitude() {
		return toLongitude;
	}
	public void setToLongitude(double toLongitude) {
		this.toLongitude = toLongitude;
	}
	public double getToLatitude() {
		return toLatitude;
	}
	public void setToLatitude(double toLatitude) {
		this.toLatitude = toLatitude;
	}
	public float getBenefit() {
		return benefit;
	}
	public void setBenefit(float benefit) {
		this.benefit = benefit;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public RailwayCity(String fromCity, String toCity, int carNum, float tonnage, double fromLongitude,
			double fromLatitude, double toLongitude, double toLatitude, float benefit, String date) {
		super();
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.carNum = carNum;
		this.tonnage = tonnage;
		this.fromLongitude = fromLongitude;
		this.fromLatitude = fromLatitude;
		this.toLongitude = toLongitude;
		this.toLatitude = toLatitude;
		this.benefit = benefit;
		this.date = date;
	}
	public RailwayCity() {
	}
	
}
