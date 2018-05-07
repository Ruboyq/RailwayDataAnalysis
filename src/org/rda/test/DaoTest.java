package org.rda.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.rda.mapper.CityMapper;
import org.rda.mapper.RailwayCityMapper;
import org.rda.mapper.RailwayDataMapper;
import org.rda.mapper.UserMapper;
import org.rda.pojo.City;
import org.rda.pojo.Railway;
import org.rda.pojo.RailwayCity;
import org.rda.pojo.RailwayData;
import org.rda.pojo.User;

public class DaoTest extends BaseTest{
	@Resource
	//private UserMapper userMapper;
	//private UserMapper userMapper;
	private RailwayDataMapper rail;
	//private CityMapper cityMapper;
	
	@Test
	public void getUser(){
		System.out.println("ddddddd");
		//boolean b = rail.addRailwayCity(new RailwayCity("yl","sd",12,12f,12f));
		List<Railway> a = rail.getRailway();
		//List<RailwayCityMapper> a=rail.getFilterResult("","");
		//List<City> city = cityMapper.getOriginalCitys();
		//userMapper.updateUserPwd(12, "22222");
	//	userMapper.updateUserById(new User(12, "dddd","ddd","aa",22L, "s", 0, "d", "er", "ww", "1,2,3"));
		//String a = userMapper.getAuthorityByUserId(12);
		//Boolean b = userMapper.updateUserAuthority(12, "1,2");
		//String c = userMapper.getAuthorityByUserId(12);
//		User user = userMapper.loginUser(333, "");
//		List<String> a = 
//				userAuthorityMapper.searchUserAuthority(333);
//		System.out.println("ddddddd");
		//User a = userMapper.getUserByEmail("777@163.com");
		//System.out.println(b);
		System.out.println(a.size());
		//System.out.println(c);
		
	}
}
