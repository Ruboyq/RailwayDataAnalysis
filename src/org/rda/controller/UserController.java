package org.rda.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.rda.pojo.BaseDict;
import org.rda.pojo.QueryVo;
import org.rda.pojo.User;
import org.rda.service.BaseDictService;
import org.rda.service.UserService;
import org.rda.utils.Page;
import org.rda.utils.SystemControllerLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONException;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final String USER_DEPARTMENT = "001";
	@Autowired
	BaseDictService baseDictService;
	@Autowired
	UserService userService;
	/**
	 * 查询所有用户,返回user页面
	 * 
	 * @param queryVo,model
	 * @return
	 */
	@RequestMapping("/list")
	public String queryCustomerList(QueryVo queryVo, Model model) {

		try {
			// 解决get请求乱码问题
			if (StringUtils.isNotBlank(queryVo.getUserName())) {
				queryVo.setUserName(new String(queryVo.getUserName().getBytes("ISO-8859-1"), "UTF-8"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 客户部门
		List<BaseDict> depType = this.baseDictService.queryBaseDictByDictTypeCode(this.USER_DEPARTMENT);

		// 把前端页面需要显示的数据放到模型中
		model.addAttribute("depType", depType);

		// 分页查询数据
		Page<User> page = this.userService.queryUserByQueryVo(queryVo);
		// 把分页查询的结果放到模型中
		model.addAttribute("page", page);
		System.out.println("uid############"+queryVo.getUserId());
		// 数据回显
		model.addAttribute("userId", queryVo.getUserId());
		model.addAttribute("userName", queryVo.getUserName());
		model.addAttribute("userDepartment", queryVo.getUserDep());

		return "user";
	}
	
	/**
	 * 根据id查询用户,返回json格式数据
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public User queryUserById(int id) {
		User user = this.userService.queryUserById(id);
		return user;
	}
	
	/**
	 * 更新用户信息,返回user页面
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value="/update",method = {RequestMethod.POST})
	//此处为记录AOP拦截Controller记录用户操作  
    @SystemControllerLog(description = "更新用户信息")
	public String updateUserInfo(User user) {
		this.userService.updateUserById(user);
		return "user";
	}
	
	/**
	 * 根据id删除用户信息,返回user页面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	//此处为记录AOP拦截Controller记录用户操作  
    @SystemControllerLog(description = "通过ID删除用户") 
	public String deleteUserByID(int id) {
		this.userService.deleteUserById(id);
		return "user";
	}
	
	/**
	 * 注销当前用户
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/logoff")
	public String logoff(HttpSession session) throws IOException, JSONException {
		session.setAttribute("uid", null);
		session.setAttribute("code", null);
		return "redirect:/";
	}
}
