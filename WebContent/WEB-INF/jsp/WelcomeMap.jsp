<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- Main styles for this application -->
    	<link href="<%=basePath%>map/css/style.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>map/css/common.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>map/css/slide.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>map/css/flat-ui.min.css" />
		<!-- <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css"> -->
		<link type="text/css" href="<%=basePath%>map/css/jquery.jscrollpane.css" rel="stylesheet" media="all" />
		<link href="<%=basePath%>map/css/ui-choose.css" rel="stylesheet" />
		<link href="<%=basePath%>map/css/usermanagement.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>map/css/tableForBlacklistSetApplication.css" />
		<link type="text/css" rel="stylesheet" href="<%=basePath%>map/css/popup_blacklist.css" />
		<link href="css/contactform.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
    	<script type="text/javascript" src="<%=basePath%>map/js/jquery-1.8.3.min.js"></script>
    	<script type="text/javascript" src="<%=basePath%>map/js/jquery.SuperSlide.js"></script>
    	<script type="text/javascript" src="<%=basePath%>map/js/Validform_v5.3.2_min.js"></script>
    	<link rel="stylesheet" href="<%=basePath%>map/css/jquery-ui.css">
  		<script src="<%=basePath%>map/js/jquery-ui.js"></script>
  		
<title>RailwayDataMap</title>
</head>
<body>
<div class="about" id="about">
	<div class="col-md-6 about-left-w3ls" style = "flex: 0 0 40%;max-width: 90%;height:500px;float:left;margin-top:30px;margin-left:30px;border:1px solid #000;">
	<!doctype html>
	<html>
	<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <title>RailwayDataMap</title>
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=您申请的key值&plugin=AMap.MouseTool"></script>
    <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
    <script src="//webapi.amap.com/ui/1.0/main.js"></script>
	</head>
	<body>
	<div id="container"></div>
	<style type="text/css">
	
		 .context_menu {
            margin: 2px;
            padding: 2px;
            list-style-type: none;
            position: relative;
            background-color: rgb(255, 255, 255);
            border: 1px solid rgb(175, 175, 175);
            border-radius: 5px;
            box-shadow: rgb(153, 153, 153) 2px 2px 8px;
            white-space: nowrap;
            cursor: pointer;
        }
        .context_menu li {
            text-indent: 0.5em;
            font-size: 14px;
            width:70px;
            font-family: verdana;
            height: 30px;
            line-height: 30px;
            word-break: break-all;
            white-space: nowrap;
        }
        .context_menu li.split_line {
            border-bottom-color: rgb(204, 204, 204);
            border-bottom-style: solid;
            border-bottom-width: 1px;
        }
	
		html,
    	body,
    	#container {
        	width: 100%;
        	height: 100%;
        	margin: 0px;
        	font-size: 13px;
    	}
    	/* 定义 my-red 主题 */
    	
    	.amap-ui-control-theme-my-red .amap-ui-control-layer {
        	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.4);
        	background: red;
    	}
    
    	.amap-ui-control-theme-my-red .amap-ui-control-layer-expanded {
        	color: #fff;
        	background: red;
    	}
    
    	.amap-ui-control-theme-my-red .amap-ui-control-layer-toggle {
        	color: #fff;
    	}
        .info {
            border: solid 1px silver;
        }
        div.info-top {
            position: relative;
            background: none repeat scroll 0 0 #F9F9F9;
            border-bottom: 1px solid #CCC;
            border-radius: 5px 5px 0 0;
            width:290px;
        }
        div.info-top div {
            display: inline-block;
            color: #333333;
            font-size: 14px;
            font-weight: bold;
            line-height: 31px;
            padding: 0 10px;
        }
        div.info-top img {
            position: absolute;
            top: 10px;
            right: 10px;
            transition-duration: 0.25s;
        }
        div.info-top img:hover {
            box-shadow: 0px 0px 5px #000;
        }
        div.info-middle {
            font-size: 12px;
            padding: 6px;
            line-height: 20px;
        }
        div.info-bottom {
            height: 0px;
            width: 100%;
            clear: both;
            text-align: center;
        }
        div.info-bottom img {
            position: relative;
            z-index: 104;
        }
        span {
            margin-left: 5px;
            font-size: 14px;
        }
        .info-middle img {
            float: left;
            margin-right: 6px;
            height:90px;
            width:100px;
        }
    </style>
	<script>
    var markers = [];
  
	var map = new AMap.Map("container", {
        resizeEnable: true,
        center: [116.397428, 39.90923],
        zoom: 4,
    });
	
	AMapUI.loadUI(['control/BasicControl'], function(BasicControl) {

        var layerCtrl = new BasicControl.LayerSwitcher({
            //my-red 见上方style
            theme: 'my-red',
            position: 'tr'
        });

        map.addControl(layerCtrl);


    });
    
    var markers = []; //province见Demo引用的JS文件
    var manageid = "";
  //构建自定义信息窗体
    function createInfoWindow(title, content) {
        var info = document.createElement("div");
        info.className = "info";

        //可以通过下面的方式修改自定义窗体的宽高
        //info.style.width = "400px";
        // 定义顶部标题
        var top = document.createElement("div");
        var titleD = document.createElement("div");
        var closeX = document.createElement("img");
        top.className = "info-top";
        titleD.innerHTML = title;
        closeX.src = "https://webapi.amap.com/images/close2.gif";
        closeX.onclick = closeInfoWindow;

        top.appendChild(titleD);
        top.appendChild(closeX);
        info.appendChild(top);

        // 定义中部内容
        var middle = document.createElement("div");
        middle.className = "info-middle";
        middle.style.backgroundColor = 'white';
        middle.innerHTML = content;
        info.appendChild(middle);

        // 定义底部内容
        var bottom = document.createElement("div");
        bottom.className = "info-bottom";
        bottom.style.position = 'relative';
        bottom.style.top = '0px';
        bottom.style.margin = '0 auto';
        var sharp = document.createElement("img");
        sharp.src = "https://webapi.amap.com/images/sharp.png";
        bottom.appendChild(sharp);
        info.appendChild(bottom);
        return info;
    }

    //关闭信息窗体
    function closeInfoWindow() {
        map.clearInfoWindow();
        var point = new AMap.LngLat(116.397428,39.90923);
        map.setCenter(point);
        map.setZoom(4);
    }
    
    
    <c:forEach items="${cityList}" var="item">
        var marker;
        var marker = new AMap.Marker({
            map:map,
            bubble:true,
            position:[Number(${item.longitude}),Number(${item.latitude})],
        });
		
        marker.title = '${item.id}';
        marker.label = "${item.id}"+"#"+"${item.name}";
        
        markers.push(marker);
        marker.content= '站点编号  :  ' + '${item.id} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+ '<br/>'
		+ '站点名称  :  ' + '${item.name}' + '<br/>'
		+ '区域编号  :  ' + '${item.distinctId}' + '<br/>'
		+ '  枢纽站  :  ' + '${item.isCenter}  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp'+ '<br/>'
		+ '  经纬度  :  ' + '${item.longitude},${item.latitude}';
        marker.on('click',markerClick);
        marker.on('rightclick',markerRightClick);

      //标志物绑定鼠标右击事件——弹出右键菜单
        function markerRightClick(e){
        	var me = map;
	        mouseTool = new AMap.MouseTool(map); //地图中添加鼠标工具MouseTool插件
	        contextMenuPositon = null;
	        var content = [];
	        manageid = e.target.title;
	        content.push("<div>");
	        content.push("    <ul class='context_menu'>");
	        content.push("        <li onclick='addBayonet("+e.target.title+")'>查看站点</li>");
	        content.push("        <li onclick='manageBayonet("+e.target.title+")'>step2</li>");
	        content.push("    </ul>");
	        content.push("</div>");
	        contextMenu = new AMap.ContextMenu({isCustom: true, content: content.join('')});//通过content自定义右键菜单内容
            contextMenu.open(map, e.lnglat);
            contextMenuPositon = e.lnglat; //右键菜单位置
        }
      
    
    	function markerClick(e){
    		//实例化信息窗体
            var title = '站点信息',
                content = [];
            var data = e.target.label.split("#");
            content.push("<img src='http://localhost:8080/VehicleSystem/images/Points/"+data[0]+".jpg'>");
            content.push(e.target.content);
            var infoWindow = new AMap.InfoWindow({
                isCustom: true,  //使用自定义窗体
                content: createInfoWindow(title, content.join()),
                offset: new AMap.Pixel(155, -28),
            });
        	infoWindow.open(map, e.target.getPosition());
        	map.setZoom(7);
        	map.setCenter(e.target.getPosition());
    	}
        
    	</c:forEach>
    
   </script>
	</div>
	<div class="clearfix"></div>
</div>
</body>
</html>