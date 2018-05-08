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
    <!-- 原始地址：//webapi.amap.com/ui/1.0/ui/misc/PathSimplifier/examples/simple-demo.html -->
    <base href="//webapi.amap.com/ui/1.0/ui/misc/PathSimplifier/examples/" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>简单路径</title>
    <style>
    html,
    body,
    #container {
        width: 70%;
        height: 100%;
        margin: 0px;
    }
    </style>
</head>

<body>
    <div id="container"></div>
    <script type="text/javascript" src='//webapi.amap.com/maps?v=1.4.6&key=您申请的key值'></script>
    <!-- UI组件库 1.0 -->
    <script src="//webapi.amap.com/ui/1.0/main.js?v=1.0.11"></script>
    <script type="text/javascript">
    //创建地图
    var map = new AMap.Map('container', {
        zoom: 4
    });

    AMapUI.load(['ui/misc/PathSimplifier', 'lib/$'], function(PathSimplifier, $) {

        if (!PathSimplifier.supportCanvas) {
            alert('当前环境不支持 Canvas！');
            return;
        }

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
                    return pathData.name + '，站点：' + pathData.point[pointIndex] ;
                }
                return pathData.name + '，'+ pathData.data;
            },
            renderOptions: {

                renderAllPointsIfNumberBelow: 100 //绘制路线节点，如不需要可设置为-1
            }
        });

        window.pathSimplifierIns = pathSimplifierIns;

        //设置数据
        pathSimplifierIns.setData([{
            name: '路线0',
            path: [
                [116.405289, 39.904987],
                [113.964458, 40.54664],
                // [111.47836, 41.135964],
                // [108.949297, 41.670904],
                // [106.380111, 42.149509],
                // [103.774185, 42.56996],
                // [101.135432, 42.930601],
                // [98.46826, 43.229964],
                // [95.777529, 43.466798],
                // [93.068486, 43.64009],
                // [90.34669, 43.749086],
                // [87.61792, 43.793308]
            ],
            data:'航线:c1->c2，货运总量:10t',
            point:[
                'c1',
                'c2'
            ]
        },
        {
            name: '路线1',
            path: [
                [90.34669, 43.749086],
                [87.61792, 43.793308]
            ],
            data:'航线:c3->c4，货运总量:1t',
            point:[
                'c3',
                'c4'
            ]
        }]);

        //对第一条线路（即索引 0）创建一个巡航器
        var navg1 = pathSimplifierIns.createPathNavigator(0, {
            loop: true, //循环播放
            speed: 1000000 //巡航速度，单位千米/小时
        });
        var navg2 = pathSimplifierIns.createPathNavigator(1, {
            loop: true, //循环播放
            speed: 1000000 //巡航速度，单位千米/小时
        });
        navg1.start();
        navg2.start();
    });
    </script>
</body>

</html>