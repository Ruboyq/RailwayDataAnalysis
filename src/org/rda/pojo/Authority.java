package org.rda.pojo;

public class Authority {
	private int id;
	private String name;

	public Authority() {
		// TODO Auto-generated constructor stub
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

	public Authority(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	

}
