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
<meta name="viewport"
	content="initial-scale=1.0, user-scalable=no, width=device-width">
<title>海量点展示</title>
<!-- MAIN EFFECT -->
<link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/styleForMap.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/popup_blacklist.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/icons-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/media.css">
<link
	href="<%=basePath%>assets/js/footable/css/footable.core.css?v=2-0-1"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/js/footable/css/footable.standalone.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>assets/js/footable/css/footable-demos.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="<%=basePath%>assets/js/dataTable/lib/jquery.dataTables/css/DT_bootstrap.css">
<link rel="stylesheet"
	href="<%=basePath%>assets/js/dataTable/css/datatables.responsive.css">
<link rel="stylesheet"
	href="<%=basePath%>css/footable.standalone.min.css">
	
<script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/switch/bootstrap-switch.js"></script>
<script async="" src="<%=basePath%>js/analytics.js"></script>
<script src="<%=basePath%>js/Chart.bundle.js"></script>
<script src="<%=basePath%>js/utils.js"></script>
<script src="<%=basePath%>js/footable.min.js"
	type="text/javascript"></script>

<style type="text/css">/* Chart.js */
@
-webkit-keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
@
keyframes chartjs-render-animation {
	from {opacity: 0.99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	-webkit-animation: chartjs-render-animation 0.001s;
	animation: chartjs-render-animation 0.001s;
}
</style>

<style>
canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>

<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
}

#container {
	width: 70%;
	height: 100%;
	margin: 0px;
	border: 1px solid #f5f5f5;
	border-style: solid none solid solid;
	box-shadow: 0px 1px 3px #777;
}

#container2 {
	border: 1px solid #f5f5f5;
	border-style: solid solid none none;
	box-shadow: 0px 1px 3px #777;
}

.chart {
	width: 70%;
	height: 100%;
	margin: 0px;
	border: 1px solid #f5f5f5;
	border-style: solid none solid solid;
	box-shadow: 0px 1px 3px #777;
}

.map1 {
	width: 70%;
	margin: 0px;
	height: 100%;
}

.map2 {
	width: 30%;
	margin: 0px;
	height: 50%;
}

.text {
	width: 30%;
	margin: 0px;
	height: 50%;
}

.mapshow {
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

.label1 {
	font-weight: bold;
	font-size: 17px;
	position: absolute;
}

.label2 {
	font-weight: bold;
	font-size: 17px;
	position: absolute;
	left: 150px
}

.oneline {
	height: 40px;
}

.s1 {
	font-weight: bold;
	font-size: 17px;
}

.s2 {
	padding-left: 5px;
}

.ty-label {
	position: absolute;
	margin-right: 740px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
	right: 0px;
}

.sl {
	position: absolute;
	width: 150px;
	margin-top: 5px;
	margin-right: 580px;
	right: 0px;
}

.sctl {
	position: absolute;
	width: 75px;
	margin-top: 5px;
	margin-right: 790px;
	right: 0px;
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
	<!-- <div id="container"></div>
     <div id="container1"></div> -->
	<!-- <div class="content-wrap">
                <div class="row">
                    <div class="col-sm-12"> -->
	<div class="nest map1" id="GmapClose">
		<div class="title-alt">
			<select id="ctl" class="filter-status form-control sctl">
				<option value="from">发站
				<option value="to">到站
			</select> <span class="ty-label"> Type:</span> <select id="type"
				class="filter-status form-control sl">
				<option value="01">01-煤
				<option value="02">02-石油
				<option value="03">03-焦炭
				<option value="04">04-金属矿石
				<option value="05">05-钢铁及有色金属
				<option value="06">06-非金属矿石
				<option value="07">07-磷矿石
				<option value="08">08-矿物性建筑材料
				<option value="09">09-水泥
				<option value="10">10-木材
				<option value="11">11-粮食
				<option value="12">12-棉花
				<option value="13">13-化肥及农药
				<option value="14">14-盐
				<option value="15">15-化工品
				<option value="16">16-金属制品
				<option value="17">17-工业机械
				<option value="18">18-电子电气机械
				<option value="19">19-农业机具
				<option value="20">20-鲜活货物
				<option value="21">21-农副产品
				<option value="22">22-饮食品及烟草制品
				<option value="23">23-纺织品
				<option value="24">24-纸及文教用品
				<option value="25">25-医药品
				<option value="99">99-其他货物
			</select> <a onclick="retrieveLine();"
				style="margin-top: 5px; margin-right: 20px;"
				class="pull-right btn btn-info filter-api">Retrieve</a>
		</div>
		<div class="body-nest mapshow" id="Gmap">
			<div id="container" class="gmap"
				style="width: 100%; height: 100%; position: relative;"></div>
		</div>
	</div>
	<div class="nest map2" id="GmapClose">
		<div
			style="padding: 0px; width: 100%; height: 100%; position: relative;"
			class="body-nest" id="Gmap">

			<div class="blog-list-nest">
				<div class="vendor" style="margin: 0;">
					<blockquote style="margin: 0;">
						<p>Detail Infomation of the Chosen Railway Line</p>
						<p id="cityTitle">
							<small></small>
						</p>
					</blockquote>
				</div>
			</div>
			<div class="oneline">
				<div class="entypo-tooltip" style="color: #3498DB">
					<li style="padding: 0px;" class="icon icon-location"
						data-placement="right" title="aboveground-rail"></li>
				</div>
				<span class="label1"><span class="label s1">From:</span><span
					id="fromCityName" class="s2"></span> </span> <span class="label2"><span
					class="label s1">To:</span><span id="toCityName" class="s2"></span>
				</span>
			</div>
			<div class="oneline">
				<div class="entypo-tooltip" style="color: #3498DB">
					<li style="padding: 0px;" class="fontawesome-truck"
						data-placement="right" title="aboveground-rail"></li>
				</div>
				<span class="label1"><span class="label s1">Car
						Numbers:</span><span id="carNums" class="s2"></span> </span>
			</div>
			<div class="oneline">
				<div class="entypo-tooltip" style="color: #3498DB">
					<li style="padding: 0px;" class="maki-aboveground-rail "
						data-placement="right" title="aboveground-rail"></li>
				</div>
				<span class="label1"><span class="label s1">Total
						Freight:</span><span id="totalFreight" class="s2"></span> </span>
			</div>
		</div>
	</div>
	<div class="nest text" id="GmapClose">
		<div
			style="padding: 0px; width: 100%; height: 100%; position: relative;"
			class="body-nest" id="Gmap">

			<div class="blog-list-nest">
				<div class="vendor" style="margin: 0;">
					<blockquote style="margin: 0;">
						<p>Analysis Infomation about the RailwayLine</p>
						<p id="analysisTitle">
							<small></small>
						</p>
					</blockquote>
				</div>
			</div>
			<div class="oneline">
				<ul class="list-inline" style="position: absolute; left: 10px">
					<li><a id="ssjk" style="font-size: 20px; color: #9ea7b3"
						onclick="showChart(1);"> <span class="entypo-network"
							style="padding-right: 15px"></span>&nbsp;&nbsp;Top 5 Hottest
							Interflow Cities
					</a></li>
				</ul>
			</div>
			<div class="oneline">
				<ul class="list-inline" style="position: absolute; left: 10px">
					<li><a id="ssjk-1" style="font-size: 20px; color: #9ea7b3"
						onclick="showChart(2);"> <span class="entypo-network"
							style="padding-right: 15px"></span>&nbsp;&nbsp;Top 5 Hottest
							Freight Products
					</a></li>
				</ul>
			</div>
			<div id="tryc" class="oneline"
				style="margin-top: 10px; margin-left: 220px; display: none">
				<div class="entypo-tooltip" style="color: #3498DB">
					<li style="padding: 0px;"
						class="icon icon-arrow-up data-placement=" right" title="arrow-up"></li>
				</div>
				<span id="tryClick" class="label1" style="margin-left: 15px">Try
					Click</span>
			</div>
		</div>
	</div>
	<div id="gray3"></div>
	<div class="popup" id="popup_ssjk"
		style="width: 1000px; height: 550px; top: 15px;">
		<div class="top_nav" id='top_nav' style="width: 1000px">
			<div align="center">
				<span id="chartTitle"></span>
				<k class="guanbi"></k>
			</div>
		</div>
		<div id="chart1" class="chart"
			style="width: 100%; height: 504px; display: none">
			<div class="body-nest" id="Footable">
				<p class="lead well">按查询后吨数排名的前20条航线信息展示</p>
				<table class="table" data-paging="true"  data-sorting="true">
				</table>
			</div>
		</div>
		<div id="chart2" class="chart"
			style="width: 100%; height: 504px; display: none">
			<div class="chartjs-size-monitor"
				style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
				<div class="chartjs-size-monitor-expand"
					style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
					<div
						style="position: absolute; width: 1000000px; height: 1000000px; left: 0; top: 0"></div>
				</div>
				<div class="chartjs-size-monitor-shrink"
					style="position: absolute; left: 0; top: 0; right: 0; bottom: 0; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;">
					<div
						style="position: absolute; width: 200%; height: 200%; left: 0; top: 0"></div>
				</div>
			</div>
			<canvas id="chart-area" width="482" height="241"
				class="chartjs-render-monitor"
				style="display: block; height: 193px; width: 386px;"></canvas>
		</div>
	</div>
	<script type="text/javascript"
		src='//webapi.amap.com/maps?v=1.4.6&key=您申请的key值'></script>
	<!-- UI组件库 1.0 -->
	<script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
	<script type="text/javascript">
    //创建地图
    var map = new AMap.Map('container', {
        zoom: 4
    });

    var flashWord=null;
    var first = true;
    function retrieveLine(){
    	var ctl = $('#ctl option:selected').val();
    	var type = $('#type option:selected').val();
    	 //just some colors
        var colors = [
            "#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00",
            "#b82e2e", "#316395", "#994499", "#22aa99", "#aaaa11", "#6633cc", "#e67300", "#8b0707",
            "#651067", "#329262", "#5574a6", "#3b3eac"
        ];
       /* $.ajax({
			type:'get',
			url:"railwayData/fuzzyQuery",
			data:{"from":$('#fromCity option:selected').val(),"to":$('#toCity option:selected').val()},
			dataType:'json',
			success:function(data1){*/
				if(first==true){
			    	 document.getElementById('ssjk').style.color="#0DB8DF";
					 document.getElementById('ssjk-1').style.color="#0DB8DF";
					 document.getElementById('tryc').style.display="block";
					 flashWord=window.setInterval('set_word_shanshuo ()', 300);
					 first=false;
					 isAble=true;
			    }
        AMapUI.loadUI(['geo/DistrictExplorer'], function(DistrictExplorer) {
            //创建一个实例
            var districtExplorer = new DistrictExplorer({
                map: map
            });
            var adcode = 100000;
            districtExplorer.loadAreaNode(adcode, function(error, areaNode) {
                //更新地图视野
                map.setBounds(areaNode.getBounds(), null, null, true);
                //清除已有的绘制内容
                districtExplorer.clearFeaturePolygons();
                //绘制子区域
                districtExplorer.renderSubFeatures(areaNode, function(feature, i) {
                    var fillColor = colors[i % colors.length];
                   // var fillColor = data1.colors[feature.properties.name];
                    var strokeColor = colors[colors.length - 1 - i % colors.length];
                    return {
                        cursor: 'default',
                        bubble: true,
                        strokeColor: strokeColor, //线颜色
                        strokeOpacity: 1, //线透明度
                        strokeWeight: 1, //线宽
                        fillColor: fillColor, //填充色
                        fillOpacity: 0.35, //填充透明度
                    };
                });
                //绘制父区域
                districtExplorer.renderParentFeature(areaNode, {
                    cursor: 'default',
                    bubble: true,
                    strokeColor: 'black', //线颜色
                    strokeOpacity: 1, //线透明度
                    strokeWeight: 1, //线宽
                    fillColor: null, //填充色
                    fillOpacity: 0.35, //填充透明度
                });
            });
        });
        
        
			/*},
			error: function(json){  
				alert("用户数据加载异常，请刷新后重试...");  
			}  
		});*/
    }
    function showChart(ctl){
    	if(!isAble){
    		return;
    	}
    	if(ctl==1){
    		document.getElementById("chart1").style.display="block";
    		document.getElementById("chart2").style.display="none";
    		$("#chartTitle").text("Top 20 Hottest Railwayline");
    	}
    	if(ctl==2){
    		document.getElementById("chart1").style.display="none";
    		document.getElementById("chart2").style.display="block";
    		$("#chartTitle").text("Top 20 Hottest Stations");
    		window.myPie.update();
    	}
    }
    function set_word_shanshuo() {
    	var color = ['red','green','yellow','black','purple'];
    	$('#tryClick').css('color',color[parseInt(Math.random()*color.length)]);
    }
    /*$(function() {
        $('.footable-res').footable();
    });*/
    jQuery(function($){
    	$('.table').footable({
    		"paging": {
    			"size": 5
    		},
    		"columns": [
    			{ "name": "id", "title": "ID", "breakpoints": "xs" },
    			{ "name": "firstName", "title": "First Name" },
    			{ "name": "lastName", "title": "Last Name" },
    			{ "name": "jobTitle", "title": "Job Title", "breakpoints": "xs" },
    			{ "name": "started", "title": "Started On", "breakpoints": "xs sm" },
    			{ "name": "dob", "title": "DOB", "breakpoints": "xs sm md" }
    		],
    		"rows": [
    			{
    				"options": {
    					"expanded": true
    				},
    				"value": { "id": 1, "firstName": "Dennise", "lastName": "Fuhrman", "jobTitle": "High School History Teacher", "started": "November 8th 2011", "dob": "July 25th 1960" }
    			},
    			{ "id": 2, "firstName": "Elodia", "lastName": "Weisz", "jobTitle": "Wallpaperer Helper", "started": "October 15th 2010", "dob": "March 30th 1982" },
    			{ "id": 3, "firstName": "Raeann", "lastName": "Haner", "jobTitle": "Internal Medicine Nurse Practitioner", "started": "November 28th 2013", "dob": "February 26th 1966" },
    			{ "id": 4, "firstName": "Junie", "lastName": "Landa", "jobTitle": "Offbearer", "started": "October 31st 2010", "dob": "March 29th 1966" },
    			{ "id": 5, "firstName": "Solomon", "lastName": "Bittinger", "jobTitle": "Roller Skater", "started": "December 29th 2011", "dob": "September 22nd 1964" },
    			{ "id": 6, "firstName": "Bar", "lastName": "Lewis", "jobTitle": "Clown", "started": "November 12th 2012", "dob": "August 4th 1991" },
    			{ "id": 7, "firstName": "Usha", "lastName": "Leak", "jobTitle": "Ships Electronic Warfare Officer", "started": "August 14th 2012", "dob": "November 20th 1979" },
    			{ "id": 8, "firstName": "Lorriane", "lastName": "Cooke", "jobTitle": "Technical Services Librarian", "started": "September 21st 2010", "dob": "April 7th 1969" }
    		]
    	});
    });
    </script>
	<script src="<%=basePath%>js/popup.js"></script>
</body>

</html>