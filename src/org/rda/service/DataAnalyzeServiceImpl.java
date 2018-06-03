package org.rda.service;

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
	@Autowired
	private DistrictMapper districtMapper;
	@Autowired
	private DataCompanyMapper dataCompanyMapper;
	
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
			if(map.get("benefit") !=null){
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
		float firstbenifit=list_railwayCity.get(0).getBenefit();
		int multiple=1;
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
		Set<String> set =new HashSet<String>();
		List<String> list=new ArrayList<String>();
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

	@Override
	public JSONObject getFromCityShipNum(String startmonth,String endmonth,int productId){
		List<Map> list=railwayDataMapper.getProductTonnagebyTime(startmonth, endmonth, productId);
		List<Map> ton_car_list = railwayDataMapper.getProductbyTime(startmonth, endmonth, productId);
		standardNormalization(list);
		JSONObject data = new JSONObject();
		JSONArray jsonArray=new JSONArray();
		for(Map map:list){
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("lat", (double)map.get("fromLatitude"));
			jsonObject.put("lng", (double)map.get("fromLongitude"));
			jsonObject.put("count", (double)map.get("tonnage"));
			jsonArray.add(jsonObject);
		}
		data.put("city_ton_array", jsonArray);
		
		
		JSONObject per_month = new JSONObject();
		JSONArray x_month = new JSONArray();
		JSONArray y_carnum=new JSONArray();
		JSONArray y_ton=new JSONArray();
		int total_carnum = 0;
		float total_tonnage = 0f;
		int month = Integer.parseInt(startmonth);
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

		
		List<Map> product_benifit_5 = railwayDataMapper.getBenifitbyTime(startmonth, endmonth, productId);
		JSONObject benifit_5=new JSONObject();
		JSONArray x_name = new JSONArray();
		JSONArray y_benifit=new JSONArray();
		for(Map map:product_benifit_5){
			x_name.add((String)map.get("productName"));
			y_benifit.add((double)map.get("benifit"));
		}
		benifit_5.put("productName", x_name);
		benifit_5.put("benifit", y_benifit);
		data.put("benifit_5", benifit_5);
		
		return data;
	}
	
	@Override
	public JSONObject getToCityReceiptNum(String startmonth,String endmonth,int productId){
		List<Map> list=railwayDataMapper.getProductTonnagebyTime2(startmonth, endmonth, productId);
		List<Map> ton_car_list = railwayDataMapper.getProductbyTime2(startmonth, endmonth, productId);
		standardNormalization(list);
		JSONObject data = new JSONObject();
		JSONArray jsonArray=new JSONArray();
		for(Map map:list){
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("lat", (double)map.get("toLatitude"));
			jsonObject.put("lng", (double)map.get("toLongitude"));
			jsonObject.put("count", (double)map.get("tonnage"));
			jsonArray.add(jsonObject);
		}
		data.put("city_ton_array", jsonArray);
		
		JSONObject per_month = new JSONObject();
		JSONArray x_month = new JSONArray();
		JSONArray y_carnum=new JSONArray();
		JSONArray y_ton=new JSONArray();
		int total_carnum = 0;
		float total_tonnage = 0f;
		int month = Integer.parseInt(startmonth);
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
		
		List<Map> product_benifit_5 = railwayDataMapper.getBenifitbyTime(startmonth, endmonth, productId);
		JSONObject benifit_5=new JSONObject();
		JSONArray x_name = new JSONArray();
		JSONArray y_benifit=new JSONArray();
		for(Map map:product_benifit_5){
			x_name.add((String)map.get("productName"));
			y_benifit.add((double)map.get("benifit"));
		}
		benifit_5.put("productName", x_name);
		benifit_5.put("benifit", y_benifit);
		data.put("benifit_5", benifit_5);
		
		return data;
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
	
	@Override
	public List<District> getAllDistrict(){
		return districtMapper.getAllDistrict();
	}

	@Override
	public List<RailwayCity> getAllCenterPairs() {
		List<RailwayCity> list_map = districtMapper.getAllCenterPairs();
		return list_map;
	}
/*	@Override
	public JSONObject getCarNumInCompany() {
		List<Map> carNum_company_list = dataCompanyMapper.getCarNum();
		JSONObject carNum_company = new JSONObject();
		JSONArray x_axis = new JSONArray();
		JSONArray y_axis = new JSONArray();
		int[] carNum_list = new int[carNum_company_list.size()];
		for(int i=0;i<carNum_list.length;i++){
			carNum_list[i] = 1;
		}
		int[] position = findEqualPoints(carNum_list);
		x_axis.add(0);
		y_axis.add(0);
		for(int p:position){
			x_axis.add(carNum_company_list.get(p).get("carNum"));
			y_axis.add(0);
		}
		x_axis.add(carNum_company_list.get(carNum_company_list.size()-1).get("carNum"));
		for(Map map:carNum_company_list){
			if(map.get("carNum") ==null)
				continue;
			int carNum = Integer.parseInt(map.get("carNum").toString());
			for(int i=0;i<x_axis.size()-1;i++){
				if(carNum<x_axis.getInt(i + 1) && carNum>=x_axis.getInt(i)){
					y_axis.set(i, (int)y_axis.get(i)+1);
				}
			}
		}
		
		for(int i=0;i<x_axis.size()-1;i++){
			x_axis.set(i, x_axis.get(i).toString()+"-"+x_axis.get(i+1).toString());
		}
		x_axis.remove(x_axis.size()-1);
		carNum_company.put("x_axis", x_axis);
		carNum_company.put("y_axis", y_axis);
		return carNum_company;
	}

	@Override
	public JSONObject getCarNumInTotal() {
		List<Map> carNum_company_list = dataCompanyMapper.getCarNum();
		JSONObject carNum_total = new JSONObject();
		JSONArray x_axis = new JSONArray();
		JSONArray y_axis = new JSONArray();
		int[] carNum_list = new int[carNum_company_list.size()];
		for(int i=0;i<carNum_list.length;i++){
			if(carNum_company_list.get(i) ==null)
				continue;
			Map map = carNum_company_list.get(i);
			if(map.get("carNum") ==null)
				continue;
			carNum_list[i] = Integer.parseInt(map.get("carNum").toString());
		}
		int[] position = findEqualPoints(carNum_list);
		x_axis.add(0);
		y_axis.add(0);
		for(int p:position){
			x_axis.add(carNum_company_list.get(p).get("carNum"));
			y_axis.add(0);
		}
		x_axis.add(carNum_company_list.get(carNum_company_list.size()-1).get("carNum"));
		for(Map map:carNum_company_list){
			if(map.get("carNum") ==null)
				continue;
			int carNum = Integer.parseInt(map.get("carNum").toString());
			for(int i=0;i<x_axis.size()-1;i++){
				if(carNum<x_axis.getInt(i + 1) && carNum>=x_axis.getInt(i)){
					y_axis.set(i, (int)y_axis.get(i)+carNum);
				}
			}
		}
		
		for(int i=0;i<x_axis.size()-1;i++){
			x_axis.set(i, x_axis.get(i).toString()+"-"+x_axis.get(i+1).toString());
		}
		x_axis.remove(x_axis.size()-1);
		carNum_total.put("x_axis", x_axis);
		carNum_total.put("y_axis", y_axis);
		return carNum_total;
	}
	
	public int[] findEqualPoints(int[] carNumList) {
		int total = 0;
		int sum = 0;
		int position = 0;
		int[] list = new int[9];
		for(int i:carNumList){
			total+=i;
		}
	
		int a=carNumList.length;
		
		for(int i=0;i<carNumList.length;i++){
			sum+=carNumList[i];
			if(sum>total/10.0f*(position+1)&&sum<=total/10.0f*(position+1)+carNumList[i]){
				list[position] = i;
				position++;
			}
		}
		return list;
	}*/
	
	@Override
	public JSONObject getCarNumInCompany() {
		List<Map> carNum_company_list = dataCompanyMapper.getCarNum();
		JSONObject carNum_company = new JSONObject();
		JSONArray x_axis = new JSONArray();
		JSONArray y_axis = new JSONArray();
		int[] carNum_list = new int[carNum_company_list.size()];
		for(int i=0;i<carNum_list.length;i++){
			carNum_list[i] = 1;
		}
		//int[] position = findIndexIncrease(carNum_list.length);
		
		for(int i=0;i<10;i++){
			x_axis.add(Integer.parseInt(carNum_company_list.get(carNum_company_list.size()-1).get("carNum").toString())/10*(i));
			y_axis.add(0);
		}
		x_axis.add(carNum_company_list.get(carNum_company_list.size()-1).get("carNum"));
		for(Map map:carNum_company_list){
			if(map.get("carNum")!=null){
				int carNum = Integer.parseInt(map.get("carNum").toString());
				for(int i=0;i<x_axis.size()-1;i++){
					if(carNum<=x_axis.getInt(i + 1) && carNum>x_axis.getInt(i)){
						y_axis.set(i, (int)y_axis.get(i)+1);
					}
				}
			}
		}
		carNum_company.put("x_axis", x_axis);
		carNum_company.put("y_axis", y_axis);
		return carNum_company;
	}

	@Override
	public JSONObject getCarNumInTotal() {
		List<Map> carNum_company_list = dataCompanyMapper.getCarNum();
		JSONObject carNum_total = new JSONObject();
		JSONArray x_axis = new JSONArray();
		JSONArray y_axis = new JSONArray();
		int[] carNum_list = new int[carNum_company_list.size()];
		for(int i=0;i<carNum_list.length;i++){
			carNum_list[i] = 1;
		}
		//int[] position = findIndexIncrease(carNum_list.length);
		for(int i=0;i<10;i++){
			x_axis.add(Integer.parseInt(carNum_company_list.get(carNum_company_list.size()-1).get("carNum").toString())/10*(i));
			y_axis.add(0);
		}
		x_axis.add(carNum_company_list.get(carNum_company_list.size()-1).get("carNum"));
		for(Map map:carNum_company_list){
			if(map.get("carNum")!=null){
				int carNum = Integer.parseInt(map.get("carNum").toString());
				for(int i=0;i<x_axis.size()-1;i++){
					if(carNum<=x_axis.getInt(i + 1) && carNum>x_axis.getInt(i)){
						y_axis.set(i, (int)y_axis.get(i)+carNum);
					}
				}
			}
		}
		carNum_total.put("x_axis", x_axis);
		carNum_total.put("y_axis", y_axis);
		return carNum_total;
	}
	
	public int[] findIndexEqual(int length){
		int[] position = new int[9];
		for(int i=0;i<9;i++){
			position[i] = (length/10+1)*(i+1);
		}
		return position;
	}
	
	public int[] findIndexIncrease (int length){
		int[] position = new int[9];
		int a = length*2/100;
		for(int i=0;i<9;i++){
			position[i] = a*(i+1)*(i+1)/2;
		}
		return position;
	}
	
	public int[] findEqualPoints(int[] carNumList) {
		int total = 0;
		int sum = 0;
		int position = 0;
		int[] list = new int[9];
		for(int i:carNumList){
			total+=carNumList[i];
		}
	
		for(int i=0;i<carNumList.length;i++){
			sum+=carNumList[i];
			if(sum>=total/10*(position+1)&&sum<total/10*(position+1)+carNumList[i]){
				list[position] = i;
				position++;
			}
		}
		return list;
	}
}
