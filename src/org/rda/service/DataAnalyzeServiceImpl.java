package org.rda.service;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.ibatis.annotations.Param;
import org.rda.mapper.CityMapper;
import org.rda.mapper.RailwayCityMapper;
import org.rda.mapper.RailwayDataMapper;
import org.rda.pojo.City;
import org.rda.pojo.RailwayCity;
import org.rda.pojo.RailwayData;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import com.sun.mail.handlers.message_rfc822;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional
public class DataAnalyzeServiceImpl implements DataAnalyzeService{
	@Autowired
	private RailwayCityMapper railwayCityMapper;
	@Autowired
	private RailwayDataMapper railwayDataMapper;
	
	@Override
	//先将RailwayCity表里的数据删除，再向RailwayCity表里添加数据
	//@SystemServiceLog(description = "更新RailwayCity表数据")
	public void addRailwayCity(){
		railwayCityMapper.delRailwayCity();
		railwayCityMapper.addRailwayCity();
	}
	
	@Override
	//根据controller传来的from与to，返回路线数据和数据分析结果
	//@SystemServiceLog(description = "模糊查询")
	public JSONObject getFilterResult(String from,String to){
		JSONObject data = new JSONObject(); 
		List<Map> list_map = railwayCityMapper.getFilterResult(from, to);
		List<RailwayCity> list_railwayCity=new ArrayList<RailwayCity>();
		List<RailwayData> list_railwayData = railwayDataMapper.getFilterResult(from, to);
		System.out.println(1111);
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
		int carnum = 0;
		float tonnage = 0;
		for(RailwayCity railwayCity:list_railwayCity){
			carnum += railwayCity.getCarNum();
			tonnage += railwayCity.getTonnage();
		}
		
//		//得出车数、吨数的前五位，存入HashMap
//		JSONObject carArray=new JSONObject();
//			carArray.put("x", new JSONArray());
//			carArray.put("y", new JSONArray());
//		JSONObject tonArray=new JSONObject();
//			tonArray.put("x", new JSONArray());
//			tonArray.put("y", new JSONArray());
		
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
			
		int capacity=list_railwayCity.size()>=5?5:list_railwayCity.size();
//		//city-carNum直方图
//		//排序
//		Collections.sort(list_railwayCity,new Comparator<RailwayCity>(){
//
//			@Override
//			public int compare(RailwayCity rc1, RailwayCity rc2) {
//				// TODO Auto-generated method stub
//				int i = rc2.getCarNum() - rc1.getCarNum();
//				if(i == 0){  
//                    return (int) (rc2.getTonnage() - rc1.getTonnage());  
//                }  
//				return i;
//			}
//		});
//		//赋值
//		for(int i = 0;i<capacity;i++){
//			if(from==""&to!=""){
//				
//				carArray.getJSONArray("x").add(list_railwayCity.get(i).getFromCity());
//				carArray.getJSONArray("y").add(list_railwayCity.get(i).getCarNum());
//				//System.out.println(list_railwayCity.get(i).getFromCity()+" "+list_railwayCity.get(i).getCarNum());
//			}
//			else if(from!=""&to==""){
//				carArray.getJSONArray("x").add(list_railwayCity.get(i).getToCity());
//				carArray.getJSONArray("y").add(list_railwayCity.get(i).getCarNum());
//				//System.out.println(list_railwayCity.get(i).getToCity()+" "+list_railwayCity.get(i).getCarNum());
//			}
//			else {
//				break;
//			}
//		}
//		
//		//city-tonnage直方图
//		//排序
//		Collections.sort(list_railwayCity,new Comparator<RailwayCity>(){
//
//			@Override
//			public int compare(RailwayCity rc1, RailwayCity rc2) {
//				// TODO Auto-generated method stub 
//                return (int) (rc2.getTonnage() - rc1.getTonnage());  
//			}
//		});
//		//赋值
//		for(int i = 0;i<capacity;i++){
//			JSONObject js=new JSONObject();
//			if(from==""&to!=""){
//				js.put("x", list_railwayCity.get(i).getFromCity());
//				js.put("y", list_railwayCity.get(i).getTonnage());
//				//System.out.println(list_railwayCity.get(i).getFromCity()+" "+list_railwayCity.get(i).getTonnage());
//			}
//			else if(from!=""&to==""){
//				js.put("x", list_railwayCity.get(i).getToCity());
//				js.put("y", list_railwayCity.get(i).getTonnage());
//				//System.out.println(list_railwayCity.get(i).getToCity()+" "+list_railwayCity.get(i).getTonnage());
//			}else {
//				break;
//			}
//			tonArray.add(js);
//		}
		
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
		List<String> list = new ArrayList<String>();
		for(RailwayData railwayData:list_railwayData){
			list.add(railwayData.getProductName());
		}
		
		HashMap<String, Integer> product_frequency = new HashMap<String, Integer>();
		for(String s:list){
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

	@Override
	public JSONArray getFromCityShipNum(String startmonth,String endmonth,int productId){
		List<Map> list=railwayDataMapper.getProductTonnagebyTime(startmonth, endmonth, productId);
		standardNormalization(list);
		JSONArray jsonArray=new JSONArray();
		for(Map map:list){
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("lat", (double)map.get("fromLatitude"));
			jsonObject.put("lng", (double)map.get("fromLongitude"));
			jsonObject.put("count", (double)map.get("tonnage"));
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
	
	@Override
	public JSONArray getToCityReceiptNum(String startmonth,String endmonth,int productId){
		List<Map> list=railwayDataMapper.getProductTonnagebyTime2(startmonth, endmonth, productId);
		standardNormalization(list);
		JSONArray jsonArray=new JSONArray();
		for(Map map:list){
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("lat", (double)map.get("toLatitude"));
			jsonObject.put("lng", (double)map.get("toLongitude"));
			jsonObject.put("count", (double)map.get("tonnage"));
			jsonArray.add(jsonObject);
		}
		return jsonArray;
	}
	
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
		
		double min=100;
		for(int i=0;i<data.size();i++){
			double xx=(data.get(i)-average)/standardDeviation;
			data.set(i, xx);
			if(xx<min)
				min=xx;
		}
		
		for(int i=0;i<list.size();i++){
			Map map=list.get(i);
			double newValue=data.get(i)-min;
			map.put("tonnage", newValue);
		}
	}
}
