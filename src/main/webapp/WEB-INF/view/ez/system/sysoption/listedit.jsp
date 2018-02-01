<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>系统参数编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
	<style type="text/css">
		blockquote{
			margin-bottom: 10px!important;
			line-height: 34px;
			border-left: 5px solid #3c8dbc;
			border-radius: 0 2px 2px 0;
			background-color: #f2f2f2;
		}
	</style>
</head>
<body class="container-fluid">
	<blockquote>
		<p>温馨提示：部分配置需重新登陆系统生效！</p>
	</blockquote>
	<form class="form-horizontal" id="formid">
		<c:forEach items="${optionList}" var ="sysoption" varStatus="status">
		<input type="hidden" value="${sysoption.oid}" name="sysOptionList[${status.index}].oid" >
			<div class="form-group">
				<label class="col-sm-2 control-label"><em class="required">*</em>${sysoption.optionName}：</label>
				<div class="col-sm-10">
					<input type="text" name="sysOptionList[${status.index}].optionValue" value="${sysoption.optionValue}"  placeholder="请输入${sysoption.optionName}" required class="form-control">
				</div>
			</div>
		</c:forEach>
		<shiro:hasPermission name="option_listmodify">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">修改</button>
					<button type="reset" class="btn btn-default">重置</button>
				</div>
			</div>
		</shiro:hasPermission>
	</form>
</div>
<script type="text/javascript">
	$(function() {
		//表单验证加提交
		$("#formid").validate({
			submitHandler: function(form){
				$.ajax({
					url: "/ez/system/sysoption/updateList.do",
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
