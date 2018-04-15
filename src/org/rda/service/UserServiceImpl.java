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
	
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "通过ID查询用户")
	public User queryUserById(int id) {
		User user = this.userMapper.queryUserById(id);
		return user;
	}
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "更新用户ID")
	public void updateUserById(User user) {
		this.userMapper.updateUserById(user);
	}
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "通过ID删除用户")
	public void deleteUserById(int id) {
		this.userMapper.deleteUserById(id);
	}

	@Override
	public boolean addUser(User user) {
		// TODO 自动生成的方法存根
		boolean flag=false;
		if(userMapper.queryUserById(user.getUser_id())==null){
			flag=userMapper.addUser(user);
		}
		return flag;
	}

	@Override
	public User getUserByEmail(String email) {
		// TODO 自动生成的方法存根
		return userMapper.getUserByEmail(email);
	}
}
