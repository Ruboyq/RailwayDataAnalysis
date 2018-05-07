package org.rda.service;

public interface DataAnalyzeService {
	/**
	 * 从数据库里读取RailwayData的起始站、终点站、总吨数、总车数，算出效益
	 * 加到RailwayCity表里
	 * @param 
	 * @return
	 */
	public void insertRailwayCity();
	
	/**
	 * 清空RailwayCity表
	 * 
	 * @param 
	 * @return
	 */
	public void cleanRailwayCity();
}
