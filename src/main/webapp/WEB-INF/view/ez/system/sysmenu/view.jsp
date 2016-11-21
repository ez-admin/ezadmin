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
	<link rel="stylesheet" href="static/components/bootstrap/dist/css/bootstrap.min.css" />

	<link rel="stylesheet" href="static/components/_mod/jquery-ui.custom/jquery-ui.custom.css" />
	<link rel="stylesheet" href="static/components/chosen/chosen.css" />
	<link rel="stylesheet" href="static/components/bootstrap-datepicker/dist/css/bootstrap-datepicker3.css" />
	<link rel="stylesheet" href="static/components/bootstrap-timepicker/css/bootstrap-timepicker.css" />
	<link rel="stylesheet" href="static/components/bootstrap-daterangepicker/daterangepicker.css" />
	<link rel="stylesheet" href="static/components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css" />
	<link rel="stylesheet" href="static/components/mjolnic-bootstrap-colorpicker/dist/css/bootstrap-colorpicker.css" />

	<style type="text/css">
		.main-container{
			padding-top: 20px;
		}
		label{
			text-align: right;
			font-weight: normal;
			font-size: 14px;
			line-height: 30px;
		}
		.form-group div{
			line-height: 30px;
		}
	</style>
  </head>
  
  <body>
  <div class="main-container ace-save-state">
	  <div class="row">
		  <div class="col-xs-12">
			  <form class="form-horizontal" role="form">
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right"> 菜单名称 ：</label>
					  <div class="col-xs-6">
						  ${sysmenu.menuName}
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right"> 菜单URL地址：</label>
					  <div class="col-xs-6">
						  ${sysmenu.menuUrl}
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right"> 父级菜单ID：</label>
					  <div class="col-xs-2">
						  ${sysmenu.parentId}
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right"> 菜单顺序： </label>
					  <div class="col-xs-2">
						  ${sysmenu.menuOrder}
					  </div>
				  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" > 菜单图标：</label>
					  <div class="col-xs-6">
						  <i class="ace-ico fa ${sysmenu.menuIcon}"></i>
					  </div>
				  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" > 菜单类型：</label>
					  <div class="col-xs-6">
						  <c:choose>
							  <c:when test="${sysmenu.menuType == 1}">
								  系统菜单
							  </c:when>
							  <c:otherwise>
								  业务菜单
							  </c:otherwise>
						  </c:choose>
					  </div>
				  </div>
			  </form>
		  </div>
	  </div>
  </div>

  </body>
</html>
