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
    <base href="//webapi.amap.com/ui/1.0/ui/misc/PointSimplifier/examples/" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>数据爬取</title>
     <!-- MAIN EFFECT -->
    <link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>bootstrap/styleForSpider.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/icons-style.css" >
    <link rel="stylesheet" href="<%=basePath%>assets/css/media.css" >
    <link rel="stylesheet" href="<%=basePath%>bootstrap/bootstrap-select.min.css">
    <link rel="stylesheet" href="<%=basePath%>assets/js/datepicker/datepicker.css">
    
    <style>
    html,
    body{
        width: 100%;
        height: 100%;
        margin: 0px;
    }
    #container {
        width: 70%;
        height: 100%;
        margin: 0px;
        border: 1px solid #f5f5f5;
        border-style:solid none solid solid;
        box-shadow: 0px 1px 3px #777;
    }
     #container2 {
        border: 1px solid #f5f5f5;
        border-style:solid solid none none;
        box-shadow: 0px 1px 3px #777;
    }
    .chart {
        width: 70%;
        height: 100%;
        margin: 0px;
        border: 1px solid #f5f5f5;
        border-style:solid none solid solid;
        box-shadow: 0px 1px 3px #777;
    }
    .map1 {
        width: 65%;
        margin: 0px;
        height: 60%;
    }
     .map2 {
        width: 35%;
        margin: 0px;
        height: 60%;
    }
    .map3 {
        width: 100%;
        margin: 0px;
        height: 40%;
    }
    .text {
        width: 35%;
        margin: 0px;
        height: 40%;
    }
    .mapshow{
	padding-top: 0px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	position: absolute;
	top: 50px;
	bottom: 0px;
	width: 100%;
	left: 0;
	background: none;
    }
    .label1{
	font-weight: bold;
	font-size: 17px;
    position: absolute;
    }
    .oneline{
        height: 40px;
    }
    .s1{
        font-weight: bold;
        font-size: 15px;
        height:25px;
        padding-top:5px;
    }
    .s2{
        padding-left: 15px;
    }
     .sl{
	position: absolute;
	width: 150px;
	margin-top: 5px;
	margin-right: 590px;
    right:0px;
    }
     .sctl{
	position: absolute;
	width: 75px;
	margin-top: 5px;
	margin-right: 800px;
    right:0px;
    }
     .st{
	position: absolute;
	width: 150px;
	margin-top: 5px;
	margin-right: 340px;
    right:0px;
    }
     .ed{
	position: absolute;
	width: 150px;
	margin-top: 5px;
	margin-right: 110px;
    right:0px;
    }
     .ty-label{
	position: absolute;
	margin-right: 750px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
    right:0px;
    }
    .st-label{
	position: absolute;
	margin-right: 500px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
    right:0px;
    }
    .ed-label{
	position: absolute;
	margin-right: 260px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
    right:0px;
    }
    #loadingTip {
        position: absolute;
        z-index: 9999;
        top: 0;
        left: 0;
        padding: 3px 10px;
        background: red;
        color: #fff;
        font-size: 14px;
    }
    .hoverStyle {
       position: absolute;
    }
    </style>
</head>

<body>
                        <div class="nest map1" id="GmapClose">
                                <div style="padding:0px;width:100%;height:100%;position:relative;" class="body-nest" id="Gmap">
                                
                    <div class="blog-list-nest">
                    <div class="vendor">
                            <blockquote>
                                <p>文件列表</p>
                                <p>
                                    <small>爬取文件一览</small>
                                </p>
                            </blockquote>
                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="nest map2" id="GmapClose">
                                <div style="padding:0px;width:100%;height:100%;position:relative;" class="body-nest" id="Gmap">
                                
                    <div class="blog-list-nest">
                        <div class="vendor">
                            <blockquote>
                                <p>数据爬取</p>
                                <p>
                                    <small>根据您的喜好选择数据源</small>
                                </p>
                            </blockquote>
                        </div>
                        </div>
                        <div class="oneline">
                                <div class="entypo-tooltip" style="color:#3498DB">
                                <li style="padding:0px;"class="icon icon-location" data-placement="right" title="aboveground-rail"></li>
                                </div>
                                <span class="label1"><span class="label s1">选择爬取文件:</span> 
                                 <select class="selectpicker" multiple>
                                        <optgroup label="年度报表">
                                        <option value="1">文本</option>
                                        <option value="2">表格</option>
                                        <option value="3">图例</option>
                                        </optgroup>  
                                 <option value="4">政府政策</option>
                                 <option value="5">物通网</option>                            
                                 </select>
                                </span>
                                </div>
                        <div class="oneline">
                                <div class="entypo-tooltip" style="color:#3498DB">
                                <li style="padding:0px;"class="fontawesome-truck" data-placement="right" title="aboveground-rail"></li>
                                </div>
                                <span class="label1"><span class="label s1">Total tonnage:</span><span id="total_tonnage" class="s2"></span> </span>
                                </div>
                        <div class="oneline">
                                <div class="entypo-tooltip" style="color:#3498DB">
                                <li style="padding:0px;"class="maki-aboveground-rail " data-placement="right" title="aboveground-rail"></li>
                                </div>
                                <span class="label1"><span class="label s1">Top Car Nums:</span><span id="total_carnum" class="s2"></span> </span>
                                </div>     
                         <div class="oneline">
                         <a onclick="crawl();"style="margin-top: 5px; margin-right: 20px;"class="pull-right btn btn-info filter-api">重置</a>
                          <a onclick="crawl();"style="margin-top: 5px; margin-right: 20px;"class="pull-right btn btn-info filter-api">爬取</a>
                         </div>
                         <div class="oneline">
                         <div id="progress" style="display:none;" class="progress">
    <div class="progress progress-striped active">
    <div id="progress-bar" class="progress-bar progress-bar-info" role="progressbar"
         aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"
         style="width: 40%;">
        <span class="sr-only">40% 完成</span>
    </div>
</div>

</div>

                         </div>
                         
                                </div>
                            </div>
                            <div class="nest map3" id="GmapClose">
                            <div style="padding:0px;width:100%;height:100%;position:relative;" class="body-nest" id="Gmap">
                            </div>
                            </div>
                       
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">爬取结果</h4>
            </div>
            <div class="modal-body" style="font-size:17px;font-weight:bold">数据爬取成功!</div>
            <div style="margin-top:0px;" class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
      <script>
      function crawl(){
    	  $('#myModal').modal('show');
      $.ajax({
			type:'get',
			url:"<%=basePath%>railwayData/crawl",
			dataType:'json',
			 beforeSend : function(){
				 $("#progress").css('display','block');
				 $("#progress-bar").css('width','20%');
			},
			 complete: function(){
				 $("#progress-bar").css('width','100%');
				 $("#successAlert").html("<div style=\"padding:5px;\"id=\"successAlert\" class=\"alert alert-success\"><a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a><strong>数据爬取成功！</strong></div>");
			 },
			success:function(data1){
				$("#progress-bar").css('width','80%');
			},
			error: function(json){
				load.loading.remove();
				alert("用户数据加载异常，请刷新后重试...");  
			}  
			});
      }
			
      </script>
      
    <script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>bootstrap/defaults-zh_CN.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/js/datepicker/bootstrap-datepicker.js"></script>
    <script src="<%=basePath%>js/waitpage.js"></script>
</body>

</html>