package org.rda.service;

import java.io.IOException;
import java.io.OutputStream;

import org.rda.mapper.UserMapper;
import org.rda.pojo.User;
import org.rda.utils.RandomCode;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{
	@Autowired
	private UserMapper userMapper;
	
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	//@SystemServiceLog(description = "用户尝试登录")
	public User loginUser(int id, String password) {
		User user = userMapper.loginUser(id,password);
		System.out.println(id+"###lservice####"+password);
		return user;
	}
	
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "发送验证码")
	public String sendCheckCode(OutputStream os,String format) {
		 // 验证码图片宽度，单位像素 
	    int width = 120; 
	    // 验证码图片高度，单位像素 
	    int height = 30; 
	    // 验证码字符长度 
	    int len = 4; 
	    // 获取验证码
	    String code = RandomCode.randomString(len);
	    // 把图片输出到response输出流 
	    try {
			RandomCode.write(code, width, height,os, format);
		} catch (IOException e) {
			e.printStackTrace();
		}
	    return code;
	}
}
