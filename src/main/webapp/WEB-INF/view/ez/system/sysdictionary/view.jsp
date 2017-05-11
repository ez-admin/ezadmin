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
		<input type="hidden" name="id" value="${sysdictionary.id}">
		<div class="layui-form-item">
			<label class="layui-form-label">类型名称:</label>
			<div class="layui-input-inline">
				<select name="code" id="code" lay-verify="required" lay-filter="code" readonly>
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">字典key值:</label>
			<div class="layui-input-inline">
				<input type="text" value="${sysdictionary.sdkey}" readonly class="layui-input" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">字典value值:</label>
			<div class="layui-input-inline">
				<input type="text" value="${sysdictionary.sdvalue}" readonly  class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注：</label>
			<div class="layui-input-block">
				<textarea readonly class="layui-textarea layui-disabled">${sysdictionary.remark}</textarea>
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
		//后台获取select值
		$.ajax({url: "/ez/system/sysdictype/getSdBySdtCode.do",
			type: "POST",
			data:{selected:${sysdictionary.code}},
			dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
			success: function (result) {
				$("#code").append(result);
				form.render('select');
			}
		});

	});
</script>
</body>
</html>