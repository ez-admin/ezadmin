<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>用户/会员新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
	<div class="layui-field-box">
		<form id="formid" class="layui-form">
			<input type="hidden" name="optype" value="${optype}">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-inline">
					<input type="text" name="lognm" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-inline">
					<input type="text" name="logpwd" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">角色名称:</label>
				<div class="layui-input-inline">
					<select name="rlid" id="rlid" lay-verify="required" lay-filter="rlid">
						<option value="">请选择</option>
					</select>
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">是否启用</label>
				<div class="layui-input-block">
					<input type="checkbox" name="isused" value="1" lay-skin="switch" lay-text="是|否" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">真实姓名:</label>
				<div class="layui-input-inline">
					<input type="text" name="userrelnm" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">身份证号:</label>
				<div class="layui-input-inline">
					<input type="text" name="idnum" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号码:</label>
				<div class="layui-input-inline">
					<input type="text" name="mobile" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱:</label>
				<div class="layui-input-inline">
					<input type="text" name="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
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
			//后台获取select值
			$.ajax({
				url: '/ez/system/sysrole/getSdBySdtCode.do',
				type: "POST",
				//data:{code:5606},
				dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
				success: function (result) {
					$("#rlid").append(result);
					form.render('select');
				}
			});
			//监听提交
			form.on('submit(add)', function(data){
				//layer.msg(JSON.stringify(data.field));
				$.ajax({
					url: "/ez/system/sysuser/add.do",
					type: "POST",
					data:$('#formid').serialize(),// 你的formid
					success: function (result) {
						if("suc"==(result.msg)){
							//关闭窗口
							top.layer.closeAll();
							top.layer.msg('保存成功!',{icon: 1});
						}else{
							top.layer.msg('保存失败!'+result.message,{icon: 2},function () {
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