package org.rda.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.rda.mapper.UserAuthorityMapper;
import org.rda.mapper.UserMapper;
import org.rda.pojo.User;
import org.rda.pojo.UserAuthority;

public class DaoTest extends BaseTest{
	@Resource
	//private UserMapper userMapper;
	private UserAuthorityMapper userAuthorityMapper;
	
//	@Test
//	public void getUser(){
//		System.out.println("ddddddd");
//		//User user = userMapper.loginUser(333, "");
//		List<String> a = 
//				userAuthorityMapper.searchUserAuthority(333);
//		System.out.println("ddddddd");
//		System.out.println(a.get(0));
//	}
}
