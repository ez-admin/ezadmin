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
<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap-table.css">
<style>
    .clear{
        clear: both;
    }
    .layui-elem-quote{
        margin-bottom: 10px!important;
        line-height: 34px;
        border-left: 5px solid #3c8dbc;
        border-radius: 0 2px 2px 0;
        background-color: #f2f2f2;
    }
    .layui-form-mid i,.layui-word-aux i{
        line-height: inherit;
    }
</style>