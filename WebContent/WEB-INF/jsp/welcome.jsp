<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>General Elements</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>map/css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%=basePath%>map/css/flowstyle.css" rel='stylesheet' type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="<%=basePath%>map/css/flowfont-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
 <!-- js-->
<script src="<%=basePath%>map/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>map/js/modernizr.custom.js"></script>
<!--webfonts-->
<link href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>
<!--//webfonts--> 
<!--animate-->
<link href="<%=basePath%>map/css/flowanimate.css" rel="stylesheet" type="text/css" media="all">
<link rel="stylesheet" href="<%=basePath%>map/css/calendar.css">
<script src="<%=basePath%>map/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!-- Metis Menu -->
<script src="<%=basePath%>map/js/jquery.leoweather.min.js"></script>
<script src="<%=basePath%>map/js/metisMenu.min.js"></script>
<script src="<%=basePath%>map/js/custom.js"></script>
<!--//Metis Menu -->
</head> 
<body>



	<!-- <div style="padding-top: 20px;padding-left: 20px;font-size: 20px;color: #34495E;">
	<span id="weather"></span></div> -->



<!-- <script type="text/javascript">
	$('#weather').leoweather({format:'，{时段}好！<span id="colock">现在时间是：<strong>{年}年{月}月{日}日 星期{周} {时}:{分}:{秒}</strong>，</span> <b>{城市}天气</b> {天气} {夜间气温}℃ ~ {白天气温}℃'});
</script> -->
<div class="row">
					<div class="col-md-4 stats-info widget" style="margin-left: 20px;height:500px">
						<div class="stats-title">
							<h4 class="title">Top 5 Hottest Stations</h4>
						</div>
						<div class="stats-body">
							<ul id = "roadsInfo" class="list-unstyled">
								<li>
								</li>
								<li>
								</li>
								<li>
								</li>
								<li>
								</li>
								<li>
								</li>
								<li>
								</li> 
							</ul>
						</div>
					</div>
					<div class="col-md-8 general-grids grids-right widget-shadow" style = "height:500px">
						<h3 class="title2">Guidelines:</h3>
						<ul id="myTabs" class="nav nav-tabs" role="tablist" style = "margin-top:20px"> <li role="presentation" class=""><a href="#home" id="home-tab" role="tab" data-toggle="tab" aria-controls="home" aria-expanded="false">Brief Intro</a></li> 
						<li role="presentation" class="active"><a href="#profile" role="tab" id="profile-tab" data-toggle="tab" aria-controls="profile" aria-expanded="true">System Functions</a></li>
						<li role="presentation" class="dropdown"> <a href="#" id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown" aria-controls="myTabDrop1-contents" aria-expanded="false">User Manual<span class="caret"></span></a> 
						<ul class="dropdown-menu" aria-labelledby="myTabDrop1" id="myTabDrop1-contents"> <li class=""><a href="#dropdown1" role="tab" id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1" aria-expanded="false">Mainframe</a></li> 
						<li class=""><a href="#dropdown2" role="tab" id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2" aria-expanded="false">Personal Design</a></li> </ul> </li> </ul>
						<div id="myTabContent" class="tab-content scrollbar1" style="overflow: hidden;font-size: 18px;margin-top: 20px;"> <div role="tabpanel" class="tab-pane fade" id="home" aria-labelledby="home-tab"> <p>  This System is used for railway workers</p> </div> <div role="tabpanel" class="tab-pane fade active in" id="profile" aria-labelledby="profile-tab"> <p>请根据用户名密码及动态验证码进行登录，系统会根据相应权限为您呈现相关的表单，您可以根据左边的导航栏来选择。用户可以通过左侧导航栏进入需要进入的页面。用户进入车辆轨迹回放模块可进行车辆的轨迹回放，进入卡口设备可进行卡口设备的管理，过车信息查询可帮助用户查看卡口设备所记录的行车信息。黑名单模块为使用者提供更好的监控方式，资源管理为用户提供道路与点位的管理平台，系统管理中的部门管理角色管理人员管理等致力于提供更好的人力资源管理</p> </div> <div role="tabpanel" class="tab-pane fade" id="dropdown1" aria-labelledby="dropdown1-tab"> <p>系统主界面提供道路流量排行统计，和系统指南以及个人管理，可以显示当前用户的头像，并且提供修改密码和更改资料以及注销的功能。提供自动定位的当地天气，并获得当前时间进行显示。</p> </div> <div role="tabpanel" class="tab-pane fade" id="dropdown2" aria-labelledby="dropdown2-tab"> <p>系统为警员提供了人性的功能。首先，在主界面出现时，会实时定位当前位置和时间进行显示提醒。并且提供了小游戏功能，可为警员的休息时间增添一抹色彩</p> </div> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
				
			
				<script src="<%=basePath%>map/js/classie.js"></script>
	
		
		
	<!--scrolling js-->
	<script src="<%=basePath%>map/js/jquery.nicescroll.js"></script>
	<script src="<%=basePath%>map/js/scripts.js"></script>
	<!--//scrolling js-->
	<!-- Bootstrap Core JavaScript -->
   <script src="<%=basePath%>map/js/bootstrap.js"> </script>
   <script src="<%=basePath%>js/NewNewWelcome.js"></script>
</body>
</html>