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
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>map/css/bootstrap.css" rel='stylesheet'
	type='text/css' />
<!-- Custom CSS -->
<link href="<%=basePath%>map/css/flowstyle.css" rel='stylesheet'
	type='text/css' />
<!-- font CSS -->
<!-- font-awesome icons -->
<link href="<%=basePath%>map/css/flowfont-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- js-->
<script src="<%=basePath%>map/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>map/js/modernizr.custom.js"></script>
<!--webfonts-->
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Condensed:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>
<!--//webfonts-->
<!--animate-->
<link href="<%=basePath%>map/css/flowanimate.css" rel="stylesheet"
	type="text/css" media="all">
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
		<div class="col-md-8 general-grids grids-right widget-shadow"
			style="height: 100%;width:100%">
			<h3 class="title2">系统介绍:</h3>
			<ul id="myTabs" class="nav nav-tabs" role="tablist"
				style="margin-top: 20px">
				<li role="presentation" class=""><a href="#home" id="home-tab"
					role="tab" data-toggle="tab" aria-controls="home"
					aria-expanded="false">简介</a></li>
				<li role="presentation" class="active"><a href="#profile"
					role="tab" id="profile-tab" data-toggle="tab"
					aria-controls="profile" aria-expanded="true">系统功能</a></li>
				<li role="presentation" class="dropdown"><a href="#"
					id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"
					aria-controls="myTabDrop1-contents" aria-expanded="false">用户手册<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" aria-labelledby="myTabDrop1"
						id="myTabDrop1-contents">
						<li class=""><a href="#dropdown1" role="tab"
							id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1"
							aria-expanded="false">系统使用</a></li>
						<li class=""><a href="#dropdown2" role="tab"
							id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2"
							aria-expanded="false">人性化设计</a></li>
					</ul></li>
			</ul>
			<div id="myTabContent" class="tab-content scrollbar1"
				style="overflow: hidden; font-size: 18px; margin-top: 20px;height:400px">
				<div role="tabpanel" class="tab-pane fade" id="home"
					aria-labelledby="home-tab">
					<p>该系统是铁路货运数据的分析和显示系统。</p>
				</div>
				<div role="tabpanel" class="tab-pane fade active in" id="profile"
					aria-labelledby="profile-tab">
					<p> 系统分为三个主要模块：系统管理，数据查询和数据分析。 系统管理包括用户管理功能。 数据查询包括原始数据查询和优化数据查询功能。 数据分析模块包括类别热图和企业出发数分析功能。</p>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="dropdown1"
					aria-labelledby="dropdown1-tab">
					<p>1.系统管理</p>
					<p>主要为用户管理功能。在用户管理中，可以添加，删除或更改用户，并且可以为不同的用户授予不同的权限。具有不同权限的用户可以使用系统的不同功能。</p>
					<p>2.数据查询</p>
					<p>2.1城市查看</p>
					<p>可查看原始城市的运量统计信息以及分布。可开关省份线区分省份。</p>
					<p>2.2省份展示</p>
					<p>可根据品类、发站/到站、年份查询各个省份的发货色块图，查看某个省份的运量分析，以及该省份下的前20热点发/到站城市。</p>
					<p>2.3城市展示</p>
					<p>可根据品类、发站/到站、年份查询各个省份的发货色块图，查看该品类的运量分析，以及以某城市为中心的前20热点发/到站城市。</p>	
					<p>3.数据分析</p>
					<p>3.1品类热力图</p>
					<p>可根据品类、发站/到站、时间区间查询该品类的热力图，查看该品类的运量分析，查看该品类在所选时间段内的运量直方图。</p>
					<p>3.2企业发车数分析</p>
					<p>可根据品类、年份查看企业发车数分布图、企业发车数堆积图、企业发货吨数分布图、企业发货吨数堆积图。</p>
					<p>3.3优化数据</p>
					<p>可查看条件筛选过后的聚类结果，显示为各个城市对以及各条航道，包括每条航道的运量。</p>					
									</div>
				<div role="tabpanel" class="tab-pane fade" id="dropdown2"
					aria-labelledby="dropdown2-tab">
					<p>1.界面主题切换</p>
					<p>用户可以单击右上角的“设置”按钮切换界面主题</p>
					<p>2.修改个人信息</p>
					<p>用户可以修改部分个人信息</p>
					<p>3.时间提醒</p>
					<p>界面正上方是当前时间提醒</p>
					<p>4.搜索框</p>
					<p>您可以通过菜单栏中的搜索框快速找到所需的功能</p>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
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