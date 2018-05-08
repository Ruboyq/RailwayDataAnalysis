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
<script type="text/javascript" src="assets/js/jquery.js"></script>

<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/loader-style.css">
<link rel="stylesheet" href="assets/css/bootstrap.css">

<link rel="stylesheet" href="assets/css/profile.css">
<script type="text/javascript" src="assets/js/preloader.js"></script>
<script type="text/javascript" src="assets/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/app.js"></script>
<script type="text/javascript" src="assets/js/load.js"></script>
<script type="text/javascript" src="assets/js/main.js"></script>
<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
<!-- Fav and touch icons -->
<link rel="shortcut icon" href="assets/ico/minus.png">
<script type="text/javascript"
	src="<%=basePath%>myinfo/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>myinfo/js/jquery.SuperSlide.js"></script>
<script type="text/javascript"
	src="<%=basePath%>myinfo/js/Validform_v5.3.2_min.js"></script>

<script src="<%=basePath%>myinfo/js/cropbox.js"></script>



<title>个人信息修改</title>
</head>
<body style="width: 1239px; height: 620px; background: #f5f5f5">
	<div class="col-sm-12" style="margin-top:30px;">
		<!-- BLANK PAGE-->

		<div style="margin: -20px 15px;" class="nest" id="Blank_PageClose">
			<div class="title-alt">
				<h6>Edit Profile</h6>
			</div>

			<div class="body-nest" id="Blank_Page_Content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-3">
						<div class="text-center">
							<img
								src="http://localhost:8080/RailwayDataAnalysis/images/users/${user.user_id }.jpg?date=<%=Math.random()%>"
								class="avatar img-circle" alt="avatar" height="150px" width="150px">
							<h6>Upload a different photo...</h6>

							<div class="input-group">
								<span class="input-group-btn"> <span
									class="btn btn-primary btn-file"> Browse <input
										type="file" multiple="">
								</span>
								</span> <input type="text" class="form-control">
							</div>

						</div>
					</div>

					<!-- edit form column -->
					<div class="col-md-9 personal-info">
						<div class="alert alert-info alert-dismissable">
							 <i
								class="fa fa-coffee"></i> This is an <strong>.alert</strong>.
							Use this to show important messages to the user.
							<a class="panel-close close" data-dismiss="alert">x</a>
						</div>
						<h3>Personal info</h3>

						<form class="form-horizontal changeMyInfo" role="form"
							action="<%=basePath%>user/updateProfile" method="POST">
							<div class="form-group">
								<label class="col-lg-3 control-label">Name:</label>
								<div class="col-lg-8">
									<input id="user_name" name="user_name" class="form-control"
										value="${user.user_name}" type="text"
										 readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Work code:</label>
								<div class="col-lg-8">
									<input class="form-control" id="user_id" name="user_id"
										value="${user.user_id}" type="text"
										 readonly="readonly">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Tel:</label>
								<div class="col-lg-8">
									<input onkeyup="this.value=this.value.replace(/\D/g,'')"
										onafterpaste="this.value=this.value.replace(/\D/g,'')"
										class="form-control" id="user_tel" name="user_tel"
										value="${user.user_tel}" type="text"
										 datatype="n11-11"
										nullmsg="必填项不能为空！" errormsg="手机号需为11位数字！" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Email:</label>
								<div class="col-lg-8">
									<input class="form-control" id="user_email" name="user_email"
										value="${user.user_email}" type="text"
										 datatype="e" nullmsg="必填项不能为空！"
										errormsg="请正确填写邮箱！">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-3 control-label">Time Zone:</label>
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
							<label class="col-lg-3 control-label">Tips:</label>
								<div class="MyinfoError col-lg-8" style=" color: #F00">
								</div>
							</div>
							<div class="form-group">
								<label class="col-md-3 control-label"></label>
								<div class="col-md-8">
									<input class="btn btn-primary" value="Save Changes"
										type="submit"> <span></span> <input
										class="btn btn-default" value="Cancel" type="reset" onclick = "cancel()">
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

		});
	</script>
</body>
</html>