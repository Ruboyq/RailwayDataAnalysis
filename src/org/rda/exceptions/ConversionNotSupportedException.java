package org.rda.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR)
public class ConversionNotSupportedException extends RuntimeException{
	private String errorMessage;
	private String errorType;
	
	public ConversionNotSupportedException() {
		this.errorMessage = "Internal Server Error";
		this.errorType = "500";
	}
	
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	public String getErrorMessage() {
		return this.errorMessage;
	}
	
	public void setErrorType(String errorMessage) {
		this.errorMessage = errorMessage;
	}
	
	public String getErrorType() {
		return this.errorType;
	}
}

