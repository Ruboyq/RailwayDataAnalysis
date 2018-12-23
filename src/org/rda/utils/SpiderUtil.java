package org.rda.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import spider.*;

public class SpiderUtil {
	public void scratch() {
		try {
			HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
					.getRequest();
			String dir = request.getServletContext().getRealPath("/") + "WEB-INF\\classes\\files\\";
			Policy.setPath(dir);
			Road.setPath(dir);
			Logistics.setPath(dir);
			WebSpider.Test();
		} catch (Exception e) {
		}
	}

	public JSONArray getFiles() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
				.getRequest();
		String filepath = request.getServletContext().getRealPath("/") + "WEB-INF\\classes\\files";
		JSONArray files = new JSONArray();
		File file = new File(filepath);
		if (file.isDirectory()) {
			String[] filelist = file.list();
			for (int i = 0; i < filelist.length; i++) {
				File readfile = new File(filepath + "\\" + filelist[i]);
				if (!readfile.isDirectory())
					files.add(filelist[i]);
			}
		}
		return files;
	}
}
