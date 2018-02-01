<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>系统字典名称修改</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<input type="hidden" name="id" value="${sysdictionary.id}">
	<div class="form-group">
		<label for="code" class="col-sm-2 control-label"><em class="required">*</em>字典类型：</label>
		<div class="col-sm-10">
			<select class="form-control" id="code" name="code">
				<option value="${sysdictionary.code}" selected="selected">${sysdictionary.codeName}</option>
			</select>
		</div>
	</div>
	<div class="form-group">
		<label for="sdkey" class="col-sm-2 control-label"><em class="required">*</em>字典key值:</label>
		<div class="col-sm-10">
			<input type="text" name="sdkey" id="sdkey" value="${sysdictionary.sdkey}" required maxlength="4" placeholder="输入字典key值"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="sdvalue" class="col-sm-2 control-label"><em class="required">*</em>字典value值:</label>
		<div class="col-sm-10">
			<input type="text" name="sdvalue" id="sdvalue" value="${sysdictionary.sdvalue}" required maxlength="4" placeholder="输入字典value值"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="remark" class="col-sm-2 control-label">备注：</label>
		<div class="col-sm-10">
			<textarea id="remark" name="remark" class="form-control" >${sysdictionary.remark}</textarea>
		</div>
	</div>
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">编辑</button>
			<button type="reset" class="btn btn-default">重置</button>
		</div>
	</div>
</form>
<script type="text/javascript">
    $(function() {
        //select2插件
        $('#code').select2({
            placeholder:'请选择',
            allowClear:true,
            ajax: {
                url: '/ez/system/sysdictype/getSdBySdtCode.do',
                dataType: 'json',
                delay: 250,
                processResults: function (result) {return {results: result.data};},
                escapeMarkup: function (markup) { return markup; } // 自定义格式化防止xss注入
            }
        });
        //表单验证加提交
        $("#formid").validate({
            submitHandler: function(form){
                $.ajax({
                    url: "/ez/system/sysdictionary/update.do",
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