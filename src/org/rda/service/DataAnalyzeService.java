package org.rda.service;

import java.util.List;

import org.rda.pojo.City;
import org.rda.pojo.District;
import org.rda.pojo.RailwayCity;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public interface DataAnalyzeService {
	/**
	 * 从数据库里读取RailwayData的起始站、终点站、总吨数、总车数，算出效益
	 * 加到RailwayCity表里
	 * @param 
	 * @return
	 */
	public void addRailwayCity();
	
	/**
	 * 从railway_city表中读取查询的数据，返回路线数据和数据分析结果
	 * 
	 * @param String from,String to
	 * @return
	 */
	public JSONObject getFilterResult(String from,String to);

	/**
	 * 获取特定时间段，特定品类代码的城市-发货量热力图数据
	 * @param startmonth
	 * @param endmonth
	 * @param productId
	 * @return
	 */
	JSONObject getFromCityShipNum(String startmonth, String endmonth, int productId);

	/**
	 * 获取特定时间段，特定品类代码的城市-收货量热力图数据
	 * @param startmonth
	 * @param endmonth
	 * @param productId
	 * @return
	 */
	JSONObject getToCityReceiptNum(String startmonth, String endmonth, int productId);

	/**
	 * 获取月度发货量直方图
	 * @param productId
	 * @param year
	 * @return
	 */
	JSONObject getMonthProductNum(int productId, String year);

	List<District> getAllDistrict();
	
	/**
	 * 在不同的车数段内的企业数的条形图
	 * 
	 * @return
	 */
	JSONObject getCarNumInCompany();
	
	/**
	 * 在不同的车数段内的企业数的条形图
	 * 
	 * @return
	 */
	JSONObject getCarNumInTotal();

	/**
	 * 获取省份吨数热力图
	 * @return
	 */
	JSONObject getProvince_ton(int productId);

	/**
	 * 根据品类名和到货城市名获得前20条线路信息2.1
	 * @param productId
	 * @param toCity
	 * @return
	 */
	String getCityTonnage(int productId, String toCity);

	/**
	 * 根据品类名和发货城市名获得前20条线路信息2.2
	 * @param productId
	 * @param fromCity
	 * @return
	 */
	String getCityTonnage2(int productId, String fromCity);
	
	/**
	 * 获取所有中心对
	 * @param 
	 * @param 
	 * @return
	 */
	public List<RailwayCity> getAllCenterPairs();
}
