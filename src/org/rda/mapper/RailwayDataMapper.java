package org.rda.mapper;

import java.util.List;
import java.util.Map;

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
	List<RailwayData> getFilterResult(@Param("fromCity") String fromCity,@Param("toCity") String toCity);
	 
	/**
	 * 根据品类名获取每个省份的总发货吨数1
	 * @param productId
	 * @return
	 */
	List<Map> getProvinceTonnage(int productId);
	
	/**
	 * 根据品类名和到货城市名获得前20条线路信息2.1
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getCityTonnage(@Param("productId") int productId,@Param("toCity") String toCity);
	
	/**
	 * 根据品类名和发货城市名获得前20条线路信息2.2
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getCityTonnage2(@Param("productId") int productId,@Param("fromCity") String fromCity);
	
	/**
	 * 给定月份和品类id的前两位获得当月的总发货量
	 * @return
	 */
	Float getProductTonnage(@Param("productId") int productId,@Param("date") String date);
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内每个发货城市的该商品发货量
	 * @return
	 */
	List<Map> getProductTonnagebyTime(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") int productId);
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内每个到货城市的该商品发货量
	 * @return
	 */
	List<Map> getProductTonnagebyTime2(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") int productId);
	
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内每个发货城市的该商品发货量,车数
	 * @return
	 */
	List<Map> getProductbyTime(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") int productId);
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内每个到货城市的该商品发货量，车数
	 * @return
	 */
	List<Map> getProductbyTime2(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") int productId);
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内前五效益
	 * @return
	 */
	List<Map> getBenifitbyTime(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") int productId);
}
