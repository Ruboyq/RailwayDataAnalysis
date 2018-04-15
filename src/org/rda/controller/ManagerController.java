package org.rda.controller;

import java.util.List;

import org.rda.service.ManagerAuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;

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
	@ResponseBody
	public String SearchAuthority(String useId){
		String AuthorityList = this.managerAuthorityService.searchUserAuthority(Integer.parseInt(useId));
		return AuthorityList;
	}
	
	/**
	 * 授予某个账号一个或多个权限
	 * 
	 * @param userId,authorityList
	 * @return
	 */
	
	@RequestMapping("/AuthorityGranting")
	@ResponseBody
	public String GrantAuthority(String useId,String authorityList){
		JSONObject jb=new JSONObject();
		boolean isGrant = this.managerAuthorityService.updateUserAuthority(Integer.parseInt(useId), authorityList);
		if(isGrant){
			jb.put("info", "授予成功");
			jb.put("status", "y");
		}else{
			jb.put("info", "授予失败");
			jb.put("status", "n");
		}
		return jb.toString();
	}
}
