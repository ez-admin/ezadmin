<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>个人信息设置</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<style>
		.layui-form-select{
			display: none;
		}
		.select2-search {
			display: none;
		}
		.select2-search__field{
			display: none;
		}
		.layui-form-label{
			width:120px;
		}
		.layui-form-onswitch i {
			left: 26px;
		}
		.layui-form-switch {
			width: 50px;
		}
		.select2-container--bootstrap .select2-results>.select2-results__options {
			max-height: 400px;
		}
		.layui-tab-title .layui-this {
			background-color: #fff;
		}
	</style>
</head>
<body>
<div class="layui-tab">
	<ul class="layui-tab-title">
		<li class="layui-this">信息设置</li>
		<li>密码修改</li>
	</ul>
	<div class="layui-tab-content">
		<div class="layui-tab-item layui-show">
			<div class="layui-field-box">
			<form id="formid" class="layui-form">
				<input type="hidden" name="userno" value="${sysuser.userno}">
				<input type="hidden" name="isused" value="${sysuser.isused}">
				<div class="layui-form-item">
					<label class="layui-form-label">用户名:</label>
					<c:if test="${sysuser.userno == 1000}">
						<div class="layui-input-inline">
							<input type="text" name="lognm"  value="${sysuser.lognm}" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input" readonly>
						</div>
						<div class="layui-form-mid layui-word-aux"><i class="fa fa-exclamation-triangle red"></i>系统开发人员不可以更改用户名！</div>
					</c:if>
					<c:if test="${sysuser.userno != 1000}">
						<div class="layui-input-inline">
							<input type="text" name="lognm"  value="${sysuser.lognm}" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
					</c:if>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属公司:</label>
					<div class="layui-input-inline" style="width: 400px">
						<select id="companyno" name="companyno" style="width: 100%" lay-verify="required">
							<option value="">请选择</option>
						</select>
					</div>
					<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所属部门:</label>
					<div class="layui-input-inline" style="width: 400px">
						<select id="dptno" name="dptno" style="width: 100%" lay-verify="required">
							<option value="">请选择</option>
						</select>
					</div>
					<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名:</label>
					<div class="layui-input-inline">
						<input type="text" name="userrelnm" value="${sysuser.userrelnm}" lay-verify="required" class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别:</label>
					<div class="layui-input-inline">
						<select name="sex" id="sex" lay-verify="required">
							<option value="">请选择</option>
						</select>
					</div>
					<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">年龄:</label>
					<div class="layui-input-inline">
						<input type="number" name="age" value="${sysuser.age}" autocomplete="off" maxlength="3" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号:</label>
					<div class="layui-input-inline">
						<input type="text" name="idnum" value="${sysuser.idnum}"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码:</label>
					<div class="layui-input-inline">
						<input type="text" name="mobile" value="${sysuser.mobile}" class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱:</label>
					<div class="layui-input-inline">
						<input type="text" name="email" value="${sysuser.email}" class="layui-input">
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
		</div>
		<div class="layui-tab-item">
			<form id="myform" class="layui-form">
				<input type="hidden" name="userno" value="${sysuser.userno}">
				<input type="hidden" name="isused" value="${sysuser.isused}">
				<div class="layui-form-item">
					<label class="layui-form-label">原密码:</label>
					<div class="layui-input-inline">
						<input type="password" id="oldlogpwd"  lay-verify="required" placeholder="请输入旧密码" autocomplete="off"  class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码:</label>
					<div class="layui-input-inline">
						<input type="password" id="onenewpwd"  lay-verify="required" placeholder="请输入新密码" autocomplete="off"  class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">新密码确认:</label>
					<div class="layui-input-inline">
						<input type="password" id="twonewpwd" name="logpwd"  lay-verify="required" placeholder="请再次输入密码" autocomplete="off"  class="layui-input">
					</div>
					<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit lay-filter="modify">编辑</button>
						<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<%--select2tree plugins--%>
<link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
<link rel="stylesheet" href="/static/plugins/select2tree/css/select2.min.css" class="css">
<link rel="stylesheet" href="/static/plugins/select2tree/css/select2-bootstrap.min.css" class="css">
<script type="text/javascript" src="/static/plugins/select2tree/js/select2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/plugins/select2tree/js/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/plugins/select2tree/js/select2tree.js" charset="utf-8"></script>
<script>
	//select2插件
	$(function() {
		$("#companyno").append('${companyList}');
		$("#dptno").append('${dptList}');
		$("#companyno").select2tree({
			placeholder: '请选择一个公司',
			allowClear: true
		});
		$("#dptno").select2tree({
			placeholder: '请选择一个部门',
			allowClear: true
		});
	});
	//Demo
	layui.use(['layer', 'form','jquery','element'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,element = layui.element();
		//后台获取select值
		$.ajax({url: "/ez/system/sysdictionary/getSdBySdtCode.do",
			type: "POST",
			data:{code:1002,selected:'${sysuser.sex}'},
			dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
			success: function (result) {
				$("#sex").append(result);
				$("#sex").select2tree({
					placeholder: '请选择性别'
				});
			}
		});
		//监听提交个人信息设置
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/system/sysuser/update.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('修改成功!',{icon: 1});
                        location.reload();
					}else{
						top.layer.msg('修改失败!'+result.message,{icon: 2},function () {
							location.reload();
						});
					}
				}
			});
			return false;
		});
		//监听密码修改设置
		form.on('submit(modify)', function(data){
			//layer.msg(JSON.stringify(data.field));
			var rightoldpwd='${sysuser.logpwd}';
			var oldpwd=$("#oldlogpwd").val();
			if (rightoldpwd != oldpwd){
				top.layer.msg("原密码输入有误，请重新输入",{icon: 2});
				$("#oldlogpwd").focus();
				return false;
			}
			var onenewpwd=$('#onenewpwd').val();
			var twonewpwd=$('#twonewpwd').val();
			if (twonewpwd != onenewpwd){
				top.layer.msg("新密码两次输入不一致，请重新输入",{icon: 2});
				$("#twonewpwd").focus();
				return false;
			}

			$.ajax({
				url: "/ez/system/sysuser/update.do",
				type: "POST",
				data:$('#myform').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('修改成功!',{icon: 1});
						location.reload();
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