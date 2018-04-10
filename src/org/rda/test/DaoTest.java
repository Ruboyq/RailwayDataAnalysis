package org.rda.test;

import javax.annotation.Resource;

import org.junit.Test;
import org.rda.mapper.UserMapper;
import org.rda.pojo.User;

public class DaoTest extends BaseTest{
	@Resource
	private UserMapper userMapper;
	
	@Test
	public void getUser(){
		User user = userMapper.loginUser(7, "777777");
		System.out.println(user.getUser_id());
	}
}
