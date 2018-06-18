package org.rda.service;

import java.util.List;

import org.rda.mapper.UserMapper;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ManagerAuthorityServiceImpl implements ManagerAuthorityService{

	@Autowired
	private UserMapper userMapper;
	
	/**
	 * 根据UserId查询用户拥有的权限
	 * 
	 * @param UserId
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "查询权限")
	public String searchUserAuthority(Integer useId) {
		// TODO Auto-generated method stub
		String result=userMapper.getAuthorityByUserId(useId.intValue());
		return result;
	}

	/**
	 * 根据UserId和新的UserAuthorityList更改用户拥有的权限
	 * 
	 * @param userId,UserAuthorityList
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "更改权限")
	public boolean updateUserAuthority(Integer useId, String userAuthority) {
		// TODO Auto-generated method stub
		boolean flag=false;
		flag=userMapper.updateUserAuthority(useId, userAuthority);
		return flag;
	}
}
