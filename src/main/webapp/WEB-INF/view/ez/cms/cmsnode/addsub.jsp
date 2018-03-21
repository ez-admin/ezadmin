<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>栏目管理新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<style>
		.field-box{
			padding: 20px 0;
		}
	</style>
</head>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        fun();
    });
	function add1(){
        $.ajax({
            url: "/ez/cms/cmsnode/add.do",
            type: "POST",
            data:$('#node-form').serialize(),
            async:false,
            success: function (result) {
                var msg = JSON.parse(result);
                if ("suc" == (msg.msg)) {
                    //关闭窗口
                    top.layer.closeAll();
                    top.layer.msg('保存成功!', {icon: 1});
                } else {
                    top.layer.msg('保存失败!', {icon: 2});
                }
            }
        });
	}
    function fun(){
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1026},
            dataType: 'json',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (data) {
                $("#cmsNodeType").append(data.result);
            }
        });
    }
</script>
<body>
<div class="field-box">
	<form id="node-form" class="form-horizontal">
		<input type="hidden" name="cmsNodeParentId" value="${cmsnode.cmsNodeId}" >
		<div class="form-group">
			<label class="col-sm-2 control-label">上级栏目:</label>
			<div class="col-sm-8">
				<input type="text"  value="${cmsnode.cmsNodeName}"  readonly class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>栏目名称:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsNodeName" required placeholder="请输入栏目名称" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目编码:</label>
			<div class="col-sm-8">
				<input type="text" name="cmsNodeCode" placeholder="请输入栏目编码" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目排序:</label>
			<div class="col-sm-8">
				<input type="number" name="cmsNodeSort" value="1"  maxlength="10"  autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">栏目类型:</label>
			<div class="col-sm-8">
				<select name="cmsNodeType" id="cmsNodeType" class="form-control">
					<option value="">请选择栏目类型</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<div class="checkbox">
					<label>
						<input type="checkbox" name="cmsNodeState" value="1"> 启动/禁用
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button onclick="add1()" class="btn btn-primary">保存</button>
				<button type="reset" class="btn btn-default">重置</button>
			</div>
		</div>
	</form>
</div>
<%--<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>--%>
<%--<script>--%>
	<%--//Demo--%>
	<%--layui.use(['layer', 'form','jquery','laydate'], function(){--%>
		<%--var layer = layui.layer--%>
				<%--,form = layui.form()--%>
				<%--,$ = layui.jquery--%>
				<%--,laydate = layui.laydate;--%>
        <%--//后台获取select值--%>
        <%--$.ajax({--%>
            <%--url: '/ez/system/sysdictionary/getSdBySdtCode.do',--%>
            <%--type: "POST",--%>
            <%--data:{code:1026},--%>
            <%--dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等--%>
            <%--success: function (result) {--%>
                <%--$("#cmsNodeType").append(result);--%>
                <%--form.render('select');--%>
            <%--}--%>
        <%--});--%>
		<%--//监听提交--%>
		<%--form.on('submit(add)', function(data){--%>
			<%--//layer.msg(JSON.stringify(data.field));--%>
			<%--$.ajax({--%>
				<%--url: "/ez/cms/cmsnode/add.do",--%>
				<%--type: "POST",--%>
				<%--data:$('#formid').serialize(),// 你的formid--%>
				<%--success: function (result) {--%>
					<%--if("suc"==(result.msg)){--%>
						<%--//关闭窗口--%>
						<%--top.layer.closeAll();--%>
						<%--top.layer.msg('保存成功!',{icon: 1});--%>
					<%--}else{--%>
						<%--top.layer.msg('保存失败!'+result.message,{icon: 2});--%>
					<%--}--%>
				<%--}--%>
			<%--});--%>
			<%--return false;--%>
		<%--});--%>
	<%--});--%>
<%--</script>--%>
</body>
</html>
