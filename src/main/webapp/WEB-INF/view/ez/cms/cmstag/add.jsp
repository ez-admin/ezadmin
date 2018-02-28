<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>标签新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="container">
	<form id="formid" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>名称:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsName" required="required" placeholder="请输入名称" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
            <label class="col-sm-2 control-label"><em class="required">*</em>操作时间:</label>
            <div class="col-sm-10">
                <input type="text" name="cmsCreationTime" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:00'});">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label"><em class="required">*</em>文档数量:</label>
            <div class="col-sm-10">
                <input type="number" name="cmsRefers" value="1"   required="required" maxlength="10"  autocomplete="off" class="form-control">
            </div>
        </div>
		<div class="form-group">
			<div class="col-sm-10">
				<button type="submit" class="btn btn-default">保存</button>
				<button type="reset" class="btn btn-default">重置</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<%--<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>--%>
<link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
<!--form validation-->
<script src="/static/plugins/jquery-validation/jquery-validation.min.js"></script>
<script src="/static/plugins/jquery-validation/jquery.validation_zh_CN.js"></script>
<!--layer-->
<script type="text/javascript" src="/static/plugins/layer/layer.js"></script>
<script src="/static/plugins/My97DatePicker/cn_WdatePicker.js"></script>
<script>
    //表单验证加提交
    $("#formid").validate({
        submitHandler: function(form){
            $.ajax({
                url: "/ez/cms/cmstag/add.do",
                type: "POST",
                data:$('#formid').serialize(),// 你的formid
                dataTpye:"json",
                beforeSend: function () {
                    // 禁用按钮防止重复提交
                    $("button[type='submit']").attr({ disabled: "disabled" });
                },
                complete: function () {
                    $("button[type='submit']").removeAttr("disabled");
                },
                success: function (result) {
                    if("suc"==(result.msg)){
                        //关闭窗口
                        top.layer.closeAll();
                        top.layer.msg('保存成功!',{icon: 1});
                    }else{
                        top.layer.msg('保存失败!'+result.message,{icon: 2});
                    }
                },
                error: function () {
                    top.layer.alert("请求失败!");
                }
            });
        }
    })
	//Demo
	/*layui.use(['layer', 'form','jquery','laydate'], function(){
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
	});*/
</script>
</body>
</html>
