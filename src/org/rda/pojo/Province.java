package org.rda.pojo;

public class Province {
	private String province;
	private String city;
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public Province(String province, String city) {
		super();
		this.province = province;
		this.city = city;
	}
	public void setCity(String city) {
		this.city = city;
	}

}
