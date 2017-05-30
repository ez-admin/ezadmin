<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>系统字典名称新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>类型编码:</label>
			<div class="layui-input-inline">
				<input type="text" value="${sysdictype.code}" name="code" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>类型名称:</label>
			<div class="layui-input-inline">
				<input type="text" value="${sysdictype.name}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>是否启用:</label>
			<div class="layui-input-switch">
				<c:if test="${sysdictype.flag ==1}">
					<input type="checkbox" name="flag" lay-skin="switch" lay-text="是|否" disabled checked>
				</c:if>
				<c:if test="${sysdictype.flag ==0}">
					<input type="checkbox" name="flag" lay-skin="switch" lay-text="是|否" disabled >
				</c:if>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注：</label>
			<div class="layui-input-block">
				<textarea name="remark" class="layui-textarea layui-disabled" readonly>${sysdictype.remark}</textarea>
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
	layui.use(['layer', 'form','jquery'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery;

	});
</script>
</body>
</html>