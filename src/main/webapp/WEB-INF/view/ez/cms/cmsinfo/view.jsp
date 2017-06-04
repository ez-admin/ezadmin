<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看文章管理信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>栏目id:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsNodeId" value="${cmsinfo.cmsNodeId}" value="1"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>文章标题:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoTitle" value="${cmsinfo.cmsInfoTitle}"  required  lay-verify="required" placeholder="请输入文章标题" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">cmsInfoKey:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoKey" value="${cmsinfo.cmsInfoKey}"  placeholder="请输入cmsInfoKey" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章摘要:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoDes" value="${cmsinfo.cmsInfoDes}"  placeholder="请输入文章摘要" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label"><em class="required">*</em>文章内容：</label>
			<div class="layui-input-block">
				<textarea name="cmsInfoContent"  required placeholder="请输入文章内容" class="layui-textarea layui-disabled">${cmsinfo.cmsInfoContent}</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章标题图:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoPicpath" value="${cmsinfo.cmsInfoPicpath}"  placeholder="请输入文章标题图" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>新闻内容排序:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsInfoOrder" value="${cmsinfo.cmsInfoOrder}" value="1"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>文章创建时间:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoInserttime" value="<fmt:formatDate value='${cmsinfo.cmsInfoInserttime}' type='both' pattern='yyyy-MM-dd'/>" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" onclick="layui.laydate({elem: this})">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">发布状态 0 禁用 1 启用:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsInfoState" value="${cmsinfo.cmsInfoState}"   maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">publishStartime:</label>
			<div class="layui-input-block">
				<input type="text" name="publishStartime" value="<fmt:formatDate value='${cmsinfo.publishStartime}' type='both' pattern='yyyy-MM-dd'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" onclick="layui.laydate({elem: this})">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">publishEndtime:</label>
			<div class="layui-input-block">
				<input type="text" name="publishEndtime" value="<fmt:formatDate value='${cmsinfo.publishEndtime}' type='both' pattern='yyyy-MM-dd'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" onclick="layui.laydate({elem: this})">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">添加内容的管理员:</label>
			<div class="layui-input-block">
				<input type="text" name="author" value="${cmsinfo.author}"  placeholder="请输入添加内容的管理员" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章点击数:</label>
			<div class="layui-input-block">
				<input type="number" name="countClick" value="${cmsinfo.countClick}"   maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章来源:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsFrom" value="${cmsinfo.cmsNewsFrom}"  placeholder="请输入文章来源" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">cmsNewsUrl:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsUrl" value="${cmsinfo.cmsNewsUrl}"  placeholder="请输入cmsNewsUrl" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章作者:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsAuthor" value="${cmsinfo.cmsNewsAuthor}"  placeholder="请输入文章作者" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">seo关键词:</label>
			<div class="layui-input-block">
				<input type="text" name="newSeoKey" value="${cmsinfo.newSeoKey}"  placeholder="请输入seo关键词" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">seo描述:</label>
			<div class="layui-input-block">
				<input type="text" name="newSeoDes" value="${cmsinfo.newSeoDes}"  placeholder="请输入seo描述" autocomplete="off" class="layui-input layui-disabled">
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
	layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;

	});
</script>
</body>
</html>
