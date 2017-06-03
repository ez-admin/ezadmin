<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>图片位置管理编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<input type="hidden" name="positionId" value="${cmsimgposition.positionId}"/>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>位置名称:</label>
			<div class="layui-input-block">
				<input type="text" name="positionName" value="${cmsimgposition.positionName}"  required  lay-verify="required" placeholder="请输入位置名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">位置描述:</label>
			<div class="layui-input-block">
				<input type="text" name="positionDesc" value="${cmsimgposition.positionDesc}"  placeholder="请输入位置描述" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">是否设置图片位置类型:</label>
			<div class="layui-input-block">
				<c:if test="${cmsimgposition.tag==0}">
					<input type="radio" name="tag" lay-filter="tag" value="1" title="是" >
					<input type="radio" name="tag" lay-filter="tag" value="0" title="否" checked>
				</c:if>
				<c:if test="${cmsimgposition.tag==1}">
					<input type="radio" name="tag" lay-filter="tag" value="1" title="是" checked >
					<input type="radio" name="tag" lay-filter="tag" value="0" title="否" >
				</c:if>
			</div>
		</div>
		<div class="layui-form-item" id="imgpositionType">
			<label class="layui-form-label">图片位置类型:</label>
			<div class="layui-input-block">
				<select name="positionType" id="positionType"  >
					<option value="">请选择</option>
				</select>
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
		//监听提交
		form.on('submit(edit)', function(data){
			$.ajax({
				url: "/ez/cms/cmsimgposition/update.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
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
			return false;
		});

	});
</script>
</body>
</html>
