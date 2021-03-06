<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>菜单新增</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
</head>
<body class="container-fluid">
<form class="form-horizontal" id="formid">
	<input type="hidden" name="parentId"  value="${sysMenu.menuId}" >
	<div class="form-group">
		<label class="col-sm-2 control-label">父菜单名称:</label>
		<div class="col-sm-10">
			<input type="text" value="${sysMenu.menuName}" class="form-control" readonly>
		</div>
	</div>
	<div class="form-group">
		<label for="menuName" class="col-sm-2 control-label"><em class="required">*</em>菜单名称:</label>
		<div class="col-sm-10">
			<input type="text" id="menuName" name="menuName" required placeholder="请输入菜单名称"   class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="menuUrl" class="col-sm-2 control-label"><em class="required">*</em>菜单地址:</label>
		<div class="col-sm-10">
			<input type="text" id="menuUrl" name="menuUrl" required placeholder="请输入菜单URL地址"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="menuOrder" class="col-sm-2 control-label"><em class="required">*</em>菜单顺序:</label>
		<div class="col-sm-10">
			<input type="number" id="menuOrder" value="1" name="menuOrder" required placeholder="请输入菜单顺序"  class="form-control">
		</div>
	</div>
	<div class="form-group">
		<label for="menuIcon" class="col-sm-2 control-label">菜单图标：</label>
		<div class="col-sm-10">
			<input type="text" name="menuIcon" id="menuIcon" placeholder="请输入菜单图标" class="form-control">
			<span class="help-block">
				<a href="http://fontawesome.io/icons/" title="查看所有图标" target="_blank">
					<i class="fa fa-external-link"></i>查看所有图标
				</a>
			</span>
		</div>
	</div>
	<div class="form-group">
		<label class="col-sm-2 control-label">菜单类型：</label>
		<div class="col-sm-10">
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="0" <c:if test="${sysMenu.menuType=='0'}">checked</c:if> >&nbsp;&nbsp;开发者菜单
			</label>
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="1"  <c:if test="${sysMenu.menuType=='1'}">checked</c:if>>&nbsp;&nbsp;系统菜单
			</label>
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="2" <c:if test="${sysMenu.menuType=='2'}">checked</c:if>>&nbsp;&nbsp;业务菜单
			</label>
			<label class="radio-inline i-checks">
				<input type="radio" name="menuType" value="3" <c:if test="${sysMenu.menuType=='3'}">checked</c:if>>&nbsp;&nbsp;前台菜单
			</label>
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
                    url: "/ez/system/sysmenu/add.do",
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