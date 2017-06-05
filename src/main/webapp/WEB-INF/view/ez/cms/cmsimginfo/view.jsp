<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看图片管理信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>图片名称:</label>
			<div class="layui-input-block">
				<input type="text" name="emImageName" value="${cmsimginfo.emImageName}"  placeholder="请输入图片名称" autocomplete="off" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>图片位置:</label>
			<div class="layui-input-block">
				<select name="positionId" id="positionId" disabled>
					<option value="">请选择图片所属位置</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>图片:</label>
			<div class="layui-input-block">
				<img id="emImageUrl" src="${cmsimginfo.emImageUrl}" alt="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">图片外链:</label>
			<div class="layui-input-block">
				<input type="text" name="emImageLinkurl" value="${cmsimginfo.emImageLinkurl}"  placeholder="请输入图片外链" autocomplete="off" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>排序:</label>
			<div class="layui-input-block">
				<input type="number" name="emImageOrder" value="${cmsimginfo.emImageOrder}"  maxlength="10"  autocomplete="off" class="layui-input  layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">操作时间:</label>
			<div class="layui-input-block">
				<input type="text" name="emImageInserttime" value="<fmt:formatDate value='${cmsimginfo.emImageInserttime}'  type='both' pattern='yyyy-MM-dd hh:mm:ss'/>"   placeholder="yyyy-MM-dd hh:mm:ss" autocomplete="off" class="layui-input layui-disabled" disabled onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>发布状态:</label>
			<div class="layui-input-block">
				<c:if test="${cmsimginfo.emImageStat==0}">
					<input type="checkbox" name="emImageStat" lay-skin="switch" lay-text="启用|禁用"  value="1" disabled>
				</c:if>
				<c:if test="${cmsimginfo.emImageStat==1}">
					<input type="checkbox" name="emImageStat" lay-skin="switch" lay-text="启用|禁用" checked value="1" disabled>
				</c:if>
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label">图片缩略图:</label>
			<div class="layui-input-block">
				<input type="text" name="emImageSmallUrl" value="${cmsimginfo.emImageSmallUrl}"  placeholder="请输入图片缩略图" autocomplete="off" class="layui-input">
			</div>
		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label">是否需要isnofollow:</label>
			<div class="layui-input-block">
				<c:if test="${cmsimginfo.isnofollow==0}">
					<input type="radio" name="isnofollow" lay-filter="tag" value="1" title="是" disabled>
					<input type="radio" name="isnofollow" lay-filter="tag" value="0" title="否" checked>
				</c:if>
				<c:if test="${cmsimginfo.isnofollow==1}">
					<input type="radio" name="isnofollow" lay-filter="tag" value="1" title="是" checked >
					<input type="radio" name="isnofollow" lay-filter="tag" value="0" title="否" disabled>
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
	layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;
        //后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1025,selected:'${cmsimginfo.positionId}'},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#positionId").append(result);
                form.render('select');
            }
        });
	});
</script>
</body>
</html>
