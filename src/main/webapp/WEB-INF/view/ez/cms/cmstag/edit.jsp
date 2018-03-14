<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>标签表编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<script type="text/javascript" src="/static/plugins/layui/layer.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
	function edit(){
        $.ajax({
            url: "/ez/cms/cmstag/update.do",
            type: "POST",
            data:$('#formid').serialize(),// 你的formid
            dataType: "json",
            async:false,
            success: function (result) {
                if("suc"==(result.msg)){
                    //关闭窗口
                    top.layer.closeAll();
                    top.layer.msg('修改成功!',{icon: 1});
                }else{
                    top.layer.msg('修改失败!'+result.message,{icon: 2});
                }
            },
        });
	}
</script>
<div class="field-box">
	<form id="formid" class="form-horizontal">
		<input type="hidden" name="cmsTagId" value="${cmstag.cmsTagId}"/>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>名称:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsName" value="${cmstag.cmsName}"  required placeholder="请输入名称" autocomplete="off" class="form-control">
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>操作时间:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsCreationTime" value="<fmt:formatDate value='${cmstag.cmsCreationTime}' type='both' pattern='yyyy-MM-dd'/>" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>文档数量:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsRefers" value="${cmstag.cmsRefers}" lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>--%>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button class="btn btn-primary" onclick="edit()">编辑</button>
				<button type="reset" class="btn btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>
