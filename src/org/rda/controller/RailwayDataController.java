package org.rda.controller;

import java.util.List;

import org.rda.mapper.CityMapper;
import org.rda.pojo.City;
import org.rda.pojo.RailwayData;
import org.rda.service.RailwayDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/railwayData")
public class RailwayDataController {
	@Autowired
	private RailwayDataService railwayDataService;
	
	/**
	 * 展示原始站点信息
	 * @return
	 */
	@RequestMapping("/originalCity")
	public String showAllOriCity(Model model){
		List<City> list=railwayDataService.getOriginalCitys();
		model.addAttribute("cityList",list);
		return "WelcomeMap";
	}
	
	/**
	 * 获取模糊查询结果
	 * @param from
	 * @param to
	 * @return
	 */
	@RequestMapping("/fuzzyQuery")
	public List<RailwayData> getFilterResult(String from,String to){
		return railwayDataService.getFilterResult(from, to);
	}
}
