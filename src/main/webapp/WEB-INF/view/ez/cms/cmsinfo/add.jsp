<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>文章管理新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<style>
		.field-box{

		}
	</style>
</head>
<body>
<div class="container">
	<form id="formid" class="form-horizontal" role="form">
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>所属栏目:</label>
			<div class="col-sm-10">
				<select id="cmsNodeId" name="cmsNodeId" style="width: 100%" required>
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>文章标题:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsInfoTitle"  required placeholder="请输入文章标题" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">文章关键字:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsInfoKey" placeholder="请输入文章关键字" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">文章摘要:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsInfoDes" placeholder="请输入文章摘要" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">文章标题图:</label>
			<div class="col-sm-10">
				<input type="file" name="file" lay-ext="jpg|png|gif|jpeg" >
				<input type="hidden" name="cmsInfoPicpath">
				<img id="cmsInfoPicpath" src="" alt="">
				<%--<input type="text" name="cmsInfoPicpath" placeholder="请输入文章标题图" autocomplete="off" class="form-control">--%>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>排序:</label>
			<div class="col-sm-10">
				<input type="number" name="cmsInfoOrder" value="1"   required maxlength="10"  autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">发布状态:</label>
			<div class="col-sm-10">
				<input type="checkbox" name="cmsInfoState" lay-skin="switch" lay-text="启用|禁用" checked value="1">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">所属标签:</label>
			<div class="col-sm-10">
				<c:forEach items="${cmsTags}" var ="cmstags" >
					<input type="checkbox"  name="cmstag" value="${cmstags.cmsTagId}" title="${cmstags.cmsName}" >
					<c:if test="${sysrole.hasRole== true}">
						<input type="checkbox"  name="roleId" value="${sysrole.roleId}" title="${sysrole.roleName}" checked>
					</c:if>
					<c:if test="${sysrole.hasRole== false}">
						<input type="checkbox"  name="roleId" value="${sysrole.roleId}" title="${sysrole.roleName}" >
					</c:if>
				</c:forEach>
			</div>
		</div>
        <div class="form-group">
            <label class="col-sm-2 control-label"><em class="required">*</em>文章内容：</label>
            <div class="col-sm-10">
                <textarea id="editor" type="text/plain" style="width:100%;height:300px;" ></textarea>
                <input type="hidden" name="cmsInfoContent" id="cmsInfoContent">
            </div>
        </div>

		<!--<div class="layui-form-item">
			<label class="layui-form-label">发布开始时间:</label>
			<div class="layui-input-block">
				<input type="text" name="publishStartime" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布结束时间:</label>
			<div class="layui-input-block">
				<input type="text" name="publishEndtime" placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章来源:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsFrom" placeholder="请输入文章来源" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章来源地址:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsUrl" placeholder="请输入文章来源地址" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章作者:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsAuthor" placeholder="请输入文章作者" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">seo关键词:</label>
			<div class="layui-input-block">
				<input type="text" name="newSeoKey" placeholder="请输入seo关键词" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">seo描述:</label>
			<div class="layui-input-block">
				<input type="text" name="newSeoDes" placeholder="请输入seo描述" autocomplete="off" class="layui-input">
			</div>
		</div>-->
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-8">
				<button type="submit" class="btn btn-primary" >保存</button>
				<button type="reset" class="btn btn-default">重置</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<%--<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>--%>
<%--select2tree plugins--%>
<link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
<link rel="stylesheet" href="/static/plugins/select2tree/css/select2.min.css" class="css">
<link rel="stylesheet" href="/static/plugins/select2tree/css/select2-bootstrap.min.css" class="css">
<script type="text/javascript" src="/static/plugins/select2tree/js/select2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/plugins/select2tree/js/zh-CN.js" charset="utf-8"></script>
<script type="text/javascript" src="/static/plugins/select2tree/js/select2tree.js" charset="utf-8"></script>
<!--百度Ueditor富文本编辑器-->
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/ueditor.all.min.js"> </script>
<script type="text/javascript" charset="utf-8" src="/static/plugins/ueditor1_4_3_3/lang/zh-cn/zh-cn.js"></script>
<!--form validation-->
<script src="/static/plugins/jquery-validation/jquery-validation.min.js"></script>
<script src="/static/plugins/jquery-validation/jquery.validation_zh_CN.js"></script>
<!--layer-->
<script type="text/javascript" src="/static/plugins/layer/layer.js"></script>
<script>
    $(function() {
        //select2插件
        $("#cmsNodeId").append('${cmsnodeList}');
        $("#cmsNodeId").select2tree({
            placeholder: '请选择一个栏目',
            allowClear: true,
        });
    //后台获取select值
     /*$.ajax({
         url: '/ez/cms/cmstag/getSdBySdtCode.do',
         type: "POST",
         //data:{code:1025},
         dataType: 'json',//(string)预期返回的数据类型。xml,html,json,text等
         success: function (result) {
             $("#cmsTagId").append(result);
             //form.render('select');
         }
     });*/
     //实例化编辑器
     window.UEDITOR_CONFIG.charset="utf-8";
     UE.getEditor('editor',{toolbars: window.UEDITOR_CONFIG.toolbars});
     //表单验证加提交
     $("#formid").validate({
         submitHandler: function(form){
             var ue = UE.getEditor('editor');
             $("#cmsInfoContent").val(ue.getContent());
             $.ajax({
                 url:"/ez/cms/cmsinfo/add.do",
                 type: "POST",
                 data:$('#formid').serialize(),
                 dataTpye:"json",
                 beforeSend: function () {
                     // 禁用按钮防止重复提交
                     $("button[type='submit']").attr({ disabled: "disabled" });
                 },
                 complete: function () {
                     $("button[type='submit']").removeAttr("disabled");
                 },
                 success: function (result) {
                     if("suc"==(result.msg)){
                         //关闭窗口
                         top.layer.closeAll();
                         top.layer.msg('保存成功!',{icon: 1});
                     }else{
                         top.layer.msg('保存失败!'+result.message,{icon: 2});
                     }
                 },
                 error: function () {
                     top.layer.alert("请求失败!");
                 }
             })
         }
     })
 });
 //Demo
 /* layui.use(['layer', 'form','jquery','laydate','upload','element'], function(){
     var layer = layui.layer
         ,form = layui.form()
         ,element = layui.element()
         ,$ = layui.jquery
         ,laydate = layui.laydate;
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
                  $("input[name=cmsInfoPicpath]").attr("value",res.url);
                  $("#cmsInfoPicpath").attr("src",res.url);
                  $("#cmsInfoPicpath").attr("alt",res.filename);
                  //$("#cmsInfoPicpath").show();
                  top.layer.msg('上传成功！',{icon:1});
              }else{
                  top.layer.msg('上传失败!'+res.message,{icon: 2});
              }
          }
      });
     //后台获取select值
    /* $.ajax({
         url: '/ez/cms/cmstag/getSdBySdtCode.do',
         type: "POST",
         //data:{code:1025},
         dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
         success: function (result) {
             $("#cmsTagId").append(result);
             form.render('select');
         }
     });
     //实例化编辑器
     window.UEDITOR_CONFIG.charset="utf-8";
     var ue = UE.getEditor('editor');
     //监听提交
     /* form.on('submit(add)', function(data){
     $("#cmsInfoContent").val(ue.getContent());
     //layer.msg(JSON.stringify(data.field));
     $.ajax({
         url: "/ez/cms/cmsinfo/add.do",
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
 });*/
</script>
</body>
</html>
