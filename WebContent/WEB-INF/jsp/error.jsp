<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Fargo Error</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Dosis:400,300,500,800'>

      <link rel="stylesheet" href="<%=basePath %>css/style.css">

  
</head>

<body>
  
<div class="content">
  <canvas class="snow" id="snow"></canvas>
  <div class="main-text">
    <h1>Sorry<br/></h1><h1>${errorMessage }</h1><a class="home-link" href="#">Hitch a ride back home.</a>
  </div>
  <div class="ground">
    <div class="mound"> 
      <div class="mound_text">${errorType}</div>
      <div class="mound_spade"></div>
    </div>
  </div>
</div>
  
    <script src="<%=basePath %>js/index.js"></script>

</body>
</html>
