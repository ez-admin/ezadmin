<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>菜单新增</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<input type="hidden" name="parentId" value="0">
	<div class="form-group">
		<label for="menuName" class="col-sm-2 control-label"><em class="required">*</em>菜单名称:</label>
		<div class="col-sm-10">
			<input type="text" id="menuName" name="menuName" value="${sysMenu.menuName}" required placeholder="请输入菜单名称"   class="form-control" readonly>
		</div>
	</div>
	<div class="form-group">
		<label for="menuUrl" class="col-sm-2 control-label"><em class="required">*</em>菜单地址:</label>
		<div class="col-sm-10">
			<input type="text" id="menuUrl" name="menuUrl" value="${sysMenu.menuUrl}" required placeholder="请输入菜单URL地址"  class="form-control" readonly>
		</div>
	</div>
	<div class="form-group">
		<label for="menuOrder" class="col-sm-2 control-label"><em class="required">*</em>菜单顺序:</label>
		<div class="col-sm-10">
			<input type="number" id="menuOrder" value="${sysMenu.menuOrder}" name="menuOrder" required placeholder="请输入菜单顺序"  class="form-control" readonly>
		</div>
	</div>
	<div class="form-group">
		<label for="menuIcon" class="col-sm-2 control-label"><em class="required">*</em>菜单图标：</label>
		<div class="col-sm-10">
			<input type="text" name="menuIcon" id="menuIcon" value="${sysMenu.menuIcon}" required placeholder="请输入菜单图标"  class="form-control" readonly>
			<span class="help-block">
				<a href="http://fontawesome.io/icons/" title="查看所有图标" target="_blank">
					<i class="fa fa-external-link"></i>查看所有图标
				</a>
			</span>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">菜单类型：</label>
		<div class="col-sm-10">
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="0" <c:if test="${sysMenu.menuType=='0'}">checked</c:if> <c:if test="${sysMenu.menuType!='0'}">disabled</c:if>>&nbsp;&nbsp;开发者菜单
			</label>
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="1"  <c:if test="${sysMenu.menuType=='1'}">checked</c:if> <c:if test="${sysMenu.menuType!='1'}">disabled</c:if>>&nbsp;&nbsp;系统菜单
			</label>
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="2" <c:if test="${sysMenu.menuType=='2'}">checked</c:if> <c:if test="${sysMenu.menuType!='2'}">disabled</c:if>>&nbsp;&nbsp;业务菜单
			</label>
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="3" <c:if test="${sysMenu.menuType=='3'}">checked</c:if> <c:if test="${sysMenu.menuType!='3'}">disabled</c:if>>&nbsp;&nbsp;前台菜单
			</label>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button class="btn btn-primary" onclick="top.layer.closeAll()">关闭</button>
		</div>
	</div>
</form>
<script type="text/javascript">
    $(function() {
        $('.i-checks').iCheck({checkboxClass: 'icheckbox_square-blue', radioClass: 'iradio_square-blue'});
    });
</script>

<%--<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>菜单名称:</label>
			<div class="layui-input-block">
				<input type="text" name="menuName" value="${sysMenu.menuName}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>菜单地址:</label>
			<div class="layui-input-block">
				<input type="text" name="menuUrl" value="${sysMenu.menuUrl}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">菜单ID:</label>
			<div class="layui-input-block">
				<input type="text" name="menuId" value="${sysMenu.menuId}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">父级菜单ID:</label>
			<div class="layui-input-block">
				<input type="text" name="parentId" value="${sysMenu.parentId}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>菜单顺序:</label>
			<div class="layui-input-block">
				<input type="text" name="menuOrder" value="${sysMenu.menuOrder}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>菜单图标:</label>
			<div class="layui-input-inline">
				<input type="text" name="menuIcon" value="${sysMenu.menuIcon}" class="layui-input layui-disabled" readonly>
			</div>
			<div class="layui-form-mid layui-word-aux">
				<i class="fa ${sysMenu.menuIcon}"></i>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>菜单类型</label>
			<div class="layui-input-block">
				<c:if test="${sysMenu.menuType=='0'}">
					<input type="radio" name="menuType" value="0" title="开发者菜单" checked>
					<input type="radio" name="menuType" value="1" title="系统菜单" disabled>
					<input type="radio" name="menuType" value="2" title="业务菜单" disabled>
					<input type="radio" name="menuType" value="3" title="前台菜单" disabled>
				</c:if>
				<c:if test="${sysMenu.menuType=='1'}">
					<input type="radio" name="menuType" value="0" title="开发者菜单" disabled>
					<input type="radio" name="menuType" value="1" title="系统菜单" checked>
					<input type="radio" name="menuType" value="2" title="业务菜单" disabled>
					<input type="radio" name="menuType" value="3" title="前台菜单" disabled>
				</c:if>
				<c:if test="${sysMenu.menuType=='2'}">
					<input type="radio" name="menuType" value="0" title="开发者菜单" disabled>
					<input type="radio" name="menuType" value="1" title="系统菜单" disabled>
					<input type="radio" name="menuType" value="2" title="业务菜单" checked>
					<input type="radio" name="menuType" value="3" title="前台菜单" disabled>
				</c:if>
				<c:if test="${sysMenu.menuType=='3'}">
					<input type="radio" name="menuType" value="0" title="开发者菜单" disabled>
					<input type="radio" name="menuType" value="1" title="系统菜单" disabled>
					<input type="radio" name="menuType" value="2" title="业务菜单" disabled>
					<input type="radio" name="menuType" value="3" title="前台菜单" checked>
				</c:if>
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
	});
</script>--%>
</body>
</html>