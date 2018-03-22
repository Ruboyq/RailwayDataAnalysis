package org.rda.service;

import org.rda.pojo.SysUser;

public interface SysUserService {
	/**
	 * 根据id登录用户
	 * 
	 * @param id,password
	 * @return
	 */
	SysUser loginSysUser(Long id,String password);
}
