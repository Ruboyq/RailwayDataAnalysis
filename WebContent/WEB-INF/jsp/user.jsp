<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ssmdemo"  uri="http://ssmdemo.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" conte nt="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>客户列表-BootCRM</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">用户管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/user/list.action" method="post">
						<div class="form-group">
							<label for="userId">用户id</label> 
							<input type="text" class="form-control" id="userId" value="${userId}" name="userId">
						</div>
						<div class="form-group">
							<label for="userName">用户名称</label> 
							<input type="text" class="form-control" id="userName" value="${userName}" name="userName">
						</div>
						<div class="form-group">
							<label for="userDep">所属部门</label> 
							<select	class="form-control" id="userDep"  name="userDep">
								<option value="">--请选择--</option>
								<c:forEach items="${depType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == userDepartment}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
						<a href="#" class="btn btn-primary" data-toggle="modal" data-target="#userAddDialog" >新增</a>
					</form>
					    
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">用户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>ID</th>
									<th>用户名称</th>
									<th>用户密码</th>
									<th>用户邮箱</th>
									<th>联系电话</th>
									<th>所属部门</th>
									<th>是否激活</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row">
									<tr>
										<td>${row.user_id}</td>
										<td>${row.user_name}</td>
										<td>${row.user_pwd}</td>
										<td>${row.user_email}</td>
										<td>${row.user_tel}</td>
										<td>${row.user_department}</td>
										<td>${row.user_isValid}</td>
										<td>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick="editUser(${row.user_id})">修改</a>
											<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditAuthDialog" onclick="editUserAuth(${row.user_id})">权限管理</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteUser(${row.user_id})">删除</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- /.panel-body -->
						<div class="col-md-12 text-right">
							<ssmdemo:page url="${pageContext.request.contextPath }/user/list.action" />
						</div>
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 客户编辑对话框 -->
	<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user_form">
						<input type="hidden" id="edit_user_id" name="user_id"/>
						<div class="form-group">
							<label for="edit_userName" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userName" placeholder="用户名称" name="user_name">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userPwd" class="col-sm-2 control-label">用户密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userPwd" placeholder="用户密码" name="user_pwd">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userEmail" class="col-sm-2 control-label">用户邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userEmail" placeholder="用户名称" name="user_email">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userTel" class="col-sm-2 control-label">用户电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_userTel" placeholder="用户名称" name="user_tel">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_userDepartment" style="float:left;padding:7px 15px 0 27px;">用户部门</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_userDepartment" placeholder="客户来源" name="user_department">
									<option value="">--请选择--</option>
									<c:forEach items="${depType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == user_department}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateUser()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 客户添加对话框 -->
	<div class="modal fade" id="userAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">添加新用户</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="add_user_form">
						<input type="hidden" id="add_user_id" name="user_id"/>
						<div class="form-group">
							<label for="add_userName" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_userName" placeholder="用户名称" name="user_name">
							</div>
						</div>
						<div class="form-group">
							<label for="add_userPwd" class="col-sm-2 control-label">用户密码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_userPwd" placeholder="用户密码" name="user_pwd">
							</div>
						</div>
						<div class="form-group">
							<label for="add_userEmail" class="col-sm-2 control-label">用户邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_userEmail" placeholder="用户名称" name="user_email">
							</div>
						</div>
						<div class="form-group">
							<label for="add_userTel" class="col-sm-2 control-label">用户电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_userTel" placeholder="用户名称" name="user_tel">
							</div>
						</div>
						<div class="form-group">
							<label for="add_userDepartment" style="float:left;padding:7px 15px 0 27px;">用户部门</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="add_userDepartment" placeholder="用户部门" name="user_department">
									<option value="">--请选择--</option>
									<c:forEach items="${depType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == user_department}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="addUser()">添加用户</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 客户权限修改对话框 -->
	<div class="modal fade" id="userEditAuthDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">管理用户权限</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_user_auth_form">
						<label><input name="rights" type="checkbox" value="00" /> 用户管理 </label>
						<label><input name="rights" type="checkbox" value="01" /> 数据查询 </label> 
						<label><input name="rights" type="checkbox" value="02" /> 数据分析 </label> 
						<label><input name="rights" type="checkbox" value="03" /> 数据预测 </label> 
						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateUserAuth()">保存</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		function editUser(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>user/edit.action",
				data:{"id":id},
				success:function(data) {  
					$("#edit_user_id").val(data.user_id);
					$("#edit_userName").val(data.user_name);
					$("#edit_userPwd").val(data.user_pwd);
					$("#edit_userEmail").val(data.user_email);
					$("#edit_userTel").val(data.user_tel);
					$("#edit_userDepartment").val(data.user_department);
				}
			});
		}function editUserAuth(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>user/editAuth.action",
				data:{"id":id},
				success:function(data) {  
					
				}
			});
		}
		function updateUserAuth() {
			$.post("<%=basePath%>user/update.action",$("#edit_user_auth_form").serialize(),function(data){
				alert("用户权限更新成功！");
				window.location.reload();
			});
		}
		function updateUser() {
			$.post("<%=basePath%>user/update.action",$("#edit_user_form").serialize(),function(data){
				alert("用户信息更新成功！");
				window.location.reload();
			});
		}
		
		function addUser() {
			$.post("<%=basePath%>user/add.action",$("#add_user_form").serialize(),function(data){
				alert("添加用户成功！已发送激活邮件到用户邮箱!");
				window.location.reload();
			});
		}
		
		function deleteUser(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.post("<%=basePath%>user/delete.action",{"id":id},function(data){
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
