<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看城市信息表信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label">城市名:</label>
			<div class="layui-input-inline">
				<input type="text" name="name" value="${syscity.name}"  placeholder="请输入城市名" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">url地址:</label>
			<div class="layui-input-inline">
				<input type="text" name="url" value="${syscity.url}"  placeholder="请输入url地址" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">是否最明细科目（0否1是）:</label>
			<div class="layui-input-inline">
				<input type="text" name="leaf" value="${syscity.leaf}"  placeholder="请输入是否最明细科目（0否1是）" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">父级id:</label>
			<div class="layui-input-inline">
				<input type="number" name="parentId" value="${syscity.parentId}"   maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
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
