package org.rda.mapper;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.SysUser;

public interface SysUserMapper {
	/**
	 * 根据id查询用户
	 * 
	 * @param id,password
	 * @return
	 */
	SysUser loginSysUser(@Param("id") Long id,@Param("password") String password);
}
