package org.rda.service;

import java.util.List;

import org.rda.pojo.City;
import org.rda.pojo.District;

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
	 * @param 
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
}
