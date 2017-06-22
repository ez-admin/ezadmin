<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>标签表新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>名称:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsName" required  lay-verify="required" placeholder="请输入名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<%--		<div class="layui-form-item">
                    <label class="layui-form-label"><em class="required">*</em>操作时间:</label>
                    <div class="layui-input-block">
                        <input type="text" name="cmsCreationTime" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label"><em class="required">*</em>文档数量:</label>
                    <div class="layui-input-block">
                        <input type="number" name="cmsRefers" value="1"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input">
                    </div>
                </div>--%>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="add">保存</button>
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
		//监听提交
		form.on('submit(add)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/cms/cmstag/add.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('保存成功!',{icon: 1});
					}else{
						top.layer.msg('保存失败!'+result.message,{icon: 2});
					}
				}
			});
			return false;
		});
	});
</script>
</body>
</html>
