<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ch">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Le styles -->
<script type="text/javascript" src="<%=basePath%>>assets/js/jquery.js"></script>

<link rel="stylesheet" href="<%=basePath%>assets/css/style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/loader-style.css">
<link rel="stylesheet" href="<%=basePath%>assets/css/bootstrap.css">

<link rel="stylesheet" href="<%=basePath%>assets/css/profile.css">
<link rel="stylesheet" href="<%=basePath%>yzm/style.css" type="text/css"
	media="all">
<link href="<%=basePath%>/yzm/demo.css" type="text/css" rel="stylesheet">
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
<link rel="shortcut icon" href="<%=basePath%>assets/ico/minus.png">
<script type="text/javascript"
	src="<%=basePath%>myinfo/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>myinfo/js/jquery.SuperSlide.js"></script>
<script type="text/javascript"
	src="<%=basePath%>myinfo/js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>yzm/passwordStrength-min.js.下载"></script>

<script src="<%=basePath%>myinfo/js/cropbox.js"></script>


<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
}
</style>
<title>个人信息修改</title>
</head>
<body style="background: #f5f5f5">
	<div class="col-sm-12">
		<!-- BLANK PAGE-->

		<div class="nest" id="Blank_PageClose">
			<div class="title-alt">
				<h6>Edit Profile</h6>
			</div>

			<div class="body-nest" id="Blank_Page_Content" style="height: 100%;">
				<div class="row">
					<!-- left column -->
					<div class="col-md-3">
						<div class="text-center" style="padding-top:100px;padding-left:150px">
							<img
								src="http://localhost:8080/RailwayDataAnalysis/images/users/${user.user_id }.jpg?date=<%=Math.random()%>"
								class="avatar img-circle" alt="avatar" height="150px"
								width="150px">

						</div>
					</div>

					<!-- edit form column -->
					<div class="col-md-9 personal-info">
						<div class="alert alert-info alert-dismissable" style="margin-left:150px">
							<i class="fa fa-coffee"></i> 您可以修改<strong>部分个人资料</strong>.
						</div>
						<form class="form-horizontal changeMyInfo" role="form"
							action="<%=basePath%>user/updateProfile" method="POST">
							<div class="form-group">
								<label class="col-lg-3 control-label">姓名:</label>
								<div class="col-lg-8">
									<input id="user_name" name="user_name" class="form-control"
										value="${user.user_name}" type="text" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">工号:</label>
								<div class="col-lg-8">
									<input class="form-control" id="user_id" name="user_id"
										value="${user.user_id}" type="text" readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">密码:</label>
								<div class="col-lg-8">
									<input type="password" class="form-control" id="user_pwd"
										name="user_pwd" value="${user.user_pwd}" class="inputxt"
										plugin="passwordStrength" datatype="*6-18"
										errormsg="密码至少6个字符,最多18个字符！" nullmsg="请填写信息！">
									<div class="passwordStrength"
										style="width: 290px; font-size: 15px; padding-top: 5px; height: 25px">
										密码强度： <span class="bgStrength">弱</span><span>中</span><span
											class="last">强</span>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">确认密码:</label>
								<div class="col-lg-8">
									<input type="password" class="form-control"
										id="password_recheck" name="password_recheck"
										value="${user.user_pwd}" recheck="user_pwd"
										datatype="*6-18" errormsg="两次输入的密码不一致！" nullmsg="请填写信息！">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">电话:</label>
								<div class="col-lg-8">
									<input onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'')"
										class="form-control" id="user_tel" name="user_tel"
										value="${user.user_tel}" type="text" datatype="n11-11"
										nullmsg="必填项不能为空！" errormsg="手机号需为11位数字！" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">邮箱:</label>
								<div class="col-lg-8">
									<input class="form-control" id="user_email" name="user_email"
										value="${user.user_email}" type="text" datatype="e"
										nullmsg="必填项不能为空！" errormsg="请正确填写邮箱！">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">所属部门:</label>
								<div class="col-lg-8">
									<c:forEach items="${depType}" var="item">
										<c:if test="${user.user_department == item.dict_id }">
											<input id="user_department" name="user_department"
												value="${user.user_department }" type="hidden">
											<input class="form-control" value="${item.dict_item_name }"
												type="text" class="form-control input-sm"
												readonly="readonly">
										</c:if>
									</c:forEach>
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">提示:</label>
								<div class="MyinfoError col-lg-8"
									style="color: #F00; margin-top: 8px;"></div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input class="btn btn-primary" value="保存"
										type="submit"> <span></span> <input
										class="btn btn-default" value="取消" type="reset"
										onclick="cancel()">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END OF BLANK PAGE -->
	<script>
function cancel(){
	if($.browser.mozilla)
		top.location.href = "<%=basePath%>homepage";
	 else
		top.location.href = "<%=basePath%>homepage";
		}
		$(function() {
			$(".changeMyInfo").Validform({
				tiptype : function(msg, o, cssctl) {
					var objtip = $(".MyinfoError");
					cssctl(objtip, o.type);
					objtip.text(msg);
				},
				usePlugin : {
					passwordstrength : {
						minLen : 6,
						maxLen : 18
					}
				},
				ajaxPost : true,
				callback : function(data) {
					var res = data.status;
					var objtip = $(".MyinfoError");
					if (res == 'n') {
						alert("修改失败!请刷新页面重试!");
						objtip.text('修改失败!');
					}
					if (res == 'y') {
						setTimeout('cancel()', 1000);
						alert("修改成功!关闭窗口后将跳转至主界面...");
						objtip.text('修改成功!');
					}
				}
			});
			$("#user_pwd").focus();
			$("#user_pwd").blur();
		});
	</script>
</body>
</html>