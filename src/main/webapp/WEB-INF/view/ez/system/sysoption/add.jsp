<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>系统设置新增</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<div class="form-group">
		<label for="oid" class="col-sm-2 control-label"><em class="required">*</em>参数id：</label>
		<div class="col-sm-10">
			<input type="text" id="oid" name="oid" required placeholder="请输入参数id" class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="optionValue" class="col-sm-2 control-label"><em class="required">*</em>参数值:</label>
		<div class="col-sm-10">
			<textarea id="optionValue" name="optionValue" class="form-control" ></textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="optionName" class="col-sm-2 control-label"><em class="required">*</em>参数名称:</label>
		<div class="col-sm-10">
			<input type="text" name="optionName" id="optionName" required maxlength="100" placeholder="输入参数名称"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="optionOrder" class="col-sm-2 control-label"><em class="required">*</em>参数顺序:</label>
		<div class="col-sm-10">
			<input type="number" id="optionOrder" value="1" name="optionOrder" required placeholder="请输入参数顺序"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">保存</button>
			<button type="reset" class="btn btn-default">重置</button>
		</div>
	</div>
</form>
<script type="text/javascript">
    $(function() {
        //表单验证加提交
        $("#formid").validate({
            submitHandler: function(form){
                $.ajax({
                    url: "/ez/system/sysoption/add.do",
                    type: "POST",
                    data:$('#formid').serialize(),// 你的formid
                    dataType: 'json',
                    beforeSend: function () {
                        // 禁用按钮防止重复提交
                        $("button[type='submit']").attr({ disabled: "disabled" });
                    },
                    complete: function () {
                        $("button[type='submit']").removeAttr("disabled");
                    },
                    success: function (result) {
                        if(result.status){
                            //关闭窗口
                            top.layer.closeAll();
                            top.layer.msg('保存成功!',{icon: 1});
                        }else{
                            top.layer.msg('保存失败!'+result.message,{icon: 2,time: 5000});
                        }
                    }
                });
            }
        });
    });
</script>
<%--
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>参数id:</label>
			<div class="layui-input-block">
				<input type="text" name="oid" lay-verify="required" placeholder="请输入参数id" autocomplete="off" class="layui-input">
			</div>
		</div>

		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label"><em class="required">*</em>参数值：</label>
			<div class="layui-input-block">
				<textarea name="optionValue" lay-verify="required" placeholder="请输入参数值" class="layui-textarea"></textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>参数名称:</label>
			<div class="layui-input-block">
				<input type="text" name="optionName" lay-verify="required" placeholder="请输入参数名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">参数排序:</label>
			<div class="layui-input-block">
				<input type="number" name="optionOrder" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="add">保存</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>--%>
<%--<script>
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
				url: "/ez/system/sysoption/add.do",
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
</script>--%>
</body>
</html>
