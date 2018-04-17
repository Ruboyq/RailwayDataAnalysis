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
    <link rel="shortcut icon" href="images/smalllogo.png">

    <!-- Main styles for this application -->
    <link href="<%=basePath%>myinfo/css/style.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="<%=basePath%>myinfo/css/common.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>myinfo/css/slide.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>myinfo/css/flat-ui.min.css" />
		<!-- <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css"> -->
		<link type="text/css" href="<%=basePath%>myinfo/css/jquery.jscrollpane.css" rel="stylesheet" media="all" />
		<link type="text/css" href="<%=basePath%>myinfo/css/bootstrap.css" rel="stylesheet"/>
		<link href="<%=basePath%>myinfo/css/ui-choose.css" rel="stylesheet" />
		<link href="<%=basePath%>myinfo/css/usermanagement.css" rel="stylesheet" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>myinfo/css/tableformodify.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>myinfo/css/modifyInformation.css" />
		<!-- <link rel="stylesheet" type="text/css" href="css/select.css" /> -->
		
		<script type="text/javascript" src="<%=basePath%>myinfo/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="<%=basePath%>myinfo/js/jquery.SuperSlide.js"></script>
		<script type="text/javascript" src="<%=basePath%>myinfo/js/Validform_v5.3.2_min.js"></script>
		<link rel="stylesheet" href="<%=basePath%>myinfo/css/portrait.css" type="text/css" />
		<link type="text/css" rel="stylesheet" href="<%=basePath%>myinfo/css/popup_blacklist.css" />
    	<style>
        .container
        {
            position: absolute;
            top: 14%; left: 2%; right: 0; bottom: 0;
        }
        .action
        {
            width: 400px;
            height: 70px;
            margin: 10px 0;
        }
        .cropped>img
        {
            margin-right: 10px;
        }
        .file {
		    position: relative;
		    display: inline-block;
		    border-radius: 4px;
		    padding: 4px 12px;
		    overflow: hidden;
		    color:#fff;
		    background-color:#2ecc71;
		    text-decoration: none;
		    text-indent: 0;
		    line-height: 20px;
		    font-size:15px;
		}
		.file input {
		    position: absolute;
		    font-size: 100px;
		    right: 0;
		    top: 0;
		    opacity: 0;
		}
		.file:hover {
		    background: #AADFFD;
		    border-color: #78C3F3;
		    color: #004974;
		    text-decoration: none;
		}
    </style>
	<script src="<%=basePath%>myinfo/js/cropbox.js"></script>
	

	
<title>个人信息修改</title>
</head>
<body style="width:1239px;height:620px;background:#f5f5f5">
<div class="about" id="about" style = "width:1147px;height:620px">
	<div class="col-md-6 person-info-agileits-w3layouts" style="padding-top: 130px;padding-left:200px;">
		<img class="double-border" style = "display:unset;" src="http://localhost:8080/RailwayDataAnalysis/images/users/${user.user_id }.jpg?date=<%=Math.random()%>" alt="显示不了喵" />
		<br/><button id = "change"class="btn btn-success btn-xs " style="width:92px;height:28px;padding-left: 5px;margin-left: 53px;margin-top: 20px;">更换头像 </button>
	</div>
		<div class="col-md-6 person-info-agileits-w3layouts" style="padding-top: 20px;">
		<h3 class="w3_head w3_head1" style="font-weight: bold;color:#34495E;margin-bottom:30px;">修改个人信息 <span>modify user information</span></h3>
		<form class = "changeMyInfo" action = "<%=basePath%>user/updateProfile" method = "POST">
		<div style="height:50px">
	   		 <p class="col-xs-5" style="width:150px;font-size: 18px;color:#34495E;">姓名:</p>
			 <input id = "user_name" name = "user_name" class="col-xs-5" value = "${user.user_name}"type="text" class="form-control input-sm" readonly = "readonly" >
		</div>
		
		<div style="height:45px">
	   		 <p class="col-xs-5" style="width:150px;font-size: 18px;color:#34495E;">工号:</p>
			 <input class="col-xs-5" id = "user_id" name = "user_id" value = "${user.user_id}" type="text" class="form-control input-sm" readonly = "readonly" >
		</div>
		
		<div style="height:45px">
	   		 <p class="col-xs-5" style="width:150px;font-size: 18px;color:#34495E;">电话:</p>
			 <input onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')" class="col-xs-5" id = "user_tel" name = "user_tel" value = "${user.user_tel}" type="text" class="form-control input-sm" datatype="n11-11"nullmsg="必填项不能为空！"errormsg="手机号需为11位数字！"/>
		</div>
		<div style="height:45px">
	   		 <p class="col-xs-5" style="width:150px;font-size: 18px;color:#34495E;">电子邮箱:</p>
			 <input class="col-xs-5" id = "user_email" name = "user_email" value = "${user.user_email}" type="text" class="form-control input-sm"datatype="e"nullmsg="必填项不能为空！"errormsg="请正确填写邮箱！">
		</div>
		<div style="height:45px">
	   		 <p class="col-xs-5" style="width:150px;font-size: 18px;color:#34495E;">所属部门:</p>
	   		 <c:forEach items="${depType}" var="item">
	   		 <c:if test = "${user.user_department == item.dict_id }">
	   		 <input id = "user_department" name = "user_department" value = "${user.user_department }" type="hidden">
			 <input class="col-xs-5" value = "${item.dict_item_name }"type="text" class="form-control input-sm" readonly = "readonly" >
			 </c:if>
			 </c:forEach>		
		</div>
		<div class = "MyinfoError" style="height:35px;color:#F00">
	   		 <p class="col-xs-5" style="width:150px"></p>
		</div>
		<div style="height:50px">
		<button class="btn btn-yellow btn-xs " style="width:92px;height:39px;padding-left: 5px;margin-left: 150px;margin-right: 50px;">保     存 </button>
		<input type = "button" value = "取消" onclick = "cancel()" class="btn btn-yellow btn-xs" style="width:92px;height:39px;">
		</div>
		</form>
		
		
</div>
</div>

	<div id="gray1"></div>
								
	<div class="popup" id="popup_ghtx" style ="width:450px;height:540px">

	<div class="top_nav" id='top_nav'style ="width:449px">
		<div align="center">
			<span>更改头像</span>
			<j class="guanbi"></j>
		</div>
	</div>
		<div class = "min">
		<div class="container">
    <div class="imageBox">
        <div class="thumbBox"></div>
        <div class="spinner" style="display: none">Loading...</div>
    </div>
    <div class="action">
    	<a class="file">选择文件
    	<input type="file" name="" id="file">
		</a>
        <input type="button" id="btnCrop" value="上传" style="height:28px;width:84px;border-width:0px;border-radius: 4px;font-size:15px;color:#fff;background-color:#2ecc71;float: right">
        <input type="button" id="btnZoomIn" value="+" style="margin-right:10px;height:28px;width:28px;border-width:0px;border-radius: 4px;font-size:15px;color:#fff;background-color:#2ecc71;float: right">
        <input type="button" id="btnZoomOut" value="-" style="margin-right:10px;height:28px;width:28px;border-width:0px;border-radius: 4px;font-size:15px;color:#fff;background-color:#2ecc71;float: right">
    </div>
    <div class="cropped">
    </div>
	</div>
	</div>
	
<script>
$(window).load(function() {
    var options =
    {
        thumbBox: '.thumbBox',
        spinner: '.spinner',
        imgSrc: 'http://localhost:8080/RailwayDataAnalysis/images/users/${user.user_id }.jpg?n=<%=(int)(Math.floor(Math.random()*10))%>'
    }
    var cropper = $('.imageBox').cropbox(options);
    $('#file').on('change', function(){
        var reader = new FileReader();
        reader.onload = function(e) {
            options.imgSrc = e.target.result;
            cropper = $('.imageBox').cropbox(options);
        }
        reader.readAsDataURL(this.files[0]);
        this.files = [];
    })
    $('#btnCrop').on('click', function(){
        var img = cropper.getDataURL();
        $.ajax({
    		type:'POST',
    		url: 'SaveImages',
    		data:{"url":img},
    		dataType:'json',
    		async:false,
    		cache:false,
    		success:function(data){
    			var res = data.status;
    			if(res == 'n'){
    				alert("图片上传异常!请刷新页面重试!");
    			}
    			if(res == 'y'){
    				alert("图片上传成功!");
    				if($.browser.mozilla)
    					parent.location.reload();
    				 else
    					 window.location='NewNewWelcome.jsp';
    			    }
    			}
    		});            
       
    })
    $('#btnZoomIn').on('click', function(){
        cropper.zoomIn();
    })
    $('#btnZoomOut').on('click', function(){
        cropper.zoomOut();
    })
});
function cancel(){
	if($.browser.mozilla)
		top.location.href = "<%=basePath%>homepage";
	 else
		top.location.href = "<%=basePath%>homepage";
}
$(function(){
	$(".changeMyInfo").Validform({
		tiptype:function(msg,o,cssctl){
			var objtip=$(".MyinfoError");
			cssctl(objtip,o.type);
			objtip.text(msg);
		},
		ajaxPost:true,
		callback:function(data){
			var res = data.status;
			var objtip=$(".MyinfoError");
			if(res == 'n'){
				alert("修改失败!请刷新页面重试!");
				objtip.text('修改失败!');
			}
			if(res == 'y'){
				setTimeout('cancel()',1000); 
				alert("修改成功!关闭窗口后将跳转至主界面...");
				objtip.text('修改成功!');
			}
		}
	});
	
});
</script>
	</div>
	<script src="<%=basePath%>myinfo/js/popup.js"></script>
</body>
</html>