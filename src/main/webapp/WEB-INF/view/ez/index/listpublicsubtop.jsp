<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path;
%>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap-table.css">
<style>
    .clear{
        clear: both;
    }
    .layui-input-quote{
        display: block;
        width: 150px;
        padding-left: 10px;
        height: 34px;
        line-height: 34px;
        border: 1px solid #e6e6e6;
        background-color: #fff;
        border-radius: 2px;
    }
    .layui-form-mid i,.layui-word-aux i{
        line-height: inherit;
    }
</style>