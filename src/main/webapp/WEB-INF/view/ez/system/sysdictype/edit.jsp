<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE>
<html>
<head>
	<title>系统字典名称新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<input type="hidden" name="oldname" value="${sysdictype.name}">
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>类型编码:</label>
			<div class="layui-input-block">
				<input type="text" value="${sysdictype.code}" name="code" readonly class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>类型名称:</label>
			<div class="layui-input-block">
				<input type="text" value="${sysdictype.name}" name="name" required  lay-verify="required" placeholder="请输入字典类型名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>是否启用:</label>
			<div class="layui-input-switch">
				<c:if test="${sysdictype.flag ==1}">
					<input type="checkbox" name="flag" lay-skin="switch" lay-text="是|否" value="1" checked>
				</c:if>
				<c:if test="${sysdictype.flag ==0}">
					<input type="checkbox" name="flag" lay-skin="switch" lay-text="是|否" value="1">
				</c:if>

			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">备注：</label>
			<div class="layui-input-block">
				<textarea name="remark" placeholder="请输入备注内容" class="layui-textarea">${sysdictype.remark}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="edit">编辑</button>
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
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/system/sysdictype/update.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('修改成功!',{icon: 1});
					}else{
						top.layer.msg('修改失败!'+result.message,{icon: 2,time:5000});
					}
				}
			});
			return false;
		});
	});
</script>
</body>
</html>