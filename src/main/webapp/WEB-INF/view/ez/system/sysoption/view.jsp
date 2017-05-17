<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看系统设置信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label">参数id:</label>
			<div class="layui-input-inline">
				<input type="text" name="oid" value="${sysoption.oid}"   lay-verify="required" placeholder="请输入参数id" autocomplete="off" class="layui-input layui-disabled" readonly>
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">参数值：</label>
			<div class="layui-input-block">
				<textarea name="optionValue"  placeholder="请输入参数值" class="layui-textarea layui-disabled" readonly>${sysoption.optionValue}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">参数名称:</label>
			<div class="layui-input-inline">
				<input type="text" name="optionName" value="${sysoption.optionName}"  placeholder="请输入参数名称" autocomplete="off" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">参数排序:</label>
			<div class="layui-input-inline">
				<input type="number" name="optionOrder" value="${sysoption.optionOrder}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="top.layer.closeAll()">关闭</button>
			</div>
		</div>
	</form>
</div>
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
