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

				<li><a href="<%=basePath%>homepage"><i data-toggle="tooltip"
						data-placement="bottom" title="Help" style="font-size: 20px;"
						class="icon-home tooltitle"></i></a></li>
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
					<ul id="" class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="wid">系统管理</span> 

						</a></li>

						<li><a class="tooltip-tip ajax-load" href="<%=basePath%>user/list" title="用户管理" target="main"
									onclick="changeTitle('User Management')"
							title="Social"> <i class="icon-document-edit"></i> <span>用户管理</span>

						</a></li>
					</ul>

					<ul id="rights2" class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="design">数据查询</span> 

						</a></li>
						
						<li>
							 <a class="tooltip-tip ajax-load" href="#" title="原始数据">
                                <i class="icon-menu"></i>
                                <span>原始数据</span>
							</a>
							<ul>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="<%=basePath%>railwayData/originStation"
							onclick="changeTitle('Retrieve City Station')" target="main" title="站点查看"> <i class="icon-location"></i> <span>站点查看</span></a>
                                </li>
                                <li>
                                    <a class="tooltip-tip2 ajax-load" href="<%=basePath%>railwayData/originTonnage"
							onclick="changeTitle('Retrieve Railway Line')" target="main" title="省市展示"> <i class="icon-preview"></i> <span>省市展示<span></a>
                                </li>
                            </ul>
					</li>
					<li><a class="tooltip-tip ajax-load" href="<%=basePath%>cluster/optimizedStation" title="优化数据" target="main"
									onclick="changeTitle('User Management')"
							title="优化数据"> <i class="icon-menu"></i> <span>优化数据</span>

						</a></li>
					</ul>

					<ul id="menu-showhide" class="topnav menu-left-nest">
						<li><a href="#" style="border-left: 0px solid !important;"
							class="title-menu-left"> <span class="coonent">数据分析</span>

						</a></li>
						<li><a class="tooltip-tip ajax-load" href="<%=basePath%>railwayData/heatmap" target="main"
									onclick="changeTitle('Heat Map')"
							title="品类热力图"> <i class="icon-view-thumb"></i> <span>品类热力图 </span></a></li>
						<li><a class="tooltip-tip ajax-load" href="<%=basePath%>railwayData/enterpriseAnalysis" target="main"
									onclick="changeTitle('Analysis of Enterprise')"
							title="企业发车数分析"> <i class="icon-graph-pie"></i> <span>企业发车数分析 </span>

						</a></li>
							</ul>
							<!-- <ul class="topnav menu-left-nest">
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
					</ul> -->
				</div>
			</div>
		</div>
	</div>
	<!-- END OF SIDE MENU -->



	<!--  PAPER WRAP -->
	<div class="wrap-fluid">
		<div class="container-fluid paper-wrap bevel tlbr" style="height:710px;min-height:0px;">

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
								back,&nbsp; <strong>${user.user_name}!</strong>
								<button type="button" class="close" data-dismiss="alert">×</button>
							</div>


						</div>

					</div>
				</div>
			</div>
			<!--/ TITLE -->


			<!--CONTENT-->
			<div class="row">
				<iframe src="<%=basePath%>railwayData/welcome" name="main" scrolling="no" height="600px" width="100%"
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
				<!-- <div class="devider-footer"></div> -->

			</div>
			<!-- / END OF FOOTER -->


		</div>
	</div>
	<!--  END OF PAPER WRAP -->

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
	$(function() {
    	var right='${user.user_authority}';
    	var rights=right.split(',');
    	var j;
    	$('#rights1').css('display','none');
		$('#rights2').css('display','none');
		$('#menu-showhide').css('display','none');
    	for( j= 0,len=rights.length; j < len; j++) {
    		   if(rights[j]=='1')
    			   $('#rights1').css('display','block');
    		   else if(rights[j]=='2')
    			   $('#rights2').css('display','block');
    		   else if(rights[j]=='3')
    			   $('#menu-showhide').css('display','block');
    	}
    });
    </script>





</body>

</html>