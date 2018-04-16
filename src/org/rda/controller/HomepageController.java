package org.rda.controller;

import javax.servlet.http.HttpSession;

import org.rda.pojo.User;
import org.rda.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomepageController {
	@Autowired
	UserService userService;
	
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
}
