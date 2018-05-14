package org.rda.service;

import java.util.List;

import org.rda.mapper.BaseDictMapper;
import org.rda.mapper.ProvinceMapper;
import org.rda.pojo.BaseDict;
import org.rda.pojo.City;
import org.rda.pojo.Province;
import org.rda.utils.SystemServiceLog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.sun.org.apache.bcel.internal.generic.NEW;
import com.sun.xml.internal.fastinfoset.stax.events.ProcessingInstructionEvent;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
@Transactional
public class BaseDictServiceImpl implements BaseDictService {

	@Autowired
	private BaseDictMapper baseDictMapper;
	@Autowired
	private ProvinceMapper provinceMapper;
	@Autowired
	private RailwayDataService railwayDataService;

	@Override
	//此处为AOP拦截Service记录异常信息。方法不需要加try-catch  
	@SystemServiceLog(description = "查询字典")
	public List<BaseDict> queryBaseDictByDictTypeCode(String dictTypeCode) {

		List<BaseDict> list = this.baseDictMapper.queryBaseDictByDictTypeCode(dictTypeCode);
		return list;
	}
	
	@Override
	public void createProvinceTable(){
		RestTemplate request=new RestTemplate();
		List<City> citys=railwayDataService.getOriginalCitys();
		for(City city:citys){
			String url="http://restapi.amap.com/v3/geocode/regeo?output=JSON&location="+city.getLongitude()+","+city.getLatitude()+"&key=638e34196d12f4be996e95f274491348&radius=1000&extensions=base";
			JSONObject jsonObject=request.getForObject(url, JSONObject.class);
			String provinceName=jsonObject.getJSONObject("regeocode").getJSONObject("addressComponent").getString("province");
			Province province=new Province(provinceName, city.getName());
			provinceMapper.addProvince(province);
		}
	}
	
	@Override
	public JSONObject getProvincePage(){
		JSONObject table=new JSONObject();
		List<Province> list=provinceMapper.getAllProvince();
		List<String> provinceNames=provinceMapper.getProvinces();
		for(String provinceName:provinceNames){
			table.put(provinceName, new JSONArray());
		}
		for(Province province:list){
			table.getJSONArray(province.getProvince()).add(province.getCity());
		}
		return table;
	}
}

