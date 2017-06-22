<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>图片管理新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">

		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>图片名称:</label>
			<div class="layui-input-block">
				<input type="text" name="emImageName" required  lay-verify="required" placeholder="请输入图片名称" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>图片位置:</label>
			<div class="layui-input-block">
				<select name="positionId" id="positionId">
					<option value="">请选择图片所属位置</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>图片地址:</label>
			<div class="layui-input-block">
				<input type="file" name="file" lay-ext="jpg|png|gif" class="layui-upload-file">
				<input type="hidden" name="emImageUrl">
				<img id="emImageUrl" src="" alt="">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">图片外链:</label>
			<div class="layui-input-block">
				<input type="text" name="emImageLinkurl"  placeholder="请输入图片外链" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>排序:</label>
			<div class="layui-input-block">
				<input type="number" name="emImageOrder" value="1"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>发布状态:</label>
			<div class="layui-input-block">
				<input type="checkbox" name="emImageStat" lay-skin="switch" lay-text="启用|禁用" checked value="1">
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label">图片缩略图:</label>
			<div class="layui-input-block">
				<input type="text" name="emImageSmallUrl" placeholder="请输入图片缩略图" autocomplete="off" class="layui-input">
			</div>
		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label">是否isnofollow:</label>
			<div class="layui-input-block">
				<input type="radio" name="isnofollow" lay-filter="isnofollow" value="0" title="否" checked>
				<input type="radio" name="isnofollow" lay-filter="isnofollow" value="1" title="是" >
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="add">保存</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<script>
	//Demo
	layui.use(['layer', 'form','jquery','laydate','upload','element'], function(){
		var layer = layui.layer
				,form = layui.form()
            	,element = layui.element()
				,$ = layui.jquery
				,laydate = layui.laydate;
        //后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1025},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#positionId").append(result);
                form.render('select');
            }
        });
        //上传图片
        layui.upload({
            url: '/ez/cms/cmsimginfo/uploadimg.do',
            method: 'post', //上传接口的http类型
            before: function(input){
                //返回的参数item，即为当前的input DOM对象
                //top.layer.msg('正在上传，请勿操作！');
                top.layer.load();
            },
            success: function(res,input){
                top.layer.closeAll('loading');
                if(res.msg == "suc"){
                    $("input[name=emImageUrl]").attr("value",res.url);
                    $("#emImageUrl").attr("src",res.url);
                    $("#emImageUrl").attr("alt",res.filename);
                    $("#emImageUrl").show();
                    top.layer.msg('上传成功！',{icon:1});
                }else{
                    top.layer.msg('上传失败!'+res.message,{icon: 2});
                }
            }
        });
		//监听提交
		form.on('submit(add)', function(data){
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/cms/cmsimginfo/add.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('保存成功!',{icon: 1});
					}else{
						top.layer.msg('保存失败!'+result.message,{icon: 2});
					}
				}
			});
			return false;
		});
	});
</script>
</body>
</html>
