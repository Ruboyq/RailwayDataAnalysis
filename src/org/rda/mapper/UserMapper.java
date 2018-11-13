package org.rda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.QueryVo;
import org.rda.pojo.RailwayData;
import org.rda.pojo.User;

public interface UserMapper {
	/**
	 * 根据id及pwd查找相应用户
	 * 
	 * @param id,password
	 * @return
	 */
	User loginUser(@Param("id") int id,@Param("password") String password);
	
	/**
	 * 根据queryVo分页查询数据
	 * 
	 * @param queryVo
	 * @return
	 */
	List<User> queryUserByQueryVo(QueryVo queryVo);

	/**
	 * 根据queryVo查询数据条数
	 * 
	 * @param queryVo
	 * @return
	 */
	int queryCountByQueryVo(QueryVo queryVo);
	
	/**
	 * 根据id查询客户
	 * 
	 * @param id
	 * @return
	 */
	User queryUserById(int id);
	
	/**
	 * 根据id更新客户
	 * 
	 * @param user
	 */
	void updateUserById(User user);
	
	/**
	 * 根据email查询客户
	 * 
	 * @param user
	 * @return
	 */
	User getUserByEmail(String email);
	
	/**
	 * 根据id删除客户
	 * 
	 * @param id
	 */
	void deleteUserById(int id);

	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	boolean addUser(User user);
	
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

	/**
	 * 修改用户密码
	 * @param id,userAuthority
	 * @return 
	 */
	boolean updateUserPwd(@Param("userId") Integer userId,@Param("userPwd") String userPwd);

	/**
	 * 获取模糊查询结果
	 * @param from
	 * @param to
	 * @return
	 */
	List<RailwayData> getFilterResult(@Param("fromCity") String from,@Param("toCity") String to);
}