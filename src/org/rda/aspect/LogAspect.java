package org.rda.aspect;

import java.io.FileWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.rda.utils.SystemControllerLog;
import org.rda.utils.SystemServiceLog;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.ServletRequestAttributes; 
import org.springframework.web.context.request.RequestContextHolder;  

/** 
 * 切点类 
 * @author 
 * @since 2018-01-05 PM21:01
 * @version 1.0 
 */ 

@Aspect
@Component
public class LogAspect {
	//本地异常日志记录对象  
    private  static  final Logger logger = LoggerFactory.getLogger(LogAspect. class); 
    
    //Service层切点  
    @Pointcut("@annotation(org.rda.utils.SystemServiceLog)") 
     public  void serviceAspect() {  
    }  
  
    //Controller层切点  
    @Pointcut("@annotation(org.rda.utils.SystemControllerLog)")  
     public  void controllerAspect() {  
    }  
    
    /** 
     * 前置通知 用于拦截Controller层记录用户的操作 
     * 
     * @param joinPoint 切点 
     * @throws UnsupportedEncodingException 
     */  
    @Before("controllerAspect()")  
     public  void doBefore(JoinPoint joinPoint) throws UnsupportedEncodingException {  
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
        //读取session中的用户  
        String userId = String.valueOf(session.getAttribute("uid"));    
        //请求的IP  
        String ip = request.getRemoteAddr();  
        //日志文件地址
        String fileName = request.getServletContext().getRealPath("/") + "WEB-INF/classes/logs/logControllerInfo.txt";
        try {  
            //直接往loginfo.txt中追加字符串
        	FileWriter writer=new FileWriter(fileName,true);
        	
            //*========文件输出=========*//  
        	writer.write("请求时间:" + new Date() + "|");
        	writer.write("请求人:" + userId + "|");  
        	writer.write("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()" + "|"));  
        	writer.write("方法描述:" + getControllerMethodDescription(joinPoint) + "|");        
        	writer.write("请求IP:" + ip + "\n");  
        	writer.close();
            
        }  catch (Exception e) {  
            //记录本地异常日志  
            logger.error("==前置通知异常==");  
            logger.error("异常信息:{}", e.getMessage());  
        }  
    }  
    
    /**
     * 后置通知 用于拦截Service层切点
     * 
     * @param joinPoint 切点
     * 
     */
    @After("serviceAspect()")
    public void doAfter(JoinPoint joinPoint) {
    	HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();  
        HttpSession session = request.getSession();  
        //读取session中的用户  
        String userId = String.valueOf(session.getAttribute("uid"));  
        //请求的IP  
        String ip = request.getRemoteAddr();  
        //日志文件地址
        String fileName = request.getServletContext().getRealPath("/") + "WEB-INF/classes/logs/logServiceInfo.txt";
        //fileName = "C:\\Users\\T5\\Desktop\\logs.txt";
        try {  
        	//直接往loginfo.txt中追加字符串
        	FileWriter writer=new FileWriter(fileName,true);
        	
            //*========文件输出=========*//  
        	writer.write("请求时间:" + new Date() + "|");
        	writer.write("请求人:" + userId + "|");  
        	writer.write("请求方法:" + (joinPoint.getTarget().getClass().getName() + "." + joinPoint.getSignature().getName() + "()" + "|"));  
        	writer.write("方法描述:" + getServiceMthodDescription(joinPoint) + "|");        
        	writer.write("请求IP:" + ip + "\n");  
        	writer.close();
        }  catch (Exception e) {  
            //记录本地异常日志  
            logger.error("==后置通知异常==");  
            logger.error("异常信息:{}", e.getMessage());  
        }  
    }
    
    /** 
     * 获取注解中对方法的描述信息 用于service层注解 
     * 
     * @param joinPoint 切点 
     * @return 方法描述 
     * @throws Exception 
     */  
     public  static String getServiceMthodDescription(JoinPoint joinPoint)  
             throws Exception {  
        String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        String description = "";  
         for (Method method : methods) {  
             if (method.getName().equals(methodName)) {  
                Class[] clazzs = method.getParameterTypes();  
                 if (clazzs.length == arguments.length) {  
                    description = method.getAnnotation(SystemServiceLog.class).description();  
                     break;  
                }  
            }  
        }  
         return description;  
    }  
  
    /** 
     * 获取注解中对方法的描述信息 用于Controller层注解 
     * 
     * @param joinPoint 切点 
     * @return 方法描述 
     * @throws Exception 
     */  
     public  static String getControllerMethodDescription(JoinPoint joinPoint)  throws Exception {  
        String targetName = joinPoint.getTarget().getClass().getName();  
        String methodName = joinPoint.getSignature().getName();  
        Object[] arguments = joinPoint.getArgs();  
        Class targetClass = Class.forName(targetName);  
        Method[] methods = targetClass.getMethods();  
        String description = "";  
         for (Method method : methods) {  
             if (method.getName().equals(methodName)) {  
                Class[] clazzs = method.getParameterTypes();  
                 if (clazzs.length == arguments.length) {  
                    description = method.getAnnotation(SystemControllerLog.class).description();  
                     break;  
                }  
            }  
        }  
         return description;  
    }  
}
