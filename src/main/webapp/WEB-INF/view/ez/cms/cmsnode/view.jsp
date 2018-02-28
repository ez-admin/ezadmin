<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看栏目管理信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="container">
	<form id="formid" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>栏目名称:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsNodeName" value="${cmsnode.cmsNodeName}"  required="required" placeholder="请输入栏目名称" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目编码:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsNodeCode" value="${cmsnode.cmsNodeCode}"  placeholder="请输入栏目编码" autocomplete="off" class="form-control">
			</div>
		</div>
<%--		<div class="form-group">
			<label class="col-sm-2 control-label">栏目父级id:</label>
			<div class="col-sm-10">
				<input type="number" name="cmsNodeParentId" value="${cmsnode.cmsNodeParentId}"   maxlength="10"  autocomplete="off" class="form-control">
			</div>
		</div>--%>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目排序:</label>
			<div class="col-sm-10">
				<input type="number" name="cmsNodeSort" value="${cmsnode.cmsNodeSort}"   maxlength="10"  autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目类型:</label>
			<div class="col-sm-10">
				<select style="height:30px" name="cmsNodeType" id="cmsNodeType" disabled>
					<option value="">请选择栏目类型</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目状态:</label>
			<div class="col-sm-10">
				<c:if test="${cmsnode.cmsNodeState==0}">
					<input type="checkbox" name="cmsNodeState" lay-skin="switch" lay-text="启用|禁用" disabled>
				</c:if>
				<c:if test="${cmsnode.cmsNodeState==1}">
					<input type="checkbox" name="cmsNodeState" lay-skin="switch" lay-text="启用|禁用" checked  disabled>
				</c:if>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">操作时间:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsNodeInserttime" value="<fmt:formatDate value='${cmsnode.cmsNodeInserttime}' type='both' pattern='yyyy-MM-dd hh:mm:ss'/>" placeholder="yyyy-MM-dd hh:mm:ss" autocomplete="off" class="form-control" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
			</div>
		</div>

		<div class="form-group">
			<div class="col-sm-10">
				<button class="layui-btn" onclick="top.layer.closeAll()">关闭</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<%--<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>--%>
<link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
<script>
	//Demo
	/*layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;
		//后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1026,selected:'\${cmsnode.cmsNodeType}'},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#cmsNodeType").append(result);
                form.render('select');
            }
        });
	});*/
</script>
</body>
</html>
