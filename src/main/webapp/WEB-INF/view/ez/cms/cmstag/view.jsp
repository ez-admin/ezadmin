<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看标签信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<script type="text/javascript" src="/static/plugins/My97DatePicker/cn_WdatePicker.js"></script>
<div class="field-box">
	<form id="formid" class="form-horizontal">

		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>名称:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsName" value="${cmstag.cmsName}"  required placeholder="请输入名称" autocomplete="off" class="form-control" disabled>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>操作时间:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsCreationTime" value="<fmt:formatDate value='${cmstag.cmsCreationTime}' type='both' pattern='yyyy-MM-dd'/>" placeholder="yyyy-mm-dd" autocomplete="off" class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});" disabled>
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>文档数量:</label>
			<div class="col-sm-8">
				<input type="number" name="cmsRefers" value="${cmstag.cmsRefers}" value="1" required maxlength="10"  autocomplete="off" class="form-control" disabled>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button class="btn btn-primary" onclick="top.layer.closeAll()">关闭</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>
