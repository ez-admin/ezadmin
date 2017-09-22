<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path;
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>系统登录</title>
    <link rel="stylesheet" href="/static/css/loginp.css" />
    <style>
        /*body{height:100%;background:#3c8dbc;overflow:hidden;}*/
        body{height:100%;
            background-color: #3c8dbc;
            //background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zd…AiIHk9IjAiIHdpZHRoPSIxIiBoZWlnaHQ9IjEiIGZpbGw9InVybCgjdnNnZykiIC8+PC9zdmc+);
            background-image: -webkit-gradient(linear, 0% 0%, 100% 100%, color-stop(0, #3f95ea), color-stop(1, #52d3aa));
            background-image: -webkit-repeating-linear-gradient(top left, #3f95ea 0%, #52d3aa 100%);
            background-image: repeating-linear-gradient(to bottom right, #3f95ea 0%, #52d3aa 100%);
            background-image: -ms-repeating-linear-gradient(top left, #3f95ea 0%, #52d3aa 100%);
            overflow:hidden;}
        canvas{z-index:-1;position:absolute;}
    </style>
</head>
<body>
<canvas class="pg-canvas" width="1920" height="950"></canvas>
<dl class="admin_login">
    <dt>
        <strong>EzAadmin 后台管理系统</strong>
        <em>EzAadmin Management System</em>
    </dt>
    <form id="loginform" action="/ez/syslogin/login.do" method="post">
        <dd class="user_icon">
            <input type="text" name="username" id="username" placeholder="请输入账号" class="login_txtbx">
        </dd>
        <dd class="pwd_icon">
            <input type="password" name="password" id="password" placeholder="请输入密码" class="login_txtbx">
        </dd>
        <dd>
            <input type="button" onclick="login()" value="立即登陆" class="submit_btn">
        </dd>
    </form>
    <dd>
        <p>ezAdmin © www.chenez.cn 版权所有</p>
    </dd>
</dl>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/layer/layer.js"></script>
<script type="text/javascript" src="/static/js/md5.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/js/Particleground.js" charset="utf-8"></script>
<script>
    $(function(){
        //粒子背景特效
        $('body').particleground({
            /*dotColor: '#5cbdaa',
            lineColor: '#5cbdaa'*/
            dotColor: 'rgba(255, 255, 255, 0.6)',
            lineColor: 'rgba(255, 255, 255, 0.6)'
        });
    });

    <c:if test="${!empty loginmessage}">
        top.layer.alert("${loginmessage}", {icon: 7});
    </c:if>

    //监听enter事件
    $(function(){
        $("#username").focus();
        $("#username").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
        $("#password").keydown(function(event){
            if(event.keyCode==13){
                login();
            }
        });
    });
    //客户端校验
    function check() {
        if ($("#username").val() == "") {
            top.layer.msg("用户名不能为空！", {icon: 7});
            $("#username").focus();
            return false;
        } else {
            $("#username").val(jQuery.trim($('#username').val()));
        }
        if ($("#password").val() == "") {
            top.layer.msg("密码不能为空！", {icon: 7});
            $("#password").focus();
            return false;
        }
        return true;
    }
    //登陆
    function login() {
        if (check()) {
            //$(".submit_btn").attr("disabled","disabled");
            top.layer.load();
            /*top.layer.msg('正在登陆中，请稍后...', {
                icon: 16
                ,shade: 0.01
            });*/
            $("#loginform").submit();
        }
    }
</script>
</body>
</html>
