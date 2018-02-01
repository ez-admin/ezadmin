<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>系统字典名称新增</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<input type="hidden" name="oldname" value="${sysdictype.name}">
	<div class="form-group">
		<label class="col-sm-2 control-label"><em class="required">*</em>类型编码：</label>
		<div class="col-sm-10">
			<input type="text" name="code" value="${sysdictype.code}" id="code" required maxlength="4" placeholder="请输入字典类型编码"  class="form-control" readonly>
			<span class="help-block"><i class="fa fa-info-circle"></i>四位数的数字组合</span>
		</div>
	</div>
	<div class="form-group">
		<label  class="col-sm-2 control-label"><em class="required">*</em>类型名称：</label>
		<div class="col-sm-10">
			<input type="text" name="name" value="${sysdictype.name}" id="name" required maxlength="4" placeholder="请输入字典类型名称"  class="form-control" readonly>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">是否启用：</label>
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
		<label  class="col-sm-2 control-label">备注：</label>
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
        $('.i-checks').iCheck({checkboxClass: 'icheckbox_square-blue', radioClass: 'iradio_square-blue'});
	});
</script>
</body>
</html>