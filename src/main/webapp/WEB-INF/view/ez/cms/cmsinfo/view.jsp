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
			<label class="layui-form-label"><em class="required">*</em>栏目名称:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNodeId" value="${cmsinfo.cmsNodeName}"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>文章标题:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoTitle" value="${cmsinfo.cmsInfoTitle}"  required  lay-verify="required" placeholder="请输入文章标题" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章关键字:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoKey" value="${cmsinfo.cmsInfoKey}"  placeholder="请输入文章关键字" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章摘要:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoDes" value="${cmsinfo.cmsInfoDes}"  placeholder="请输入文章摘要" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">文章标题图:</label>
			<div class="layui-input-block">
				<c:if test="${null == cmsinfo.cmsInfoPicpath}">
					<input type="file" class="layui-upload-file" disabled>
				</c:if>
				<c:if test="${null != cmsinfo.cmsInfoPicpath}">
					<img src="${cmsinfo.cmsInfoPicpath}" alt="文章标题图" >
				</c:if>
				<%--<input type="text" name="cmsInfoPicpath" value="${cmsinfo.cmsInfoPicpath}"  placeholder="请输入文章标题图" autocomplete="off" class="layui-input layui-disabled">--%>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>排序:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsInfoOrder" value="${cmsinfo.cmsInfoOrder}" value="1"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>操作时间:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoInserttime" value="<fmt:formatDate value='${cmsinfo.cmsInfoInserttime}' type='both' pattern='yyyy-MM-dd hh:mm:ss'/>" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" onclick="layui.laydate({elem: this})">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">发布状态:</label>
			<div class="layui-input-block">
				<c:if test="${cmsinfo.cmsInfoState==0}">
					<input type="checkbox" name="cmsInfoState" lay-skin="switch" lay-text="启用|禁用"  value="1" disabled>
				</c:if>
				<c:if test="${cmsinfo.cmsInfoState==1}">
					<input type="checkbox" name="cmsInfoState" lay-skin="switch" lay-text="启用|禁用" checked value="1" disabled>
				</c:if>
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label">发布开始时间:</label>
			<div class="layui-input-block">
				<input type="text" name="publishStartime" value="<fmt:formatDate value='${cmsinfo.publishStartime}' type='both' pattern='yyyy-MM-dd'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" onclick="layui.laydate({elem: this})">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">发布结束时间:</label>
			<div class="layui-input-block">
				<input type="text" name="publishEndtime" value="<fmt:formatDate value='${cmsinfo.publishEndtime}' type='both' pattern='yyyy-MM-dd'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" onclick="layui.laydate({elem: this})">
			</div>
		</div>--%>

		<div class="layui-form-item">
			<label class="layui-form-label">发布人:</label>
			<div class="layui-input-block">
				<input type="text" name="author" value="${cmsinfo.authorname}"  placeholder="请输入添加内容的管理员" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章点击数:</label>
			<div class="layui-input-block">
				<input type="number" name="countClick" value="${cmsinfo.countClick}"   maxlength="10"  autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">所属标签:</label>
			<div class="layui-input-block">
				<c:forEach items="${cmsTags}" var ="cmstags" >
					<c:if test="${cmstags.tag == true}">
						<input type="checkbox"  name="cmstag" value="${cmstags.cmsTagId}" title="${cmstags.cmsName}" checked >
					</c:if>
					<c:if test="${cmstags.tag == false}">
						<input type="checkbox"  name="cmstag" value="${cmstags.cmsTagId}" title="${cmstags.cmsName}" disabled>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label"><em class="required">*</em>文章内容：</label>
			<div class="layui-input-block">
				<script id="editor" type="text/plain" style="width:100%;height:300px;" >
					${cmsinfo.cmsInfoContent}
				</script>
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label">文章来源:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsFrom" value="${cmsinfo.cmsNewsFrom}"  placeholder="请输入文章来源" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章来源地址:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsUrl" value="${cmsinfo.cmsNewsUrl}"  placeholder="请输入文章来源地址" autocomplete="off" class="layui-input layui-disabled">
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
		</div>--%>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="top.layer.closeAll()">关闭</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<!--百度Ueditor富文本编辑器-->
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
<script>
	//Demo
    layui.use(['layer', 'form','jquery','laydate','upload','element'], function(){
        var layer = layui.layer
            ,form = layui.form()
            ,element = layui.element()
            ,$ = layui.jquery
            ,laydate = layui.laydate;
        //实例化编辑器
        window.UEDITOR_CONFIG.charset="utf-8";
        var ue = UE.getEditor('editor');
        layui.upload({

        });
	});
</script>
</body>
</html>
