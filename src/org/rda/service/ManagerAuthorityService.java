package org.rda.service;

import java.util.List;

public interface ManagerAuthorityService {
	/**
	 * 根据UserId查询用户拥有的权限
	 * 
	 * @param UserId
	 * @return
	 */
	List<String> searchUserAuthority(Long UseId);
	
	/**
	 * 根据UserId和新的UserAuthorityList更改用户拥有的权限
	 * 
	 * @param userId,UserAuthorityList
	 * @return
	 */
	boolean updateUserAuthority(Long useId,List<String> UserAuthorityList);
}
