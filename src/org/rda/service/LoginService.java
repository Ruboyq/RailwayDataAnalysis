package org.rda.service;

import java.io.OutputStream;

import org.rda.pojo.User;

public interface LoginService {
	/**
	 * 根据id及pwd查找相应用户
	 * 
	 * @param id,password
	 * @return
	 */
	User loginUser(int id,String password);
	/**
	 * 发送验证码图片到前端
	 * 
	 * @param os,format
	 * @return
	 */
	public String sendCheckCode(OutputStream os,String format);
}
