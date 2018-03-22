package org.rda.controller;

import org.rda.exceptions.ConversionNotSupportedException;
import org.rda.exceptions.HttpMediaTypeNotAcceptableException;
import org.rda.exceptions.HttpMessageNotReadableException;
import org.rda.exceptions.ResourceNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
@RequestMapping("/error")  
public class ErrorController extends BaseController{  
    @RequestMapping("/400")  
    public void handle1() throws HttpMessageNotReadableException{ 
    	throw new HttpMessageNotReadableException();
    }  
    @RequestMapping("/404")  
    public void handle2() throws ResourceNotFoundException{ 
    	throw new ResourceNotFoundException();
    }  
    @RequestMapping("/406")  
    public void handle3() throws HttpMediaTypeNotAcceptableException{ 
    	throw new HttpMediaTypeNotAcceptableException();
    }  
    @RequestMapping("/500")  
    public void handle4() throws ConversionNotSupportedException{ 
    	throw new ConversionNotSupportedException();
    }    
}  
