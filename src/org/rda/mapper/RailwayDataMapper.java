package org.rda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.City;
import org.rda.pojo.RailwayData;

public interface RailwayDataMapper {
		
	/**
	 * 获取模糊查询结果
	 * @param from
	 * @param to
	 * @return
	 */
	List<RailwayData> getFilterResult(@Param("fromCity") String from,@Param("toCity") String to);
	
	
}
