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
    <%--Cropper plugins--%>
    <link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
    <link rel="stylesheet" href="/static/plugins/cropper/css/cropper.min.css">
    <link rel="stylesheet" href="/static/plugins/cropper/css/sitelogo.css">
    <style>
        .modal-backdrop {
            z-index: 999;
        }
         a:active,a:hover,a:link,a:visited{
            text-decoration:none;
        }
        .beg-layou-head #usericon,.beg-layou-head #username{
            float: left;
        }
    </style>
    <%--layui--%>
	<link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/css/layout.css" media="all" />
    <link rel="stylesheet" href="/static/css/public.css" class="css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
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
<%--jquery--%>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<%--layui--%>
<script src="/static/plugins/layui/layui.js "></script>
<script src="/static/js/layout.js "></script>
<%--Cropper plugins--%>
<script src="/static/plugins/bootstrap3.3.7/js/bootstrap.min.js"></script>
<script src="/static/plugins/cropper/js/cropper.min.js"></script>
<script src="/static/plugins/cropper/js/sitelogo.js"></script>
<script src="/static/plugins/cropper/js/html2canvas.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    //做个下简易的验证  大小 格式
    $('#avatarInput').on('change', function(e) {
        var filemaxsize = 1024 * 5;//5M
        var target = $(e.target);
        var Size = target[0].files[0].size / 1024;
        if(Size > filemaxsize) {
            alert('图片过大，请重新选择!');
            $(".avatar-wrapper").childre().remove;
            return false;
        }
        if(!this.files[0].type.match(/image.*/)) {
            alert('请选择正确的图片!')
        } else {
            var filename = document.querySelector("#avatar-name");
            var texts = document.querySelector("#avatarInput").value;
            var teststr = texts; //你这里的路径写错了
            testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
            filename.innerHTML = testend;
        }

    });

    $(".avatar-save").on("click", function() {
        var img_lg = document.getElementById('imageHead');
        // 截图小的显示框内的内容
        html2canvas(img_lg, {
            allowTaint: true,
            taintTest: false,
            onrendered: function(canvas) {
                canvas.id = "mycanvas";
                //生成base64图片数据
                var dataUrl = canvas.toDataURL("image/jpeg");
                var newImg = document.createElement("img");
                newImg.src = dataUrl;
                imagesAjax(dataUrl)
            }
        });
    })

    function imagesAjax(src) {
        var data = {};
        data.img = src;
        data.jid = $('#jid').val();
        $.ajax({
            url: "/ez/system/sysuser/usericon.do",
            data: data,
            type: "POST",
            dataType: 'json',
            success: function(result) {
                if(result.msg == 'suc') {
                    $('.avatar-view img').attr('src',src );
                }
            }
        });
    }
</script>

</body>
</html>





