<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看标签表信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>名称:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsName" value="${cmstag.cmsName}"  required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input layui-disabled" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>操作时间:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsCreationTime" value="<fmt:formatDate value='${cmstag.cmsCreationTime}' type='both' pattern='yyyy-MM-dd'/>" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" onclick="layui.laydate({elem: this})" disabled>
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>文档数量:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsRefers" value="${cmstag.cmsRefers}" value="1"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input layui-disabled" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="top.layer.closeAll()">关闭</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<script>
	//Demo
	layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;

	});
</script>
</body>
</html>
