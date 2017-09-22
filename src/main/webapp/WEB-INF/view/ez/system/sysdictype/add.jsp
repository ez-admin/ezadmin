<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>系统字典类型新增</title>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path;
	%>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">

	<%--<link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />--%>
	<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
	<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/static/css/public.css" class="css">

	<script src="/static/plugins/bootstrap-table/bootstrap.min.js"></script>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="/static/js/html5shiv.min.js"></script>
	<script src="/static/js/respond.min.js"></script>
	<![endif]-->

	<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="/static/plugins/layer/layer.js"></script>

<%--<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>--%>
</head>
<body>
<form class="form-horizontal" id="formid">
	<div class="form-group">
		<label for="code" class="col-sm-2 control-label"><em class="required">*</em>类型编码:</label>
		<div class="col-sm-10">
			<input type="text" name="code" id="code" required maxlength="4" placeholder="请输入字典类型编码" autocomplete="off" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="name" class="col-sm-2 control-label"><em class="required">*</em>类型名称:</label>
		<div class="col-sm-10">
			<input type="text" name="name" id="name" required maxlength="4" placeholder="请输入字典类型名称" autocomplete="off" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<div class="radio">
			<label>
				<input type="radio" name="flag" id="flag1" value="1" checked>
				是
			</label>
		</div>
		<div class="radio">
			<label>
				<input type="radio" name="flag" id="flag2" value="0" >
				否
			</label>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-default">Sign in</button>
		</div>
	</div>
</form>


	<%--<div class="layui-field-box">
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
	</div>--%>
	<%--<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>--%>
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