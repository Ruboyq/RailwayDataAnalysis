package org.rda.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.rda.mapper.UserMapper;
import org.rda.pojo.User;

public class DaoTest extends BaseTest{
	@Resource
	//private UserMapper userMapper;
	private UserMapper userMapper;
	
	@Test
	public void getUser(){
		System.out.println("ddddddd");
		userMapper.updateUserById(new User(12, "","","",22L, "", 0, "", "", "", ""));
		
//		User user = userMapper.loginUser(333, "");
//		List<String> a = 
//				userAuthorityMapper.searchUserAuthority(333);
//		System.out.println("ddddddd");
//		System.out.println(a.get(0));
	}
}
