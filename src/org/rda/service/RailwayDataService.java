package org.rda.service;

import java.util.List;

import org.rda.pojo.City;
import org.rda.pojo.RailwayData;

public interface RailwayDataService {
	
	/**
	 * 获取所有原始站点信息
	 * @return
	 */
	List<City> getOriginalCitys();
	
	/**
	 * 获取模糊查询结果
	 * @param from
	 * @param to
	 * @return
	 */
	List<RailwayData> getFilterResult(String from,String to);
}
