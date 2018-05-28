package org.rda.mapper;

import java.util.List;

import org.rda.pojo.City;
import org.rda.pojo.District;

public interface DistrictMapper {
	
	/**
	 * 获取所有的原始站点信息
	 * @return
	 */
	List<District> getAllDistrict();

}
