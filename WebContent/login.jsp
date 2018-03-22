<%@ page language="java" pageEncoding="UTF-8"%>
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
<link href="<%=basePath%>css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<link href="<%=basePath%>css/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="<%=basePath%>js/jquery1.42.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/login.js"></script>
<script language="JavaScript"> 
if (window != top) 
top.location.href = location.href; 
</script>

</head>

<body>


<div class="header">
  <h1 class="headerLogo"><a title="后台管理系统" target="_blank"><img alt="logo" src="<%=basePath%>images/logo.jpg"></a></h1>
</div>

<div class="banner">

<div class="login-aside">
  <div id="o-box-up"></div>
  <div id="o-box-down"  style="table-layout:fixed;">
   <div class="error-box"></div>
   
   <form class="registerform" action="login" method = "post">
   <div class="fm-item">
	   <label for="logonId" class="form-label">系统登陆：</label>
	   <input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" type="text" value="输入账号" maxlength="100" id="id" name = "id" class="i-text"  datatype="s5-18" errormsg="请输入5位的用户ID！"  >    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label">登陆密码：</label>
	   <input type="password" value="" maxlength="100" id="password"  name = "password" class="i-text" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！">    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item pos-r">
	   <label for="logonId" class="form-label">验证码</label>
	   <input type="text" value="输入验证码" maxlength="100" id="yzm" name = "yzm" class="i-text yzm" datatype = "*4-4" ajaxurl = "checkcode" nullmsg="请输入验证码！" errormsg="请输入4位验证码!">    
       <div class="ui-form-explain"><img src="picturecheckcode" class="yzm-img" id = "CreateCheckCode" onclick="myReload()"/></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label"></label>
	   <input type="submit" value="" tabindex="4" id="send-btn" class="btn-login"> 
       <div class="ui-form-explain"></div>
  </div>
  
  </form>
  
  </div>

</div>

	<div class="bd">
		<ul>
			<li style="background:url(<%=basePath%>images/theme-pic1.jpg) #CCE1F3 center 0 no-repeat;"></li>
			<li style="background:url(<%=basePath%>images/theme-pic2.jpg) #BCE0FF center 0 no-repeat;"></li>
		</ul>
	</div>

	<div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>


<div class="banner-shadow"></div>

<div class="footer">
   <p>Copyright &copy; 2017.Group JAVAEE All rights reserved.</p>
</div>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
