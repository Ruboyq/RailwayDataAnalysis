/**
 * 
 */
function init() {
    $("#id").val("");
    $("#password").val("");
    $("#yzm").val("");
}
function myReload() {  
    document.getElementById("CreateCheckCode").src = document  
            .getElementById("CreateCheckCode").src  
            + "?nocache=" + new Date().getTime();  
}  
$(function(){
$(".i-text").focus(function(){
$(this).addClass('h-light');
});

$(".i-text").focusout(function(){
$(this).removeClass('h-light');
});

$("#id").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});

$("#id").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});


$("#password").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});



$("#yzm").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});

$("#yzm").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});
});
