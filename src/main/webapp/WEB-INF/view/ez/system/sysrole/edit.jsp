<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<%@ include file="/WEB-INF/view/ez/index/selpath.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>角色名称修改</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
        <input type="hidden" name="roleId" value="${sysrole.roleId}">
		<div class="layui-form-item">
			<label class="layui-form-label">角色类型:</label>
			<div class="layui-input-inline">
				<select name="roleType" id="roleType"  lay-verify="required" lay-filter="roleType">
					<option value="">请选择</option>
				</select>
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称:</label>
			<div class="layui-input-inline">
				<input type="text" name="roleName" value="${sysrole.roleName}" required  lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
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
		//后台获取select值
		$.ajax({
			url: '/ez/system/sysdictionary/getSdBySdtCode.do',
			type: "POST",
			data:{code:5606,selected:'${sysrole.roleType}'},
			dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
			success: function (result) {
				$("#roleType").append(result);
				form.render('select');
			}
		});
		//监听提交
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
            //alert($('#formid').serialize());
			$.ajax({
				url: "/ez/system/sysrole/update.do",
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