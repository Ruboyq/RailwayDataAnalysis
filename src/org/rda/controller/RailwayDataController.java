package org.rda.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.rda.mapper.CityMapper;
import org.rda.mapper.RailwayCityMapper;
import org.rda.pojo.City;
import org.rda.pojo.RailwayCity;
import org.rda.pojo.RailwayData;
import org.rda.service.DataAnalyzeService;
import org.rda.service.RailwayDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/railwayData")
public class RailwayDataController {
	@Autowired
	private RailwayDataService railwayDataService;
	@Autowired
	private DataAnalyzeService dataAnalyzeService;
	
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
	@RequestMapping("/testmap")
	public String showMap(Model model){
		return "originDrawLine";
	}
	/**
	 * 展示原始站点信息
	 * @return
	 */
	@RequestMapping("/originStation")
	public String getOriCityString(Model model){
		List<City> list=railwayDataService.getOriginalCitys();
		String[] strings=new String[list.size()];
		for(int i=0;i<list.size();i++){
			strings[i]=list.get(i).toString();
		}
		model.addAttribute("stringList",Arrays.toString(strings));

		return "originStationMap";
	}
	
	/**
	 * 获取模糊查询结果
	 * @param from
	 * @param to
	 * @return
	 */
	@RequestMapping("/fuzzyQuery")
	public void getFilterResult(String from,String to,Model model){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult(from, to);
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		
		model.addAttribute("railways", getRailwayJSONArray(railways));
		model.addAttribute("carnum", (int)analysisRes.get("carnum"));
		model.addAttribute("tonnage", (float)analysisRes.get("tonnage"));
		model.addAttribute("benifit", analysisRes.get("benifit"));
		model.addAttribute("car", analysisRes.get("car"));
		model.addAttribute("ton", analysisRes.get("ton"));
		model.addAttribute("product",analysisRes.get("product"));
	}
	
	/**
	 * 根据起始站点模糊查询
	 * @param from
	 * @param to
	 * @return
	 */
	@RequestMapping("/queryByStartStation")
	public void queryByStartStation(String from,Model model){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult(from, "");
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		
		model.addAttribute("railways", getRailwayJSONArray(railways));
		model.addAttribute("carnum", (int)analysisRes.get("carnum"));
		model.addAttribute("tonnage", (float)analysisRes.get("tonnage"));
		model.addAttribute("benifit", analysisRes.get("benifit"));
		model.addAttribute("car", analysisRes.get("car"));
		model.addAttribute("ton", analysisRes.get("ton"));
		model.addAttribute("product",analysisRes.get("product"));
	}
	
	/**
	 * 根据终点站点模糊查询
	 * @param to
	 * @param model
	 */
	@RequestMapping("/queryByEndStation")
	public void queryByEndStation(String to,Model model){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult("", to);
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		
		model.addAttribute("railways", getRailwayJSONArray(railways));
		model.addAttribute("carnum", (int)analysisRes.get("carnum"));
		model.addAttribute("tonnage", (float)analysisRes.get("tonnage"));
		model.addAttribute("benifit", analysisRes.get("benifit"));
		model.addAttribute("car", analysisRes.get("car"));
		model.addAttribute("ton", analysisRes.get("ton"));
		model.addAttribute("product",analysisRes.get("product"));
	}
	
	/**
	 * 查询所有航线
	 * @param model
	 */
	@RequestMapping("/queryAllPath")
	public void queryAllPath(Model model){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult("", "");
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		
		model.addAttribute("railways", getRailwayJSONArray(railways));
		model.addAttribute("carnum", (int)analysisRes.get("carnum"));
		model.addAttribute("tonnage", (float)analysisRes.get("tonnage"));
		model.addAttribute("product",analysisRes.get("product"));
	}
	
	/**
	 * 查询单条航线
	 * @param from
	 * @param to
	 * @param model
	 */
	@RequestMapping("/queryOnePath")
	public void queryOnePath(String from,String to,Model model){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult(from, to);
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		
		model.addAttribute("railways", getRailwayJSONArray(railways));
		model.addAttribute("carnum", (int)analysisRes.get("carnum"));
		model.addAttribute("tonnage", (float)analysisRes.get("tonnage"));
		model.addAttribute("product",analysisRes.get("product"));
	}
	
	/**
	 * 将航线列表包装为蛤蟆皮指定格式的JSON数组
	 * @param railways
	 * @return
	 */
	public JSONArray getRailwayJSONArray(List<RailwayCity> railways){
		JSONArray railwayJSONArray=new JSONArray();
		for(int i=0;i<railways.size();i++){
			RailwayCity railwayCity=railways.get(i);
			JSONObject jsObject=new JSONObject();
			jsObject.put("name", "线路"+i);
			double[][] position={{railwayCity.getFromLongitude(),railwayCity.getFromLatitude()},
								 {railwayCity.getToLongitude(),railwayCity.getToLatitude()}};
			jsObject.put("path", position);
			jsObject.put("data", railwayCity.getFromCity()+"站->"+railwayCity.getToCity()+"站");
			String[] station={railwayCity.getFromCity()+"站",railwayCity.getToCity()+"站"};
			jsObject.put("point", station);
			jsObject.put("carNum", railwayCity.getCarNum());
			jsObject.put("tonnage", railwayCity.getTonnage());
			jsObject.put("benefit", railwayCity.getBenefit());
			railwayJSONArray.add(jsObject);
		}
		return railwayJSONArray;
	}
}
