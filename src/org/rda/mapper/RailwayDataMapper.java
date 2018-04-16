package org.rda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.City;
import org.rda.pojo.RailwayData;

public interface RailwayDataMapper {
	/**
	 * 获取所有的原始站点信息
	 * @return
	 */
	List<City> getOriginalCitys();
	
	/**
	 * 获取模糊查询结果
	 * @param from
	 * @param to
	 * @return
	 */
	List<RailwayData> getFilterResult(@Param("fromCity") String fromCity,@Param("toCity") String toCity);
	
	
}
