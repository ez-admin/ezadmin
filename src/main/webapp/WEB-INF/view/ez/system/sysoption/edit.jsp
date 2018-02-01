<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>系统设置编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<input type="hidden" name="oid" value="${sysoption.oid}"/>
	<div class="form-group">
		<label for="optionValue" class="col-sm-2 control-label"><em class="required">*</em>参数值:</label>
		<div class="col-sm-10">
			<textarea id="optionValue" name="optionValue" class="form-control" >${sysoption.optionValue}</textarea>
		</div>
	</div>
	<div class="form-group">
		<label for="optionName" class="col-sm-2 control-label"><em class="required">*</em>参数名称:</label>
		<div class="col-sm-10">
			<input type="text" name="optionName" id="optionName" value="${sysoption.optionName}" required maxlength="100" placeholder="输入参数名称"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="optionOrder" class="col-sm-2 control-label"><em class="required">*</em>参数顺序:</label>
		<div class="col-sm-10">
			<input type="number" id="optionOrder" value="${sysoption.optionOrder}" name="optionOrder" required placeholder="请输入参数顺序"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">修改</button>
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
                    url: "/ez/system/sysoption/update.do",
                    type: "POST",
                    data:$('#formid').serialize(),// 你的formid
                    dataType: 'json',
                    success: function (result) {
                        if(result.status){
                            //关闭窗口
                            top.layer.closeAll();
                            top.layer.msg('修改成功!',{icon: 1});
                        }else{
                            top.layer.msg('修改失败!'+result.message,{icon: 2,time: 5000});
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>
