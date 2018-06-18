package org.rda.service;

import java.util.List;

import org.rda.mapper.UserMapper;
import org.rda.pojo.QueryVo;
import org.rda.pojo.User;
import org.rda.utils.Page;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	/**
	 * 根据条件分页查询客户
	 * 
	 * @param queryVo
	 * @return
	 */
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "查询查询条件客户")
	public Page<User> queryUserByQueryVo(QueryVo queryVo) {
		// 设置查询条件,从哪一条数据开始查
		queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());

		// 查询数据结果集
		List<User> list = this.userMapper.queryUserByQueryVo(queryVo);
		// 查询到的数据总条数
		int total = this.userMapper.queryCountByQueryVo(queryVo);

		// 封装返回的page对象
		Page<User> page = new Page<>(total, queryVo.getPage(), queryVo.getRows(), list);

		return page;
	}
	
	/**
	 * 根据id查询数据
	 * 
	 * @param id
	 * @return
	 */
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "通过ID查询用户")
	public User queryUserById(int id) {
		User user = this.userMapper.queryUserById(id);
		return user;
	}
	
	/**
	 * 根据id编辑客户数据
	 * 
	 * @param user
	 */
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "更新用户ID")
	public void updateUserById(User user) {
		this.userMapper.updateUserById(user);
	}
	/**
	 * 根据id删除客户数据
	 * 
	 * @param id
	 */
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "通过ID删除用户")
	public void deleteUserById(int id) {
		this.userMapper.deleteUserById(id);
	}

	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "添加用户")
	public boolean addUser(User user) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		if(userMapper.queryUserById(user.getUser_id())==null){
			flag=userMapper.addUser(user);
		}
		return flag;
	}

	/**
	 * 根据邮件查询用户
	 * @param email
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "通过email获取用户")
	public User getUserByEmail(String email) {
		// TODO 自动生成的方法存根
		return userMapper.getUserByEmail(email);
	}

	/**
	 * 根据id更改密码
	 * @param id
	 * @param password
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "更新用户密码")
	public boolean updatePassword(int userId, String userPwd) {
		// TODO 自动生成的方法存根
		return userMapper.updateUserPwd(userId, userPwd);
	}
}
