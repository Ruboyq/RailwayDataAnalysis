package org.rda.pojo;

public class User {
	private int user_id;
	private String user_name;
	private String user_pwd;
	private String user_token;
	private Long user_activatetime;
	private String user_createdate;
	private int user_isValid;
	private String user_email;
	private String user_department;
	private String user_tel;
	public User(int user_id, String user_name, String user_pwd, String user_token, Long user_activatetime,
			String user_createdate, int user_isValid, String user_email, String user_department, String user_tel) {
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pwd = user_pwd;
		this.user_token = user_token;
		this.user_activatetime = user_activatetime;
		this.user_createdate = user_createdate;
		this.user_isValid = user_isValid;
		this.user_email = user_email;
		this.user_department = user_department;
		this.user_tel = user_tel;
	}
	public User(){}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_token() {
		return user_token;
	}
	public void setUser_token(String user_token) {
		this.user_token = user_token;
	}
	public Long getUser_activatetime() {
		return user_activatetime;
	}
	public void setUser_activatetime(Long user_activatetime) {
		this.user_activatetime = user_activatetime;
	}
	public String getUser_createdate() {
		return user_createdate;
	}
	public void setUser_createdate(String user_createdate) {
		this.user_createdate = user_createdate;
	}
	public int getUser_isValid() {
		return user_isValid;
	}
	public void setUser_isValid(int user_isValid) {
		this.user_isValid = user_isValid;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_department() {
		return user_department;
	}
	public void setUser_department(String user_department) {
		this.user_department = user_department;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
}
