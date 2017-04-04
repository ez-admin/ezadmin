<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>登录</title>
    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/static/css/login.css" />
</head>
<body class="beg-login-bg">
<div class="beg-login-box">
    <header>
        <h1>ezAdmin后台管理系统</h1>
    </header>
    <div class="beg-login-main">
        <form class="layui-form">
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe612;</i>
                </label>
                <input type="text" name="userName" id="username" lay-verify="userName" autocomplete="off" placeholder="这里输入登录名" class="layui-input">
            </div>
            <div class="layui-form-item">
                <label class="beg-login-icon">
                    <i class="layui-icon">&#xe642;</i>
                </label>
                <input type="password" name="password" id="password" lay-verify="password" autocomplete="off" placeholder="这里输入密码" class="layui-input">
            </div>
            <div class="layui-form-item">
                <div class="beg-pull-left beg-login-remember">
                    <label>记住帐号？</label>
                    <input type="checkbox" name="rememberMe" value="true" lay-skin="switch" checked title="记住帐号">
                </div>
                <div class="beg-pull-right">
                    <button class="layui-btn layui-btn-primary" type="button" onclick="login()">
                        <i class="layui-icon">&#xe650;</i> 登录
                    </button>
                </div>
                <div class="beg-clear"></div>
            </div>
        </form>
    </div>
    <footer>
        <p>ezAdmin © www.chenez.cn</p>
    </footer>
</div>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/layui/lay/dest/layui.all.js"></script>
<script>
    var layer = layui.layer;
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
            var password = $("#password").val();
            //登录处理
            $.post("/ez/syslogin/login.do",
                    {"lognm": username, "logpwd": password},
                    function (result) {

                        if (result == null) {
                            layer.msg('登陆失败！', {icon: 2});
                            return false;
                        }
                        if (result.status == "true" || result.status == true) {
                            layer.msg('登陆成功！', {icon: 1});
                            window.location.href = "/ez/syslogin/index.do";
                        } else {
                            layer.msg(result.message, {icon: 7});
                        }

                    }, "json");
        }
    }
</script>
</body>
</html>
