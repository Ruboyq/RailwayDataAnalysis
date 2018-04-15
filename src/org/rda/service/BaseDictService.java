package org.rda.service;

import java.util.List;

import org.rda.pojo.BaseDict;

public interface BaseDictService {

	/**
	 * 根据类别代码查询
	 * 
	 * @param dictTypeCode
	 * @return
	 */
	List<BaseDict> queryBaseDictByDictTypeCode(String dictTypeCode);
}
