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
	<style type="text/css">
		body{
			background-color: #ffffff;
		}
		.main-container{
			padding: 20px;
		}
		.inputdiv{
			line-height: 35px;
			font-weight: normal;
			font-size: 14px;
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
						  <input type="text" value="${sysmenu.menuName}" class="form-control" readonly/>
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right"> 菜单URL地址：</label>
					  <div class="col-xs-6">
						  <input type="text" value="${sysmenu.menuUrl}" class="form-control" readonly/>
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right"> 父级菜单ID：</label>
					  <div class="col-xs-1">
						  <input type="text" value="${sysmenu.parentId}" class="form-control" readonly/>
					  </div>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right"> 菜单顺序： </label>
					  <div class="col-xs-1">
						  <input type="text" value="${sysmenu.menuOrder}" class="form-control" readonly/>
					  </div>
				  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" > 菜单图标：</label>
					  <div class="col-xs-2">
						  <input type="text" value="${sysmenu.menuIcon}" class="form-control" readonly>
					  </div>
					  <i class="ace-ico fa ${sysmenu.menuIcon} inputdiv"></i>
				  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" > 菜单类型：</label>
					  <div class="col-xs-6 inputdiv">
						  <c:choose>
							  <c:when test="${sysmenu.menuType == 1}">
								  <input type="radio" checked readonly>系统菜单
							  </c:when>
							  <c:otherwise>
								  <input type="radio" checked readonly>业务菜单
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
