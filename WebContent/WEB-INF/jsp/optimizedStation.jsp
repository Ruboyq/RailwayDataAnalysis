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
    <title>优化数据</title>
     <!-- MAIN EFFECT -->
    <link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>assets/css/styleForMap.css">

    <link rel="stylesheet" href="<%=basePath%>assets/css/icons-style.css" >
    <link rel="stylesheet" href="<%=basePath%>assets/css/media.css" >
    <link rel="stylesheet" href="<%=basePath%>assets/js/switch/bootstrap-switch.css">
     <script type="text/javascript" src="<%=basePath%>assets/js/jquery.js"></script>
     <script type="text/javascript" src="<%=basePath%>assets/js/switch/bootstrap-switch.js"></script>
     <script src="<%=basePath%>js/waitpage.js"></script>
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
 .sl1 {
	position: absolute;
	width: 150px;
	margin-top: 5px;
	margin-right: 650px;
	right: 0px;
	}
	.ty-label1 {
	position: absolute;
	margin-right: 820px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
	right: 0px;
	}
	.sl2 {
	position: absolute;
	width: 80px;
	margin-top: 5px;
	margin-right: 480px;
	right: 0px;
	}
	.ty-label2 {
	position: absolute;
	margin-right: 570px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
	right: 0px;
	}
	.sl3 {
	position: absolute;
	width: 80px;
	margin-top: 5px;
	margin-right: 320px;
	right: 0px;
	}
	.ty-label3 {
	position: absolute;
	margin-right: 410px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
	right: 0px;
	}
	.sl4 {
	position: absolute;
	width: 80px;
	margin-top: 5px;
	margin-right: 140px;
	right: 0px;
	}
	.ty-label4 {
	position: absolute;
	margin-right: 220px;
	margin-top: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: 'Open Sans', serif;
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
                        <div class="nest map1" id="GmapClose">
                            <div class="title-alt">
                            <span class="ty-label1"> 类别:</span> <select id="type" class="filter-status form-control sl1">
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
                               <span class="ty-label2"> 最小吨数:</span> 
                               <input id="tons"	class="filter-status form-control sl2"></input>
                               <span class="ty-label3"> 城市间距:</span> 
                               <input id="distance"	class="filter-status form-control sl3"></input>
                               <span class="ty-label4"> 城市群数量:</span> 
                               <input id="clusterNum"	class="filter-status form-control sl4"></input>
                               <a onclick="retrieve();"style="margin-top: 5px; margin-right: 20px;"class="pull-right btn btn-info filter-api">查询</a>
                            </div>
                            <div class="body-nest mapshow" id="Gmap">
                                <div id="container" class="gmap" style="width:100%;height:100%;position:relative;"></div>
                            </div>
                        </div>
                        <div class="nest map2" id="GmapClose">
                            <div class="title-alt">
                                <h6>
                                                               当前选择的站点</h6>
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
                                <p>站点详情</p>
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
                                <span class="label1"><span class="label s1">站点名:</span><span id="cityName" class="s2"></span> </span>
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
        zoom: 4
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
                    return parts[5];
                },
                groupStyleOptions: function(gid) {

                    var size = 10;
                    var color;
                    var n = 0.04*parseInt(gid)+0.5;
                    color = '#'+('00000'+(n*0x1000000<<0).toString(16)).substr(-6);
                    return {
                        pointStyle: {
                            //content: gid % 2 ? 'circle' : 'rect',
                            fillStyle: color,
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
      /*  var data = '${stringList}';
        data=data.substring(1,data.length-1).split(", ");
        pointSimplifierIns.setData(data);*/

        pointSimplifierIns.on('pointClick pointMouseover pointMouseout', function(e, record) {
           
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
             $("#carNums").text(parts[3]);
             $("#totalFreight").text(parts[4]);
         }); 
    });
   AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function(PathSimplifier, $) {

       if (!PathSimplifier.supportCanvas) {
           alert('当前环境不支持 Canvas！');
           return;
       }
       var defaultRenderOptions = {
               renderAllPointsIfNumberBelow: -1,
               pathTolerance: 2,
               keyPointTolerance: 0,
               pathLineStyle: {
                   lineWidth: 1,
                   strokeStyle: '#087ec4',
                   borderWidth: 1,
                   borderStyle: '#eeeeee',
                   dirArrowStyle: false
               },
               pathLineHoverStyle: {
                   lineWidth: 3,
                   strokeStyle: 'rgba(204, 63, 88,1)',
                   borderWidth: 1,
                   borderStyle: '#cccccc',
                   dirArrowStyle: false
               },
               pathLineSelectedStyle: {
                   lineWidth: 6,
                   strokeStyle: '#C11534',
                   borderWidth: 1,
                   borderStyle: '#cccccc',
                   dirArrowStyle: true
               },
               dirArrowStyle: {
                   stepSpace: 35,
                   strokeStyle: '#ffffff',
                   lineWidth: 2
               },
               startPointStyle: {
                   radius: 4,
                   fillStyle: '#dc3912',
                   lineWidth: 1,
                   strokeStyle: '#eeeeee'
               },
               endPointStyle: {
                   radius: 4,
                   fillStyle: '#dc3912',
                   lineWidth: 1,
                   strokeStyle: '#eeeeee'
               },
               keyPointStyle: {
                   radius: 3,
                   fillStyle: 'rgba(8, 126, 196, 1)',
                   lineWidth: 1,
                   strokeStyle: '#eeeeee'
               },
               keyPointHoverStyle: {
                   radius: 4,
                   fillStyle: 'rgba(0, 0, 0, 0)',
                   lineWidth: 2,
                   strokeStyle: '#ffa500'
               },
               keyPointOnSelectedPathLineStyle: {
                   radius: 4,
                   fillStyle: 'rgba(8, 126, 196, 1)',
                   lineWidth: 2,
                   strokeStyle: '#eeeeee'
               }
           };
       var pathSimplifierIns = new PathSimplifier({
           zIndex: 100,
           //autoSetFitView:false,
           map: map, //所属的地图实例

           getPath: function(pathData, pathIndex) {

               return pathData.path;
           },
           getHoverTitle: function(pathData, pathIndex, pointIndex) {

               if (pointIndex >= 0) {
                   //point 
                   return  ;
               }
               return '总吨数:'+pathData.tonnage;
           },
           renderOptions: defaultRenderOptions
       });

       window.pathSimplifierIns = pathSimplifierIns;

       pathSimplifierIns.on('pathClick pointClick', function(e, info){
         });

   });
   
	function retrieve() {
		var distance = $('#distance').val();
		var tons = $('#tons').val();
		var clusterNum=$('#clusterNum').val();
		var type = $('#type option:selected').val();
		load.loading.add(0.4,"<%=basePath%>images/loading.gif");
		$.ajax({
			type:'get',
			url:"<%=basePath%>cluster/queryOptimizedStation",
			data:{"distance":distance,"tons":tons,"type":type,"clusterNum":clusterNum},
			dataType:'json',
			success:function(data1){
				load.loading.remove();
        if(data1.status == 'n'){
         alert("查询失败！服务器报错！");
         return; 
        }
        
                  map.clearMap();
				  var points =data1.pointList.substring(1,data1.pointList.length-1).split(", ");
				  pointSimplifierIns.setData(points);
				  pathSimplifierIns.setData(data1.railways);
				  for(var i =0;i<data1.railwaynum;i++){
					  var width=1;
					  if(data1.railways[i].tonnage >3000000)
						  width = 8;
					  else if(data1.railways[i].tonnage >2000000)
						  width = 6;
					  else if(data1.railways[i].tonnage >1500000)
						  width = 4;
					  else
						  width = 1;
				         var navg = pathSimplifierIns.createPathNavigator(i, {
				             loop: true, //循环播放
				             speed: 500000, //巡航速度，单位千米/小时
				             pathNavigatorStyle: {
	                        	  initRotateDegree: 0,
	                              width: 16,
	                              height: 16,
	                              autoRotate: true,
	                              lineJoin: 'round',
	                              content: 'defaultPathNavigator',
	                              fillStyle: '#087EC4',
	                              strokeStyle: '#116394', //'#eeeeee',
	                              lineWidth: 1,
	                              pathLinePassedStyle: {
	                                  lineWidth: width,
	                                  strokeStyle: 'rgba(8, 126, 196, 1)',
	                                  borderWidth: 1,
	                                  borderStyle: '#eeeeee',
	                                  dirArrowStyle: false
	                              }
	                          }
				           });
				           navg.start();
				   }
				  var circles=data1.circleList.toString().substring(1,data1.circleList.toString().length-1).split(",,");
				  var circleInfo;
				   for(var j = 0,len = circles.length; j < len; j++){
					   circleInfo=circles[j].split(',');
					   var circle = new AMap.Circle({
						   	bubble:true,
						       center: new AMap.LngLat(circleInfo[1],circleInfo[2]),// 圆心位置
						       radius: 100000, //半径
						       strokeColor: "#00FFFF", //线颜色
						       strokeOpacity: 1, //线透明度
						       strokeWeight: 3, //线粗细度
						       fillColor: "#7FFFD4", //填充颜色
						       fillOpacity:0.5 //填充透明度
						   });
					  circle.setMap(map);
					}
			},
			error: function(json){
				load.loading.remove();
				alert("用户数据加载异常，请刷新后重试...");  
			}  
			});
	}
    </script>
</body>

</html>