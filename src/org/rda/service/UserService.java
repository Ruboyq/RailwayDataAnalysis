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
}
