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
<title>局运量</title>
<!-- MAIN EFFECT -->
 <link rel="stylesheet" type="text/css" href="//webapi.amap.com/ui/1.0/ui/geo/DistrictExplorer/examples/area.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/styleForMap.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>css/popup_blacklist.css" />
<link rel="stylesheet" href="<%=basePath%>assets/css/icons-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/media.css">
<link rel="stylesheet" href="<%=basePath%>assets/js/datepicker/datepicker.css">
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
<script type="text/javascript" src="<%=basePath%>assets/js/datepicker/bootstrap-datetimepicker.js"></script>
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


.chart {
	width: 70%;
	height: 100%;
	margin: 0px;
	border: 1px solid #f5f5f5;
	border-style: solid none solid solid;
	box-shadow: 0px 1px 3px #777;
}

.map1 {
	width: 100%;
	margin: 0px;
	height: 100%;
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
.sctl{
	position: absolute;
	width: 75px;
	margin-top: 5px;
	margin-left: 10px;
    left:0px;
    }
.ty-label{
    position: absolute;
    margin-left: 100px;
    margin-top: 10px;
    font-size: 15px;
    font-weight: bold;
    font-family: 'Open Sans', serif;
    left: 0px;
    }
.sl {
    position: absolute;
    width: 150px;
    margin-top: 5px;
    margin-left:150px;
    left: 0px;
}
.st-label{
    position: absolute;
    margin-left: 310px;
    margin-top: 10px;
    font-size: 15px;
    font-weight: bold;
    font-family: 'Open Sans', serif;
    left: 0px;
    }
.st{
    position: absolute;
    width: 100px;
    margin-top: 5px;
    margin-left: 360px;
    left: 0px;
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
                                        <option value="from">发送
                                        <option value="to">到达
         </select>
			 <span class="ty-label"> 类别:</span> <select id="type"
				class="filter-status form-control sl">
				<option value="">全品类
				<option value="8">08-矿物性建筑材料
				<option value="9">09-水泥
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
			</select> 
			<span class="st-label">
                                   年份:</span>
                                        <div data-date-viewmode="years" id="dpYears1" class="input-group date st">

                                            <input onfocus=this.blur() type="text" value="2018" class="form-control" id="time1">
                                            <span class="input-group-addon add-on entypo-calendar "></span>
                                        </div>
			<a onclick="retrieveCompany();"
				style="margin-top: 5px; margin-right: 40px;"
				class="pull-right btn btn-info filter-api">查询</a>
				<a id="ssjk" onclick="showChart();"
				style="margin-top: 5px; margin-right: 20px;"
				class="pull-right btn btn-info filter-api" disabled="true" >图表</a>				
		</div>
		<div style="margin-top: 10px" class="body-nest mapshow" id="Gmap">
			<div id="container" class="gmap"
				style="width: 100%; height: 100%; position: relative;">
				<div class="body-nest" id="Footable">
					<p id="tt1" class="lead well">各局别运量统计</p>
					<table id = 'table1' class="table-striped footable-res footable metro-blue"
					data-page-size="9">
					<thead>
						<tr>
							<th>局</th>
							<th>当前品类</th>
							<th>吨数</th>
							<th>车数</th>
							<th>总收入</th>
						</tr>
					</thead>
					<tbody>
						
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
	
	<div id="gray3"></div>
	<div class="popup" id="popup_ssjk" style = "width:1000px;height:550px;top:15px;">
		<div class="top_nav" id='top_nav'style = "width:1000px">
			<div align="center">
				<span id="chartTitle"></span>
				<k class="guanbi"></k>
			</div>
		</div>
		<div id="chart1" class="chart" style="width: 100%; height:504px;display:none"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
		<canvas id="canvas" width="905" height="452" class="chartjs-render-monitor" style="display: block; height: 362px; width: 724px;"></canvas>
	</div>
</div>	
	</div>
	<script type="text/javascript">
var randomScalingFactor = function() {
	return Math.round(Math.random() * 100);
};


var chartData = {
		labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
		datasets: [{
			type: 'bar',
			label: '吨数',
			backgroundColor: window.chartColors.blue,
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			],
			borderColor: window.chartColors.grey,
			borderWidth: 2
		}, {
			type: 'bar',
			label: '车数',
			backgroundColor: window.chartColors.grey,
			data: [
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor(),
				randomScalingFactor()
			],
			borderColor: window.chartColors.blue,
			borderWidth: 2
		}]
	};
	
window.onload = function() {
	var ctx1 = document.getElementById('canvas').getContext('2d');
	window.myLine = new Chart(ctx1, {
		type: 'bar',
		data: chartData,
		options: {
			responsive: true,
			title: {
				display: true,
				text: '各局别运量信息直方图'
			},
			tooltips: {
				mode: 'index',
				intersect: true
			}
		}
	});
};
		$('#dpYears1').datetimepicker({
			startView: 'decade',
			minView: 'decade',
			format: 'yyyy',
			maxViewMode: 2,
			minViewMode:2,
			autoclose: true,
			language: "zh-CN"
		});
	var type;
	var time;
	var typeText;
	var ctlText;
	var isAble = true;
	function retrieveCompany(){
		type = $('#type option:selected').val();
		typeText = $('#type option:selected').text();
		var ctl = $('#ctl option:selected').val();
		ctlText = $('#ctl option:selected').text();
		time = $('#time1').val();		
		load.loading.add(0.4,"<%=basePath%>images/loading.gif");
		$.ajax({
			type:'get',
			url:"<%=basePath%>railwayData/originCompanyAnalysis",
			data:{"type":type,"ctl":ctl,"time":time},
			dataType:'json',
			success:function(data1){
				load.loading.remove();
				if(data1.status == "n"){
					alert("查询时间段内暂无数据!");
					return;
				}
				$('#ssjk').attr("disabled",false); 
				$('#table1 tbody').html(data1.html);
				$('#table1').trigger('footable_initialized');
				chartData.datasets[0].data.splice(0, 1);
				chartData.datasets[1].data.splice(0, 1);
				chartData.datasets[0].data=data1.chart.y_ton;
				chartData.datasets[1].data=data1.chart.y_carnum;
				chartData.labels=data1.chart.x_company;
				window.myLine.update();
			},
			error: function(json){
				load.loading.remove();
				alert("用户数据加载异常，请刷新后重试...");  
			}  
		});	  		  		  					
	}
	function showChart() {
		document.getElementById("chart1").style.display = "block";
		$("#chartTitle").text("各局运量信息直方图-"+typeText+"-"+time+"年"+"-"+ctlText);
	}
	$(function() {
		$('#table1').footable();
	});
	</script>
	<script src="<%=basePath%>js/popup.js"></script>
</body>

</html>