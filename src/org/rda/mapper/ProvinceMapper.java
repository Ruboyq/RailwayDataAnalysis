package org.rda.mapper;

import java.util.List;

import org.rda.pojo.Province;

public interface ProvinceMapper {

	/**
	 * 获取城市省份信息
	 * @return
	 */
	List<Province> getAllProvince();
	
	/**
	 * 添加
	 * @param Province
	 * @return
	 */
	boolean addProvince(Province province);
	
	List<String> getProvinces();
}