package org.rda.service;

import org.rda.pojo.QueryVo;
import org.rda.pojo.User;
import org.rda.utils.Page;

public interface UserService {
	/**
	 * 根据条件分页查询客户
	 * 
	 * @param queryVo
	 * @return
	 */
	Page<User> queryUserByQueryVo(QueryVo queryVo);
	
	/**
	 * 根据id查询数据
	 * 
	 * @param id
	 * @return
	 */
	User queryUserById(int id);
	
	/**
	 * 根据id编辑客户数据
	 * 
	 * @param user
	 */
	void updateUserById(User user);
	
	/**
	 * 根据id删除客户数据
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
	 * 根据邮件查询用户
	 * @param email
	 * @return
	 */
	User getUserByEmail(String email);
	
	/**
	 * 根据id更改密码
	 * @param id
	 * @param password
	 * @return
	 */
	boolean updatePassword(int userId,String userPwd);
}
