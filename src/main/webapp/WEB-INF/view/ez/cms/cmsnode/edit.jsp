<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>栏目管理编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<input type="hidden" name="cmsNodeId" value="${cmsnode.cmsNodeId}"/>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>栏目名称:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNodeName" value="${cmsnode.cmsNodeName}"  required  lay-verify="required" placeholder="请输入栏目名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">栏目编码:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNodeCode" value="${cmsnode.cmsNodeCode}"  placeholder="请输入栏目编码" autocomplete="off" class="layui-input">
			</div>
		</div>
<%--		<div class="layui-form-item">
			<label class="layui-form-label">栏目父级id:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsNodeParentId" value="${cmsnode.cmsNodeParentId}"   maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label">栏目排序:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsNodeSort" value="${cmsnode.cmsNodeSort}"   maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">栏目类型:</label>
			<div class="layui-input-block">
				<select name="cmsNodeType" id="cmsNodeType">
					<option value="">请选择栏目类型</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">栏目状态:</label>
			<div class="layui-input-block">
				<c:if test="${cmsnode.cmsNodeState==0}">
					<input type="checkbox" name="cmsNodeState" lay-skin="switch" lay-text="启用|禁用"  value="1">
				</c:if>
				<c:if test="${cmsnode.cmsNodeState==1}">
					<input type="checkbox" name="cmsNodeState" lay-skin="switch" lay-text="启用|禁用" checked value="1">
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">操作时间:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNodeInserttime" value="<fmt:formatDate value='${cmsnode.cmsNodeInserttime}'  type='both' pattern='yyyy-MM-dd hh:mm:ss'/>"   placeholder="yyyy-MM-dd hh:mm:ss" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="edit">编辑</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
            data:{code:1026,selected:'${cmsnode.cmsNodeType}'},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#cmsNodeType").append(result);
                form.render('select');
            }
        });
		//监听提交
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/cms/cmsnode/update.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('修改成功!',{icon: 1});
					}else{
						top.layer.msg('修改失败!'+result.message,{icon: 2},function () {
							location.reload();
						});
					}
				}
			});
			return false;
		});

	});
</script>
</body>
</html>
