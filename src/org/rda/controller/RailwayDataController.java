package org.rda.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.rda.mapper.CityMapper;
import org.rda.mapper.RailwayCityMapper;
import org.rda.pojo.City;
import org.rda.pojo.District;
import org.rda.pojo.RailwayCity;
import org.rda.pojo.RailwayData;
import org.rda.service.BaseDictService;
import org.rda.service.DataAnalyzeService;
import org.rda.service.RailwayDataService;
import org.rda.service.SpiderService;
import org.rda.utils.SpiderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

@Controller
@RequestMapping("/railwayData")
public class RailwayDataController {
	@Autowired
	private RailwayDataService railwayDataService;
	@Autowired
	private DataAnalyzeService dataAnalyzeService;
	@Autowired
	private BaseDictService baseDictService;
	@Autowired
	private SpiderService spiderService;
	
	/**
	 * 返回欢迎界面
	 * @return
	 */
	@RequestMapping("/welcome")
	public String showWelcome(Model model){
		return "welcome";
	}
	/**
	 * 返回热力图界面
	 * @return
	 */
	@RequestMapping("/heatmap")
	public String showHeatMap(Model model){
		return "heatmap";
	}
	/**
	 * 返回爬虫界面
	 * @return
	 */
	@RequestMapping("/spider")
	public String showSpider(Model model){
		return "spider";
	}
	/**
	 * 启动爬虫
	 * @param model
	 * @return
	 */
	@RequestMapping("/crawl")
	@ResponseBody
	public String crawlData(){
		spiderService.crawl();
		JSONObject job = new JSONObject();
		job.put("status","y");
		return job.toString();
	}
	
	/**
	 * 启动爬虫
	 * @param model
	 * @return
	 */
	@RequestMapping("/showCrawlFiles")
	@ResponseBody
	public String showCrawlFiles(){
		JSONArray ja = spiderService.getFiles();
		JSONObject job = new JSONObject();
		job.put("status","y");
		job.put("files", ja);
		return job.toString();
	}
	
	/**
	 * 展示原始站点
	 * @param model
	 * @return
	 */
	@RequestMapping("/originStation")
	public String showOriginStation(Model model){
		List<City> list=railwayDataService.getOriginalCitys();
		String[] strings=new String[list.size()];
		for(int i=0;i<list.size();i++){
			strings[i]=list.get(i).toString();
		}
		model.addAttribute("stringList",Arrays.toString(strings));

		return "originStationMap";
	}
	/**
	 * 显示城市数据界面
	 * @return
	 */
	@RequestMapping("/originTonnageCity")
	public String showOriginTonnageCity(Model model){
		List<City> list=railwayDataService.getOriginalCitys();
		String[] strings=new String[list.size()];
		for(int i=0;i<list.size();i++){
			strings[i]=list.get(i).toString();
		}
		model.addAttribute("stringList",Arrays.toString(strings));
		return "originTonnageCityMap";
	}
	/**
	 * 显示省份数据界面
	 * @return
	 */
	@RequestMapping("/originTonnageProvince")
	public String showOriginTonnageProvince(Model model){
		return "originTonnageProvinceMap";
	}
	/**
	 * 显示局运量界面
	 * @return
	 */
	@RequestMapping("/originCompany")
	public String showOriginCompanny(Model model){
		return "originCompany";
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
	public String getFromCityShipNum(String startmonth,String endmonth,String productId){
		String[] t1=startmonth.split("-");
		String[] t2=endmonth.split("-");
		startmonth=t1[2]+t1[1];
		endmonth=t2[2]+t2[1];
		System.out.println(productId);
		JSONObject jsonArray=dataAnalyzeService.getFromCityShipNum(startmonth, endmonth, productId);
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
	public String getToCityReceiptNum(String startmonth,String endmonth,String productId){
		String[] t1=startmonth.split("-");
		String[] t2=endmonth.split("-");
		startmonth=t1[2]+t1[1];
		endmonth=t2[2]+t2[1];
		JSONObject jsonArray=dataAnalyzeService.getToCityReceiptNum(startmonth, endmonth, productId);
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
	 * 获取省份吨数热力图
	 * @return
	 */
	@RequestMapping("/cityTonnages")
	@ResponseBody
	public String getProvince_ton(String type,String ctl,String time){
		return dataAnalyzeService.getProvince_ton(type,ctl,time).toString();
	}
	
	/**
	 * 某省最火前20名城市数据
	 * @return
	 */
	@RequestMapping("/top20CitiesFromProvince")
	@ResponseBody
	public String getTop20CitiesFromProvince(String ctl,String type,String provinceName,String time){
		JSONObject jsonObject=new JSONObject();
		String html1 = null;
		String html2 = null;
		System.out.println(ctl);
		if (ctl.equalsIgnoreCase("from")) {
			html1 = dataAnalyzeService.getProvinceTonnage1(type, provinceName, time);
			html2 = dataAnalyzeService.getProvinceTonnage2(type, provinceName, time);
		}
		else if(ctl.equalsIgnoreCase("to")){
			html1 = dataAnalyzeService.getProvinceTonnage3(type, provinceName, time);
			html2 = dataAnalyzeService.getProvinceTonnage4(type, provinceName, time);
		}
		if (html1 != null && html2 != null) {
			jsonObject.put("html1", html1);
			jsonObject.put("html2", html2);
			jsonObject.put("status", "y");
		} else
			jsonObject.put("status", "n");
		return jsonObject.toString();
	}
	
	/**
	 * 最火前20名城市数据
	 * @return
	 */
	@RequestMapping("/top20Cities")
	@ResponseBody
	public String getTop20Cities(String type,String cityName,String time){
		JSONObject jsonObject=new JSONObject();
		String html1 = dataAnalyzeService.getCityTonnage(type, cityName,time);
		String html2 = dataAnalyzeService.getCityTonnage2(type, cityName,time);
		if (html1 != null && html2 != null) {
			jsonObject.put("html1", html1);
			jsonObject.put("html2", html2);
			jsonObject.put("status", "y");
		} else
			jsonObject.put("status", "n");
		return jsonObject.toString();
	}
	/**
	 * 局别运量分析
	 * @return
	 */
	@RequestMapping("/originCompanyAnalysis")
	@ResponseBody
	public String originCompanyAnalysis(String type,String ctl,String time){
		JSONObject jsonObject=new JSONObject();
		String html = dataAnalyzeService.getCompanyTable(type, ctl , time);
		if (html != null) {
			JSONObject chart = dataAnalyzeService.getCompanyChart(type, ctl, time);
			jsonObject.put("html", html);
			jsonObject.put("chart", chart);
			jsonObject.put("status", "y");
		} else
			jsonObject.put("status", "n");
		return jsonObject.toString();
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
		List<?> railways=JSONArray.toList((JSONArray) analysisRes.get("railway"),new RailwayCity(),new JsonConfig());
		JSONObject returnValue=new JSONObject();
		JSONArray railwayArray=getRailwayJSONArray(railways);
		returnValue.put("railways",railwayArray);
		returnValue.put("railwaynum", railwayArray.size());
		returnValue.put("carnum", (int)analysisRes.get("carnum"));      //所有航线的总车数
		returnValue.put("tonnage", (double)analysisRes.get("tonnage")); //所有航线的总吨数
		returnValue.put("benifit", analysisRes.get("benifit"));         //排名前五的城市-收益系数直方图
		//returnValue.put("car", analysisRes.get("car"));                 //排名前五的城市-车数直方图
		//returnValue.put("ton", analysisRes.get("ton")); 				//排名前五的城市-吨数直方图
		returnValue.put("product",analysisRes.getJSONObject("product"));			//排名前五的商品品类饼状图
		
		
		return returnValue.toString();
	}
	
	/**
	 * 将航线列表包装为蛤蟆皮指定格式的JSON数组
	 * @param railways
	 * @return
	 */
	public JSONArray getRailwayJSONArray(List<?> railways){
		JSONArray railwayJSONArray=new JSONArray();
		for(int i=0;i<railways.size();i++){
			RailwayCity railwayCity=(RailwayCity) railways.get(i);
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
	/**
	 * 显示企业分析界面
	 * @return
	 */
	@RequestMapping("/enterpriseAnalysis")
	public String showEnterpriseAnalysis(Model model){
		return "enterpriseAnalysis";
	}
	
	/**
	 * 以企业为单位分析
	 * 1、统计区间内的企业数
	 * 2、统计区间内的总发车\吨数
	 * @return
	 */
	@RequestMapping("/enterpriseAnalysisResult")
	@ResponseBody
	public String enterpriseAnalysisResult(String type, String time){
		JSONObject job = new JSONObject();
		JSONObject carnum = dataAnalyzeService.getCarNums(type,time);
		JSONObject carton = dataAnalyzeService.getCarTons(type,time);
		if(carnum.get("status") == "n" || carton.get("status") == "n")
			job.put("status", "n");
		else {
			job.put("status", "y");
			job.put("carnum", carnum.get("carnum"));
			job.put("carton", carton.get("carton"));
		}
		return job.toString();
	}

}
