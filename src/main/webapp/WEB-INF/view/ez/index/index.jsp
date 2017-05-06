<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<title>${SYSNAME}</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">

	<link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/layout.css" media="all" />
    <link rel="stylesheet" href="/static/css/public.css" class="css">

</head>
<body>
<div class="layui-layout layui-layout-admin beg-layout-container">
    <!-- 页面顶部¨ -->
    <%@ include file="head.jsp"%>
    <!-- 侧边导航栏-->
    <div class="layui-side beg-layout-side" id="side" lay-filter="side"></div>
    <!--内容区域-->
    <div class="layui-body beg-layout-body">
        <div class="layui-tab layui-tab-brief layout-nav-card" lay-filter="layout-tab" style="border: 0; margin: 0;box-shadow: none; height: 100%;">
            <ul class="layui-tab-title">
                <li class="layui-this">
                    <a href="javascript:;">
                        <i class="fa fa-dashboard" aria-hidden="true"></i>
                        <cite>控制面板</cite>
                    </a>
                </li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe src="/ez/syslogin/tab.do"></iframe>
                </div>
            </div>
        </div>
    </div>
    <!--页脚-->
    <%@ include file="foot.jsp"%>
</div>
<script src="/static/plugins/layui/layui.js "></script>
<script src="/static/js/layout.js "></script>
</body>
</html>





