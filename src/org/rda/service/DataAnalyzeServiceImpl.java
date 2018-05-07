package org.rda.service;

import org.rda.mapper.RailwayCityMapper;
import org.rda.mapper.RailwayDataMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class DataAnalyzeServiceImpl {
	@Autowired
	private RailwayCityMapper railwayCityMapper;
	private RailwayDataMapper railwayDataMapper;
	
	public void insertRailwayCity(){
		railwayCityMapper.cleanRailwayCity();
		railwayDataMapper.insertRailwayCity();
	}
}
