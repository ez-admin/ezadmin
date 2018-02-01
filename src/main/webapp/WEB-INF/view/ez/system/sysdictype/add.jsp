<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>系统字典类型新增</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
	<form class="form-horizontal" id="formid">
		<div class="form-group">
			<label for="code" class="col-sm-2 control-label"><em class="required">*</em>类型编码：</label>
			<div class="col-sm-10">
				<input type="text" name="code" id="code" required maxlength="4" placeholder="请输入字典类型编码"  class="form-control">
				<span class="help-block"><i class="fa fa-info-circle"></i>四位数的数字组合</span>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label"><em class="required">*</em>类型名称：</label>
			<div class="col-sm-10">
				<input type="text" name="name" id="name" required maxlength="4" placeholder="请输入字典类型名称"  class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">是否启用：</label>
			<div class="col-sm-10">
				<label class="radio-inline i-checks">
					<input type="radio" checked="" value="1" name="flag">&nbsp;&nbsp;是
				</label>
				<label class="radio-inline i-checks">
					<input type="radio" value="0" name="flag" >&nbsp;&nbsp;否
				</label>
			</div>
		</div>
		<div class="form-group">
			<label for="remark" class="col-sm-2 control-label">备注：</label>
			<div class="col-sm-10">
				<textarea id="remark" name="remark" class="form-control" ></textarea>
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
            $('.i-checks').iCheck({checkboxClass: 'icheckbox_square-blue', radioClass: 'iradio_square-blue'});
            $("#formid").validate({
                submitHandler: function(form){
					$.ajax({
                        url: "/ez/system/sysdictype/add.do",
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
</body>
</html>