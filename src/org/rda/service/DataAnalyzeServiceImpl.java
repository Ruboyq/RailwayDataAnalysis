package org.rda.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.ibatis.annotations.Param;
import org.rda.mapper.CityMapper;
import org.rda.mapper.DataCompanyMapper;
import org.rda.mapper.DistrictMapper;
import org.rda.mapper.RailwayCityMapper;
import org.rda.mapper.RailwayDataMapper;
import org.rda.pojo.City;
import org.rda.pojo.District;
import org.rda.pojo.RailwayCity;
import org.rda.pojo.RailwayData;
import org.rda.spark.SparkKM;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.sun.mail.handlers.message_rfc822;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import sun.text.resources.cldr.es.FormatData_es_419;

@Service
@Transactional
public class DataAnalyzeServiceImpl implements DataAnalyzeService{
	@Autowired
	private RailwayCityMapper railwayCityMapper;
	@Autowired
	private RailwayDataMapper railwayDataMapper;
	@Autowired
	private DistrictMapper districtMapper;
	@Autowired
	private DataCompanyMapper dataCompanyMapper;
	
	/**
	 * 从数据库里读取RailwayData的起始站、终点站、总吨数、总车数，算出效益
	 * 加到RailwayCity表里
	 * 先将RailwayCity表里的数据删除，再向RailwayCity表里添加数据
	 */
	@Override
	@SystemServiceLog(description = "更新RailwayCity表数据")
	public void addRailwayCity(){
		railwayCityMapper.delRailwayCity();
		railwayCityMapper.addRailwayCity();
	}
	
	/**
	 * 获取局别直方图信息
	 * @return
	 */
	@Override
	public JSONObject getCompanyChart(String productId, String ctl, String time) {
		JSONObject total = new JSONObject();
		JSONArray x_company = new JSONArray();
		JSONArray y_carnum=new JSONArray();
		JSONArray y_ton=new JSONArray();
		List<Map> ton_car_list;
		if (ctl.equalsIgnoreCase("from"))
			ton_car_list =railwayDataMapper.getCompanyChart1(productId,time);
		else
			ton_car_list =railwayDataMapper.getCompanyChart2(productId,time);
		int n = 0;
		for(int i=0;i<ton_car_list.size();i++){
			Map map=ton_car_list.get(i);
		}
		loop1: while(n < 18){
			for (Map map:ton_car_list) {
				if (n == 0) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("哈")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 1) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("沈")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 2) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("京")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 3) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("太")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 4) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("呼")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 5) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("郑")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 6) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("武")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 7) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("西")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 8) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("济")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 9) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("上")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 10) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("南")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 11) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("广")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 12) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("宁")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 13) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("成")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 14) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("昆")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 15) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("兰")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 16) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("乌")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				} else if (n == 17) {
					if (map.get("company") != null) {
						if (((String) (map.get("company"))).equalsIgnoreCase("青")) {
							x_company.add(map.get("company"));
							y_carnum.add(map.get("carNum"));
							y_ton.add(map.get("tonnage"));
							n++;
							continue loop1;
						}
					}
				}
			}
		}
		total.put("x_company", x_company);
		total.put("y_carnum", y_carnum);
		total.put("y_ton", y_ton);
		return total;
	}
	
	/**
	 * 获取局别表格信息
	 * @return
	 */
	@Override
	public String getCompanyTable(String productId, String ctl, String time) {
		String html="";
		List<Map> maps;
		if (ctl.equalsIgnoreCase("from"))
			maps =railwayDataMapper.getCompanyTable1(productId,time);
		else
			maps =railwayDataMapper.getCompanyTable2(productId,time);
		if (maps.size() == 0)
			return null;
		for(int i=0;i<maps.size();i++){
			Map map=maps.get(i);
			if (map.get("company") != null) {
				html += "<tr>";
				html += "<td>" + map.get("company") + "<//td>";
				html += "<td><span class='status-metro status-active'title='Active'>" + productId + "<//span><//td>";
				html += "<td data-value=" + Math.round((Double) map.get("tonnage")) + ">"
						+ Math.round((Double) map.get("tonnage")) + "<//td>";
				html += "<td data-value=" + ((BigDecimal) map.get("carNum")).intValue() + ">" + map.get("carNum")
						+ "<//td>";
				html += "<td data-value=" + Math.round((Double) map.get("income")) + ">"
						+ Math.round((Double) map.get("income")) + "<//td>";
				html += "<//tr>";
			}
		}
		return html;
	}
	
	/**
	 * 获取省份吨数热力图
	 * @return
	 */
	@Override
	public JSONObject getProvince_ton(String productId,String ctl,String time){
		JSONObject jsonObject=new JSONObject();
		JSONObject provincergb=new JSONObject();
		JSONObject provincercar=new JSONObject();
		JSONObject provincerton=new JSONObject();
		List<Map> maps = null;
		if (ctl.equalsIgnoreCase("from"))
			maps =railwayDataMapper.getProvinceTonnage1(productId,time);
		else
			maps =railwayDataMapper.getProvinceTonnage2(productId,time);
		if (maps.size() == 0){
			jsonObject.put("status","n");
			return jsonObject;
		}
		int carnum=0;
		float ton=0;
		
		int area=maps.size()/5;
		int[] Interval={0,area,area*2,area*3,area*4,maps.size()}; //区间
		//String[] rgb={"#00BFFF","#1E90FF","#0000FF","#4169E1","#0000CD"}; //颜色
		String[] rgb={"0.5","0.4","0.3","0.2","0.1"}; //颜色
		for(Map map:maps){
			provincercar.put(map.get("province"),Integer.valueOf(map.get("carNum").toString()).intValue());
			provincerton.put(map.get("province"),Float.parseFloat(map.get("tonnage").toString()));
			carnum+=Integer.valueOf(map.get("carNum").toString()).intValue();
			ton+=Float.parseFloat(map.get("tonnage").toString());
		}
		
		for(int i=0;i<5;i++){
			for(int j=Interval[i];j<Interval[i+1];j++){
				provincergb.put(maps.get(j).get("province"), rgb[i]);
			}
		}
		
		jsonObject.put("carnums", carnum);
		jsonObject.put("totalFreight", ton);
		jsonObject.put("colors", provincergb);
		jsonObject.put("province_car", provincercar);
		jsonObject.put("province_ton", provincerton);
		jsonObject.put("status","y");
		return jsonObject;
	}
	
	/**
	 * 根据品类名和到货城市名获得前20条线路信息2.1
	 * @param productId
	 * @param toCity
	 * @return
	 */
	@Override
	public String getCityTonnage(String productId,String toCity,String time){
		String html="";
		List<Map> maps=railwayDataMapper.getCityTonnage(productId, toCity,time);
		if (maps.size() == 0)
			return null;
		for(int i=0;i<maps.size();i++){
			int rank=i+1;
			Map map=maps.get(i);
			html+="<tr>";
			html+="<td data-value="+rank+">"+rank+"<//td>";
			html+="<td>"+map.get("fromCity")+"<//td>";
			html+="<td><span class='status-metro status-active'title='Active'>"+productId+"<//span><//td>";
			html+="<td data-value="+Math.round((Double)map.get("tonnage"))+">"+Math.round((Double)map.get("tonnage"))+"<//td>";
			html+="<td data-value="+((BigDecimal)map.get("carNum")).intValue()+">"+map.get("carNum")+"<//td>";
			html+="<td data-value="+Math.round((Double)map.get("income"))+">"+Math.round((Double)map.get("income"))+"<//td>";
			html+="<//tr>";
		}
		return html;
	}
	
	/**
	 * 根据品类名和发货城市名获得前20条线路信息2.2
	 * @param productId
	 * @param fromCity
	 * @return
	 */
	@Override
	public String getCityTonnage2(String productId,String fromCity,String time){
		String html="";
		List<Map> maps=railwayDataMapper.getCityTonnage2(productId, fromCity,time);
		if (maps.size() == 0)
			return null;
		for(int i=0;i<maps.size();i++){
			int rank=i+1;
			Map map=maps.get(i);
			html+="<tr>";
			html+="<td data-value="+rank+">"+rank+"<//td>";
			html+="<td>"+map.get("toCity")+"<//td>";
			html+="<td><span class='status-metro status-active'title='Active'>"+productId+"<//span><//td>";
			html+="<td data-value="+Math.round((Double)map.get("tonnage"))+">"+Math.round((Double)map.get("tonnage"))+"<//td>";
			html+="<td data-value="+((BigDecimal)map.get("carNum")).intValue()+">"+map.get("carNum")+"<//td>";
			html+="<td data-value="+Math.round((Double)map.get("income"))+">"+Math.round((Double)map.get("income"))+"<//td>";
			html+="<//tr>";
		}
		return html;
	}
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.1
	 * @param productId
	 * @param toProvince
	 * @return
	 */
	@Override
	public String getProvinceTonnage1(String productId,String fromProvince,String time){
		String html="";
		List<Map> maps=railwayDataMapper.getProvinceTonnageRank1(productId, fromProvince,time);
		if (maps.size() == 0)
			return null;
		for(int i=0;i<maps.size();i++){
			int rank=i+1;
			Map map=maps.get(i);
			html+="<tr>";
			html+="<td data-value="+rank+">"+rank+"<//td>";
			html+="<td>"+map.get("fromCity")+"<//td>";
			html+="<td><span class='status-metro status-active'title='Active'>"+productId+"<//span><//td>";
			html+="<td data-value="+Math.round((Double)map.get("tonnage"))+">"+Math.round((Double)map.get("tonnage"))+"<//td>";
			html+="<td data-value="+((BigDecimal)map.get("carNum")).intValue()+">"+map.get("carNum")+"<//td>";
			html+="<td data-value="+Math.round((Double)map.get("income"))+">"+Math.round((Double)map.get("income"))+"<//td>";
			html+="<//tr>";
		}
		return html;
	}
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.2
	 * @param productId
	 * @param fromProvince
	 * @return
	 */
	@Override
	public String getProvinceTonnage2(String productId,String fromProvince,String time){
		String html="";
		List<Map> maps=railwayDataMapper.getProvinceTonnageRank2(productId, fromProvince,time);
		if (maps.size() == 0)
			return null;
		for(int i=0;i<maps.size();i++){
			int rank=i+1;
			Map map=maps.get(i);
			html+="<tr>";
			html+="<td data-value="+rank+">"+rank+"<//td>";
			html+="<td>"+map.get("toCity")+"<//td>";
			html+="<td><span class='status-metro status-active'title='Active'>"+productId+"<//span><//td>";
			html+="<td data-value="+Math.round((Double)map.get("tonnage"))+">"+Math.round((Double)map.get("tonnage"))+"<//td>";
			html+="<td data-value="+((BigDecimal)map.get("carNum")).intValue()+">"+map.get("carNum")+"<//td>";
			html+="<td data-value="+Math.round((Double)map.get("income"))+">"+Math.round((Double)map.get("income"))+"<//td>";
			html+="<//tr>";
		}
		return html;
	}
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.3
	 * @param productId
	 * @param toProvince
	 * @return
	 */
	@Override
	public String getProvinceTonnage3(String productId,String toProvince,String time){
		String html="";
		List<Map> maps=railwayDataMapper.getProvinceTonnageRank3(productId, toProvince,time);
		if (maps.size() == 0)
			return null;
		for(int i=0;i<maps.size();i++){
			int rank=i+1;
			Map map=maps.get(i);
			html+="<tr>";
			html+="<td data-value="+rank+">"+rank+"<//td>";
			html+="<td>"+map.get("fromCity")+"<//td>";
			html+="<td><span class='status-metro status-active'title='Active'>"+productId+"<//span><//td>";
			html+="<td data-value="+Math.round((Double)map.get("tonnage"))+">"+Math.round((Double)map.get("tonnage"))+"<//td>";
			html+="<td data-value="+((BigDecimal)map.get("carNum")).intValue()+">"+map.get("carNum")+"<//td>";
			html+="<td data-value="+Math.round((Double)map.get("income"))+">"+Math.round((Double)map.get("income"))+"<//td>";
			html+="<//tr>";
		}
		return html;
	}
	
	/**
	 * 根据品类名和省份名获得前20名城市信息2.4
	 * @param productId
	 * @param fromProvince
	 * @return
	 */
	@Override
	public String getProvinceTonnage4(String productId,String toProvince,String time){
		String html="";
		List<Map> maps=railwayDataMapper.getProvinceTonnageRank4(productId, toProvince,time);
		if (maps.size() == 0)
			return null;
		for(int i=0;i<maps.size();i++){
			int rank=i+1;
			Map map=maps.get(i);
			html+="<tr>";
			html+="<td data-value="+rank+">"+rank+"<//td>";
			html+="<td>"+map.get("toCity")+"<//td>";
			html+="<td><span class='status-metro status-active'title='Active'>"+productId+"<//span><//td>";
			html+="<td data-value="+Math.round((Double)map.get("tonnage"))+">"+Math.round((Double)map.get("tonnage"))+"<//td>";
			html+="<td data-value="+((BigDecimal)map.get("carNum")).intValue()+">"+map.get("carNum")+"<//td>";
			html+="<td data-value="+Math.round((Double)map.get("income"))+">"+Math.round((Double)map.get("income"))+"<//td>";
			html+="<//tr>";
		}
		return html;
	}
	
	/**
	 * 从railway_city表中读取查询的数据，返回路线数据和数据分析结果
	 * @param String from,String to
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "模糊查询")
	public JSONObject getFilterResult(String from,String to){
		JSONObject data = new JSONObject(); 
		int carnum = 0;
		float tonnage = 0;
		int capacity=0;
		float firstbenifit=0;
		int multiple=1;
		Set<String> set =new HashSet<String>();
		List<String> list=new ArrayList<String>();
		List<Map> list_map = railwayCityMapper.getFilterResult(from, to);
		List<RailwayCity> list_railwayCity=new ArrayList<RailwayCity>();
		List<RailwayData> list_railwayData = railwayDataMapper.getFilterResult(from, to);
		for(Map map:list_map){
			RailwayCity railwayCity=new RailwayCity((String)map.get("fromCity"), 
													(String)map.get("toCity"), 
													Integer.valueOf(map.get("carNum").toString()).intValue(),
													Float.parseFloat(map.get("tonnage").toString()),
													(double)map.get("fromLongitude"), 
													(double)map.get("fromLatitude"), 
													(double)map.get("toLongitude"), 
													(double)map.get("toLatitude"), 
													Float.parseFloat(map.get("benefit").toString()), 
													null);
			list_railwayCity.add(railwayCity);
		}
		//计算总车数、总吨数
		
		for(RailwayCity railwayCity:list_railwayCity){
			carnum += railwayCity.getCarNum();
			tonnage += railwayCity.getTonnage();
		}
		
		//产品频数 
		JSONObject productArray=new JSONObject();
			productArray.put("x", new JSONArray());
			productArray.put("y", new JSONArray());
		
		//得出效益的前五位，存入HashMap
		JSONObject benifitArray=new JSONObject();
			benifitArray.put("x", new JSONArray());
			benifitArray.put("y_carnum", new JSONArray());
			benifitArray.put("y_ton", new JSONArray());
			benifitArray.put("y_benifit", new JSONArray());
			
		capacity=list_railwayCity.size()>=5?5:list_railwayCity.size();
		
		//city-benifit直方图
		//排序
		Collections.sort(list_railwayCity,new Comparator<RailwayCity>(){

			@Override
			public int compare(RailwayCity rc1, RailwayCity rc2) {
				// TODO Auto-generated method stub 
				float value=rc2.getBenefit() - rc1.getBenefit();
				if(value>0)
					return 1;
				else if(value==0)
					return 0;
				else
					return -1;
			}
		});
		firstbenifit=list_railwayCity.get(0).getBenefit();
		while(firstbenifit<10){
			firstbenifit=firstbenifit*10;
			multiple=multiple*10;
		}
		
		for(int i=0;i<list_railwayCity.size();i++){
			list_railwayCity.get(i).setBenefit(list_railwayCity.get(i).getBenefit()*multiple);
		}
		
		//赋值
		for(int i = 0;i<capacity;i++){
			if(from==""&to!=""){
				benifitArray.getJSONArray("x").add(list_railwayCity.get(i).getFromCity());
			}
			else if(from!=""&to==""){
				benifitArray.getJSONArray("x").add(list_railwayCity.get(i).getToCity());

			}
			
			benifitArray.getJSONArray("y_carnum").add(list_railwayCity.get(i).getCarNum());
			benifitArray.getJSONArray("y_ton").add(list_railwayCity.get(i).getTonnage());
			benifitArray.getJSONArray("y_benifit").add(list_railwayCity.get(i).getBenefit());
		}
		
		//productId-productNum饼图
		//统计运输货物的频数
		
		for(RailwayData railwayData:list_railwayData){
			list.add(railwayData.getProductName());
			set.add(railwayData.getProductName());
		}
		
		HashMap<String, Integer> product_frequency = new HashMap<String, Integer>();
		for(String s:set){
			product_frequency.put(s, Collections.frequency(list, s));
		}
		List<Map.Entry<String, Integer>> list_product_frequency = 
				new ArrayList<Map.Entry<String, Integer>>(product_frequency.entrySet()); 
		//计算货物总频次
		int total_frequency=0;
		for(Map.Entry<String, Integer> me:list_product_frequency){
			total_frequency+=me.getValue().intValue();
		}
		//排序
		Collections.sort(list_product_frequency,new Comparator<Map.Entry<String, Integer>>(){

			@Override
			public int compare(Entry<String, Integer> o1, Entry<String, Integer> o2) {
				// TODO Auto-generated method stub
				return o2.getValue().compareTo(o1.getValue());
			}
		});
		int remaining_frequency=total_frequency;
		DecimalFormat df=new DecimalFormat("0.0000");
		capacity=list_product_frequency.size()>=5?5:list_product_frequency.size();
		for(int i = 0;i<capacity;i++){
			productArray.getJSONArray("x").add(list_product_frequency.get(i).getKey());
			productArray.getJSONArray("y").add(df.format((float)list_product_frequency.get(i).getValue()/total_frequency));
			remaining_frequency-=list_product_frequency.get(i).getValue().intValue();
		}
		productArray.getJSONArray("x").add("其他");
		productArray.getJSONArray("y").add(df.format((float)remaining_frequency/total_frequency));
		
		data.put("railway", list_railwayCity);
		data.put("carnum", carnum);
		data.put("tonnage", tonnage);
		data.put("product", productArray);
		data.put("benifit", benifitArray);
		return data;
	}

	/**
	 * 获取特定时间段，特定品类代码的城市-发货量热力图数据
	 * @param startmonth
	 * @param endmonth
	 * @param productId
	 * @return
	 */
	@Override
	public JSONObject getFromCityShipNum(String startmonth,String endmonth,String productId){
		List<Map> list=railwayDataMapper.getProductTonnagebyTime(startmonth, endmonth, productId);
		List<Map> ton_car_list = railwayDataMapper.getProductbyTime(startmonth, endmonth, productId);
		JSONObject data = new JSONObject();
		JSONArray jsonArray=new JSONArray();
		
		JSONObject per_month = new JSONObject();
		JSONArray x_month = new JSONArray();
		JSONArray y_carnum=new JSONArray();
		JSONArray y_ton=new JSONArray();
		int total_carnum = 0;
		float total_tonnage = 0f;
		int month = Integer.parseInt(startmonth);
		
		List<Map> product_benifit_5 = railwayDataMapper.getBenifitbyTime(startmonth, endmonth, productId);
		JSONObject benifit_5=new JSONObject();
		JSONArray x_name = new JSONArray();
		JSONArray y_benifit=new JSONArray();
		
		/**
		 * 
		 */
		standardNormalization(list);
		for(Map map:list){
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("lat", (double)map.get("fromLatitude"));
			jsonObject.put("lng", (double)map.get("fromLongitude"));
			jsonObject.put("count", (double)map.get("tonnage"));
			jsonArray.add(jsonObject);
		}
		data.put("city_ton_array", jsonArray);
		
		/**
		 * 
		 */
		while(month<=Integer.parseInt(endmonth)){
			int carnum = 0;
			float tonnage = 0f;
			for(Map map:ton_car_list){
				if(Integer.parseInt((String) map.get("date"))==month){
					carnum+=Integer.valueOf(map.get("carNum").toString()).intValue();
					tonnage+=Float.parseFloat(map.get("tonnage").toString());
				}
			}
			total_carnum+=carnum;
			total_tonnage+=tonnage;
			x_month.add(month);
			y_carnum.add(carnum);
			y_ton.add(tonnage);
			
			if(month%100==12)
				month = month + 100 - 11;
			else
				month++;
		}
		per_month.put("x_month", x_month);
		per_month.put("y_carnum", y_carnum);
		per_month.put("y_ton", y_ton);
		data.put("total_carnum", total_carnum);
		data.put("total_tonnage", total_tonnage);
		data.put("per_month", per_month);
		
		/**
		 * 
		 */
		for(Map map:product_benifit_5){
			x_name.add((String)map.get("productName"));
			y_benifit.add((double)map.get("benifit"));
		}
		benifit_5.put("productName", x_name);
		benifit_5.put("benifit", y_benifit);
		data.put("benifit_5", benifit_5);
		
		return data;
	}
	
	/**
	 * 获取特定时间段，特定品类代码的城市-收货量热力图数据
	 * @param startmonth
	 * @param endmonth
	 * @param productId
	 * @return
	 */
	@Override
	public JSONObject getToCityReceiptNum(String startmonth,String endmonth,String productId){
		List<Map> list=railwayDataMapper.getProductTonnagebyTime2(startmonth, endmonth, productId);
		List<Map> ton_car_list = railwayDataMapper.getProductbyTime2(startmonth, endmonth, productId);
		JSONObject data = new JSONObject();
		JSONArray jsonArray=new JSONArray();
		
		JSONObject per_month = new JSONObject();
		JSONArray x_month = new JSONArray();
		JSONArray y_carnum=new JSONArray();
		JSONArray y_ton=new JSONArray();
		int total_carnum = 0;
		float total_tonnage = 0f;
		int month = Integer.parseInt(startmonth);
		
		List<Map> product_benifit_5 = railwayDataMapper.getBenifitbyTime(startmonth, endmonth, productId);
		JSONObject benifit_5=new JSONObject();
		JSONArray x_name = new JSONArray();
		JSONArray y_benifit=new JSONArray();
		/**
		 * 
		 */
		standardNormalization(list);
		for(Map map:list){
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("lat", (double)map.get("toLatitude"));
			jsonObject.put("lng", (double)map.get("toLongitude"));
			jsonObject.put("count", (double)map.get("tonnage"));
			jsonArray.add(jsonObject);
		}
		data.put("city_ton_array", jsonArray);
		
		/**
		 * 
		 */
		while(month<=Integer.parseInt(endmonth)){
			int carnum = 0;
			float tonnage = 0f;
			for(Map map:ton_car_list){
				if(Integer.parseInt((String) map.get("date"))==month){
					carnum+=Integer.valueOf(map.get("carNum").toString()).intValue();
					tonnage+=Float.parseFloat(map.get("tonnage").toString());
				}
			}
			total_carnum+=carnum;
			total_tonnage+=tonnage;
			x_month.add(month);
			y_carnum.add(carnum);
			y_ton.add(tonnage);
			
			if(month%100==12)
				month = month + 100 - 11;
			else
				month++;
		}
		per_month.put("x_month", x_month);
		per_month.put("y_carnum", y_carnum);
		per_month.put("y_ton", y_ton);
		data.put("total_carnum", total_carnum);
		data.put("total_tonnage", total_tonnage);
		data.put("per_month", per_month);
		
		for(Map map:product_benifit_5){
			x_name.add((String)map.get("productName"));
			y_benifit.add((double)map.get("benifit"));
		}
		benifit_5.put("productName", x_name);
		benifit_5.put("benifit", y_benifit);
		data.put("benifit_5", benifit_5);
		
		return data;
	}
	
	/**
	 * 获取特定时间段，特定品类代码的城市-收货量热力图数据
	 * @param startmonth
	 * @param endmonth
	 * @param productId
	 * @return
	 */
	@Override
	public JSONObject getMonthProductNum(int productId,String year){
		String date=new String();
		JSONObject jsonObject=new JSONObject();
		Float ton=new Float(0);
		for(int i=1;i<=12;i++){
			if(i<10)
				date=year+"0"+i;
			else
				date=year+i;
			ton=railwayDataMapper.getProductTonnage(productId, date);
			if(ton==null)
				jsonObject.put(i, 0);
			else
				jsonObject.put(i, ton.floatValue());
		}
		return jsonObject;
	}
	
	/**
	 * 对数据进行标准归一化处理
	 */
	public void standardNormalization(List<Map> list){
		double average=0;
		double standardDeviation=0;
		double min=100;  //标准归一化后的最小值
		List<Double> data=new ArrayList<Double>();
		for(Map map:list){
			data.add((double)map.get("tonnage"));
		}
		
		for(double value:data){
			average+=value;
		}
		average=average/data.size();
		
		for(double value:data){
			standardDeviation+=(value-average)*(value-average);
		}
		standardDeviation=Math.sqrt(standardDeviation/data.size());
		
		
		//标准归一化
		for(int i=0;i<data.size();i++){
			double xx=(data.get(i)-average)/standardDeviation;
			data.set(i, xx);
			if(xx<min)
				min=xx;
		}
		
		//等比例缩放到[0,1]区间
		for(int i=0;i<data.size();i++){
			double newValue=(data.get(i)-min)/(2*Math.abs(min));
			data.set(i, newValue);
		}
		
		//将小于0.4的数据等比例缩放到[0.4,0.6]
		//将[Omin，Omax]上每个数映射到区间[Nmin,Nmax]上:(Nmax-Nmin)/(Omax-Omin)*(O-Omin)+Nmin
		for(int i=0;i<data.size();i++){
			Map map=list.get(i);
			if(data.get(i)<0.4){
				double newValue=(0.6-0.4)/(1.0-0.0)*(data.get(i)-0.0)+0.4;
				data.set(i, newValue);
			}
			map.put("tonnage", data.get(i));
		}
	}
	
	/**
	 * 获取所有划分区域
	 * 
	 * @return
	 */
	@Override
	public List<District> getAllDistrict(){
		return districtMapper.getAllDistrict();
	}
	/**
	 * 获取所有中心对
	 * 
	 * @return
	 */
	@Override
	public List<RailwayCity> getAllCenterPairs() {
		List<RailwayCity> list_map = districtMapper.getAllCenterPairs();
		return list_map;
	}
	
	/**
	 * 在不同的车数段内的企业数的分析
	 * 
	 * @return
	 */
	@Override
	public JSONObject getCarNums(String productId,String time) {
		List<Integer> carNum_company_list = dataCompanyMapper.getCarNum(productId,time);
		
		JSONObject carNums = new JSONObject();
		JSONObject carNum = new JSONObject();
		JSONArray x_axis = new JSONArray();
		JSONArray y_axis1 = new JSONArray();
		JSONArray y_axis2 = new JSONArray();
		int max=100000;
		if (carNum_company_list.size() == 0) {
			carNums.put("status", "n");
			return carNums;
		}
		carNum_company_list.removeAll(Collections.singleton(null));
		max = Collections.max(carNum_company_list);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		x_axis.add("0");
		y_axis2.add(0);
		x_axis.add("50");
		y_axis2.add(0);
		x_axis.add("100");
		y_axis2.add(0);
		x_axis.add("500");
		y_axis2.add(0);
		x_axis.add("1000");
		y_axis2.add(0);
		x_axis.add("2000");
		y_axis2.add(0);
		x_axis.add("5000");
		y_axis2.add(0);
		x_axis.add("10000");
		y_axis2.add(0);
		x_axis.add("30000");
		y_axis2.add(0);
		x_axis.add(String.valueOf(max));
		y_axis2.add(0);
		for (Integer num : carNum_company_list) {
			if (num != null) {
				for (int i = 0; i < x_axis.size() - 1; i++) {
					if (num <= x_axis.getInt(i + 1) && num > x_axis.getInt(i)) {
						if((int) y_axis1.get(i) >= 100)
							break;
						y_axis1.set(i, (int) y_axis1.get(i) + 1);
						break;
					}
				}
				for (int i = 0; i < x_axis.size() - 1; i++) {
					if (num <= x_axis.getInt(i + 1) && num > x_axis.getInt(i)) {
						y_axis2.set(i, (int) y_axis2.get(i) + num);
						break;
					}
				}
			}
		}
		for (int i = 0; i < x_axis.size() - 1; i++) {
			if (i == 0) {
				x_axis.set(i, x_axis.get(i).toString() + "-" + x_axis.get(i + 1).toString());
			} else {
				x_axis.set(i, String.valueOf(x_axis.getInt(i) + 1) + "-" + x_axis.get(i + 1).toString());
			}
		}
		x_axis.remove(x_axis.size()-1);
		y_axis1.remove(y_axis1.size()-1);
		y_axis2.remove(y_axis2.size()-1);
		carNum.put("x_axis", x_axis);
		carNum.put("y_axis1", y_axis1);
		carNum.put("y_axis2", y_axis2);
		carNums.put("carnum", carNum);
		carNums.put("status","y");
		return carNums;
	}
	
	/**
	 * 在不同的发货吨数段内的企业数的分析
	 * 
	 * @return
	 */
	@Override
	public JSONObject getCarTons(String productId,String time) {
		List<Integer> carTon_company_list = dataCompanyMapper.getCarTon(productId,time);
		
		JSONObject carTons = new JSONObject();
		JSONObject carTon = new JSONObject();
		JSONArray x_axis = new JSONArray();
		JSONArray y_axis1 = new JSONArray();
		JSONArray y_axis2 = new JSONArray();
		int max=100000;
		if (carTon_company_list.size() == 0) {
			carTons.put("status", "n");
			return carTons;
		}
		carTon_company_list.removeAll(Collections.singleton(null));
		max = Collections.max(carTon_company_list);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		y_axis1.add(0);
		x_axis.add("0");
		y_axis2.add(0);
		x_axis.add("500");
		y_axis2.add(0);
		x_axis.add("1000");
		y_axis2.add(0);
		x_axis.add("2000");
		y_axis2.add(0);
		x_axis.add("5000");
		y_axis2.add(0);
		x_axis.add("10000");
		y_axis2.add(0);
		x_axis.add("30000");
		y_axis2.add(0);
		x_axis.add("50000");
		y_axis2.add(0);
		x_axis.add("100000");
		y_axis2.add(0);
		x_axis.add(String.valueOf(max));
		y_axis2.add(0);
		for (Integer num : carTon_company_list) {
			if (num != null) {
				for (int i = 0; i < x_axis.size() - 1; i++) {
					if (num <= x_axis.getInt(i + 1) && num > x_axis.getInt(i)) {
						if((int) y_axis1.get(i) >= 100)
							break;
						y_axis1.set(i, (int) y_axis1.get(i) + 1);
						break;
					}
				}
				for (int i = 0; i < x_axis.size() - 1; i++) {
					if (num <= x_axis.getInt(i + 1) && num > x_axis.getInt(i)) {
						y_axis2.set(i, (int) y_axis2.get(i) + num);
						break;
					}
				}
			}
		}
		for (int i = 0; i < x_axis.size() - 1; i++) {
			if (i == 0) {
				x_axis.set(i, x_axis.get(i).toString() + "-" + x_axis.get(i + 1).toString());
			} else {
				x_axis.set(i, String.valueOf(x_axis.getInt(i) + 1) + "-" + x_axis.get(i + 1).toString());
			}
		}
		x_axis.remove(x_axis.size()-1);
		y_axis1.remove(y_axis1.size()-1);
		y_axis2.remove(y_axis2.size()-1);
		carTon.put("x_axis", x_axis);
		carTon.put("y_axis1", y_axis1);
		carTon.put("y_axis2", y_axis2);
		carTons.put("carton", carTon);
		carTons.put("status","y");
		return carTons;
	}
	
	/**
	 * 计算中心对
	 * 
	 * @return
	 */
	@Override
	public boolean computeCenterPairs(int distance, int tons, String type, int clusterNum) {
		SparkKM skm = new SparkKM();
		return skm.optimizeStation(distance, tons, type, clusterNum);
	}

}
