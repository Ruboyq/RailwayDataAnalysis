package org.rda.mapper;

import java.util.List;

import org.rda.pojo.Customer;
import org.rda.pojo.QueryVo;

public interface CustomerMapper {

	/**
	 * 根据queryVo分页查询数据
	 * 
	 * @param queryVo
	 * @return
	 */
	List<Customer> queryCustomerByQueryVo(QueryVo queryVo);

	/**
	 * 根据queryVo查询数据条数
	 * 
	 * @param queryVo
	 * @return
	 */
	int queryCountByQueryVo(QueryVo queryVo);
	
	/**
	 * 根据id查询客户
	 * 
	 * @param id
	 * @return
	 */
	Customer queryCustomerById(Long id);
	
	/**
	 * 根据id编辑客户
	 * 
	 * @param customer
	 */
	void updateCustomerById(Customer customer);
	
	/**
	 * 根据id删除客户
	 * 
	 * @param id
	 */
	void deleteCustomerById(Long id);

}
