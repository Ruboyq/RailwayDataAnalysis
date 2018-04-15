package org.rda.test;


import org.junit.Test;
import org.rda.pojo.User;
import org.rda.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;

public class ServiceTest extends BaseTest{
	@Autowired
	private LoginService loginService;
	
	@Test
	public void getUser(){
		User user = loginService.loginUser(7, "777777");
		System.out.println(user.getUser_id());
	}
}
