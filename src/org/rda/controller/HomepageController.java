package org.rda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomepageController {
	/**
	 * 返回主界面
	 * 
	 * @param nothin
	 * @return
	 */
	@RequestMapping("/homepage")
	public String returnHomepage() {

		return "homepage";
	}
	
}
