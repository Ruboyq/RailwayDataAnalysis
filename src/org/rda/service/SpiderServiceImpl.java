package org.rda.service;

import org.rda.utils.SpiderUtil;
import org.rda.utils.SystemServiceLog;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Spider.GetArticles;

@Service
@Transactional
public class SpiderServiceImpl implements SpiderService{
	
	/**
	 * 爬取数据
	 * @return
	 */
	@Override
	@SystemServiceLog(description = "爬取数据")
	public void crawl(String path1, String path2, String path3, String path4, String path5) {
		SpiderUtil su=new SpiderUtil();
		su.scratch();
	}

}
