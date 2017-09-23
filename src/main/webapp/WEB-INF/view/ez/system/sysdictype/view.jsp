<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>系统字典名称新增</title>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">

	<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
	<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/static/plugins/iCheck/custom.css">
	<link rel="stylesheet" href="/static/css/public.css" class="css">


	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="/static/js/html5shiv.min.js"></script>
	<script src="/static/js/respond.min.js"></script>
	<![endif]-->

	<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
	<!--layer-->
	<script type="text/javascript" src="/static/plugins/layer/layer.js"></script>
	<!--bootstrap-->
	<script src="/static/plugins/bootstrap-table/bootstrap.min.js"></script>
	<!--form validation-->
	<script src="/static/plugins/jquery-validation/jquery-validation.min.js"></script>
	<script src="/static/plugins/jquery-validation/jquery.validation_zh_CN.js"></script>
	<!-- iCheck -->
	<script src="/static/plugins/iCheck/icheck.min.js"></script>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<input type="hidden" name="oldname" value="${sysdictype.name}">
	<div class="form-group">
		<label class="col-sm-2 control-label"><em class="required">*</em>类型编码</label>
		<div class="col-sm-10">
			<input type="text" name="code" value="${sysdictype.code}" id="code" required maxlength="4" placeholder="请输入字典类型编码" autocomplete="off" class="form-control" readonly>
			<span class="help-block"><i class="fa fa-info-circle"></i>四位数的数字组合</span>
		</div>
	</div>
	<div class="form-group">
		<label  class="col-sm-2 control-label"><em class="required">*</em>类型名称</label>
		<div class="col-sm-10">
			<input type="text" name="name" value="${sysdictype.name}" id="name" required maxlength="4" placeholder="请输入字典类型名称" autocomplete="off" class="form-control" readonly>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">是否启用</label>
		<div class="col-sm-10">
			<label class="radio-inline i-checks">
				<input type="radio" <c:if test="${sysdictype.flag ==1}">checked</c:if> <c:if test="${sysdictype.flag !=1}">disabled</c:if> value="1" name="flag">&nbsp;&nbsp;是
			</label>
			<label class="radio-inline i-checks">
				<input type="radio" <c:if test="${sysdictype.flag ==0}">checked</c:if> <c:if test="${sysdictype.flag !=0}">disabled</c:if> value="0" name="flag" >&nbsp;&nbsp;否
			</label>
		</div>
	</div>
	<div class="form-group">
		<label  class="col-sm-2 control-label">备注</label>
		<div class="col-sm-10">
			<textarea id="remark" name="remark" class="form-control" readonly> ${sysdictype.remark}</textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-primary" onclick="top.layer.closeAll()">关闭</button>
		</div>
	</div>
</form>
<script>
    $(function() {
        $('.i-checks').iCheck({checkboxClass: 'icheckbox_square-blue', radioClass: 'iradio_square-blue',});
	});
</script>
</body>
</html>