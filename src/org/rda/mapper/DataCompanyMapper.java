package org.rda.mapper;

import java.util.List;
import java.util.Map;

public interface DataCompanyMapper {
	/**
	 * 获取每个公司的总车数 
	 * @return
	 */
	List<Map> getCarNum();

}
