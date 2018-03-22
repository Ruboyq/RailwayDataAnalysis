package org.rda.service;

import java.io.OutputStream;

public interface CheckCodeService {
	/**
	 * 发送验证码图片到前端
	 * 
	 * @param os,format
	 * @return
	 */
	public String sendCheckCode(OutputStream os,String format);

}
