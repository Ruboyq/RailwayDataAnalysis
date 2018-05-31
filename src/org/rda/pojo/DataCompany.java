package org.rda.pojo;

public class DataCompany {
	private int id;
	private String date;
	private String productName;
	private int productId;
	private String fromDepart;
	private String fromCity;
	private String toDepart;
	private String toCity;
	private String company;
	private String isTotal;
	private int carNum;
	private float tonnage;
	private float income;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
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
	public String getFromDepart() {
		return fromDepart;
	}
	public void setFromDepart(String fromDepart) {
		this.fromDepart = fromDepart;
	}
	public String getFromCity() {
		return fromCity;
	}
	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}
	public String getToDepart() {
		return toDepart;
	}
	public void setToDepart(String toDepart) {
		this.toDepart = toDepart;
	}
	public String getToCity() {
		return toCity;
	}
	public void setToCity(String toCity) {
		this.toCity = toCity;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
	public float getIncome() {
		return income;
	}
	public void setIncome(float income) {
		this.income = income;
	}
	public DataCompany(int id, String date, String productName, int productId, String fromDepart, String fromCity,
			String toDepart, String toCity, String company, String isTotal, int carNum, float tonnage, float income) {
		super();
		this.id = id;
		this.date = date;
		this.productName = productName;
		this.productId = productId;
		this.fromDepart = fromDepart;
		this.fromCity = fromCity;
		this.toDepart = toDepart;
		this.toCity = toCity;
		this.company = company;
		this.isTotal = isTotal;
		this.carNum = carNum;
		this.tonnage = tonnage;
		this.income = income;
	}
	public DataCompany() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
