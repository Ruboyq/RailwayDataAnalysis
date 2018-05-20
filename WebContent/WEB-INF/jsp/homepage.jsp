<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<title>RailwayDataAnalysisSystem</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!-- Le styles -->
<script type="text/javascript" src="assets/js/jquery.js"></script>

<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/loader-style.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/media.css">
<link rel="stylesheet" href="assets/css/social.css">






<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/minus.png">
</head>

<body
	style="background: url('assets/img/bg.jpg') no-repeat center center fixed;">
	<!-- Preloader -->
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<!-- TOP NAVBAR -->
	<nav role="navigation" class="navbar navbar-static-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button data-target="#bs-example-navbar-collapse-1"
				data-toggle="collapse" class="navbar-toggle" type="button">
				<span class="entypo-menu"></span>
			</button>
			<button class="navbar-toggle toggle-menu-mobile toggle-left"
				type="button">
				<span class="entypo-list-add"></span>
			</button>




			<div id="logo-mobile" class="visible-xs">
				<h1>
					RailwayData<span>v0.1</span>
				</h1>
			</div>

		</div>


		<!-- Collect the nav links, forms, and other content for toggling -->
		<div id="bs-example-navbar-collapse-1"
			class="collapse navbar-collapse">
			<ul class="nav navbar-nav">

				<li><a href="#"><i data-toggle="tooltip"
						data-placement="bottom" title="Help" style="font-size: 20px;"
						class="icon-help tooltitle"></i></a></li>
			</ul>
			<div id="nt-title-container"
				class="navbar-left running-text visible-lg">
				<ul class="date-top">
					<li class="entypo-calendar" style="margin-right: 5px"></li>
					<li id="Date"></li>


				</ul>

				<ul id="digital-clock" class="digital">
					<li class="entypo-clock" style="margin-right: 5px"></li>
					<li class="hour"></li>
					<li>:</li>
					<li class="min"></li>
					<li>:</li>
					<li class="sec"></li>
					<li class="meridiem"></li>
				</ul>
				<!--  <ul id="nt-title">
                        <li><i class="wi-day-lightning"></i>&#160;&#160;Berlin&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li>
                        <li><i class="wi-day-lightning"></i>&#160;&#160;Yogyakarta&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; Tonight- 72 °F (22.2 °C)
                        </li>

                        <li><i class="wi-day-lightning"></i>&#160;&#160;Sttugart&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li>

                        <li><i class="wi-day-lightning"></i>&#160;&#160;Muchen&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li>

                        <li><i class="wi-day-lightning"></i>&#160;&#160;Frankurt&#160;
                            <b>85</b><i class="wi-fahrenheit"></i>&#160;; 15km/h
                        </li> 

				</ul>-->
				
			</div>

			<ul style="margin-right: 0;" class="nav navbar-nav navbar-right">
				<li><a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<img alt="" class="admin-pic img-circle"
						src="<%=basePath%>images/users/${user.user_id}.jpg">Hi,
						${user.user_name} <b class="caret"></b>
				</a>
					<ul style="margin-top: 14px;" role="menu"
						class="dropdown-setting dropdown-menu">
						<li><a href="<%=basePath%>toChangeProfile" target="main" onclick="changeTitle('My Profile')"> <span class="entypo-user"></span>&#160;&#160;My
								Profile
						</a></li>
						<li><a href="<%=basePath%>toChangePassword" target="main" onclick="changeTitle('Security Service')"> <span class="entypo-vcard"></span>&#160;&#160;Change
								Password
						</a></li>
						<li class="divider"></li>
						<li><a
							href="<%=basePath%>user/logoff">
								<span class="entypo-lifebuoy"></span>&#160;&#160; Log off
						</a></li>
					</ul></li>
				<li><a data-toggle="dropdown" class="dropdown-toggle" href="#">
						<span class="icon-gear"></span>&#160;&#160;Setting
				</a>
					<ul role="menu" class="dropdown-setting dropdown-menu">

						<li class="theme-bg">
							<div id="button-bg"></div>
							<div id="button-bg2"></div>
							<div id="button-bg3"></div>
							<div id="button-bg5"></div>
							<div id="button-bg6"></div>
							<div id="button-bg7"></div>
							<div id="button-bg8"></div>
							<div id="button-bg9"></div>
							<div id="button-bg10"></div>
							<div id="button-bg11"></div>
							<div id="button-bg12"></div>
							<div id="button-bg13"></div>
						</li>
					</ul></li>
				<li class="hidden-xs"><a class="toggle-left" href="#"> <span
						style="font-size: 20px;" class="entypo-list-add"></span>
				</a></li>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<!-- /END OF TOP NAVBAR -->

	<!-- SIDE MENU -->
	<div id="skin-select">
		<div id="logo">
			<h1>
				Railway<span>v 0.1</span>
			</h1>
		</div>

		<a id="toggle"> <span class="entypo-menu"></span>
		</a>
		<div class="dark">
			<form action="#">
				<span> <input type="text" name="search" value=""
					class="search rounded id_search" placeholder="Search Menu..."
					autofocus="">
				</span>
			</form>
		</div>

		<div class="search-hover">
			<form id="demo-2">
				<input type="search" placeholder="Search Menu..." class="id_search">
			</form>
		</div>


		<div class="search-hover">
			<form id="demo-2">
				<input type="search" placeholder="Search Menu..." class="id_search">
			</form>
		</div>




		<div class="skin-part">
			<div id="tree-wrap">
				<div class="side-bar">
					<ul class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="wid">系统管理</span> 

						</a></li>

						<li><a class="tooltip-tip ajax-load" href="<%=basePath%>user/list" title="Blog List" target="main"
									onclick="changeTitle('User Management')"
							title="Social"> <i class="icon-document-edit"></i> <span>用户管理</span>

						</a></li>
						<li><a class="tooltip-tip ajax-load" href="media.html"
							title="Media"> <i class="entypo-newspaper"></i> <span>日志管理</span>

						</a></li>
					</ul>

					<ul class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="design">数据查询</span> 

						</a></li>
						
						<li>
							 <a class="tooltip-tip ajax-load" href="#" title="Blog App">
                                <i class="icon-menu"></i>
                                <span>原始数据</span>
							</a>
							<ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="<%=basePath%>railwayData/originStation"
							onclick="changeTitle('Retrieve City Station')" target="main" title="Mail"> <i class="icon-location"></i> <span>站点查看</span></a>
                                </li>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="<%=basePath%>railwayData/originDrawLine"
							onclick="changeTitle('Retrieve Railway Line')" target="main" title="Mail"> <i class="icon-preview"></i> <span>线路查看<span></a>
                                </li>
                            </ul>
					</li>
					
						<li>
							 <a class="tooltip-tip ajax-load" href="#" title="Blog App">
                                <i class="icon-menu"></i>
                                <span>优化数据</span>
							</a>
							<ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="<%=basePath%>railwayData/map"
							onclick="changeTitle('Retrieve City Station')" target="main" title="Mail"> <i class="icon-location"></i> <span>站点查看</span></a>
                                </li>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="<%=basePath%>railwayData/originalLineMap"
							onclick="changeTitle('Retrieve Railway Line')" target="main" title="Mail"> <i class="icon-preview"></i> <span>线路查看<span></a>
                                </li>
                            </ul>
					</li>
						<!--<li><a class="tooltip-tip" href="#" title="Extra Pages">
								<i class="icon-document-new"></i> <span>Extra Page</span>
						</a>
							<ul>
								<li><a class="tooltip-tip2 ajax-load"
									href="blank_page.html" title="Blank Page"><i
										class="icon-media-record"></i><span>Blank Page</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="profile.html"
									title="Profile Page"><i class="icon-user"></i><span>Profile
											Page</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="invoice.html"
									title="Invoice"><i class="entypo-newspaper"></i><span>Invoice</span></a>
								</li>
								<li><a class="tooltip-tip2 ajax-load"
									href="pricing_table.html" title="Pricing Table"><i
										class="fontawesome-money"></i><span>Pricing Table</span></a></li>
								<li><a class="tooltip-tip2 ajax-load" href="time-line.html"
									title="Time Line"><i class="entypo-clock"></i><span>Time
											Line</span></a></li>
								<li><a class="tooltip-tip2" href="404.html"
									title="404 Error Page"><i class="icon-thumbs-down"></i><span>404
											Error Page</span></a></li>
								<li><a class="tooltip-tip2" href="500.html"
									title="500 Error Page"><i class="icon-thumbs-down"></i><span>500
											Error Page</span></a></li>
								<li><a class="tooltip-tip2" href="lock-screen.html"
									title="Lock Screen"><i class="icon-lock"></i><span>Lock
											Screen</span></a></li>
							</ul></li>-->

					

					</ul>

					<ul id="menu-showhide" class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="coonent">数据分析</span> <i
								data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

						</a></li>
						<li><a class="tooltip-tip ajax-load" href="<%=basePath%>railwayData/heatmap" title="Blog List" target="main"
									onclick="changeTitle('Heat Map')"
							title="Social"> <i class="icon-view-thumb"></i> <span>品类热力图 </span>
						<li><a class="tooltip-tip ajax-load" href="<%=basePath%>railwayData/heatmap" title="Blog List" target="main"
									onclick="changeTitle('User Management')"
							title="Social"> <i class="icon-graph-pie"></i> <span>企业发车数分析 </span>

						</a></li>
							</ul>
							<ul class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="design">数据预测</span> <i
								data-toggle="tooltip" class="entypo-cog pull-right config-wrap"></i>

						</a></li>
						<li><a class="tooltip-tip" href="#" title="Tables"> <i
								class="icon-view-thumb"></i> <span>Tables</span>
						</a>
							<ul>
								<li><a class="tooltip-tip2 ajax-load"
									href="table-static.html" title="Table Static"><i
										class="entypo-layout"></i><span>Table Static</span></a></li>
								<li><a class="tooltip-tip2 ajax-load"
									href="table-dynamic.html" title="Table Dynamic"><i
										class="entypo-menu"></i><span>Table Dynamic</span></a></li>
							</ul></li>

						<li><a class="tooltip-tip ajax-load" href="map.html"
							title="Map"> <i class="icon-location"></i> <span>Map</span>

						</a></li>
					</ul>


					<div class="side-dash">
						<h3>
							<span>Device</span>
						</h3>
						<ul class="side-dashh-list">
							<li>Avg. Traffic <span>25k<i style="color: #44BBC1;"
									class="fa fa-arrow-circle-up"></i>
							</span>
							</li>
							<li>Visitors <span>80%<i style="color: #AB6DB0;"
									class="fa fa-arrow-circle-down"></i>
							</span>
							</li>
							<li>Convertion Rate <span>13m<i
									style="color: #19A1F9;" class="fa fa-arrow-circle-up"></i>
							</span>
							</li>
						</ul>
						<h3>
							<span>Traffic</span>
						</h3>
						<ul class="side-bar-list">
							<li>Avg. Traffic
								<div class="linebar">5,7,8,9,3,5,3,8,5</div>
							</li>
							<li>Visitors
								<div class="linebar2">9,7,8,9,5,9,6,8,7</div>
							</li>
							<li>Convertion Rate
								<div class="linebar3">5,7,8,9,3,5,3,8,5</div>
							</li>
						</ul>
						<h3>
							<span>Visitors</span>
						</h3>
						<div id="g1" style="height: 180px" class="gauge"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END OF SIDE MENU -->



	<!--  PAPER WRAP -->
	<div class="wrap-fluid">
		<div class="container-fluid paper-wrap bevel tlbr">

			<!-- CONTENT -->
			<!--TITLE -->
			<div class="row">
				<div id="paper-top">
					<div class="col-sm-3">
						<h2 class="tittle-content-header">
							<span class="entypo-doc-text"></span> <span id="contentTitle">OriginalData</span>
						</h2>

					</div>

					<div class="col-sm-7">
						<div class="devider-vertical visible-lg"></div>
						<div class="tittle-middle-header">

							<div class="alert">
								<span class="tittle-alert entypo-info-circled"></span> Welcome
								back,&nbsp; <strong>${user.user_name}!</strong>&nbsp;&nbsp;Your last
								sig in at Yesterday, 16:54 PM
								<button type="button" class="close" data-dismiss="alert">×</button>
							</div>


						</div>

					</div>
				</div>
			</div>
			<!--/ TITLE -->


			<!--CONTENT-->
			<div class="row">
				<iframe src="<%=basePath%>railwayData/originalCity" name="main" scrolling="no" height="600px" width="100%"
					frameborder="0"
					></iframe>
			</div>


			<!-- /END OF CONTENT -->



			<!-- FOOTER -->
			<div class="footer-space"></div>
			<div id="footer">
				<div class="devider-footer-left"></div>
				<div class="time">
					<p id="spanDate">
					<p id="clock">
				</div>
				<div class="copyright">
					Make with Love <span class="entypo-heart"></span>From <a
						href="#" title="BeautyAndTheBeast" target="_blank">Beauty and the Beast</a>
					All Rights Reserved
				</div>
				<div class="devider-footer"></div>

			</div>
			<!-- / END OF FOOTER -->


		</div>
	</div>
	<!--  END OF PAPER WRAP -->

	<!-- RIGHT SLIDER CONTENT -->
	<div class="sb-slidebar sb-right">
		<div class="right-wrapper">
			<div class="row">
				<h3>
					<span><i class="entypo-gauge"></i>&nbsp;&nbsp;MAIN WIDGET</span>
				</h3>
				<div class="col-sm-12">

					<div class="widget-knob">
						<span class="chart" style="position: relative" data-percent="86">
							<span class="percent"></span>
						</span>
					</div>
					<div class="widget-def">
						<b>Distance traveled</b> <br> <i>86% to the check point</i>
					</div>

					<div class="widget-knob">
						<span class="speed-car" style="position: relative"
							data-percent="60"> <span class="percent2"></span>
						</span>
					</div>
					<div class="widget-def">
						<b>The average speed</b> <br> <i>30KM/h avarage speed</i>
					</div>


					<div class="widget-knob">
						<span class="overall" style="position: relative" data-percent="25">
							<span class="percent3"></span>
						</span>
					</div>
					<div class="widget-def">
						<b>Overall result</b> <br> <i>30KM/h avarage Result</i>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- END OF RIGHT SLIDER CONTENT-->




	<!-- MAIN EFFECT -->
	<script type="text/javascript" src="assets/js/preloader.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap.js"></script>
	<script type="text/javascript" src="assets/js/app.js"></script>
	<script type="text/javascript" src="assets/js/load.js"></script>
	<script type="text/javascript" src="assets/js/main.js"></script>
	<script type="text/javascript"
		src="assets/js/flatvideo/jquery.fitvids.js"></script>

	<script>
    // Basic FitVids Test
    $(".blog-list-nest").fitVids();
    // Custom selector and No-Double-Wrapping Prevention Test
    $(".blog-list-nest").fitVids();
    // Custom selector and No-Double-Wrapping Prevention Test
    </script>

	<script type="text/javascript">
    function changeTitle(notice) {
    	$("#contentTitle").html(notice);
    }
    </script>





</body>

</html>
