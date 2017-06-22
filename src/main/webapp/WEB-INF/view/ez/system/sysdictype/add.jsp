<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>系统字典类型新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
	<div class="layui-field-box">
		<form id="formid" class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label"><em class="required">*</em>类型编码:</label>
				<div class="layui-input-block">
					<input type="text" name="code" required maxlength="4" lay-verify="number" placeholder="请输入字典类型编码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><em class="required">*</em>类型名称:</label>
				<div class="layui-input-block">
					<input type="text" name="name" required  lay-verify="required" placeholder="请输入字典类型名称" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><em class="required">*</em>是否启用:</label>
				<div class="layui-input-switch">
					<input type="checkbox" name="flag" lay-skin="switch" lay-text="是|否" checked value="1">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">备注：</label>
				<div class="layui-input-block">
					<textarea name="remark" placeholder="请输入备注内容" class="layui-textarea"></textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="add">保存</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
			//监听提交
			form.on('submit(add)', function(data){
				//layer.msg(JSON.stringify(data.field));
				$.ajax({
					url: "/ez/system/sysdictype/add.do",
					type: "POST",
					data:$('#formid').serialize(),// 你的formid
					success: function (result) {
						if("suc"==(result.msg)){
							//关闭窗口
							top.layer.closeAll();
							top.layer.msg('保存成功!',{icon: 1});
						}else{
							top.layer.msg('保存失败!'+result.message,{icon: 2,time: 5000});
						}
					}
				});
				return false;
			});
		});
	</script>
</body>
</html>