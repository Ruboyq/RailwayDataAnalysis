package org.rda.controller;

import java.util.List;

import org.rda.service.ManagerAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

public class ManagerController {
	@Autowired
	ManagerAuthorityService managerAuthorityService;
	
	/**
	 * 查看一个账号拥有的所有权限
	 * 
	 * @param UserId
	 * @return
	 */
	@RequestMapping("/Authority")
	public List<String> SearchAuthority(String useId){
		List<String> AuthorityList = this.managerAuthorityService.searchUserAuthority(Long.parseLong(useId));
		
		return AuthorityList;
	}
	
	/**
	 * 授予某个账号一个或多个权限
	 * 
	 * @param userId,authorityList
	 * @return
	 */
	
	@RequestMapping("/AuthorityGranting")
	public boolean GrantAuthority(String useId,List<String> authorityList){
		boolean isGrant = this.managerAuthorityService.updateUserAuthority(Long.parseLong(useId), authorityList);
		
		return isGrant;
	}
}
