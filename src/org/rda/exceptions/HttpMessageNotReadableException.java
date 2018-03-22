package org.rda.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.BAD_REQUEST)
public class HttpMessageNotReadableException extends RuntimeException{
	private String errorMessage;
	private String errorType;
	
	public HttpMessageNotReadableException() {
		this.errorMessage = "Bad Request";
		this.errorType = "400";
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
