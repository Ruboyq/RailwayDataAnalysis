package org.rda.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.rda.pojo.BaseDict;
import org.rda.pojo.Customer;
import org.rda.pojo.QueryVo;
import org.rda.service.BaseDictService;
import org.rda.service.CustomerService;
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
@RequestMapping("/customer")
public class CustomerController{

	private static final String CUSTOMER_LEVEL_TYPE = "006";
	private static final String CUSTOMER_FROM_TYPE = "002";
	private static final String CUSTOMER_INDUSTRY_TYPE = "001";
	@Autowired
	CustomerService customerService;
	@Autowired
	BaseDictService baseDictService;
	
	/**
	 * 查询所有用户,返回customer页面
	 * 
	 * @param queryVo,model
	 * @return
	 */
	@RequestMapping("/list")
	public String queryCustomerList(QueryVo queryVo, Model model) {

		try {
			// 解决get请求乱码问题
			if (StringUtils.isNotBlank(queryVo.getCustName())) {
				queryVo.setCustName(new String(queryVo.getCustName().getBytes("ISO-8859-1"), "UTF-8"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 客户来源
		List<BaseDict> fromType = this.baseDictService.queryBaseDictByDictTypeCode(this.CUSTOMER_FROM_TYPE);
		// 所属行业
		List<BaseDict> industryType = this.baseDictService.queryBaseDictByDictTypeCode(this.CUSTOMER_INDUSTRY_TYPE);
		// 客户级别
		List<BaseDict> levelType = this.baseDictService.queryBaseDictByDictTypeCode(this.CUSTOMER_LEVEL_TYPE);

		// 把前端页面需要显示的数据放到模型中
		model.addAttribute("fromType", fromType);
		model.addAttribute("industryType", industryType);
		model.addAttribute("levelType", levelType);

		// 分页查询数据
		Page<Customer> page = this.customerService.queryCustomerByQueryVo(queryVo);
		// 把分页查询的结果放到模型中
		model.addAttribute("page", page);

		// 数据回显
		model.addAttribute("custName", queryVo.getCustName());
		model.addAttribute("custSource", queryVo.getCustSource());
		model.addAttribute("custIndustry", queryVo.getCustIndustry());
		model.addAttribute("custLevel", queryVo.getCustLevel());

		return "customer";
	}
	
	/**
	 * 根据id查询用户,返回json格式数据
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/edit")
	@ResponseBody
	public Customer queryCustomerById(Long id) {
		Customer customer = this.customerService.queryCustomerById(id);
		return customer;
	}
	
	/**
	 * 更新用户信息,返回customer页面
	 * 
	 * @param cus
	 * @return
	 */
	@RequestMapping(value="/update",method = {RequestMethod.POST})
	//此处为记录AOP拦截Controller记录用户操作  
    @SystemControllerLog(description = "更新客户信息")
	public String updateCustomerInfo(Customer cus) {
		this.customerService.updateCustomerById(cus);
		return "customer";
	}
	
	/**
	 * 根据id删除用户信息,返回customer页面
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	//此处为记录AOP拦截Controller记录用户操作  
    @SystemControllerLog(description = "通过ID删除客户") 
	public String deleteCustomerByID(Long id) {
		this.customerService.deleteCustomerById(id);
		return "customer";
	}
	
	/**
	 * 注销当前用户
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/logoff")
	public String logoff(HttpSession session) throws IOException, JSONException {
		session.setAttribute("userId", null);
		session.setAttribute("code", null);
		return "redirect:/";
	}
}
