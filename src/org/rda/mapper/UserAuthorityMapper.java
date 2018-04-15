package org.rda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.QueryVo;
import org.rda.pojo.UserAuthority;

public interface UserAuthorityMapper {
		
	/**
	 * 根据id获得用户权限
	 * @param id
	 * @return 权限
	 */
	String getAuthorityByUserId(int userId);
	
	/**
	 * 修改用户权限
	 * @param id,userAuthority
	 * @return 
	 */
	boolean updateUserAuthority(@Param("userId") Integer userId,@Param("userAuthority") String userAuthority);


}
