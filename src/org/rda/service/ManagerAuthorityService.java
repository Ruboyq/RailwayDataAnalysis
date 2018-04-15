package org.rda.service;

import java.util.List;

public interface ManagerAuthorityService {
	/**
	 * 根据UserId查询用户拥有的权限
	 * 
	 * @param UserId
	 * @return
	 */
	String searchUserAuthority(Integer UseId);
	
	/**
	 * 根据UserId和新的UserAuthorityList更改用户拥有的权限
	 * 
	 * @param userId,UserAuthorityList
	 * @return
	 */
	boolean updateUserAuthority(Integer useId,String UserAuthorityList);
}
