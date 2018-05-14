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
}
