<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="digits" uri="http://www.springframework.org/tags/form" %>
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
	<link rel="stylesheet" href="static/components/bootstrap/dist/css/bootstrap.min.css" />

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
		<link rel="stylesheet" href="plugins/form/css/bootstrapValidator.min.css" />
	<%--<script src="plugins/form/validationRule.js" type="text/javascript"></script>
	<script src="plugins/form/validation.js" type="text/javascript"></script>
	<script type="text/javascript" src="plugins/form/jquery-validate.bootstrap-tooltip.js"></script>--%>
	<script type="text/javascript" src="plugins/form/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript" src="plugins/form/js/zh_CN.js"></script>
	<!-- 表单验证end -->
	<style type="text/css">
		.main-container{
			padding-top: 20px;
			background-color: rgb(245, 245, 245);
		}
		label{
			text-align: right;
			font-weight: normal;
			font-size: 14px;
			line-height: 30px;
		}
		.form-actions {
			margin-bottom: 0;
		}
	</style>
  </head>
  
  <body>
  <div class="main-container ace-save-state">
	  <div class="row">
		  <div class="col-xs-12">
			  <form class="form-horizontal" role="form" id="inputForm" action="<%=path%>/ez/system/sysmenu/add.do"
					method="post" failAlert="表单填写不正确，请按要求填写！">
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuName"> <span class="star">*</span>菜单名称：</label>
					  <div class="col-xs-6">
						  <input type="text" name="menuName" id="menuName" placeholder="菜单名称" class="form-control"
								 maxlength="3" required/>
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuUrl"> 菜单URL地址：</label>
					  <div class="col-xs-6">
						  <input type="text" name="menuUrl" id="menuUrl" placeholder="菜单URL地址" class="form-control"
								 required />
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="parentId"> 父级菜单ID：</label>
					  <div class="col-xs-2">
						  <input type="number" name="parentId" id="parentId" placeholder="数字" class="form-control"
								step="1" min="0" required />
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuOrder"> 菜单顺序：</label>
					  <div class="col-xs-2">
						  <input type="number" name="menuOrder" id="menuOrder" placeholder="数字" class="form-control"
								 step="1" min="0" required />
					  </div>
				  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuIcon"> 菜单图标：</label>
					  <div class="col-xs-6">
						  <input type="text" name="menuIcon" id="menuIcon" placeholder="菜单图标" class="form-control"
								 required />
					  </div>
				  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuType"> 菜单类型：</label>
					  <div class="col-xs-6">
						  <input type="text" name="menuType" id="menuType" placeholder="菜单类型" class="form-control"
								 required />
					  </div>
				  </div>

				  <div class="form-actions center">
					  <button class="btn btn-white btn-info btn-bold" type="submit">
						  <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
						  保存
					  </button>
					  <button class="btn btn-white btn-warning btn-round" onclick="top.Dialog.close()">
						  <i class="ace-icon fa fa-reply "></i>
						  取消
					  </button>
				  </div>
			  </form>
		  </div>
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
		        			window.parent.location.reload();
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
	window.parent.location.reload();
	//关闭窗口
	top.Dialog.close();
}
</script> 
  </body>
</html>
