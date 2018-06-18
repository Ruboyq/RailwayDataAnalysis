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
    <title>海量点展示</title>
     <!-- MAIN EFFECT -->
    <link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/styleForMap.css">

    <link rel="stylesheet" href="<%=basePath%>assets/css/icons-style.css" >
    <link rel="stylesheet" href="<%=basePath%>assets/css/media.css" >
    <link rel="stylesheet" href="<%=basePath%>assets/js/switch/bootstrap-switch.css">
    
    <link rel="stylesheet" href="<%=basePath%>assets/js/wizard/css/jquery.steps.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>assets/js/wizard/jquery.stepy.css">
    <link href="<%=basePath%>assets/js/tabs/acc-wizard.min.css" rel="stylesheet">
    
     <script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>assets/js/switch/bootstrap-switch.js"></script>
     
      <script src="<%=basePath%>assets/js/wizard/build/jquery.steps.js"></script>
    <script type="text/javascript" src="<%=basePath%>assets/js/wizard/jquery.stepy.js"></script>
    
     <script async="" src="<%=basePath%>js/analytics.js"></script>
     <script src="<%=basePath%>js/Chart.bundle.js"></script>
     <script src="<%=basePath%>js/utils.js"></script>
     <script src="<%=basePath%>js/waitpage.js"></script>
     <style type="text/css">/* Chart.js */
@-webkit-keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}@keyframes chartjs-render-animation{from{opacity:0.99}to{opacity:1}}.chartjs-render-monitor{-webkit-animation:chartjs-render-animation 0.001s;animation:chartjs-render-animation 0.001s;}</style>

     <style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
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
    .map1 {
        width: 100%;
        margin: 0px;
        height: 100%;
    }
     .map2 {
        width: 100%;
        margin: 0px;
        height: 50%;
    }
    .mapshow{
	padding-top: 0px;
	padding-bottom: 10px;
	padding-left: 10px;
	padding-right: 10px;
	position: absolute;
	top: 0px;
	bottom: 0px;
	width: 100%;
	left: 0;
	background: none;
    }
    .chart {
        width: 70%;
        height: 100%;
        margin: 0px;
        margin-left:35px;
        border: 1px solid #f5f5f5;
        border-style:solid none solid solid;
        box-shadow: 0px 1px 3px #777;
    }
    </style>
</head>

<body>
                        <div class="nest map1" id="GmapClose">
                            <div class="body-nest mapshow" id="tab">
                                <div id="wizard-tab" style="height:100%">
                                    <h2>First Step</h2>
                                    <section>
                                    <div class="chart" style="width: 100%; height:504px;">
                                    <canvas id="chart1" width="500" height="200px" class="chartjs-render-monitor" style="display: block; height: 362px; width: 724px;"></canvas>
                                    </div>
                                    </section>

                                    <h2>Second Step</h2>
                                    <section>
                                    <div class="chart" style="width: 100%; height:504px;">
                                    <canvas id="chart2" width="500" height="200px" class="chartjs-render-monitor" style="display: block; height: 362px; width: 724px;"></canvas>
                                    </div>
                                    </section>
                                </div>

                            </div>
                        </div>
</body>
<script>
/*<div id="container" class="gmap" style="width:100%;height:100%;position:relative;">
<canvas id="chart1" width="905" height="452" class="chartjs-render-monitor" style="display: block; height: 362px; width: 724px;"></canvas>
</div>*/
var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
var color = Chart.helpers.color;
var barChartData = {
		labels: MONTHS,
		datasets: [{
			label: 'Nums of Enterprise',
			backgroundColor: [
				window.chartColors.red,
				window.chartColors.orange,
				window.chartColors.yellow,
				window.chartColors.green,
				window.chartColors.blue,
				window.chartColors.purple,
				window.chartColors.red,
				window.chartColors.orange,
				window.chartColors.yellow,
				window.chartColors.green
			],
			borderColor: window.chartColors.red,
			borderWidth: 1,
			data:[]
		}]

	};
	
var config = {
		type: 'line',
		data: {
			labels: [],
			datasets: [{
				label: 'Sum of Car Nums',
				backgroundColor: Samples.utils.transparentize(window.chartColors.red),
				borderColor: window.chartColors.red,
				data: [],
				fill: 'start',
			}]
		},
		options: {
			responsive: true,
			title: {
				display: true,
				text: 'The Stacking Map '
			},
			tooltips: {
				mode: 'index',
				intersect: false,
			},
			hover: {
				mode: 'nearest',
				intersect: true
			},
			scales: {
				xAxes: [{
					display: true,
					scaleLabel: {
						display: true,
						labelString: 'Carnums'
					}
				}],
				yAxes: [{
					display: true,
					scaleLabel: {
						display: true,
						labelString: 'Sum of Car Nums'
					}
				}]
			}
		}
	};
$(function(){
	load.loading.add(0.4,"<%=basePath%>images/loading.gif");
	 $.ajax({
			type:'get',
			url:"<%=basePath%>railwayData/enterpriseAnalysisResult",
			dataType:'json',
			success:function(data1){
				load.loading.remove();
				barChartData.datasets.splice(0, 1);
				barChartData.labels=data1.one.x_axis;
    			var newDataset1 = {
    				label: 'Sum of Car Nums',
    				backgroundColor:  [
    					window.chartColors.red,
    					window.chartColors.orange,
    					window.chartColors.yellow,
    					window.chartColors.green,
    					window.chartColors.blue,
    					window.chartColors.purple,
    					window.chartColors.red,
    					window.chartColors.orange,
    					window.chartColors.yellow,
    					window.chartColors.green
    				],
    				borderColor: window.chartColors.red,
    				borderWidth: 1,
    				data: data1.one.y_axis
    			};
    			barChartData.datasets.push(newDataset1);
    			window.myBar.update();
    			
    			config.data.datasets.splice(0, 1);
    			var newDataset = {
    					label: 'Sum of Car Nums',
    					backgroundColor: Samples.utils.transparentize(window.chartColors.red),
    					borderColor: window.chartColors.red,
    					data: data1.total.y_axis,
    					fill: 'start',
    				};
    			config.data.labels=data1.total.x_axis;
    			config.data.datasets.push(newDataset);
    			window.myLine.update();
			},
				error: function(json){  
					load.loading.remove();
					alert("用户数据加载异常，请刷新后重试...");  
				}  
				});
});  

$("#wizard-tab").steps({
    headerTag: "h2",
    bodyTag: "section",
    transitionEffect: "none",
    enableFinishButton: false,
    enablePagination: false,
    enableAllSteps: true,
    titleTemplate: "#title#",
    cssClass: "tabcontrol"
});

window.onload = function() {
	var ctx1 = document.getElementById('chart1').getContext('2d');
	window.myBar = new Chart(ctx1, {
		type: 'bar',
		data: barChartData,
		options: {
			responsive: true,
			legend: {
				position: 'top',
			},
			title: {
				display: true,
				text: 'Car Nums Histogram'
			}
		}
	});
	var ctx2 = document.getElementById('chart2').getContext('2d');
	window.myLine = new Chart(ctx2, config);
};

</script>
</html>