<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看系统设置信息</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<div class="form-group">
		<label for="optionValue" class="col-sm-2 control-label"><em class="required">*</em>参数值:</label>
		<div class="col-sm-10">
			<textarea id="optionValue" name="optionValue" class="form-control" readonly >${sysoption.optionValue}</textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="optionName" class="col-sm-2 control-label"><em class="required">*</em>参数名称:</label>
		<div class="col-sm-10">
			<input type="text" name="optionName" id="optionName" value="${sysoption.optionName}" readonly maxlength="100" placeholder="输入参数名称"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="optionOrder" class="col-sm-2 control-label"><em class="required">*</em>参数顺序:</label>
		<div class="col-sm-10">
			<input type="number" id="optionOrder" value="${sysoption.optionOrder}" name="optionOrder" readonly placeholder="请输入参数顺序"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-primary" onclick="top.layer.closeAll()">关闭</button>
		</div>
	</div>
</form>

</body>
</html>
