package org.rda.exceptions;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.NOT_ACCEPTABLE)
public class HttpMediaTypeNotAcceptableException extends RuntimeException{
	private String errorMessage;
	private String errorType;
	
	public HttpMediaTypeNotAcceptableException() {
		this.errorMessage = "Not Acceptable";
		this.errorType = "406";
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
