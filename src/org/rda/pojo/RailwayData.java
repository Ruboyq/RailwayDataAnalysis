package org.rda.pojo;

public class RailwayData {
	private int id;
	private String productName;
	private int productId;
	private String fromCity;
	private String toCity;
	private String isTotal;
	private int carNum;
	private float tonnage;
	private double fromLongitude;
	private double fromLatitude;
	private double toLongitude;
	private double toLatitude;
	

	public RailwayData(int id, String productName, int productId, String fromCity, String toCity, String isTotal,
			int carNum, float tonnage, double fromLongitude, double fromLatitude, double toLongitude,
			double toLatitude) {
		super();
		this.id = id;
		this.productName = productName;
		this.productId = productId;
		this.fromCity = fromCity;
		this.toCity = toCity;
		this.isTotal = isTotal;
		this.carNum = carNum;
		this.tonnage = tonnage;
		this.fromLongitude = fromLongitude;
		this.fromLatitude = fromLatitude;
		this.toLongitude = toLongitude;
		this.toLatitude = toLatitude;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductId() {
		return productId;
	}


	public void setProductId(int productId) {
		this.productId = productId;
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


	public String getIsTotal() {
		return isTotal;
	}


	public void setIsTotal(String isTotal) {
		this.isTotal = isTotal;
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


	public RailwayData() {
		// TODO Auto-generated constructor stub
	}

}
