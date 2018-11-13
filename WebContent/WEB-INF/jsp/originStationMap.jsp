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
     <script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>assets/js/switch/bootstrap-switch.js"></script>
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
        font-size: 17px;
    }
    .s2{
        padding-left: 15px;
    }
     .sw{
	right: 10px;
	position: absolute;
	top: 15px;
    }
    .sw-label{
	right: 0px;
	position: absolute;
	margin-right: 120px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
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
                                <h6>
                                    所有城市站点查看</h6>
                                <span class="sw-label">
                                    省份边界线:</span>
                                <div class="make-switch sw" data-on="primary" data-off="info">
                                    <input type="checkbox" checked="">
                                </div>
                            </div>
                            <div class="body-nest mapshow" id="Gmap">
                                <div id="container" class="gmap" style="width:100%;height:100%;position:relative;"></div>
                            </div>
                        </div>
                        <div class="nest map2" id="GmapClose">
                            <div class="title-alt">
                                <h6>
                                当前选择的城市</h6>
                            </div>
                            <div class="body-nest mapshow" id="Gmap">
                                <div id="container2" class="gmap" style="width:100%;height:100%;position:relative;"></div>
                            </div>
                            </div>
                        <div class="nest text" id="GmapClose">
                            <div style="padding:0px;width:100%;height:100%;position:relative;" class="body-nest" id="Gmap">
                                
                    <div class="blog-list-nest">
                        <div class="vendor">
                            <blockquote>
                                <p>城市2017年运量统计</p>
                                <p id ="cityTitle">
                                    <small></small>
                                </p>
                            </blockquote>
                        </div>
                        </div>
                        <div class="oneline">
                                <div class="entypo-tooltip" style="color:#3498DB">
                                <li style="padding:0px;"class="icon icon-location" data-placement="right" title="aboveground-rail"></li>
                                </div>
                                <span class="label1"><span class="label s1">城市名:</span><span id="cityName" class="s2"></span> </span>
                                </div>
                        <div class="oneline">
                                <div class="entypo-tooltip" style="color:#3498DB">
                                <li style="padding:0px;"class="fontawesome-truck" data-placement="right" title="aboveground-rail"></li>
                                </div>
                                <span class="label1"><span class="label s1">发车数:</span><span id="carNums" class="s2"></span> </span>
                                </div>
                        <div class="oneline">
                                <div class="entypo-tooltip" style="color:#3498DB">
                                <li style="padding:0px;"class="maki-aboveground-rail " data-placement="right" title="aboveground-rail"></li>
                                </div>
                                <span class="label1"><span class="label s1">总吨数:</span><span id="totalFreight" class="s2"></span> </span>
                                </div>     
                                </div>
                            </div>
                    <!-- </div>

                </div>
            </div> -->
    <script type="text/javascript" src='//webapi.amap.com/maps?v=1.4.6&key=您申请的key值'></script>
    <!-- UI组件库 1.0 -->
    <script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
    <script type="text/javascript">
    var provinceLine =true;
    var map2 = new AMap.Map("container2", {
        resizeEnable: true,
        center: [116.397428, 39.90923],
        zoom: 8,
    });
    </script>
    <script type="text/javascript">
    var markers=[];
    //创建地图
    var map = new AMap.Map('container', {
        zoom: 6
    });
    var colors = [
        '#0cc2f2',
        '#4fd2b1',
        '#90e36f',
        '#ffe700',
        '#ff9e00',
        '#ff6700',
        '#ff1800'
    ];
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
            //使用GroupStyleRender
            renderConstructor: PointSimplifier.Render.Canvas.GroupStyleRender,
            renderOptions: {
                //点的样式
                pointStyle: {
                    fillStyle: 'red',
                    width: 5,
                    height: 5
                },
                getGroupId: function(item, idx) {

                    var parts = item.split(',');

                    //按纬度区间分组
                    return Math.abs(Math.round(parseFloat(parts[1]) / 5));
                },
                groupStyleOptions: function(gid) {

                    var size = 4;

                    return {
                        pointStyle: {
                            //content: gid % 2 ? 'circle' : 'rect',
                            fillStyle: 'red',
                            width: size,
                            height: size
                        },
                        pointHardcoreStyle: {
                            width: size - 2,
                            height: size - 2
                        }
                    };
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

        pointSimplifierIns.on('pointClick pointMouseover pointMouseout', function(e, record) {
            //console.log(e.type, record);
           
        });
         pointSimplifierIns.on('pointClick', function(e, record) {
              var parts = record.data.split(',');
              map2.remove(markers);
              markers=[];
            var marker = new AMap.Marker({
                map:map2,
                bubble:true,
                position:[parseFloat(parts[0]),parseFloat(parts[1])],
             });
             markers.push(marker);
             map2.setCenter(marker.getPosition());
             marker.setAnimation('AMAP_ANIMATION_BOUNCE');
             document.getElementById('cityTitle').innerHTML="<small>"+parts[2]+"</small>";
             $("#cityName").text(parts[2]);
             $("#carNums").text(parts[3]+"车");
             $("#totalFreight").text(parts[4]+"吨");
         }); 
    });

     AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function(PathSimplifier, $) {

        if (!PathSimplifier.supportCanvas) {
            alert('当前环境不支持 Canvas！');
            return;
        }

        //just some colors
        var colors = [
            "#3366cc", "#dc3912", "#ff9900", "#109618", "#990099", "#0099c6", "#dd4477", "#66aa00",
            "#b82e2e", "#316395", "#994499", "#22aa99", "#aaaa11", "#6633cc", "#e67300", "#8b0707",
            "#651067", "#329262", "#5574a6", "#3b3eac"
        ];

        var pathSimplifierIns = new PathSimplifier({
            //autoSetFitView:false,
            map: map, //所属的地图实例
            zIndex: 100,
            getPath: function(pathData, pathIndex) {

                return pathData.path;
            },
            getHoverTitle: function(pathData, pathIndex, pointIndex) {

                if (pointIndex >= 0) {
                    //point 
                    return pathData.name;
                }

                return pathData.name;
            },
            renderOptions: {
                renderAllPointsIfNumberBelow: 200,
                pathTolerance: 1,
                keyPointTolerance: 10,
                keyPointStyle: {
                    fillStyle: '#ccc',
                    radius: 1,
                    lineWidth: 1
                },
                startPointStyle: null,
                endPointStyle: null,
                pathLineHoverStyle: {
                    strokeStyle: '#000000'
                },
                pathLineSelectedStyle: {
                    dirArrowStyle: null,
                    strokeStyle: '#000000',
                    borderStyle: 'orange',
                    borderWidth: 2
                },
                getPathStyle: function(pathItem, zoom) {

                    var color = colors[pathItem.pathIndex % colors.length],
                        lineWidth = Math.round(4 * Math.pow(1.1, zoom - 3));

                    return {

                        pathLineStyle: {
                            strokeStyle: color,
                            lineWidth: lineWidth
                        },
                        pathLineSelectedStyle: {
                            lineWidth: lineWidth + 2
                        },
                        pathNavigatorStyle: {
                            fillStyle: color
                        }
                    }
                }
            }
        });


        window.pathSimplifierIns = pathSimplifierIns;

        $.getJSON('http://a.amap.com/amap-ui/static/data/prov-borders.json', function(d) {

            pathSimplifierIns.setData(d);

        });

        pathSimplifierIns.on('selectedPathIndexChanged', function(e, info) {});

        pathSimplifierIns.on('pointClick pointMouseover pointMouseout', function(e, record) {
            //console.log(e.type, record);
        });

        pathSimplifierIns.on('pathClick pathMouseover pathMouseout', function(e, record) {
            //console.log(e.type, record);
        });
    });
    
    </script>
    <script>
    function changeProvinceLine(){
        if(provinceLine){
            pathSimplifierIns.hide()
            provinceLine=false;
        }else{
            pathSimplifierIns.show()
            provinceLine=true;
        }
    }
    $('.make-switch').bootstrapSwitch('setSizeClass', 'switch-small');
    </script>
</body>

</html>