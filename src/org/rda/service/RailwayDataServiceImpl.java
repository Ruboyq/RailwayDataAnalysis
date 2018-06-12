package org.rda.service;

import java.util.List;

import org.rda.mapper.CityMapper;
import org.rda.pojo.City;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RailwayDataServiceImpl implements RailwayDataService{
	@Autowired
	private CityMapper cityMapper;

	@Override
	//@SystemServiceLog(description = "显示原始站点数据")
	public List<City> getOriginalCitys() {
		// TODO 自动生成的方法存根
		return cityMapper.getOriginalCitys();
	}	
	@Override
	//@SystemServiceLog(description = "显示原始站点数据")
	public List<City> getOptimizedCitys() {
		// TODO 自动生成的方法存根
		return cityMapper.getOptimizedCitys();
	}	
}
