package org.rda.pojo;

import java.util.List;

public class UserAuthority {
	private int userId;
	private int authorityId;

	public UserAuthority() {
		// TODO Auto-generated constructor stub
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(int authorityId) {
		this.authorityId = authorityId;
	}

	public UserAuthority(int userId, int authorityId) {
		super();
		this.userId = userId;
		this.authorityId = authorityId;
	}
	
}
