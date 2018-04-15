package org.rda.service;

import java.util.List;

import org.rda.mapper.RailwayDataMapper;
import org.rda.mapper.UserMapper;
import org.rda.pojo.City;
import org.rda.pojo.RailwayData;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class RailwayDataServiceImpl implements RailwayDataService{
	@Autowired
	private RailwayDataMapper railwayDataMapper;

	@Override
	@SystemServiceLog(description = "显示原始站点数据")
	public List<City> getOriginalCitys() {
		// TODO 自动生成的方法存根
		return railwayDataMapper.getOriginalCitys();
	}

	@Override
	@SystemServiceLog(description = "模糊查询货运路线数据")
	public List<RailwayData> getFilterResult(String from, String to) {
		// TODO 自动生成的方法存根
		return railwayDataMapper.getFilterResult(from, to);
	}
	
	
}
