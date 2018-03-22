package org.rda.service;

import org.rda.mapper.SysUserMapper;
import org.rda.pojo.SysUser;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class SysUserServiceImpl implements SysUserService{
	@Autowired
	private SysUserMapper sysuserMapper;
	
	@Override
	public SysUser loginSysUser(Long id, String password) {
		SysUser sysuser = sysuserMapper.loginSysUser(id,password);
		return sysuser;
	}

}
