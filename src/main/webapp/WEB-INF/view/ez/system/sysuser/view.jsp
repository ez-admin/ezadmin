<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>系统用户/会员新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<input type="hidden" name="optype" value="${optype}">
		<div class="layui-form-item">
			<label class="layui-form-label">用户名:</label>
			<div class="layui-input-inline">
				<input type="text" name="lognm"  value="${sysuser.lognm}" readonly class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">密码:</label>
			<div class="layui-input-inline">
				<input type="text" name="logpwd" value="${sysuser.logpwd}" readonly class="layui-input">
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">角色名称:</label>
			<div class="layui-input-inline">
				<select name="rlid" id="rlid" lay-verify="required" lay-filter="rlid" disabled>
					<option value="">请选择</option>
				</select>
			</div>
			<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">是否启用</label>
			<div class="layui-input-block">
				<c:if test="${sysuser.isused ==1}">
					<input type="checkbox" name="isused" lay-skin="switch" lay-text="是|否" disabled checked>
				</c:if>
				<c:if test="${sysuser.isused ==0}">
					<input type="checkbox" name="isused" lay-skin="switch" lay-text="是|否" disabled >
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">真实姓名:</label>
			<div class="layui-input-inline">
				<input type="text" name="userrelnm" value="${sysuser.userrelnm}" readonly class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">身份证号:</label>
			<div class="layui-input-inline">
				<input type="text" name="idnum" value="${sysuser.idnum}" readonly class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号码:</label>
			<div class="layui-input-inline">
				<input type="text" name="mobile" value="${sysuser.mobile}" readonly class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱:</label>
			<div class="layui-input-inline">
				<input type="text" name="email" value="${sysuser.email}" readonly class="layui-input">
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
		$.ajax({url: "/ez/system/sysrole/getSdBySdtCode.do",
			type: "POST",
			data:{selected:'${sysuser.rlid}'},
			dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
			success: function (result) {
				$("#rlid").append(result);
				form.render('select');
			}
		});

	});
</script>
</body>
</html>