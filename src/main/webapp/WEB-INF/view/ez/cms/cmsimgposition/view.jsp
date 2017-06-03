<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>查看图片位置管理信息</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>位置名称:</label>
			<div class="layui-input-block">
				<input type="text" name="positionName" value="${cmsimgposition.positionName}"  required  lay-verify="required" placeholder="请输入位置名称" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">位置描述:</label>
			<div class="layui-input-block">
				<input type="text" name="positionDesc" value="${cmsimgposition.positionDesc}"  placeholder="请输入位置描述" autocomplete="off" class="layui-input layui-disabled">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>操作时间:</label>
			<div class="layui-input-block">
				<input type="text" name="inserttime" value="<fmt:formatDate value='${cmsimgposition.inserttime}'  type='both' pattern='yyyy-MM-dd hh:mm:ss'/>"   placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input layui-disabled" disabled onclick="layui.laydate({elem: this, istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">是否设置图片位置类型:</label>
			<div class="layui-input-block">
				<c:if test="${cmsimgposition.tag==0}">
					<input type="radio" name="tag" lay-filter="tag" value="1" title="是" disabled>
					<input type="radio" name="tag" lay-filter="tag" value="0" title="否" checked>
				</c:if>
				<c:if test="${cmsimgposition.tag==1}">
					<input type="radio" name="tag" lay-filter="tag" value="1" title="是" checked >
					<input type="radio" name="tag" lay-filter="tag" value="0" title="否" disabled>
				</c:if>
			</div>
		</div>
		<div class="layui-form-item" id="imgpositionType">
			<label class="layui-form-label">图片位置类型:</label>
			<div class="layui-input-block">
				<select name="positionType" id="positionType" disabled >
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="top.layer.closeAll()">关闭</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<script>
	//Demo
	layui.use(['layer', 'form','jquery','laydate'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery
				,laydate = layui.laydate;
//判断默认是否加载位置类型
        if(${cmsimgposition.tag==0}){
            $("#imgpositionType").hide();
        }
        //监听单选框
        form.on('radio(tag)', function(data){
            var tag=data.value;
            if (0==tag){//否
                if ( !$("#imgpositionType").is(":hidden") ){
                    $("#imgpositionType").hide();
                };
            }else {
                if ( $("#imgpositionType").is(":hidden") ){
                    $("#imgpositionType").show();
                };
            }
        });
        //后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1025,selected:'${cmsimgposition.positionType}'},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#positionType").append(result);
                form.render('select');
            }
        });
	});
</script>
</body>
</html>
