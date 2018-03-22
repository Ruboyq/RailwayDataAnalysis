package org.rda.mapper;

import java.util.List;

import org.rda.pojo.BaseDict;

public interface BaseDictMapper {
	/**
	 * 根据类别代码查询数据
	 * 
	 * @param dictTypeCode
	 * @return
	 */
	List<BaseDict> queryBaseDictByDictTypeCode(String dictTypeCode);
	
}

