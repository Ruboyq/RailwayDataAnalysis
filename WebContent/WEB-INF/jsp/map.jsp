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
//104.250755 30.535947
<head>
    <!-- 原始地址：//webapi.amap.com/ui/1.0/ui/misc/PointSimplifier/examples/index.html -->
    <base href="//webapi.amap.com/ui/1.0/ui/misc/PointSimplifier/examples/" />
    <meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>海量点展示</title>
    <style>
    html,
    body,
    #container {
        width: 100%;
        height: 100%;
        margin: 0px;
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

            getPosition: function(item) {

                if (!item) {
                    return null;
                }

                var parts = item.split(',');

                //返回经纬度
                return [parseFloat(parts[0]), parseFloat(parts[1])];
            },
            getHoverTitle: function(dataItem, idx) {
                return idx + ': ' + dataItem;
            },
            renderOptions: {
                //点的样式
                pointStyle: {
                    width: 6,
                    height: 6
                },
                //鼠标hover时的title信息
                hoverTitleStyle: {
                    position: 'top'
                }
            }
        });

        window.pointSimplifierIns = pointSimplifierIns;

        $('<div id="loadingTip">加载数据，请稍候...</div>').appendTo(document.body);
        $.get('http://a.amap.com/amap-ui/static/data/10w.txt', function(csv) {

            var data = csv.split('\n');
            pointSimplifierIns.setData(data);
           /* pointSimplifierIns.renderEngine.setOption('pointStyle',  utils.extend({}, defaultRenderOptions['pointStyle']));
            pointSimplifierIns.renderLater(200);*/
            $('#loadingTip').remove();
        });

        pointSimplifierIns.on('pointClick pointMouseover pointMouseout', function(e, record) {
            //console.log(e.type, record);
        });
    });
    </script>
</body>

</html>