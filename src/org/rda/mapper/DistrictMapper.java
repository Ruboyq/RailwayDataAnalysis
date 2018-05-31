package org.rda.mapper;

import java.util.List;

import org.rda.pojo.City;
import org.rda.pojo.District;
import org.rda.pojo.RailwayCity;

public interface DistrictMapper {
	
	/**
	 * 获取所有的区域信息
	 * @return
	 */
	List<District> getAllDistrict();
	/**
	 * 获取所有的中心对信息
	 * @return
	 */
	List<RailwayCity> getAllCenterPairs();
}
