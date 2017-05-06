<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>系统参数编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
	<style>
		.layui-form-label {
			width: 120px;
		}
		.layui-input-block {
			margin-left: 150px;
		}
	</style>
</head>
<body>
<div class="layui-field-box">
	<blockquote class="layui-elem-quote">
		<p>温馨提示：部分配置需重新登陆系统生效！</p>
	</blockquote>
	<form id="formid" class="layui-form">
		<c:forEach items="${optionList}" var ="sysoption" varStatus="status">
		<input type="hidden" value="${sysoption.oid}" name="sysOptionList[${status.index}].oid" >
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">${sysoption.optionName}：</label>
			<div class="layui-input-block">
				<input type="text" name="sysOptionList[${status.index}].optionValue" value="${sysoption.optionValue}"  placeholder="请输入${sysoption.optionName}" autocomplete="off" class="layui-input">
			</div>
		</div>
		</c:forEach>
		<shiro:hasPermission name="option_listmodify">
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="edit">编辑</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</shiro:hasPermission>
	</form>
</div>
<script>
	//Demo
	layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;
		//监听提交
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/system/sysoption/updateList.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('修改成功!',{icon: 1});
					}else{
						top.layer.msg('修改失败!'+result.message,{icon: 2},function () {
							location.reload();
						});
					}
				}
			});
			return false;
		});

	});
</script>
</body>
</html>
