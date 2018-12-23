package org.rda.service;

import java.util.List;

import net.sf.json.JSONArray;

public interface SpiderService {
	/**
	 * 设置爬虫路径
	 * 
	 * @return
	 */
	public void crawl();
	/**
	 * 获取爬取的文件
	 * 
	 * @return
	 */
	public JSONArray getFiles();
}
