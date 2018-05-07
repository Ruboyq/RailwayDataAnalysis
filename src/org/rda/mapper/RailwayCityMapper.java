package org.rda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.rda.pojo.RailwayCity;
import org.rda.pojo.RailwayData;
import org.rda.pojo.User;

public interface RailwayCityMapper {
	/**
	 * 获取模糊查询结果
	 * @param from
	 * @param to
	 * @return
	 */
	List<RailwayCityMapper> getFilterResult(@Param("fromCity") String from,@Param("toCity") String to);

	/**
	 * 添加
	 * @param railwayCity
	 * @return
	 */
	boolean addRailwayCity(RailwayCity railwayCity);
}
