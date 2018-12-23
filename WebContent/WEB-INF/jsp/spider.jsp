<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<!-- 原始地址：//webapi.amap.com/ui/1.0/ui/misc/PointSimplifier/examples/index.html -->
<base href="http://localhost:8080/RailwayDataAnalysis/" />
<meta charset="utf-8">
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>数据爬取</title>
<!-- MAIN EFFECT -->
<link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>bootstrap/styleForSpider.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/icons-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/media.css">
<link rel="stylesheet" href="<%=basePath%>css/file-explore.css">
<link rel="stylesheet" href="<%=basePath%>css/font-awesome.css">
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
}

.map2 {
	width: 100%;
	margin: 0px;
	height: 100%;
}

.label1 {
	font-weight: bold;
	font-size: 17px;
	position: absolute;
}

.oneline {
	height: 40px;
}

.s1 {
	font-weight: bold;
	font-size: 15px;
	height: 25px;
	padding-top: 5px;
}

.s2 {
	padding-left: 15px;
}

.st {
	position: absolute;
	width: 150px;
	margin-top: 5px;
	margin-right: 340px;
	right: 0px;
}
</style>
</head>

<body>
	<div class="nest map2" id="GmapClose">
		<div
			style="padding: 0px; width: 100%; height: 100%; position: relative;"
			class="body-nest" id="Gmap">

			<div class="blog-list-nest">
				<div class="vendor">
					<blockquote>
						<p>数据爬取</p>
						<p>
							<small>爬取相关数据源</small>
						</p>
					</blockquote>
				</div>
			</div>
			<div class="oneline">
				<div id="progress" style="display: none;" class="progress">
					<div class="progress progress-striped active">
						<div id="progress-bar" class="progress-bar progress-bar-info"
							role="progressbar" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100" style="width: 0%;">
							<span class="sr-only"></span>
						</div>
					</div>

				</div>
 <a
			onclick="crawl();" style="margin-top: 5px; margin-right: 20px;"
					class="pull-right btn btn-info filter-api">爬取</a>
			</div>

<div class="oneline">
           <ul id = "file-trees" class="file-tree" style="font-size:15px;">
           </ul>
			</div>
			
		</div>
	</div>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">爬取结果</h4>
				</div>
				<div class="modal-body" style="font-size: 17px; font-weight: bold">数据爬取成功!</div>
				<div style="margin-top: 0px;" class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<script>
	$(function() {
		  $(".file-tree").filetree();
		});
      function crawl(){
    	  
      $.ajax({
			type:'get',
			url:"<%=basePath%>railwayData/crawl",
			dataType:'json',
			 beforeSend : function(){
				 $("#progress").css('display','block');
				 setTimeout(function(){ 
					 $("#progress-bar").css('width','20%');
				 }, 1000);
			},
			 complete: function(){
				 setTimeout(function(){ 
					 $("#progress-bar").css('width','100%');
					 setTimeout(function(){
						 $("#progress").css('display','none'); 
						 $("#progress-bar").css('width','0%');
						 load.loading.add(0.4,"<%=basePath%>images/loading.gif");
						 setTimeout(function(){
						 $.ajax({
								type:'get',
								url:"<%=basePath%>railwayData/showCrawlFiles",
								dataType:'json',
								success:function(data){
									load.loading.remove();
									$('#myModal').modal('show');
									$("#successAlert").html("<div style=\"padding:5px;\"id=\"successAlert\" class=\"alert alert-success\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a><strong>数据爬取成功！获取文件中..</strong></div>");
									$.each(data.files, function (index, item) {
										$("#file-trees").empty();
										$("#file-trees").append('<li><a href = "<%=basePath%>classes/files/'+item+'" download="">'+item+'</a></li>');
									 });
								},
								error: function(json){
									alert("用户数据加载异常，请刷新后重试...");  
								}
								});
						 }, 10000);
					 }, 1000);
					 
				 }, 2000);
			 },
			success:function(data1){
				 setTimeout(function(){ 
					 $("#progress-bar").css('width','80%');
				 }, 1500);
			},
			error: function(json){
				alert("用户数据加载异常，请刷新后重试...");  
			}  
			});
      }
<%--        --%>
      </script>

	<script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
	<script type="text/javascript"
		src="<%=basePath%>bootstrap/bootstrap.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/file-explore.js"></script>
	<script src="<%=basePath%>js/waitpage.js"></script>
</body>

</html>