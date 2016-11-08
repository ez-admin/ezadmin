<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>ez后台管理系统</title>
	<link href="/static/login/css/login.css" rel="stylesheet">
	<link rel="stylesheet" href="/static/login/css/jquery-labelauty.css">
	<!-- Buttons 库的核心文件 -->
	<link rel="stylesheet" href="/static/login/css/button.css">
  
<script type="text/javascript" src="/static/login/js/jquery.js"></script>
<script type="text/javascript" src="/static/login/js/login.js"></script>
<!--居中显示start-->
<script type="text/javascript" src="/static/login/js/center-plugin.js"></script>
<!--居中显示end-->
<style>
/*提示信息*/	
#cursorMessageDiv {
	position: absolute;
	z-index: 99999;
	border: solid 1px #cc9933;
	background: #ffffcc;
	padding: 2px;
	margin: 0px;
	display: none;
	line-height:150%;
}
/*提示信息*/
</style>
<style type="text/css"> 
	html{
		background: url(/static/login/images/login-bg.png) no-repeat center center fixed;
		-webkit-background-size: cover;
		-moz-background-size: cover;
		-o-background-size: cover;
		background-size: cover;
	}
	.button-caution, .button-caution-flat {
		background-color: #E50012;
		border-color: #E50012;
		color: #FFF;
	}
	</style> 
</head>
<body>

	
		<div class="login-logo">
			<img src="/static/login/images/login-logo.png">
		</div>
		<h3>ez后台管理系统</h3>
		<div class="content-loginbox">
			<form class="post" id="loginForm" action="/ez/syslogin/login.do" class="login_form" method="post">
					<input type="text" name="username" id="username" class="username" placeholder="请输入您的用户名">
					<input type="password" name="password" id="password" class="password" placeholder="请输入您的用户密码">
					<div class="login_info" style="display:none;"></div>
					<div class="login_info2"></div>
					<div class="login_button">
						<button  class="button button-glow button-rounded button-raised button-primary"  type="button" onclick="login()">登&nbsp;录</button>
						<button  class="button button-glow button-rounded button-caution" type="reset" value="重置" >重&nbsp;置</button>
					</div>
	    	</form>
		</div>
		 <div class="login_bottom">
			<h5>
				<a href="#">@ez开发者版权所有</a>
				<%--<a href="ez/static/sysuser/test.html" target="_blank">查询用户信息并跳转到一个JSP页面22</a>--%>
			</h5>
		</div>
		<script src="/static/login/js/jquery-1.8.3.min.js"></script>
		<script src="/static/login/js/jquery-labelauty.js"></script>

<script>
	$(function(){
		//居中
		 //$('.login_main').center();
		 document.getElementById("username").focus();
		 $("#username").keydown(function(event){
		 	if(event.keyCode==13){
				login();
			}
		 })
		 $("#password").keydown(function(event){
		 	if(event.keyCode==13){
				login();
			}
		 })
		 
	});

	//登录
	function login() {
		var errorMsg = "";
		var username = document.getElementById("username");
		var password = document.getElementById("password");
		if(!username.value){
			errorMsg += "&nbsp;&nbsp;用户名不能为空!";
		}
		if(!password.value){
			errorMsg += "&nbsp;&nbsp;密码不能为空!";
		}

		if(errorMsg != ""){
			$(".login_info").html(errorMsg);
			$(".login_info").show();
		}else{
			$(".login_info").show();
			$(".login_info").html("&nbsp;&nbsp;正在登录中...");
			//登录处理
			$.post("<%=path%>/ez/syslogin/login.do",
				  {"lognm":username.value,"logpwd":password.value},
				  function(result){
					  if(result == null){
						  $(".login_info").html("&nbsp;&nbsp;登陆失败！");
						  return false;
					  }
					  if(result.status=="true"||result.status==true){
					  	  $(".login_info").html("&nbsp;&nbsp;登录成功，正在转到主页...");
						  window.location="<%=path%>/ez/syslogin/index.do";
					  }else{
					  	 $(".login_info").html("&nbsp;&nbsp;"+result.message);
					  }

				  },"json");
		}
	}
</script>
</body>
</html>

