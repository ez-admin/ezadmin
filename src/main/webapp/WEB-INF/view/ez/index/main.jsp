<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <meta charset="UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/static/css/main.css" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="/static/js/html5shiv.min.js"></script>
    <script src="/static/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="admin-main">
    <blockquote class="layui-elem-quote">
        <p>用户信息</p>
    </blockquote>
    <fieldset class="layui-elem-field">
        <div class="layui-field-box">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>当前用户名</legend>
                <div class="layui-field-box">
                    <p>${sysuser.lognm}</p>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>最近登陆时间</legend>
                <div class="layui-field-box">
                    <p>${sysuser.lastlogin}</p>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>最近登陆IP</legend>
                <div class="layui-field-box">
                    <p>${sysuser.loginip}</p>
                </div>
            </fieldset>
        </div>
    </fieldset>
    <blockquote class="layui-elem-quote">
        <p>系统信息</p>
    </blockquote>
    <fieldset class="layui-elem-field">
        <div class="layui-field-box">
            <fieldset class="layui-elem-field layui-field-title">
                <legend>系统操作环境</legend>
                <div class="layui-field-box">
                    <p>${osName}&nbsp;&nbsp;${osArch}&nbsp;&nbsp;${osVersion}</p>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>java 运行环境</legend>
                <div class="layui-field-box">
                    <p>Java(TM) SE Runtime Environment&nbsp;&nbsp;${javaVersion}</p>
                </div>
            </fieldset>
            <fieldset class="layui-elem-field layui-field-title">
                <legend>Java 安装目录</legend>
                <div class="layui-field-box">
                    <p>${javaHome}</p>
                </div>
            </fieldset>
        </div>
    </fieldset>
</div>
</body>
</html>