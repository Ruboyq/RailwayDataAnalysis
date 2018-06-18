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
 <link rel="stylesheet" type="text/css" href="//webapi.amap.com/ui/1.0/ui/geo/DistrictExplorer/examples/area.css">
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

<script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>assets/js/switch/bootstrap-switch.js"></script>
<script async="" src="<%=basePath%>js/analytics.js"></script>
<script src="<%=basePath%>js/Chart.bundle.js"></script>
<script src="<%=basePath%>js/utils.js"></script>
<script src="<%=basePath%>assets/js/footable/js/footable.js?v=2-0-1"
	type="text/javascript"></script>
<script
	src="<%=basePath%>assets/js/footable/js/footable.sort.js?v=2-0-1"
	type="text/javascript"></script>
<script
	src="<%=basePath%>assets/js/footable/js/footable.filter.js?v=2-0-1"
	type="text/javascript"></script>
<script
	src="<%=basePath%>assets/js/footable/js/footable.paginate.js?v=2-0-1"
	type="text/javascript"></script>
<script
	src="<%=basePath%>assets/js/footable/js/footable.paginate.js?v=2-0-1"
	type="text/javascript"></script>
<script src="<%=basePath%>js/waitpage.js"></script>
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
	margin-right: 840px;
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
	margin-right: 680px;
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
			 <span class="ty-label"> Type:</span> <select id="type"
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
						<p>Infomation Panel</p>
						<p id="cityTitle">
							<small>Detail information about the chosen type</small>
						</p>
					</blockquote>
				</div>
			</div>
			<div class="oneline">
				<div class="entypo-tooltip" style="color: #3498DB">
					<li style="padding: 0px;" class="icon icon-location"
						data-placement="right" title="aboveground-rail"></li>
				</div>
				<span class="label1"><span class="label s1">Chosen Type:</span><span
					id="chosenType" class="s2"></span> </span>
			</div>
			<div class="oneline">
				<div class="entypo-tooltip" style="color: #3498DB">
					<li style="padding: 0px;" class="fontawesome-truck"
						data-placement="right" title="aboveground-rail"></li>
				</div>
				<span class="label1"><span class="label s1">Total Car
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
						<p>Table Panel</p>
						<p id="analysisTitle">
							<small>Top 20 Hottest Cities</small>
						</p>
					</blockquote>
				</div>
			</div>
			<div class="oneline">
				<ul class="list-inline" style="position: absolute; left: 10px">
					<li><a id="ssjk" style="font-size: 20px; color: #9ea7b3"
						onclick="showChart(1);"> <span class="entypo-network"
							style="padding-right: 15px"></span>&nbsp;&nbsp;Top 20 Hottest From Cities
					</a></li>
				</ul>
			</div>
			<div class="oneline">
				<ul class="list-inline" style="position: absolute; left: 10px">
					<li><a id="ssjk-1" style="font-size: 20px; color: #9ea7b3"
						onclick="showChart(2);"> <span class="entypo-network"
							style="padding-right: 15px"></span>&nbsp;&nbsp;Top 20 Hottest To Cities
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
				<p id="tt1" class="lead well">到达城市为的城市中品类运量最大的前20名城市信息</p>
				<table id = 'table1' class="table-striped footable-res footable metro-blue"
					data-page-size="9">
					<thead>
						<tr>
						    <th>排名</th>
							<th>发送城市</th>
							<th>当前品类</th>
							<th>吨数</th>
							<th>车数</th>
							<th>总收入</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Isidra</td>
							<td><a href="#">Boudreaux</a></td>
							<td>Traffic Court Referee</td>
							<td data-value="78025368997">22 Jun 1972</td>
							<td data-value="1"><span class="status-metro status-active"
								title="Active">Active</span></td>
						</tr>
						<tr>
							<td>Shona</td>
							<td>Woldt</td>
							<td><a href="#">Airline Transport Pilot</a></td>
							<td data-value="370961043292">3 Oct 1981</td>
							<td data-value="2"><span
								class="status-metro status-disabled" title="Disabled">Disabled</span>
							</td>
						</tr>
						<tr>
							<td>Granville</td>
							<td>Leonardo</td>
							<td>Business Services Sales Representative</td>
							<td data-value="-22133780420">19 Apr 1969</td>
							<td data-value="3"><span
								class="status-metro status-suspended" title="Suspended">Suspended</span>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<div class="pagination pagination-centered"></div>
							</td>
						</tr>
					</tfoot>
				</table>

			</div>
		</div>
		<div id="chart2" class="chart"
			style="width: 100%; height: 504px; display: none">
			<div class="body-nest" id="Footable">
				<p id="tt2" class="lead well">从发送的品类运量最大的前20名目的城市信息</p>
				<table id = 'table2' class="table-striped footable-res footable metro-blue"
					data-page-size="9">
					<thead>
						<tr> 
						    <th>排名</th>
							<th>到达城市</th>
							<th>当前品类</th>
							<th>吨数</th>
							<th>车数</th>
							<th>总收入</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Isidra</td>
							<td><a href="#">Boudreaux</a></td>
							<td>Traffic Court Referee</td>
							<td data-value="78025368997">22 Jun 1972</td>
							<td data-value="1"><span class="status-metro status-active"
								title="Active">Active</span></td>
						</tr>
						<tr>
							<td>Shona</td>
							<td>Woldt</td>
							<td><a href="#">Airline Transport Pilot</a></td>
							<td data-value="370961043292">3 Oct 1981</td>
							<td data-value="2"><span
								class="status-metro status-disabled" title="Disabled">Disabled</span>
							</td>
						</tr>
						<tr>
							<td>Granville</td>
							<td>Leonardo</td>
							<td>Business Services Sales Representative</td>
							<td data-value="-22133780420">19 Apr 1969</td>
							<td data-value="3"><span
								class="status-metro status-suspended" title="Suspended">Suspended</span>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="5">
								<div class="pagination pagination-centered"></div>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src='//webapi.amap.com/maps?v=1.4.6&key=您申请的key值'></script>
	<!-- UI组件库 1.0 -->
	<script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
	<script type="text/javascript">
	var flashWord = null;
	var first = true;
	var isRetrieve = false;
	var isAble = false;
	var type;
	var typeText;
		//创建地图
		var map = new AMap.Map('container', {
			zoom : 4
		});
		AMapUI.load(['ui/misc/PointSimplifier', 'lib/$', 'lib/utils'], function(PointSimplifier, $, utils) {

	        if (!PointSimplifier.supportCanvas) {
	            alert('当前环境不支持 Canvas！');
	            return;
	        }
	        var defaultRenderOptions = {
	            drawQuadTree: false,
	            drawPositionPoint: false,
	            drawShadowPoint: false,
	            //点
	            pointStyle: {
	                content: 'circle',
	                width: 10,
	                height: 10,
	                fillStyle: '#1f77b4',
	                lineWidth: 1,
	                strokeStyle: 'rgba(0,0,0,0)'
	            },
	            //TopN区域
	            topNAreaStyle: {
	                autoGlobalAlphaAlpha: true,
	                content: 'rect',
	                fillStyle: '#e25c5d',
	                lineWidth: 1,
	                strokeStyle: 'rgba(0,0,0,0)'
	            },
	            //点的硬核部分
	            pointHardcoreStyle: {
	                content: 'none',
	                width: 5,
	                height: 5,
	                lineWidth: 1,
	                fillStyle: 'rgba(0,0,0,0)',
	                strokeStyle: 'rgba(0,0,0,0)'
	            },
	            //定位点
	            pointPositionStyle: {
	                content: 'circle',
	                width: 2,
	                height: 2,
	                lineWidth: 1,
	                //offset: ['-50%', '-50%'],
	                strokeStyle: 'rgba(0,0,0,0)',
	                fillStyle: '#cc0000'
	            },
	            //鼠标hover时的覆盖点
	            pointHoverStyle: {
	                width: 10,
	                height: 10,
	                content: 'circle',
	                fillStyle: 'rgba(0,0,0,0)',
	                lineWidth: 2,
	                strokeStyle: '#ffa500'
	            },
	            //空间被占用的点
	            shadowPointStyle: {
	                fillStyle: 'rgba(0,0,0,0.2)',
	                content: 'circle',
	                width: 6,
	                height: 6,
	                lineWidth: 1,
	                strokeStyle: 'rgba(0,0,0,0)'
	            }
	        };
	        var pointSimplifierIns = new PointSimplifier({
	            map: map, //所属的地图实例
	            zIndex: 100,
	            maxChildrenOfQuadNode:10,
	            getPosition: function(item) {

	                if (!item) {
	                    return null;
	                }

	                var parts = item.split(',');

	                //返回经纬度
	                return [parseFloat(parts[0]), parseFloat(parts[1])];
	            },
	            getHoverTitle: function(dataItem, idx) {
	                var parts = dataItem.split(',');
	                return parts[2];
	            },
	            renderOptions: {
	                //点的样式
	                pointStyle: {
	                    width: 6,
	                    height: 6
	                },
	                //鼠标hover时的title信息
	                hoverTitleStyle: {
	                    position: 'top',
	                    classNames: 'hoverStyle'
	                }
	            }
	        });

	        window.pointSimplifierIns = pointSimplifierIns;

	            //data = ['103.813963,30.817154,dataanalysis'];
	        var data = '${stringList}';
	        data=data.substring(1,data.length-1).split(", ");
	        pointSimplifierIns.setData(data);
	           /* pointSimplifierIns.renderEngine.setOption('pointStyle',  utils.extend({}, defaultRenderOptions['pointStyle']));
	            pointSimplifierIns.renderLater(200);*/

	        pointSimplifierIns.on('pointMouseover', function(e, record) {
	            //console.log(e.type, record);
	            $('.tipMarker').css('display','none');
	        });
	        pointSimplifierIns.on('pointMouseout', function(e, record) {
	            //console.log(e.type, record);
	            $('.tipMarker').css('display','block');
	        });
	         pointSimplifierIns.on('pointClick', function(e, record) {
	        	 if(!isRetrieve)
	        		 return;
	              var parts = record.data.split(',');
	              var cityName=parts[2];
	              load.loading.add(0.4,"<%=basePath%>images/loading.gif");
	              $.ajax({
	  				type:'get',
	  				url:"<%=basePath%>railwayData/top20Cities",
	  				data:{"type":type,"cityName":cityName},
	  				dataType:'json',
	  				success:function(data1){
	  					load.loading.remove();
	  					if (first == true) {
	  		  				document.getElementById('ssjk').style.color = "#0DB8DF";
	  		  				document.getElementById('ssjk-1').style.color = "#0DB8DF";
	  		  				document.getElementById('tryc').style.display = "block"; 
	  		  				flashWord = window.setInterval('set_word_shanshuo ()', 300);
	  		  				first = false;
	  		  				isAble = true;
	  		  			}
	  					 $('#table1 tbody').html(data1.html1);
	  					$('#table1').trigger('footable_initialized');
	  					 $('#table2 tbody').html(data1.html2);
	  					$('#table2').trigger('footable_initialized');
	  					$('#tt1').text('到达城市为'+cityName+'的城市中'+typeText+'品类运量最大的前20名城市信息');
	  					$('#tt2').text('从'+cityName+'发送的'+typeText+'品类运量最大的前20名目的城市信息');
	  				},
	  				error: function(json){
	  					load.loading.remove();
	  					alert("用户数据加载异常，请刷新后重试...");  
	  				}  
	  				});
	           /*  $("#cityName").text(parts[2]);
	             $("#carNums").text(parts[3]);
	             $("#totalFreight").text(parts[4]);*/
	         }); 
	    });
		function retrieveLine() {
			//var html = '<tr><td>1</td><td>成都</td><td>北京</td><td>7777</td><td><span class="status-metro status-active"title="Active">6666</span></td><td>9999</td></tr>';
			type = $('#type option:selected').val();
			typeText = $('#type option:selected').text();
			//just some colors
			var colors = [ "#3366cc", "#dc3912", "#ff9900", "#109618",
					"#990099", "#0099c6", "#dd4477", "#66aa00", "#b82e2e",
					"#316395", "#994499", "#22aa99", "#aaaa11", "#6633cc",
					"#e67300", "#8b0707", "#651067", "#329262", "#5574a6",
					"#3b3eac" ];
			load.loading.add(0.4,"<%=basePath%>images/loading.gif");
			$.ajax({
				type:'get',
				url:"<%=basePath%>railwayData/cityTonnages",
				data:{"type":type},
				dataType:'json',
				success:function(data1){
					load.loading.remove();
			        document.getElementById('ssjk').style.color = "#9ea7b3";
			        document.getElementById('ssjk-1').style.color = "#9ea7b3";
			        document.getElementById('tryc').style.display = "none"; 
			        flashWord= window.clearInterval(flashWord);
			        first = true;
			        isAble = false;
			        isRetrieve=true;
			    //document.getElementById('cityTitle').innerHTML="<small>"+$('#type option:selected').text()+"</small>";
			    $("#chosenType").text($('#type option:selected').text());
			    $("#carNums").text(data1.carnums);
	            $("#totalFreight").text(data1.totalFreight);
				AMapUI.load(['ui/geo/DistrictExplorer', 'lib/$'], function(DistrictExplorer, $) {

			        //创建一个实例
			        var districtExplorer = window.districtExplorer = new DistrictExplorer({
			            eventSupport: true, //打开事件支持
			            map: map,
			            zIndex:50
			        });

			        //当前聚焦的区域
			        var currentAreaNode = null;

			        //鼠标hover提示内容
			        var $tipMarkerContent = $('<div class="tipMarker top"></div>');

			        var tipMarker = new AMap.Marker({
			            content: $tipMarkerContent.get(0),
			            offset: new AMap.Pixel(0, 0),
			            bubble: true
			        });

			        //根据Hover状态设置相关样式
			        function toggleHoverFeature(feature, isHover, position) {

			            tipMarker.setMap(isHover ? map : null);

			            if (!feature) {
			                return;
			            }

			            var props = feature.properties;

			            if (isHover) {

			                //更新提示内容
			                $tipMarkerContent.html(props.name);
			                //更新位置
			                tipMarker.setPosition(position || props.center);
			            }
			            //更新相关多边形的样式
			            var polys = districtExplorer.findFeaturePolygonsByAdcode(props.adcode);
			            for (var i = 0, len = polys.length; i < len; i++) {

			                polys[i].setOptions({
			                    fillOpacity: isHover ? 0.5 : 0.2
			                });
			            }
			        }

			        //监听feature的hover事件
			        districtExplorer.on('featureMouseout featureMouseover', function(e, feature) {
			            toggleHoverFeature(feature, e.type === 'featureMouseover',
			                e.originalEvent ? e.originalEvent.lnglat : null);
			        });

			        //监听鼠标在feature上滑动
			        districtExplorer.on('featureMousemove', function(e, feature) {
			            //更新提示位置
			            tipMarker.setPosition(e.originalEvent.lnglat);
			        });


			        //绘制某个区域的边界
			        function renderAreaPolygons(areaNode) {

			            //更新地图视野
			            map.setBounds(areaNode.getBounds(), null, null, true);

			            //清除已有的绘制内容
			            districtExplorer.clearFeaturePolygons();

			            //绘制子区域
			            districtExplorer.renderSubFeatures(areaNode, function(feature, i) {
			            	
			            	var fillColor = data1.colors[feature.properties.name];
			                //var fillColor = colors[i % colors.length];
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
			        }

			        //切换区域后刷新显示内容
			        function refreshAreaNode(areaNode) {
			            districtExplorer.setHoverFeature(null);
			            renderAreaPolygons(areaNode);
			        }

			        //切换区域
			        function switch2AreaNode(adcode, callback) {

			            if (currentAreaNode && ('' + currentAreaNode.getAdcode() === '' + adcode)) {
			                return;
			            }

			            loadAreaNode(adcode, function(error, areaNode) {

			                if (error) {

			                    if (callback) {
			                        callback(error);
			                    }

			                    return;
			                }

			                currentAreaNode = window.currentAreaNode = areaNode;

			                //设置当前使用的定位用节点
			                districtExplorer.setAreaNodesForLocating([currentAreaNode]);

			                refreshAreaNode(areaNode);

			                if (callback) {
			                    callback(null, areaNode);
			                }
			            });
			        }

			        //加载区域
			        function loadAreaNode(adcode, callback) {

			            districtExplorer.loadAreaNode(adcode, function(error, areaNode) {

			                if (error) {

			                    if (callback) {
			                        callback(error);
			                    }

			                    console.error(error);

			                    return;
			                }
			                if (callback) {
			                    callback(null, areaNode);
			                }
			            });
			        }

			        //全国
			        switch2AreaNode(100000);
			    });
			},
			error: function(json){
				load.loading.remove();
				alert("用户数据加载异常，请刷新后重试...");  
			}  
			});
		}
		function showChart(ctl) {
			if (!isAble) {
				return;
			}
			if (ctl == 1) {
				document.getElementById("chart1").style.display = "block";
				document.getElementById("chart2").style.display = "none";
				$("#chartTitle").text("Top 20 Hottest From Cities");
			}
			if (ctl == 2) {
				document.getElementById("chart1").style.display = "none";
				document.getElementById("chart2").style.display = "block";
				$("#chartTitle").text("Top 20 Hottest To Cities");
			}
		}
		function set_word_shanshuo() {
			var color = [ 'red', 'green', 'yellow', 'black', 'purple' ];
			$('#tryClick').css('color',
					color[parseInt(Math.random() * color.length)]);
		}
		$(function() {
			$('#table1').footable();
			$('#table2').footable();
		});
	</script>
	<script src="<%=basePath%>js/popup.js"></script>
</body>

</html>