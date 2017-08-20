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
        body{height:100%;background:#16a085;overflow:hidden;}
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
    <dd class="user_icon">
        <input type="text" name="userName" id="username" placeholder="请输入账号" class="login_txtbx">
    </dd>
    <dd class="pwd_icon">
        <input type="password" name="password" id="password" placeholder="请输入密码" class="login_txtbx">
    </dd>
    <dd>
        <input type="button" onclick="login()" value="立即登陆" class="submit_btn">
    </dd>
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
        <c:if test="${id !=null && id == 1}">
            top.location.href = "/ez/syslogin/loginsession/2.do";
        </c:if>
        <c:if test="${id !=null && id == 3}">
            top.location.href = "/ez/syslogin/loginsession/4.do";
        </c:if>
        //粒子背景特效
        $('body').particleground({
            dotColor: '#5cbdaa',
            lineColor: '#5cbdaa'
        });
    });
</script>
<script >
    $(function() {
        <c:if test="${id !=null && id == 2}">
        top.layer.alert('您的账号正在另一客户端登录！', {icon: 7});
        $.ajax({
            url: "/ez/syslogin/removeSession.do",
            type: "POST",
            success: function (result) {

            }
        });
        </c:if>
        <c:if test="${id !=null && id == 4}">
        top.layer.alert('会话超时，请重新登录！', {icon: 7});
        </c:if>
    });
</script>
<script>
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
            layer.msg("用户名不能为空！", {icon: 7});
            $("#username").focus();
            return false;
        } else {
            $("#username").val(jQuery.trim($('#username').val()));
        }
        if ($("#password").val() == "") {
            layer.msg("密码不能为空！", {icon: 7});
            $("#password").focus();
            return false;
        }
        return true;
    }
    //登陆
    function login() {
        if (check()) {
            var username = $("#username").val();
            var password = md5($("#password").val());
            //登录处理
            $.post("/ez/syslogin/login.do",
                    {"lognm": username, "logpwd": password},
                    function (result) {
                        if (result == null) {
                            layer.msg('登陆失败！', {icon: 2});
                            return false;
                        } else if (result.status == "true" || result.status == true) {
                            layer.msg('登陆成功！', {icon: 1});
                            window.location.href = "/ez/syslogin/index.do";
                        } else {
                            layer.msg(result.message, {icon: 7});
                            return false;
                        }
                    }, "json");
        }
    }
</script>
</body>
</html>
