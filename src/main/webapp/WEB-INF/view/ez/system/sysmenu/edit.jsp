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
	<!-- 表单异步提交start -->
	<script src="plugins/form/form.js" type="text/javascript"></script>
	<!-- 表单异步提交end -->
	<style type="text/css">
        body{
            background-color: #ffffff;
        }
        .main-container{
            padding: 20px;
        }
	</style>
  </head>
  
  <body>
  <div class="main-container ace-save-state">
	  <div class="row">
		  <div class="col-xs-12">
			  <form class="form-horizontal" role="form" id="inputForm" action="<%=path%>/ez/system/sysmenu/update.do"
					method="post">
					<input type="hidden" name="menuId" value="${sysmenu.menuId}">
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuName"> 菜单名称 ：</label>
					  <div class="col-xs-6">
						  <input type="text" name="menuName" id="menuName" value="${sysmenu.menuName}" placeholder="菜单名称" class="form-control"
								  required/>
					  </div>
                      <span class="star">*</span>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuUrl"> 菜单URL地址：</label>
					  <div class="col-xs-6">
						  <input type="text" name="menuUrl" id="menuUrl" value="${sysmenu.menuUrl}" placeholder="菜单URL地址" class="form-control"
								 required />
					  </div>
                      <span class="star">*</span>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="parentId"> 父级菜单ID：</label>
					  <div class="col-xs-2">
						  <input type="number" name="parentId" id="parentId" value="${sysmenu.parentId}" placeholder="数字" class="form-control"
								step="1" min="0" required />
					  </div>
                      <span class="star">*</span>
				  </div>

				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuOrder"> 菜单顺序： </label>
					  <div class="col-xs-2">
						  <input type="number" name="menuOrder" id="menuOrder" value="${sysmenu.menuOrder}" placeholder="数字" class="form-control"
								 step="1" min="0" required />
					  </div>
                      <span class="star">*</span>
                  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" for="menuIcon"> 菜单图标：</label>
					  <div class="col-xs-6">
						  <input type="text" name="menuIcon" id="menuIcon" value="${sysmenu.menuIcon}" placeholder="菜单图标" class="form-control"
						  />
					  </div>
				  </div>
				  <div class="form-group">
					  <label class="col-xs-4 control-label no-padding-right" > 菜单类型：</label>
					  <div class="col-xs-6">
						  <label>
							  <input type="radio" name="menuType" value="1" <c:if test="${sysmenu.menuType == '1' }">checked="checked"</c:if> >
							  系统菜单
						  </label>
						  <label>
							  <input type="radio" name="menuType" value="2" <c:if test="${sysmenu.menuType == '1' }">checked="checked"</c:if> >
							  业务菜单
						  </label>
					  </div>
				  </div>
				  <div class="form-group">
                      <div class="col-xs-4"></div>
                      <div class="col-xs-6">
                          <button class="btn btn-white btn-info btn-bold" type="submit">
                              <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
                              保存
                          </button>
                          <button class="btn btn-white btn-warning btn-round" onclick="top.Dialog.close()">
                              <i class="ace-icon fa fa-reply "></i>
                              取消
                          </button>
                      </div>
				  </div>
			  </form>
		  </div>
	  </div>
  </div>
<script type="text/javascript">

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


function closeWin(){
	//刷新数据
	window.parent.location.reload();
	//关闭窗口
	top.Dialog.close();
}
</script> 
  </body>
</html>
