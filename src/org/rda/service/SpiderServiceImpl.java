package org.rda.service;

import java.util.List;

import org.rda.utils.SpiderUtil;
import org.rda.utils.SystemServiceLog;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.sf.json.JSONArray;

@Service
@Transactional
public class SpiderServiceImpl implements SpiderService{
	
	/**
	 * 爬取数据
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "爬取数据")
	public void crawl() {
		SpiderUtil su=new SpiderUtil();
		su.scratch();
	}
	
	/**
	 * 获取爬取文件
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "获取爬取文件")
	public JSONArray getFiles() {
		SpiderUtil su=new SpiderUtil();
		return su.getFiles();
	}

}
