<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>栏目管理编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<script type="text/javascript" src="/static/plugins/My97DatePicker/cn_WdatePicker.js"></script>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
	$(function () {
		fun();
    });
    function edit(){
        $.ajax({
            url: "/ez/cms/cmsnode/update.do",
            type: "POST",
            data:$('#formid').serialize(),// 你的formid
            dataType: "json",
            async:false,
            success: function (result) {
                if("suc"==(result.msg)){
                    //关闭窗口
                    top.layer.closeAll();
                    top.layer.msg('修改成功!',{icon: 1});
                }else{
                    top.layer.msg('修改失败!'+result.message,{icon: 2},function () {
                        location.reload();
                    });
                }
            }
        });
    }
    function fun(){
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1026,selected:'${cmsnode.cmsNodeType}'},
            dataType: 'json',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (data) {
                $("#cmsNodeType").append(data.result);
            }
        });
	}
</script>
<div class="field-box">
	<form id="formid" class="form-horizontal">
		<input type="hidden" name="cmsNodeId" value="${cmsnode.cmsNodeId}"/>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>栏目名称:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsNodeName" value="${cmsnode.cmsNodeName}"  required placeholder="请输入栏目名称" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目编码:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsNodeCode" value="${cmsnode.cmsNodeCode}"  placeholder="请输入栏目编码" autocomplete="off" class="form-control">
			</div>
		</div>
<%--		<div class="layui-form-item">
			<label class="layui-form-label">栏目父级id:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsNodeParentId" value="${cmsnode.cmsNodeParentId}"   maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>--%>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目排序:</label>
			<div class="col-sm-8">
				<input type="number" name="cmsNodeSort" value="1"  maxlength="10"  autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目类型:</label>
			<div class="col-sm-8">
				<select name="cmsNodeType" id="cmsNodeType">
					<option value="">请选择栏目类型</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目状态:</label>
			<div class="col-sm-8">
				<c:if test="${cmsnode.cmsNodeState==0}">
					<input type="checkbox" name="cmsNodeState" value="1">启用|禁用
				</c:if>
				<c:if test="${cmsnode.cmsNodeState==1}">
					<input type="checkbox" name="cmsNodeState" checked="checked" value="1">启用|禁用
				</c:if>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">操作时间:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsNodeInserttime" value="<fmt:formatDate value='${cmsnode.cmsNodeInserttime}'  type='both' pattern='yyyy-MM-dd HH:mm:ss'/>"   placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'});">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button onclick="edit()" class="btn btn-primary">保存</button>
				<button type="reset" class="btn btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>
