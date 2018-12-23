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
    <title>企业数分析</title>
     <!-- MAIN EFFECT -->
     <link rel="stylesheet" type="text/css" href="//webapi.amap.com/ui/1.0/ui/geo/DistrictExplorer/examples/area.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/styleForMap.css">

    <link rel="stylesheet" href="<%=basePath%>assets/css/icons-style.css" >
    <link rel="stylesheet" href="<%=basePath%>assets/css/media.css" >
    <link rel="stylesheet" href="<%=basePath%>assets/js/datepicker/datepicker.css">
    <link rel="stylesheet" href="<%=basePath%>assets/js/switch/bootstrap-switch.css">
    
    <link rel="stylesheet" href="<%=basePath%>assets/js/wizard/css/jquery.steps.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>assets/js/wizard/jquery.stepy.css">
    <link href="<%=basePath%>assets/js/tabs/acc-wizard.min.css" rel="stylesheet">
    
     <script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>assets/js/datepicker/bootstrap-datetimepicker.js"></script>
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
        .ty-label{
    position: absolute;
    margin-right: 470px;
    margin-top: 10px;
    font-size: 15px;
    font-weight: bold;
    font-family: 'Open Sans', serif;
    right: 0;
    }
    .sl {
    position: absolute;
    width: 150px;
    margin-top: 5px;
    margin-right:310px;
     right: 0;
}
.st-label{
    position: absolute;
    margin-right: 260px;
    margin-top: 10px;
    font-size: 15px;
    font-weight: bold;
    font-family: 'Open Sans', serif;
    right: 0;
    }
     .st{
    position: absolute;
    width: 150px;
    margin-top: 5px;
    margin-right: 100px;
    right: 0;
    }
    </style>
</head>

<body>
                        <div class="nest map1" id="GmapClose">
                            <div style= "background: none repeat scroll 0 0;" class="title-alt">
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
            <a onclick="retrieveLine();"
                style="margin-top: 5px; margin-right: 20px;"
                class="pull-right btn btn-info filter-api">查询</a>                                

                            </div>
                           
                            <div style="margin-top: 50px" class="body-nest mapshow" id="tab">
                                <div id="wizard-tab" style="height:100%">
                                    <h2>企业发车数相关图表</h2>
                                    <section>
                                    <div class="chart" style="width: 100%; height:504px;">
                                    <canvas id="chart1" width="500" height="200px" class="chartjs-render-monitor" style="display: block; height: 362px; width: 724px;"></canvas>
                                    </div>
                                    </section>

                                    <h2>企业发货吨数相关图表</h2>
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
$('#dpYears1').datetimepicker({
            startView: 'decade',
            minView: 'decade',
            format: 'yyyy',
            maxViewMode: 2,
            minViewMode:2,
            autoclose: true,
            language: "zh-CN"
        });
var MONTHS = ['', '', '', '', '', '', '', '', '', '', '', ''];
var color = Chart.helpers.color;
var barChartData1 = {
		labels: MONTHS,
		datasets: [{
            type: 'line',
            label: '该区间企业发车数之和',
            borderColor: window.chartColors.grey,
            backgroundColor: window.chartColors.grey,
            borderWidth: 2,
            fill: false,
			data:[],
            yAxisID: 'y-axis-1'
		},{
            type:'bar',
            label: '该区间企业数量',
            backgroundColor: window.chartColors.blue,
            data: [],
            borderColor: window.chartColors.grey,
            borderWidth: 2,
            yAxisID: 'y-axis-2'
        }]

	};

var barChartData2 = {
        labels: MONTHS,
        datasets: [{
            type: 'line',
            label: '该区间企业吨数数之和',
            borderColor: window.chartColors.grey,
            backgroundColor: window.chartColors.grey,
            borderWidth: 2,
            fill: false,
            data:[],
            yAxisID: 'y-axis-3'
        },{
            type:'bar',
            label: '该区间企业数量',
            backgroundColor: window.chartColors.blue,
            data: [],
            borderColor: window.chartColors.grey,
            borderWidth: 2,
            yAxisID: 'y-axis-4'
        }]

    };
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
	window.myBar1 = new Chart(ctx1, {
        type: 'bar',
		data: barChartData1,
		options: {
			responsive: true,
            hoverMode: 'index',
            stacked: false,
            title: {
                display: true,
                text: '不同运量规模客户企业分布图(发车数)'
            },
            scales: {
                yAxes: [{
                            type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: 'left',
                            id: 'y-axis-1',
                        }, {
                            type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: 'right',
                            id: 'y-axis-2',

                            // grid line settings
                            gridLines: {
                                drawOnChartArea: false, // only want the grid lines for one axis to show up
                            },
                        }],
                    }
                }
            });
	var ctx2 = document.getElementById('chart2').getContext('2d');
	window.myBar2 = new Chart(ctx2, {
        type: 'bar',
        data: barChartData2,
        options: {
            responsive: true,
            hoverMode: 'index',
            stacked: false,
            title: {
                display: true,
                text: '不同运量规模客户企业分布图(吨数数)'
            },
            scales: {
                yAxes: [{
                            type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: 'left',
                            id: 'y-axis-3',
                        }, {
                            type: 'linear', // only linear but allow scale type registration. This allows extensions to exist solely for log scale for instance
                            display: true,
                            position: 'right',
                            id: 'y-axis-4',

                            // grid line settings
                            gridLines: {
                                drawOnChartArea: false, // only want the grid lines for one axis to show up
                            },
                        }],
                    }
                }
            });
};

function retrieveLine() {
    var type = $('#type option:selected').val();
    var time = $('#time1').val();
    load.loading.add(0.4,"<%=basePath%>images/loading.gif");
    $.ajax({
        type:'get',
        url:"<%=basePath%>railwayData/enterpriseAnalysisResult",
        data:{"type":type,"time":time},
        dataType:'json',
        success:function(data1){
            if(data1.status == "n"){
                load.loading.remove();
                alert("查询年份暂无数据！");
                return;
            }
            load.loading.remove();
            barChartData1.datasets[0].data.splice(0, 1);
            barChartData1.datasets[1].data.splice(0, 1);            
            barChartData1.labels=data1.carnum.x_axis;
            barChartData1.datasets[0].data=data1.carnum.y_axis2;
            barChartData1.datasets[1].data=data1.carnum.y_axis1;           
            window.myBar1.update();

            barChartData2.datasets[0].data.splice(0, 1);
            barChartData2.datasets[1].data.splice(0, 1);            
            barChartData2.labels=data1.carton.x_axis;
            barChartData2.datasets[0].data=data1.carton.y_axis2;
            barChartData2.datasets[1].data=data1.carton.y_axis1; 
            window.myBar2.update();
        },
        error: function(json){  
            load.loading.remove();
            alert("用户数据加载异常，请刷新后重试...");  
        }  
    });
}    
</script>
</html>