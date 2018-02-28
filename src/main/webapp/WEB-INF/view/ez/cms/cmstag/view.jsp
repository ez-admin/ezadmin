<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看标签信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="container">
	<form id="formid" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>名称:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsName" value="${cmstag.cmsName}"  required="required" placeholder="请输入名称" autocomplete="off" class="form-control" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>操作时间:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsCreationTime" value="<fmt:formatDate value='${cmstag.cmsCreationTime}' type='both' pattern='yyyy-MM-dd'/>" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="form-control" disabled>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>文档数量:</label>
			<div class="col-sm-10">
				<input type="number" name="cmsRefers" value="${cmstag.cmsRefers}" required="required" maxlength="10"  autocomplete="off" class="form-control" disabled>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-10">
				<button class="btn btn-default" onclick="top.layer.closeAll()">关闭</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<%--<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>--%>
<link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
<!--layer-->
<script type="text/javascript" src="/static/plugins/layer/layer.js"></script>
<script>
	//Demo
	/*layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;

	});*/
</script>
</body>
</html>
