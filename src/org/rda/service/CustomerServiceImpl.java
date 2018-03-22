package org.rda.service;

import java.util.List;

import org.rda.mapper.CustomerMapper;
import org.rda.pojo.Customer;
import org.rda.pojo.QueryVo;
import org.rda.utils.Page;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerMapper customerMapper;

	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "查询查询条件客户")
	public Page<Customer> queryCustomerByQueryVo(QueryVo queryVo) {
		// 设置查询条件,从哪一条数据开始查
		queryVo.setStart((queryVo.getPage() - 1) * queryVo.getRows());

		// 查询数据结果集
		List<Customer> list = this.customerMapper.queryCustomerByQueryVo(queryVo);
		// 查询到的数据总条数
		int total = this.customerMapper.queryCountByQueryVo(queryVo);

		// 封装返回的page对象
		Page<Customer> page = new Page<>(total, queryVo.getPage(), queryVo.getRows(), list);

		return page;
	}
	
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "通过ID查询用户")
	public Customer queryCustomerById(Long id) {
		Customer customer = this.customerMapper.queryCustomerById(id);
		return customer;
	}
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "更新用户ID")
	public void updateCustomerById(Customer customer) {
		this.customerMapper.updateCustomerById(customer);
	}
	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "通过ID删除客户")
	public void deleteCustomerById(Long id) {
		this.customerMapper.deleteCustomerById(id);
	}
}
