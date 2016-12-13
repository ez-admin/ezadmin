<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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
	</style>
  </head>
  
  <body>
  <div class="main-container ace-save-state">
	  <div class="row">
		  <div class="col-xs-12">
			  <form class="form-horizontal" role="form" id="inputForm" action="<%=path%>/ez/system/sysmenu/add.do" method="post">
				  <div class="form-group ">
					  <label class="col-xs-12 col-sm-4 control-label no-padding-right" for="menuName"> <span class="star">*</span>菜单名称 ：</label>
					  <div class="col-xs-12 col-sm-8">
						  <div class="clearfix">
							  <input type="text" name="menuName" id="menuName" placeholder="菜单名称" class="col-xs-12 col-sm-6 required"/>
						  </div>
					  </div>
				  </div>
				  <div class="space-2"></div>

				  <div class="form-group">
					  <label class="col-xs-12 col-sm-4 control-label no-padding-right" for="menuUrl"> <span class="star">*</span>菜单URL地址：</label>
					  <div class="col-xs-12 col-sm-8">
						  <div class="clearfix">
							  <input type="text" name="menuUrl" id="menuUrl" placeholder="菜单URL地址" class="col-xs-12 col-sm-6 required" />
						  </div>
					  </div>
				  </div>
				  <div class="space-2"></div>

				  <div class="form-group">
					  <label class="col-xs-12 col-sm-4 control-label no-padding-right" for="parentId"> <span class="star">*</span>父级菜单ID：</label>
					  <div class="col-xs-12 col-sm-8">
						  <div class="input-group">
							  <input type="text" name="parentId" id="parentId" />
						  </div>
					  </div>
				  </div>
				  <div class="space-2"></div>

				  <div class="form-group">
					  <label class="col-xs-12 col-sm-4 control-label no-padding-right" for="menuOrder"> <span class="star">*</span>菜单顺序： </label>
					  <div class="col-xs-12 col-sm-8">
						  <div class="input-group">
							  <input type="text" name="menuOrder" id="menuOrder" />
						  </div>
					  </div>
				  </div>
				  <div class="space-2"></div>

				  <div class="form-group">
					  <label class="col-xs-12 col-sm-4 control-label no-padding-right" for="menuIcon"> 菜单图标：</label>
					  <div class="col-xs-12 col-sm-8">
						  <div class="clearfix">
							  <input type="text" name="menuIcon" id="menuIcon" placeholder="菜单图标" class="col-xs-12 col-sm-6" />
						  </div>
					  </div>
				  </div>
				  <div class="space-2"></div>

				  <div class="form-group">
					  <label class="col-xs-12 col-sm-4 control-label no-padding-right" > <span class="star">*</span>菜单类型：</label>
					  <div class="col-xs-12 col-sm-8">
						  <div>
							  <label class="line-height-1 blue">
								  <input type="radio" name="menuType" value="1" class="ace required"  >
								  <span class="lbl">系统菜单</span>
							  </label>
						  </div>
						  <div>
							  <label class="line-height-1 blue">
								  <input type="radio" name="menuType" value="2" class="ace">
								  <span class="lbl">业务菜单</span>
							  </label>
						  </div>
					  </div>
				  </div>
				  <div class="hr hr-dotted"></div>
				  <div class="form-group">
					  <label class="col-xs-12 col-sm-4"></label>
					  <div class="col-xs-12 col-sm-8">
						  <button class="btn btn-white btn-info btn-bold" type="submit">
							  <i class="ace-icon fa fa-floppy-o bigger-120 blue"></i>
							  保存
						  </button>
						  &nbsp;&nbsp;&nbsp;
						  <button class="btn btn-white btn-warning btn-round" type="reset">
							  <i class="ace-icon fa fa-reply "></i>
							  重置
						  </button>
					  </div>
				  </div>
			  </form>
		  </div>
	  </div>
  </div>
  <!-- 表单异步提交 -->
  <script src="/plugins/form/jquery.form.js"></script>
  <!-- 数字点击加减 -->
  <script src="/static/components/fuelux/js/spinbox.js"></script>
  <!-- 表单验证 -->
  <script src="/static/components/jquery-validation/dist/jquery.validate.min.js"></script>
  <script src="/static/components/jquery-validation/dist/additional-methods.min.js"></script>
  <script src="/static/components/jquery-validation/dist/messages_zh.js"></script>
  <!-- ace scripts -->
  <script src="/static/assets/js/src/elements.spinner.js"></script>
  <script src="/static/assets/js/src/ace.js"></script>


<script type="text/javascript">
	jQuery(function($) {
		/*数字点击加减*/
		$('#parentId').ace_spinner({
			min: 0,
			//max: 100,
			step: 1,
			icon_up: 'fa fa-plus',
			icon_down: 'fa fa-minus',
			btn_up_class:'btn-info' ,
			btn_down_class:'btn-info'
		});
		$('#menuOrder').ace_spinner({
			min: 0,
			//max: 100,
			step: 1,
			icon_up: 'fa fa-plus',
			icon_down: 'fa fa-minus',
			btn_up_class:'btn-info' ,
			btn_down_class:'btn-info'
		});
		/*表单验证*/
		$('#inputForm').validate({
			//debug: true, //调试模式取消submit的默认提交功能
			errorElement: 'div',
			errorClass: 'help-block',
			focusInvalid: false,
			ignore: "",
			/*rules: {
				menuName: {
					required: true
				},
				menuUrl: {
					required: true
				},
				parentId: {
					required: true
				},
				menuOrder: {
					required: true
				},
				menuType: {
					required: true
				}
				password: {
					required: true,
					minlength: 5
				},
				password2: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				},*/

				/*phone: {
					required: true,
					phone: 'required'
				},
				url: {
					required: true,
					url: true
				},
			},*/
			highlight: function (e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},

			success: function (e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},
			errorPlacement: function (error, element) {
				if(element.is('input[type=checkbox]') || element.is('input[type=radio]')) {
					var controls = element.closest('div[class*="col-"]');
					if(controls.find(':checkbox,:radio').length > 1) controls.append(error);
					else error.insertAfter(element.nextAll('.lbl:eq(0)').eq(0));
				}
				else if(element.is('.select2')) {
					error.insertAfter(element.siblings('[class*="select2-container"]:eq(0)'));
				}
				else if(element.is('.chosen-select')) {
					error.insertAfter(element.siblings('[class*="chosen-container"]:eq(0)'));
				}
				else error.insertAfter(element.parent());
			},
			submitHandler:function(form){
				//表单异步提交处理
				/*$('#inputForm').submit(function(){
					//判断表单的客户端验证时候通过
					var valid = $('#inputForm').validationEngine({returnIsValid: true});
					 if(valid){*/
					$(form).ajaxSubmit({
						//表单提交成功后的回调
						success: function(result){
							if("suc"==(result.msg)){
								closeWin();
								top.layer.msg("保存成功!",{icon:1});
							}else{
								location.reload();
								top.layer.msg("保存失败!"+result.message,{icon:2});
							}
						}
					});
					/*}*/

					//阻止表单默认提交事件
					return false;
				/*});*/
			}
		});
	});


function closeWin(){
	//关闭窗口
	top.layer.closeAll();
}
</script>

  </body>
</html>
