package org.rda.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.rda.pojo.BaseDict;
import org.rda.pojo.User;
import org.rda.service.BaseDictService;
import org.rda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomepageController {
	private static final String USER_DEPARTMENT = "001";
	@Autowired
	UserService userService;
	@Autowired
	BaseDictService baseDictService;
	/**
	 * 返回主界面
	 * 
	 * @param nothin
	 * @return
	 */
	@RequestMapping("/homepage")
	public String returnHomepage(HttpSession session,Model model) {
		int uid=(int) session.getAttribute("uid");
		User user=userService.queryUserById(uid);
		model.addAttribute("user", user);
		return "homepage";
	}
	/**
	 * 返回修改密码界面
	 * 
	 * @param nothin
	 * @return
	 */
	@RequestMapping("/toChangePassword")
	public String returnChangePasswordPage(HttpSession session,Model model) {
		int uid=(int) session.getAttribute("uid");
		User user=userService.queryUserById(uid);
		model.addAttribute("password", user.getUser_pwd());
		return "ChangePassword";
	}
	/**
	 * 返回修改个人资料界面
	 * 
	 * @param nothin
	 * @return
	 */
	@RequestMapping("/toChangeProfile")
	public String returnChangeProfilePage(HttpSession session,Model model) {
		int uid=(int) session.getAttribute("uid");
		User user=userService.queryUserById(uid);
		List<BaseDict> depType = this.baseDictService.queryBaseDictByDictTypeCode(this.USER_DEPARTMENT);
		model.addAttribute("depType", depType);
		model.addAttribute("user", user);
		return "ModifyInformation";
	}
}
