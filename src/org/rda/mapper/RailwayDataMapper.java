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
	 * 根据品类名及时间获取局别的运量情况-发站
	 * @param productId
	 * @return
	 */
	List<Map> getCompanyTable1(@Param("productId") String productId,@Param("time") String time);
	/**
	 * 根据品类名及时间获取局别的运量情况-到站
	 * @param productId
	 * @return
	 */
	List<Map> getCompanyTable2(@Param("productId") String productId,@Param("time") String time);
	
	/**
	 * 根据品类名获取每个省份的总发货吨数-发站
	 * @param productId
	 * @return
	 */
	List<Map> getProvinceTonnage1(@Param("productId") String productId,@Param("time") String time);
	/**
	 * 根据品类名获取每个省份的总到货吨数-到站
	 * @param productId
	 * @return
	 */
	List<Map> getProvinceTonnage2(@Param("productId") String productId,@Param("time") String time);
	
	/**
	 * 根据品类名和到货城市名获得前20条线路信息2.1
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getCityTonnage(@Param("productId") String productId,@Param("toCity") String toCity,@Param("time") String time);
	
	/**
	 * 根据品类名和发货城市名获得前20条线路信息2.2
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getCityTonnage2(@Param("productId") String productId,@Param("fromCity") String fromCity,@Param("time") String time);
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.1-发站
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getProvinceTonnageRank1(@Param("productId") String productId,@Param("fromProvince") String fromProvince,@Param("time") String time);
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.2-到站
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getProvinceTonnageRank2(@Param("productId") String productId,@Param("fromProvince") String fromProvince,@Param("time") String time);
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.1-发站
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getProvinceTonnageRank3(@Param("productId") String productId,@Param("toProvince") String toProvince,@Param("time") String time);
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.2-到站
	 * @param from
	 * @param to
	 * @return
	 */
	List<Map> getProvinceTonnageRank4(@Param("productId") String productId,@Param("toProvince") String toProvince,@Param("time") String time);
	
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
			@Param("endmonth") String endmonth,@Param("productId") String productId);
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内每个到货城市的该商品发货量
	 * @return
	 */
	List<Map> getProductTonnagebyTime2(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") String productId);
	
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内每个发货城市的该商品发货量,车数
	 * @return
	 */
	List<Map> getProductbyTime(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") String productId);
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内每个到货城市的该商品发货量，车数
	 * @return
	 */
	List<Map> getProductbyTime2(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") String productId);
	
	/**
	 * 给定年份 和 品类代码的前两位 获得该时间段内局别的吨数、车数直方图横纵轴-发站
	 * @return
	 */
	List<Map> getCompanyChart1(@Param("productId") String productId,@Param("time") String time);
	
	/**
	 * 给定年份 和 品类代码的前两位 获得该时间段内局别的吨数、车数直方图横纵轴-到站
	 * @return
	 */
	List<Map> getCompanyChart2(@Param("productId") String productId,@Param("time") String time);
	
	/**
	 * 给定起止月份 和 品类代码的前两位 获得该时间段内前五效益
	 * @return
	 */
	List<Map> getBenifitbyTime(@Param("startmonth") String startmonth,
			@Param("endmonth") String endmonth,@Param("productId") String productId);
}