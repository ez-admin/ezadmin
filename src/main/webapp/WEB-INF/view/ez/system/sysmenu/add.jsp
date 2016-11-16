<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<!-- page specific plugin styles -->
	<link rel="stylesheet" href="static/components/_mod/jquery-ui.custom/jquery-ui.custom.css" />
	<link rel="stylesheet" href="static/components/chosen/chosen.css" />
	<link rel="stylesheet" href="static/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" />
	<link rel="stylesheet" href="static/components/bootstrap-timepicker/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="static/components/bootstrap-daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" href="static/components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />
	<link rel="stylesheet" href="static/components/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.css" />

	<!-- 表单异步提交start -->
	<script src="plugins/form/form.js" type="text/javascript"></script>
	<!-- 表单异步提交end -->
	<!-- 表单验证start -->
	<script src="plugins/form/validationRule.js" type="text/javascript"></script>
	<script src="plugins/form/validation.js" type="text/javascript"></script>
	<!-- 表单验证end -->
  </head>
  
  <body>
  	<div class="row">
	  <div class="col-xs-12">
		<form class="form-horizontal" id="inputForm" action="<%=path%>/ez/system/sysmenu/add.do" method="post" failAlert="表单填写不正确，请按要求填写！">
			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 菜单名称</label>

				<div class="col-sm-9">
					<input type="text" id="form-field-1" placeholder="菜单名称" class="col-xs-10 col-sm-5" />
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> 菜单URL地址 </label>

				<div class="col-sm-9">
					<input type="text" id="form-field-1-1" placeholder="菜单URL地址" class="form-control" />
				</div>
			</div>
			<%--<fieldset>
			<table class="tableStyle" formMode="view">
				<tr>
					<th colspan="2">添加*系统管理权限表</th>
				</tr>
			</table>
			<legend>基本信息</legend>
			<table class="tableStyle" formMode="line" >

				<tr class="style1">
					<td width="30%">
						角色编号:
					</td>
					<td width="70%">
						<input name="roleId" id="roleId" type="text"  maxlength="100" watermark="请输入角色编号" style="width: 400px;"/>
					</td>
				</tr>

				<tr class="style1">
					<td width="30%">
						fxQx:
					</td>
					<td width="70%">
						<input name="fxQx" id="fxQx" type="text"  maxlength="10" watermark="请输入fxQx" class="validate[custom[onlyNumberWide]]" style="width: 400px;"/>
					</td>
				</tr>

				<tr class="style1">
					<td width="30%">
						fwQx:
					</td>
					<td width="70%">
						<input name="fwQx" id="fwQx" type="text"  maxlength="10" watermark="请输入fwQx" class="validate[custom[onlyNumberWide]]" style="width: 400px;"/>
					</td>
				</tr>

				<tr class="style1">
					<td width="30%">
						qx1:
					</td>
					<td width="70%">
						<input name="qx1" id="qx1" type="text"  maxlength="10" watermark="请输入qx1" class="validate[custom[onlyNumberWide]]" style="width: 400px;"/>
					</td>
				</tr>

				<tr class="style1">
					<td width="30%">
						qx2:
					</td>
					<td width="70%">
						<input name="qx2" id="qx2" type="text"  maxlength="10" watermark="请输入qx2" class="validate[custom[onlyNumberWide]]" style="width: 400px;"/>
					</td>
				</tr>

				<tr class="style1">
					<td width="30%">
						qx3:
					</td>
					<td width="70%">
						<input name="qx3" id="qx3" type="text"  maxlength="10" watermark="请输入qx3" class="validate[custom[onlyNumberWide]]" style="width: 400px;"/>
					</td>
				</tr>

				<tr class="style1">
					<td width="30%">
						qx4:
					</td>
					<td width="70%">
						<input name="qx4" id="qx4" type="text"  maxlength="10" watermark="请输入qx4" class="validate[custom[onlyNumberWide]]" style="width: 400px;"/>
					</td>
				</tr>

			</table>
			<table class="tableStyle" formMode="line" >
				<tr >
					<td width="50%">
						<div align="right">
						<input type="submit" value="　保　存　"/> </div>
					</td>
					<td >
						<div align="left">
						<input type="button" value="　取　消　" onclick="top.Dialog.close()" />
						</div>
					</td>
				</tr>
			</table>
			</fieldset>
			<div class="height_5"></div>--%>
		</form>
		</div>
	</div>
		
<script type="text/javascript">
function initComplete(){
	
	 //表单异步提交处理
  $('#inputForm').submit(function(){
  	//判断表单的客户端验证时候通过
		var valid = $('#inputForm').validationEngine({returnIsValid: true});
		if(valid){
		   $(this).ajaxSubmit({
		        //表单提交成功后的回调
		        success: function(responseText, statusText, xhr, $form){
		        	if("suc"==(responseText.msg)){
		        		top.Dialog.alert("保存成功!",function(){
		        			closeWin();
			             });
		        	}else{
		        		top.Dialog.alert("保存失败!"+responseText.message,function(){
		        			window.location.reload();
			             });
		        	}
		             
		        }
		    }); 
		 }
	    
	    //阻止表单默认提交事件
	    return false; 
	});
}

function closeWin(){
	//刷新数据
	top.frmright.refresh();
	//关闭窗口
	top.Dialog.close();
}
</script> 
  </body>
</html>
