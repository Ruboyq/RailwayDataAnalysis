package org.rda.mapper;

import java.util.List;

import org.rda.pojo.City;

public interface CityMapper {
	/**
	 * 获取所有的原始站点信息
	 * @return
	 */
	List<City> getOriginalCitys();
	/**
	 * 获取所有的优化站点信息
	 * @return
	 */
	List<City> getOptimizedCitys();
}