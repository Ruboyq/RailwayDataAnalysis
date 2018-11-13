<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate">
<meta HTTP-EQUIV="expires" CONTENT="0">
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>系统登录</title>
<link href="<%=basePath%>css/login.css" rel="stylesheet"
	rev="stylesheet" type="text/css" media="all" />
<link href="<%=basePath%>css/demo.css" rel="stylesheet" rev="stylesheet"
	type="text/css" media="all" />

<script type="text/javascript" src="<%=basePath%>js/jquery1.42.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/login.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/jquery.particleground.min.js"></script>
<script language="JavaScript">
	if (window != top)
		top.location.href = location.href;
</script>
<script>
	$(document).ready(function() {
		$j11('#1').particleground({
			dotColor : '#FFFFFF',
			lineColor : '#5cbdaa'
		});
	});
</script>
</head>

<body>


	<div class="header">
		<h1 class="headerLogo">
			<a title="后台管理系统" target="_blank"><img alt="logo"
				src="<%=basePath%>images/logo.jpg"></a>
		</h1>
	</div>

	<div class="banner" id="1" style="background: #0c8ba9">

		<div class="login-aside">
			<div id="o-box-up"></div>
			<div id="o-box-down" style="table-layout: fixed;">
				<div class="error-box">
					<c:if test="${message != null}">${message}</c:if>
				</div>

				<form class="loginform" action="<%=basePath%>login" method="post">
					<div class="fm-item">
						<label for="logonId" class="form-label">系统登陆：</label> <input
							onkeyup="this.value=this.value.replace(/\D/g,'')"
							onafterpaste="this.value=this.value.replace(/\D/g,'')"
							type="text" 
							value="<c:choose>
							<c:when test="${Id != null}">${Id}</c:when>
							<c:otherwise>
							输入账号
							</c:otherwise>
							</c:choose>"
							maxlength="100" id="id" name="id"
							class="i-text" datatype="s5-5" errormsg="请输入5位的用户工号！">
						<div class="ui-form-explain"></div>
					</div>

					<div class="fm-item">
						<label for="logonId" class="form-label">登陆密码：</label> <input
							type="password" value="" maxlength="100" id="password"
							name="password" class="i-text" datatype="*6-16" nullmsg="请设置密码！"
							errormsg="密码范围在6~16位之间！">
						<div class="ui-form-explain"></div>
					</div>

					<div class="fm-item pos-r">
						<label for="logonId" class="form-label">验证码</label> <input
							type="text" value="输入验证码" maxlength="100" id="yzm" name="yzm"
							class="i-text yzm" datatype="*4-4" ajaxurl="<%=basePath%>checkcode"
							nullmsg="请输入验证码！" errormsg="请输入4位验证码!">
						<div class="ui-form-explain">
							<img src="<%=basePath%>picturecheckcode" class="yzm-img" id="CreateCheckCode"
								onclick="myReload()" />
						</div>
					</div>

					<div class="fm-item">
						<label for="logonId" class="form-label"></label> <input
							type="submit" value="" tabindex="4" id="send-btn"
							class="btn-login">
						<div class="ui-form-explain"></div>
					</div>

				</form>

			</div>

		</div>

		<div class="bd">
			<!--  
		<ul>
			<li style="background:url(<%=basePath%>images/theme-pic1.jpg) #CCE1F3 center 0 no-repeat;"></li>
			<li style="background:url(<%=basePath%>images/theme-pic2.jpg) #BCE0FF center 0 no-repeat;"></li>
		</ul>
		 -->
			<label>验证码</label>
		</div>

		<div class="hd">
			<ul></ul>
		</div>
	</div>
	<script type="text/javascript">
		jQuery(".banner").slide({
			titCell : ".hd ul",
			mainCell : ".bd ul",
			effect : "fold",
			autoPlay : true,
			autoPage : true,
			trigger : "click"
		});
	</script>


	<div class="banner-shadow"></div>

	<div class="footer">
		<p>Copyright &copy; 2017.Group Beauty and the Beast All rights
			reserved.</p>
	</div>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
<script>
$(function(){
$(".loginform").Validform({
	tiptype:function(msg,o,cssctl){
		var objtip=$(".error-box");
		cssctl(objtip,o.type);
		objtip.text(msg);
	},
	ajaxPost:true,
	callback:function(data){
		var res = data.status;
		var objtip=$(".error-box");
		if(res == 'n'){
			objtip.text('用户id或密码错误!');
			init();
			myReload();
		}
		if(res == 'y'){
			objtip.text('登录成功!');
			window.location.assign("<%=basePath%>homepage");
			 /*if($.browser.mozilla)
				// window.location.assign("user/list");
				 window.location.assign("homepage");
			 else
				// window.location='user/list';
				// window.location("homepage");
				 window.location.assign("homepage");*/
		}
	},
});
});
</script>
</html>
