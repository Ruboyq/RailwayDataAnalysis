package org.rda.pojo;

public class Railway {
	private String fromCity;
	private String toCity;
	private int carNum;
	private float tonnage;
	public Railway() {
		super();
		// TODO Auto-generated constructor stub
	}
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
	public Railway(String fromCity, String toCity, int carNum, float tonnage) {
		super();
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.carNum = carNum;
		this.tonnage = tonnage;
	}

}
