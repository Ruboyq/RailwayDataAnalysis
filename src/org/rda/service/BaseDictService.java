package org.rda.service;

import java.util.List;

import org.rda.pojo.BaseDict;

import net.sf.json.JSONObject;

public interface BaseDictService {

	/**
	 * 根据类别代码查询
	 * 
	 * @param dictTypeCode
	 * @return
	 */
	List<BaseDict> queryBaseDictByDictTypeCode(String dictTypeCode);

	/**
	 * 创建省份-城市对应表
	 */
	void createProvinceTable();

	/**
	 * 获取省份-城市对应表
	 * @return
	 */
	JSONObject getProvincePage();
}
