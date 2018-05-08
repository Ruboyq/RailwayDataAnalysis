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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
//@Transactional
public class DataAnalyzeServiceImpl implements DataAnalyzeService{
	@Autowired
	private RailwayCityMapper railwayCityMapper;
	@Autowired
	private RailwayDataMapper railwayDataMapper;
	
	@Override
	//先将RailwayCity表里的数据删除，再向RailwayCity表里添加数据
	@SystemServiceLog(description = "更新RailwayCity表数据")
	public void addRailwayCity(){
		railwayCityMapper.delRailwayCity();
		railwayCityMapper.addRailwayCity();
	}
	
	@Override
	//根据controller传来的from与to，返回路线数据和数据分析结果
	@SystemServiceLog(description = "模糊查询")
	public JSONObject getFilterResult(String from,String to){
		JSONObject data = new JSONObject(); 
		List<RailwayCity> list_railwayCity = railwayCityMapper.getFilterResult(from, to);
		List<RailwayData> list_railwayData = railwayDataMapper.getFilterResult(from, to);
		//计算总车数、总吨数
		int carnum = 0;
		float tonnage = 0;
		//得出车数、吨数的前五位，存入HashMap
		JSONArray carArray=new JSONArray();
		JSONArray tonArray=new JSONArray();
		//HashMap<String, Integer> car = new HashMap<String, Integer>();
		//HashMap<String, Float> ton = new HashMap<String, Float>();
		
		//产品频数
		JSONArray productArray=new JSONArray();
		//HashMap<String, Integer> product = new HashMap<String, Integer>();
		
		//得出效益的前五位，存入HashMap
		JSONArray benifitArray=new JSONArray();
		//HashMap<String, Float> benifit = new HashMap<String, Float>();
		
		for(RailwayCity railwayCity:list_railwayCity){
			carnum += railwayCity.getCarNum();
			tonnage += railwayCity.getTonnage();
		}
			
		int capacity=list_railwayCity.size()>=5?5:list_railwayCity.size();
		//city-carNum直方图
		//排序
		Collections.sort(list_railwayCity,new Comparator<RailwayCity>(){

			@Override
			public int compare(RailwayCity rc1, RailwayCity rc2) {
				// TODO Auto-generated method stub
				int i = rc2.getCarNum() - rc1.getCarNum();
				if(i == 0){  
                    return (int) (rc2.getTonnage() - rc1.getTonnage());  
                }  
				return i;
			}
		});
		//赋值
		for(int i = 0;i<capacity;i++){
			JSONObject js=new JSONObject();
			if(from==""&to!=""){
				js.put("x", list_railwayCity.get(i).getFromCity());
				js.put("y", list_railwayCity.get(i).getCarNum());
				//System.out.println(list_railwayCity.get(i).getFromCity()+" "+list_railwayCity.get(i).getCarNum());
			}
			else if(from!=""&to==""){
				js.put("x", list_railwayCity.get(i).getToCity());
				js.put("y", list_railwayCity.get(i).getCarNum());
				//System.out.println(list_railwayCity.get(i).getToCity()+" "+list_railwayCity.get(i).getCarNum());
			}
			else {
				break;
			}
			carArray.add(js);
		}
		
		//city-tonnage直方图
		//排序
		Collections.sort(list_railwayCity,new Comparator<RailwayCity>(){

			@Override
			public int compare(RailwayCity rc1, RailwayCity rc2) {
				// TODO Auto-generated method stub 
                return (int) (rc2.getTonnage() - rc1.getTonnage());  
			}
		});
		//赋值
		for(int i = 0;i<capacity;i++){
			JSONObject js=new JSONObject();
			if(from==""&to!=""){
				js.put("x", list_railwayCity.get(i).getFromCity());
				js.put("y", list_railwayCity.get(i).getTonnage());
				//System.out.println(list_railwayCity.get(i).getFromCity()+" "+list_railwayCity.get(i).getTonnage());
			}
			else if(from!=""&to==""){
				js.put("x", list_railwayCity.get(i).getToCity());
				js.put("y", list_railwayCity.get(i).getTonnage());
				//System.out.println(list_railwayCity.get(i).getToCity()+" "+list_railwayCity.get(i).getTonnage());
			}else {
				break;
			}
			tonArray.add(js);
		}
		
		//city-benifit直方图
		//排序
		Collections.sort(list_railwayCity,new Comparator<RailwayCity>(){

			@Override
			public int compare(RailwayCity rc1, RailwayCity rc2) {
				// TODO Auto-generated method stub 
		        return (int) (rc2.getBenefit() - rc1.getBenefit());
			}
		});
		//赋值
		for(int i = 0;i<capacity;i++){
			JSONObject js=new JSONObject();
			if(from==""&to!=""){
				js.put("x", list_railwayCity.get(i).getFromCity());
				js.put("y", list_railwayCity.get(i).getBenefit());
				//System.out.println(list_railwayCity.get(i).getFromCity()+" "+list_railwayCity.get(i).getBenefit());
			}
			else if(from!=""&to==""){
				js.put("x", list_railwayCity.get(i).getToCity());
				js.put("y", list_railwayCity.get(i).getBenefit());
				//System.out.println(list_railwayCity.get(i).getToCity()+" "+list_railwayCity.get(i).getBenefit());
			}else {
				break;
			}
			benifitArray.add(js);
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
			JSONObject js=new JSONObject();
			js.put("x", list_product_frequency.get(i).getKey());
			js.put("y", df.format((float)list_product_frequency.get(i).getValue()/total_frequency));
			remaining_frequency-=list_product_frequency.get(i).getValue().intValue();
			productArray.add(js);
			//System.out.println(list_product_frequency.get(i).getKey()+" "+df.format((float)list_product_frequency.get(i).getValue()/total_frequency*100)+"%");
		}
		JSONObject js=new JSONObject();
		js.put("x", "其他");
		js.put("y", df.format((float)remaining_frequency/total_frequency));
		//System.out.println("其他 "+df.format((float)remaining_frequency/total_frequency*100)+"%");
		productArray.add(js);
		
		data.put("railway", list_railwayCity);
		data.put("carnum", carnum);
		data.put("tonnage", tonnage);
		data.put("car", carArray);
		data.put("ton", tonArray);
		data.put("product", productArray);
		data.put("benifit", benifitArray);
		return data;
	}
}
