package org.rda.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.rda.mapper.RailwayDataMapper;
import org.rda.mapper.UserMapper;
import org.rda.pojo.RailwayData;
import org.rda.pojo.User;

public class DaoTest extends BaseTest{
	@Resource
	//private UserMapper userMapper;
	//private UserMapper userMapper;
	private RailwayDataMapper rail;
	
	@Test
	public void getUser(){
		System.out.println("ddddddd");
		List<RailwayData> a=rail.getFilterResult("广州","");
		
		//userMapper.updateUserPwd(12, "22222");
		//userMapper.addUser(new User(122, "dddd","ddd","aa",22L, "s", 0, "d", "er", "ww", "fff"));
		//String a = userMapper.getAuthorityByUserId(12);
		//Boolean b = userMapper.updateUserAuthority(12, "1,2");
		//String c = userMapper.getAuthorityByUserId(12);
//		User user = userMapper.loginUser(333, "");
//		List<String> a = 
//				userAuthorityMapper.searchUserAuthority(333);
//		System.out.println("ddddddd");
		//User a = userMapper.getUserByEmail("777@163.com");
		//System.out.println(a.getUser_name());
		System.out.println(a.size());
		//System.out.println(c);
		
	}
}
