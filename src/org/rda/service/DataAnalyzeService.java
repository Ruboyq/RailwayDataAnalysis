package org.rda.service;

import java.util.List;

import org.rda.pojo.City;

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
}
