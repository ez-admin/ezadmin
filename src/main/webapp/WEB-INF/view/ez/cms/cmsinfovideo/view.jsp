<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看视频管理信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>视频标题:</label>
			<div class="layui-input-block">
				<input type="text" name="emVideoTitle" value="${cmsinfovideo.emVideoTitle}"  placeholder="请输入标题" autocomplete="off" class="layui-input layui-disabled" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>视频位置:</label>
			<div class="layui-input-block">
				<select name="positionId" id="positionId" lay-verify="required" disabled>
					<option value="">请选择视频所属位置</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">标题图:</label>
			<div class="layui-input-block">
				<img id="emVideoPicpath" src="${cmsinfovideo.emVideoPicpath}" alt="" width="80%">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>视频:</label>
			<div class="layui-input-block">
				<video src="${cmsinfovideo.emVideoPath}" id="emVideoPath"  controls="controls"  width="80%">
				</video>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">视频排序:</label>
			<div class="layui-input-block">
				<input type="number" name="emVideoOrder" value="${cmsinfovideo.emVideoOrder}"   maxlength="10"  autocomplete="off" class="layui-input layui-disabled" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布状态:</label>
			<div class="layui-input-block">
				<c:if test="${cmsinfovideo.emVideoStat==0}">
					<input type="checkbox" name="emVideoStat" lay-skin="switch" lay-text="启用|禁用"  value="1">
				</c:if>
				<c:if test="${cmsinfovideo.emVideoStat==1}">
					<input type="checkbox" name="emVideoStat" lay-skin="switch" lay-text="启用|禁用" checked value="1">
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">录入者:</label>
			<div class="layui-input-block">
				<input type="text" name="author" value="${cmsinfovideo.authorname}"  placeholder="请输入录入者" autocomplete="off" class="layui-input layui-disabled" disabled>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">录入时间:</label>
			<div class="layui-input-block">
				<input type="text" name="emVideoInserttime" value="<fmt:formatDate value='${cmsinfoimg.emImageInserttime}'  type='both' pattern='yyyy-MM-dd hh:mm:ss'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" disabled onclick="layui.laydate({elem: this})">
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
    layui.use(['layer', 'form','jquery','laydate','upload','element'], function(){
        var layer = layui.layer
            ,form = layui.form()
            ,element = layui.element()
            ,$ = layui.jquery
            ,laydate = layui.laydate;
        //后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1027,selected:'${cmsinfovideo.positionId}'},
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
