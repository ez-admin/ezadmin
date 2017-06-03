<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>分配角色</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<input type="hidden" name="userno" value="${userno}" />
		<div class="layui-form-item">
			<label class="layui-form-label">分配角色:</label>
			<div class="layui-input-inline" style="width: 80%">
				<c:forEach items="${sysRoleList}" var ="sysrole" >
					<c:if test="${sysrole.hasRole== true}">
						<input type="checkbox"  name="roleId" value="${sysrole.roleId}" title="${sysrole.roleName}" checked>
					</c:if>
					<c:if test="${sysrole.hasRole== false}">
						<input type="checkbox"  name="roleId" value="${sysrole.roleId}" title="${sysrole.roleName}" >
					</c:if>
				</c:forEach>
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="modify">修改</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
		//监听提交
		form.on('submit(modify)', function(data){
			//layer.msg(JSON.stringify(data.field));
			if($("input[name='roleId']:checked").size() != 0){
				$.ajax({
					url: "/ez/system/sysuser/assignrole.do",
					type: "POST",
                    async: false,
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
			}else {
				top.layer.msg('请至少选择一角色！');
			}
		});
	});
</script>
</body>
</html>
