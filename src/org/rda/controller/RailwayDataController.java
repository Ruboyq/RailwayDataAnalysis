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
import org.rda.service.BaseDictService;
import org.rda.service.DataAnalyzeService;
import org.rda.service.RailwayDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/railwayData")
public class RailwayDataController {
	@Autowired
	private RailwayDataService railwayDataService;
	@Autowired
	private DataAnalyzeService dataAnalyzeService;
	@Autowired
	private BaseDictService baseDictService;
	
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
	 * 获取省份-城市对应表
	 * @return “省份”:省内城市JSONArray
	 */
	@RequestMapping("/provinceCity")
	@ResponseBody
	public String getProvinceCityTable(){
		JSONObject jsonObject=baseDictService.getProvincePage();
		return jsonObject.toString();
	}
	
	/**
	 * 获取特定时间段，特定品类代码的城市-发货量热力图数据
	 * @param startmonth 结构为“年份+月份”6位字符串，比如“201607”
	 * @param endmonth 结构为“年份+月份”6位字符串，比如“201607”
	 * @param productId
	 * @return {"lat":26.470940857142857,"lng":117.49123128571429,"count":49.22800016403198} 的jsonarray
	 */
	@RequestMapping("/ShipNum")
	@ResponseBody
	public String getFromCityShipNum(String startmonth,String endmonth,int productId){
		JSONArray jsonArray=dataAnalyzeService.getFromCityShipNum(startmonth, endmonth, productId);
		return jsonArray.toString();
	}
	
	/**
	 * 获取特定时间段，特定品类代码的城市-收货量热力图数据
	 * @param startmonth 结构为“年份+月份”6位字符串，比如“201607”
	 * @param endmonth 结构为“年份+月份”6位字符串，比如“201607”
	 * @param productId
	 * @return {"lat":26.470940857142857,"lng":117.49123128571429,"count":49.22800016403198} 的jsonarray
	 */
	@RequestMapping("/ReceiptNum")
	@ResponseBody
	public String getToCityReceiptNum(String startmonth,String endmonth,int productId){
		JSONArray jsonArray=dataAnalyzeService.getToCityReceiptNum(startmonth, endmonth, productId);
		return jsonArray.toString();
	}
	
	/**
	 * 获取月度发货量直方图
	 * @param productId
	 * @param year 年份字符串
	 * @return
	 */
	@RequestMapping("/MonthProduct")
	@ResponseBody
	public String getMonthProductNum(int productId,String year){
		JSONObject jsonObject=dataAnalyzeService.getMonthProductNum(productId, year);
		return jsonObject.toString();
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
	@ResponseBody
	public String getFilterResult(String from,String to){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult(from, to);
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		JSONObject returnValue=new JSONObject();
		returnValue.put("railways", getRailwayJSONArray(railways));
		returnValue.put("carnum", (int)analysisRes.get("carnum"));
		returnValue.put("tonnage", (float)analysisRes.get("tonnage"));
		returnValue.put("benifit", analysisRes.get("benifit"));
		returnValue.put("car", analysisRes.get("car"));
		returnValue.put("ton", analysisRes.get("ton"));
		returnValue.put("product",analysisRes.get("product"));
		return returnValue.toString();
	}
	
	/**
	 * 根据起始站点模糊查询
	 * @param from
	 * @param to
	 * @return
	 */
	@RequestMapping("/queryByStartStation")
	@ResponseBody
	public String queryByStartStation(String from){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult(from, "");
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		JSONObject returnValue=new JSONObject();
		returnValue.put("railways", getRailwayJSONArray(railways));
		returnValue.put("carnum", (int)analysisRes.get("carnum"));
		returnValue.put("tonnage", (float)analysisRes.get("tonnage"));
		returnValue.put("benifit", analysisRes.get("benifit"));
		returnValue.put("car", analysisRes.get("car"));
		returnValue.put("ton", analysisRes.get("ton"));
		returnValue.put("product",analysisRes.get("product"));
		return returnValue.toString();
	}
	
	/**
	 * 根据终点站点模糊查询
	 * @param to
	 * @param model
	 */
	@RequestMapping("/queryByEndStation")
	@ResponseBody
	public String queryByEndStation(String to){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult("", to);
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		JSONObject returnValue=new JSONObject();
		returnValue.put("railways", getRailwayJSONArray(railways));
		returnValue.put("carnum", (int)analysisRes.get("carnum"));
		returnValue.put("tonnage", (float)analysisRes.get("tonnage"));
		returnValue.put("benifit", analysisRes.get("benifit"));
		returnValue.put("car", analysisRes.get("car"));
		returnValue.put("ton", analysisRes.get("ton"));
		returnValue.put("product",analysisRes.get("product"));
		return returnValue.toString();
	}
	
	/**
	 * 查询所有航线
	 * @param model
	 */
	@RequestMapping("/queryAllPath")
	@ResponseBody
	public String queryAllPath(){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult("", "");
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		JSONObject returnValue=new JSONObject();
		returnValue.put("railways", getRailwayJSONArray(railways));
		returnValue.put("carnum", (int)analysisRes.get("carnum"));
		returnValue.put("tonnage", (float)analysisRes.get("tonnage"));
		returnValue.put("product",analysisRes.get("product"));
		return returnValue.toString();
	}
	
	/**
	 * 查询单条航线
	 * @param from
	 * @param to
	 * @param model
	 */
	@RequestMapping("/queryOnePath")
	@ResponseBody
	public String queryOnePath(String from,String to){
		JSONObject analysisRes = dataAnalyzeService.getFilterResult(from, to);
		List<RailwayCity> railways=(List<RailwayCity>) analysisRes.get("railway");
		JSONObject returnValue=new JSONObject();
		returnValue.put("railways", getRailwayJSONArray(railways));
		returnValue.put("carnum", (int)analysisRes.get("carnum"));
		returnValue.put("tonnage", (float)analysisRes.get("tonnage"));
		returnValue.put("product",analysisRes.get("product"));
		return returnValue.toString();
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
