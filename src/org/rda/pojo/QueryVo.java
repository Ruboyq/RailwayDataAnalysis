package org.rda.pojo;

public class QueryVo {
	private String userId;
	private String userName;
	private String userDep;

	// 当前页码数
	private Integer page = 1;
	// 数据库从哪一条数据开始查
	private Integer start;
	// 每页显示数据条数
	private Integer rows = 10;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserDep() {
		return userDep;
	}
	public void setUserDep(String userDep) {
		this.userDep = userDep;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	
	public QueryVo(String userId, String userName, String userDep, Integer page, Integer start, Integer rows) {
		this.userId = userId;
		this.userName = userName;
		this.userDep = userDep;
		this.page = page;
		this.start = start;
		this.rows = rows;
	}
	public QueryVo(){}
}
