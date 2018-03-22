package org.rda.controller;

import java.sql.SQLException;

import org.rda.exceptions.*;
import org.rda.utils.SystemControllerLog;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONException;	

@Controller    
public class BaseController {

	//处理500错误
	@ExceptionHandler(ConversionNotSupportedException.class)
	//此处为记录AOP拦截Controller记录用户操作  
	@SystemControllerLog(description = "触发500异常") 
	public ModelAndView handlerConversionNotSupportedException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		ConversionNotSupportedException error = (ConversionNotSupportedException)ex;
		mv.addObject("errorType",error.getErrorType());
		mv.addObject("errorMessage",error.getErrorMessage());
		mv.setViewName("error");
		return mv;
	}
	
	//处理406错误
	//此处为记录AOP拦截Controller记录用户操作  
	@SystemControllerLog(description = "触发406异常") 
	@ExceptionHandler(HttpMediaTypeNotAcceptableException.class)
	public ModelAndView handlerHttpMediaTypeNotAcceptableException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		HttpMediaTypeNotAcceptableException error = (HttpMediaTypeNotAcceptableException)ex;
		mv.addObject("errorType",error.getErrorType());
		mv.addObject("errorMessage",error.getErrorMessage());
		mv.setViewName("error");
		return mv;
	}
	
	//处理404错误
	@ExceptionHandler(ResourceNotFoundException.class)
	//此处为记录AOP拦截Controller记录用户操作  
	@SystemControllerLog(description = "触发404异常") 
	public ModelAndView handlerResourceNotFoundException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		ResourceNotFoundException error = (ResourceNotFoundException)ex;
		mv.addObject("errorType",error.getErrorType());
		mv.addObject("errorMessage",error.getErrorMessage());
		mv.setViewName("error");
		return mv;
	}
	
	//处理400错误
	//此处为记录AOP拦截Controller记录用户操作  
	@SystemControllerLog(description = "触发400异常") 
	@ExceptionHandler(HttpMessageNotReadableException.class)
	public ModelAndView handlerHttpMessageNotReadableException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		HttpMessageNotReadableException error = (HttpMessageNotReadableException)ex;
		mv.addObject("errorType",error.getErrorType());
		mv.addObject("errorMessage",error.getErrorMessage());
		mv.setViewName("error");
		return mv;
	}
	
	//处理SQL异常
	@ExceptionHandler(SQLException.class)
	//此处为记录AOP拦截Controller记录用户操作  
	@SystemControllerLog(description = "触发SQL异常") 
	public ModelAndView handlerSqlException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorType", "数据库异常");
		mv.addObject("errorMessage","你碰见了没人可怕的数据库异常");
		mv.setViewName("error");
		return mv;
	}
	
	//处理JSON异常
	//此处为记录AOP拦截Controller记录用户操作  
	@SystemControllerLog(description = "触发JSON异常") 
	@ExceptionHandler(JSONException.class)
	public ModelAndView handlerJSONException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorType", "数据传输异常");
		mv.addObject("errorMessage","你碰见了没人可怕的数据传输异常");
		mv.setViewName("error");
		return mv;
	}
	
	//处理普通异常
	@ExceptionHandler
	//此处为记录AOP拦截Controller记录用户操作  
    @SystemControllerLog(description = "触发普通未定义异常") 
	public ModelAndView handlerException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorType", "未知的异常");
		mv.addObject("errorMessage","你碰见了没人可怕的未知异常");
		mv.setViewName("error");
		return mv;
	}
	
}
