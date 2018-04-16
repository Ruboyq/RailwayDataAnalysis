package org.rda.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.exceptions.IbatisException;
import org.rda.pojo.BaseDict;
import org.rda.pojo.QueryVo;
import org.rda.pojo.User;
import org.rda.service.BaseDictService;
import org.rda.service.ManagerAuthorityService;
import org.rda.service.UserService;
import org.rda.utils.Page;
import org.rda.utils.SystemControllerLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

import org.rda.utils.MailUtil;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final String USER_DEPARTMENT = "001";
	@Autowired
	BaseDictService baseDictService;
	@Autowired
	UserService userService;
	@Autowired
	ManagerAuthorityService managerAuthorityService;
	
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
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	@RequestMapping("/add")
	@ResponseBody
	public String addUser(User user){
		JSONObject jb=new JSONObject();
		boolean flag=userService.addUser(user);
		if(flag){
			//发送激活邮件
			try {
				user = MailUtil.activateMail(user);
				// 重新设置了有效时间和token激活码
				userService.updateUserById(user);
			} catch (AddressException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			jb.put("info", "添加成功");
			jb.put("status", "y");
		}else{
			jb.put("info", "添加失败，工号重复");
			jb.put("status", "n");
		}
		return jb.toString();
	}
	
	/**
	 * 激活账号
	 * @return
	 */
	@RequestMapping("/toActivate")
	public String activateUser(@RequestParam("email") String email,@RequestParam("token") String token,Model model){
		String message = null;
		Long time = System.currentTimeMillis();
		User user = userService.getUserByEmail(email);
		try{
			if (user != null) {
				if (user.getUser_isValid() == 0 && user.getUser_activatetime() != 0) {  //未激活
					
					if (user.getUser_activatetime() < time) { // 过期--激活失败
						// 重新发送激活邮件
						user = MailUtil.activateMail(user);
						// 重新设置了有效时间和token激活码
						userService.updateUserById(user);
					} else if (user.getUser_activatetime() > time) {// 在时间内
						
						if (user.getUser_token().equals(token)) {// 在时间内且激活码通过，激活成功
							user.setUser_isValid(1);
							user.setUser_createdate(new Date().toString());
							// 重新设置token防止被禁用的用户利用激活
							user.setUser_token(token.replace("1", "c"));
							userService.updateUserById(user);
							// resp.getWriter().write(JsonUtil.toJson(u));
							message = "Activate successfully！";
							model.addAttribute("message", message);
						} else { // 在时间内但是激活码错误 
							message = "The activation code is wrong！";
							model.addAttribute("message", message);
						}
					}
				} else if (user.getUser_isValid() == 1) { // 已经被激活的重复点链接
					message = "The user has been activated！";
					model.addAttribute("message", message);
				}
				// u为空
			} else if (user == null) {
				message = "Wrong user！";
				model.addAttribute("message", message);
			}
		}
		catch(MessagingException | NoSuchAlgorithmException e){
			
			// Redirect to exception page
			return "redirect:/toError";
		}
		return "redirect:/";
	}
	
	/**
	 * 查看一个账号拥有的所有权限
	 * 
	 * @param UserId
	 * @return
	 */
	@RequestMapping("/editAuth")
	@ResponseBody
	public String SearchAuthority(String id){
		JSONObject jb=new JSONObject();
		String authorityList = this.managerAuthorityService.searchUserAuthority(Integer.parseInt(id));
		if (authorityList != null){
			String[] rights=authorityList.split(",");
			jb.put("rights", rights);
		}
		return jb.toString();
	}
	
	/**
	 * 授予某个账号一个或多个权限
	 * 
	 * @param userId,authorityList
	 * @return
	 */
	@RequestMapping("/updateAuth")
	@ResponseBody
	public String GrantAuthority(String user_id,@RequestParam("rights") String[] rights){
		JSONObject jb=new JSONObject();
		String authorityList="";
		for(int i=0;i<rights.length;i++){
			if(i==rights.length-1)
				authorityList+=rights[i];
			else
				authorityList=authorityList+rights[i]+",";
		}
		boolean isGrant = this.managerAuthorityService.updateUserAuthority(Integer.parseInt(user_id), authorityList);
		if(isGrant){
			jb.put("info", "授予成功");
			jb.put("status", "y");
		}else{
			jb.put("info", "授予失败");
			jb.put("status", "n");
		}
		return jb.toString();
	}
	
	/**
	 * 修改用户密码
	 * @param password
	 * @param session
	 * @return
	 */
	@RequestMapping("/changePassword")
	@ResponseBody
	public String changePassword(String password,HttpSession session){
		JSONObject jb=new JSONObject();
		int uid=(int) session.getAttribute("uid");
		boolean flag=userService.updatePassword(uid, password);
		if(flag){
			jb.put("info", "修改成功");
			jb.put("status", "y");
		}else{
			jb.put("info", "修改失败");
			jb.put("status", "n");
		}
		return jb.toString();
	}
}
