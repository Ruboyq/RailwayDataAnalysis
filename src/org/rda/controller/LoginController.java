package org.rda.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.rda.pojo.User;
import org.rda.service.LoginService;
import org.rda.utils.SpiderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

@Controller
public class LoginController {
	@Autowired
	LoginService loginService;

	/**
	 * 生成随机验证码
	 * 
	 * @param session,response
	 * @return
	 */
	@RequestMapping("/picturecheckcode")
	public void sendCode(HttpSession session, HttpServletResponse response) throws IOException {
		// 验证码图片格式
		String format = "png";
		// 设置图片格式
		response.setContentType("image/" + format);
		// 禁止浏览器缓存图片
		String code = this.loginService.sendCheckCode(response.getOutputStream(), format);
		session.setAttribute("code", code);
	}
	
	/**
	 * 检查验证码输入是否正确,返回json数据
	 * 
	 * @param param,session
	 * @return
	 */
	@RequestMapping("/checkcode")
	@ResponseBody
	public String checkCode(String param, HttpSession session) throws IOException, JSONException {
		JSONObject jb = new JSONObject();
		if (param.equals(session.getAttribute("code"))) {
			jb.put("info", "验证码输入正确");
			jb.put("status", "y");
		} else {
			jb.put("info", "验证码输入错误");
			jb.put("status", "n");
		}
		return jb.toString();
	}

	/**
	 * 判断账号密码是否正确,是否允许登录
	 * 
	 * @param id,password,session
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String login(int id,String password,HttpSession session) throws IOException, JSONException {
		JSONObject jb = new JSONObject();
		User u = this.loginService.loginUser(id, password);
		if (u != null) {
			session.setAttribute("uid", id);
			jb.put("info", "登录成功！");
			jb.put("status", "y");
		} else {
			jb.put("info", "用户ID或者密码错误");
			jb.put("status", "n");
		}
		return jb.toString();
	}
}
