package org.rda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface DataCompanyMapper {
	/**
	 * 获取每个公司的总车数 
	 * @return
	 */
	List<Integer> getCarNum(@Param("productId") String productId,@Param("time") String time);
	
	/**
	 * 获取每个公司的总吨数
	 * @return
	 */
	List<Integer> getCarTon(@Param("productId") String productId,@Param("time") String time);
}