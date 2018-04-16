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
	
	@Override
	@SystemServiceLog(description = "查询权限")
	public String searchUserAuthority(Integer useId) {
		// TODO Auto-generated method stub
		String result=userMapper.getAuthorityByUserId(useId.intValue());
		return result;
	}

	@Override
	@SystemServiceLog(description = "更改权限")
	public boolean updateUserAuthority(Integer useId, String userAuthority) {
		// TODO Auto-generated method stub
		boolean flag=false;
		flag=userMapper.updateUserAuthority(useId, userAuthority);
		return flag;
	}
}
