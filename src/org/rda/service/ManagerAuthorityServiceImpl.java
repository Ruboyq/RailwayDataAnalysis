package org.rda.service;

import java.util.List;

import org.rda.mapper.UserAuthorityMapper;
import org.rda.mapper.UserMapper;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ManagerAuthorityServiceImpl implements ManagerAuthorityService{

	@Autowired
	private UserAuthorityMapper userAuthorityMapper;
	
	@Override
	@SystemServiceLog(description = "查询权限")
	public String searchUserAuthority(Integer useId) {
		// TODO Auto-generated method stub
		String result=userAuthorityMapper.getAuthorityByUserId(useId.intValue());
		return result;
	}

	@Override
	@SystemServiceLog(description = "更改权限")
	public boolean updateUserAuthority(Integer useId, String userAuthority) {
		// TODO Auto-generated method stub
		boolean flag=false;
		flag=userAuthorityMapper.updateUserAuthority(useId, userAuthority);
		return flag;
	}
	/*@Autowired
	//ManagerAuthorityMapper名称暂定
	private ManagerAuthorityMapper managerAuthorityMapper;
	
	@Override
	public List<String> searchUserAuthority(Long userId) {
		//数据库查询用户权限
		List<String> AuthorityList = managerAuthorityMapper.searchUserAuthority(userId);
		return AuthorityList;
	}
	
	@Override
	public boolean updateUserAuthority(Long userId,List<String> userAuthorityList){
		//数据库更改用户权限
		boolean updateUserAuthority = managerAuthorityMapper.updateUserAuthority(userId,userAuthorityList);
		return updateUserAuthority;
	}*/
}
