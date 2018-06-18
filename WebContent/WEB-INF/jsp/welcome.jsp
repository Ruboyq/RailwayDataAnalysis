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
			<h3 class="title2">Guidelines:</h3>
			<ul id="myTabs" class="nav nav-tabs" role="tablist"
				style="margin-top: 20px">
				<li role="presentation" class=""><a href="#home" id="home-tab"
					role="tab" data-toggle="tab" aria-controls="home"
					aria-expanded="false">Brief Intro</a></li>
				<li role="presentation" class="active"><a href="#profile"
					role="tab" id="profile-tab" data-toggle="tab"
					aria-controls="profile" aria-expanded="true">System Functions</a></li>
				<li role="presentation" class="dropdown"><a href="#"
					id="myTabDrop1" class="dropdown-toggle" data-toggle="dropdown"
					aria-controls="myTabDrop1-contents" aria-expanded="false">User
						Manual<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" aria-labelledby="myTabDrop1"
						id="myTabDrop1-contents">
						<li class=""><a href="#dropdown1" role="tab"
							id="dropdown1-tab" data-toggle="tab" aria-controls="dropdown1"
							aria-expanded="false">Mainframe</a></li>
						<li class=""><a href="#dropdown2" role="tab"
							id="dropdown2-tab" data-toggle="tab" aria-controls="dropdown2"
							aria-expanded="false">Personal Design</a></li>
					</ul></li>
			</ul>
			<div id="myTabContent" class="tab-content scrollbar1"
				style="overflow: hidden; font-size: 18px; margin-top: 20px;height:400px">
				<div role="tabpanel" class="tab-pane fade" id="home"
					aria-labelledby="home-tab">
					<p>This system is an analysis and inquiry system for railway freight data.</p>
				</div>
				<div role="tabpanel" class="tab-pane fade active in" id="profile"
					aria-labelledby="profile-tab">
					<p>This system is an analysis and display system for railway freight data. The system is divided into three major modules: system management, data query, and data analysis. The system management includes user management functions. The data query includes the original data query and the optimized data query function. The data analysis module includes the category heat map and the enterprise departure number analysis function.</p>
				</div>
				<div role="tabpanel" class="tab-pane fade" id="dropdown1"
					aria-labelledby="dropdown1-tab">
					<p>1.System Management</p>
					<p>There are user management functions under system management. In the user management, users can be added, deleted, or changed, and different users can be given different rights. Users with different permissions can use different functions of the system.</p>
					<p>2. Data query</p>
					<p>2.1 Raw data</p>
					<p>The raw data is divided into site view and province and city display modules.
The site is viewed to show all the original points and their analysis data.
The provinces and cities show the tonnage heat maps of different provinces and the information of the top 20 cities in a certain city.</p>
					<p>2.2 Optimizing data</p>
					<p>The optimized data shows the site distribution and hub connection after optimization clustering according to the system.</p>
					<p>3. Data analysis</p>
					<p>3.1 category heat map</p>
					<p>The heat maps of categories show the national heat maps of a certain category according to the delivery and arrival at different time periods. It can be seen which cities are hot and which cities are not hot, and some of the analyzed data are displayed at the same time.</p>
					<p>3.2 Analysis of enterprise departures</p>
					<p>The analysis of the number of start-ups in an enterprise analyzes the histogram of the sum of the number of companies in a certain segment and the cumulative figure of the sum of the number of start-ups in a certain segment.</p>
									</div>
				<div role="tabpanel" class="tab-pane fade" id="dropdown2"
					aria-labelledby="dropdown2-tab">
					<p>1. Interface theme switching</p>
					<p>The user can click the Setting button in the upper right corner to switch the interface theme</p>
					<p>2. Modify personal information</p>
					<p>Users can modify some personal information</p>
					<p>3. Time reminder</p>
					<p>Directly above the interface is the current time reminder</p>
					<p>4. Search box</p>
					<p>You can quickly find the desired function through the search box in the menu bar</p>
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