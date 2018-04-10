package org.rda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.QueryVo;
import org.rda.pojo.UserAuthority;

public interface UserAuthorityMapper {
		
	/**
	 * 根据用户id查询用户所具有的权限
	 * 
	 * @param userId
	 * @return 用户权限数组
	 */
	List<String> searchUserAuthority(int userId);
	
	/**
	 * 修改用户权限
	 * 
	 * @param userId,userAuthorityList
	 */
	void updateUserById(int userId,List<String> userAuthorityList);

}
