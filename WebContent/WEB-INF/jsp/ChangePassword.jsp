<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<!-- saved from url=(0065)http://validform.rjboy.cn/demo/demo_usePlugin_strengthAlways.html -->
<html lang="en"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="<%=basePath%>yzm/style.css" type="text/css" media="all">
<link href="<%=basePath%>/yzm/demo.css" type="text/css" rel="stylesheet">
<script async="" src="<%=basePath%>yzm/analytics.js.下载"></script>
<script type="text/javascript" src="<%=basePath%>yzm/jquery-1.6.2.min.js.下载"></script>
<script type="text/javascript" src="<%=basePath%>yzm/Validform_v5.3.2_min.js.下载"></script>

<script type="text/javascript" src="<%=basePath%>yzm/passwordStrength-min.js.下载"></script>
</head>

<body style="height: 600px;">  
<!-- url(images/banner.jpg) no-repeat center top; -->
<div class="main" style="height: 100%;background:#f5f5f5">
    <div class="wraper" style = "margin-top:50px;margin-left:100px">
    	<h1 class="m_head wow rollIn" data-wow-delay="0.4s" style="text-align:left;font-weight:bold;color: #9ea7b3;font-size: 40px;line-height: 1.5em;">
    	Security Service Center</h1>
        
        <form class="changePassword" action="<%=basePath%>user/changePassword" method="POST" style = "font-size:18px;line-height:1.72">
            <table width="100%" style="table-layout:fixed;">
                <tbody><tr>
                    <td class="need" style="width:10px;">*</td>
                    <td style="width:100px;color:#9ea7b3">旧密码：</td>
                    <td style="width:210px;">
                        <input style = "border-radius:6px"type="password" value="" name="oldPassword" id = "oldPassword" class="inputxt" datatype="*6-18" errormsg="密码至少6个字符,最多18个字符！" nullmsg="请填写信息！">
                    </td>
                    <td>
                        <div class="Validform_checktip Validform_right"></div>
                    </td>
                </tr>
                <tr>
                    <td class="need" style="width:10px;">*</td>
                    <td style="width:100px;color:#9ea7b3">密码：</td>
                    <td style="width:290px;">
                        <input type="password" style = "margin-top:25px;border-radius:6px"value="" name="password" class="inputxt" plugin="passwordStrength" datatype="*6-18" errormsg="密码至少6个字符,最多18个字符！" nullmsg="请填写信息！">
                        <div class="passwordStrength" style="width:290px;font-size:15px">密码强度： <span class="bgStrength">弱</span><span>中</span><span class="last">强</span></div>
                    </td>
                    <td>
                        <div class="Validform_checktip Validform_right"></div>
                    </td>
                </tr>
                <tr>
                    <td class="need">*</td>
                    <td style="width:100px;color:#9ea7b3">确认密码：</td>
                    <td><input type="password" style = "border-radius:6px;"value="" name="repassword" class="inputxt" recheck="password" datatype="*6-18" errormsg="两次输入的密码不一致！" nullmsg="请填写信息！"></td>
                    <td><div class="Validform_checktip Validform_right">通过信息验证！</div></td>
                </tr>
                <tr>
                    <td class="need"></td>
                    <td></td>
                    <td colspan="2" style="padding:10px 0 18px 0;">
                        <button  type="submit" style = "font-family: Lato,Helvetica,Arial,sans-serif;margin-top:20px;height:40px;width:90px;border-radius:6px;border:none;color:#fff;background: #1f6ca0;" class="button" onclick = "return checkOldPassword('${password}')">保存</button>
                        <button  type="reset" style = "font-family: Lato,Helvetica,Arial,sans-serif;margin-top:20px;margin-left:40px;height:40px;width:90px;border-radius:6px;border:none;color:#fff;background: #1f6ca0;"class="button">重置</button>
                    </td>
                </tr>
            </tbody></table>
        </form>
         
    </div>
</div>
<script>
function changePage(){
	if($.browser.mozilla)
		top.location.href = "<%=basePath%>homepage";
	 else
		 top.location.href = "<%=basePath%>homepage";
}
$(function(){
	$(".changePassword").Validform({
		tiptype:2,
		usePlugin:{
			passwordstrength:{
				minLen:6,
				maxLen:18
			}
		},
		ajaxPost:true,
		callback:function(data){
			var res = data.status;
			if(res == 'n'){
				alert("修改失败!请刷新页面重试!");
			}
			if(res == 'y'){
				setTimeout('changePage()',1000); 
			}
		}
	});
})
function checkOldPassword(password){
	if($(oldPassword).val() == password)
		return true;
	else{
		alert("旧密码输入错误！");
		return false;
	}
}
</script>

</body></html>