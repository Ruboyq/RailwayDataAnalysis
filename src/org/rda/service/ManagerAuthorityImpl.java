package org.rda.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public class ManagerAuthorityImpl implements ManagerAuthorityService{

	@Override
	public List<String> searchUserAuthority(Long UseId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateUserAuthority(Long useId, List<String> UserAuthorityList) {
		// TODO Auto-generated method stub
		return false;
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
