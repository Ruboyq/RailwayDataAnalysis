package org.rda.service;

import org.rda.pojo.Customer;
import org.rda.pojo.QueryVo;
import org.rda.utils.Page;

public interface CustomerService {
	/**
	 * 根据条件分页查询客户
	 * 
	 * @param queryVo
	 * @return
	 */
	Page<Customer> queryCustomerByQueryVo(QueryVo queryVo);
	
	/**
	 * 根据id查询数据
	 * 
	 * @param id
	 * @return
	 */
	Customer queryCustomerById(Long id);
	
	/**
	 * 根据id编辑客户数据
	 * 
	 * @param customer
	 */
	void updateCustomerById(Customer customer);
	
	/**
	 * 根据id删除客户数据
	 * 
	 * @param id
	 */
	void deleteCustomerById(Long id);
}
