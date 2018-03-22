package org.rda.service;

import java.io.IOException;
import java.io.OutputStream;

import org.rda.utils.RandomCode;
import org.springframework.stereotype.Service;

@Service
public class CheckCodeServiceImpl implements CheckCodeService{

	@Override
	public String sendCheckCode(OutputStream os,String format) {
		 // 验证码图片宽度，单位像素 
	    int width = 120; 
	    // 验证码图片高度，单位像素 
	    int height = 30; 
	    // 验证码字符长度 
	    int len = 4; 
	    // 获取验证码
	    String code = RandomCode.randomString(len);
	    // 把图片输出到response输出流 
	    try {
			RandomCode.write(code, width, height,os, format);
		} catch (IOException e) {
			e.printStackTrace();
		}
	    return code;
	}
}
