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
    <input type="hidden" name="parentId" value="${sysMenu.parentId}">
    <input type="hidden" name="menuId" value="${sysMenu.menuId}">
    <div class="form-group">
        <label for="menuName" class="col-sm-2 control-label"><em class="required">*</em>菜单名称:</label>
        <div class="col-sm-10">
            <input type="text" id="menuName" name="menuName" value="${sysMenu.menuName}" required placeholder="请输入菜单名称" autocomplete="off"  class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label for="menuUrl" class="col-sm-2 control-label"><em class="required">*</em>菜单地址:</label>
        <div class="col-sm-10">
            <input type="text" id="menuUrl" name="menuUrl" value="${sysMenu.menuUrl}" required placeholder="请输入菜单URL地址" autocomplete="off" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label for="menuOrder" class="col-sm-2 control-label"><em class="required">*</em>菜单顺序:</label>
        <div class="col-sm-10">
            <input type="number" id="menuOrder" value="${sysMenu.menuOrder}" name="menuOrder" required placeholder="请输入菜单顺序" autocomplete="off" class="form-control">
        </div>
    </div>
    <div class="form-group">
        <label for="menuIcon" class="col-sm-2 control-label">菜单图标：</label>
        <div class="col-sm-10">
            <input type="text" name="menuIcon" id="menuIcon" value="${sysMenu.menuIcon}"  placeholder="请输入菜单图标" autocomplete="off" class="form-control">
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
                <input type="radio" name="menuType" value="0" <c:if test="${sysMenu.menuType=='0'}">checked</c:if>>&nbsp;&nbsp;开发者菜单
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
            <button type="submit" class="btn btn-primary">修改</button>
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
                    url: "/ez/system/sysmenu/update.do",
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
<%--<body>
<div class="layui-field-box">
    <form id="formid" class="layui-form">
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>菜单名称:</label>
            <div class="layui-input-block">
                <input type="text" name="menuName" value="${sysMenu.menuName}" lay-verify="required" placeholder="请输入菜单名称" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>菜单地址:</label>
            <div class="layui-input-block">
                <input type="text" name="menuUrl" value="${sysMenu.menuUrl}" lay-verify="required" placeholder="请输入菜单URL地址" autocomplete="off" class="layui-input">
            </div>
        </div>
        <input type="hidden" name="menuId"  value="${sysMenu.menuId}" >
        <input type="hidden" name="parentId"  value="${sysMenu.parentId}" >
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>菜单顺序:</label>
            <div class="layui-input-block">
                <input type="number" name="menuOrder" value="${sysMenu.menuOrder}"  lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>菜单图标:</label>
            <div class="layui-input-inline">
                <input type="text" name="menuIcon" value="${sysMenu.menuIcon}" lay-verify="required" placeholder="请输入菜单图标" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <a href="http://fontawesome.io/icons/" title="查看所有图标" target="_blank">
                    <i class="fa fa-external-link"></i>
                </a>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><em class="required">*</em>菜单类型</label>
            <div class="layui-input-block">
                <c:if test="${sysMenu.menuType=='0'}">
                    <input type="radio" name="menuType" value="0" title="开发者菜单" checked>
                    <input type="radio" name="menuType" value="1" title="系统菜单" >
                    <input type="radio" name="menuType" value="2" title="业务菜单">
                    <input type="radio" name="menuType" value="3" title="前台菜单" >
                </c:if>
                <c:if test="${sysMenu.menuType=='1'}">
                    <input type="radio" name="menuType" value="0" title="开发者菜单" >
                    <input type="radio" name="menuType" value="1" title="系统菜单" checked>
                    <input type="radio" name="menuType" value="2" title="业务菜单">
                    <input type="radio" name="menuType" value="3" title="前台菜单" >
                </c:if>
                <c:if test="${sysMenu.menuType=='2'}">
                    <input type="radio" name="menuType" value="0" title="开发者菜单" >
                    <input type="radio" name="menuType" value="1" title="系统菜单" >
                    <input type="radio" name="menuType" value="2" title="业务菜单" checked>
                    <input type="radio" name="menuType" value="3" title="前台菜单" >
                </c:if>
                <c:if test="${sysMenu.menuType=='3'}">
                    <input type="radio" name="menuType" value="0" title="开发者菜单" >
                    <input type="radio" name="menuType" value="1" title="系统菜单" >
                    <input type="radio" name="menuType" value="2" title="业务菜单" >
                    <input type="radio" name="menuType" value="3" title="前台菜单"  checked>
                </c:if>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit">编辑</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<script>
    //Demo
    layui.use(['layer', 'form','jquery'], function(){
        var layer = layui.layer
                ,form = layui.form()
                ,$ = layui.jquery;
        //监听提交
        form.on('submit(edit)', function(data){
            //layer.msg(JSON.stringify(data.field));
            $.ajax({
                url: "/ez/system/sysmenu/update.do",
                type: "POST",
                data:$('#formid').serialize(),// 你的formid
                success: function (result) {
                    if("suc"==(result.msg)){
                        //关闭窗口
                        top.layer.closeAll();
                        top.layer.msg('保存成功!',{icon: 1});
                    }else{
                        top.layer.msg('保存失败!'+result.message,{icon: 2,time: 5000});
                    }
                }
            });
            return false;
        });
    });
</script>--%>
</body>
</html>