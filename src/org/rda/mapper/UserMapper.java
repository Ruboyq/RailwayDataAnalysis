package org.rda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.QueryVo;
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
}
