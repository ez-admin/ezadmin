<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>文章管理编辑</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>
<body>
<div class="container">
	<form id="formid" class="form-horizontal" role="form">
		<input type="hidden" name="cmsInfoId" value="${cmsinfo.cmsInfoId}"/>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>栏目名称:</label>
			<div class="col-sm-10">
				<select id="cmsNodeId" name="cmsNodeId" style="width: 100%" lay-verify="required">
					<option value="">请选择</option>
				</select>
				<%--<input type="number" name="cmsNodeId" value="${cmsinfo.cmsNodeId}" lay-verify="required" maxlength="10"  autocomplete="off" class="form-control">--%>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>文章标题:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsInfoTitle" value="${cmsinfo.cmsInfoTitle}"  required  lay-verify="required" placeholder="请输入文章标题" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">文章关键字:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsInfoKey" value="${cmsinfo.cmsInfoKey}"  placeholder="请输入文章关键字" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">文章摘要:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsInfoDes" value="${cmsinfo.cmsInfoDes}"  placeholder="请输入文章摘要" autocomplete="off" class="form-control">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label">文章标题图:</label>
			<div class="col-sm-10">
                <%--
				<input type="file" name="file" lay-ext="jpg|png|gif|jpeg" class="layui-upload-file">
				<input type="hidden" name="cmsInfoPicpath">
				<img id="cmsInfoPicpath" src="${cmsinfo.cmsInfoPicpath}" alt="">
				--%>
				<input type="text" name="cmsInfoPicpath" value="${cmsinfo.cmsInfoPicpath}"  placeholder="请输入文章标题图" autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>排序:</label>
			<div class="col-sm-10">
				<input type="number" name="cmsInfoOrder" value="${cmsinfo.cmsInfoOrder}" lay-verify="required" maxlength="10"  autocomplete="off" class="form-control">
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>操作时间:</label>
			<div class="col-sm-10">
				<input type="text" name="cmsInfoInserttime" value="<fmt:formatDate value='${cmsinfo.cmsInfoInserttime}' type='both' pattern='yyyy-MM-dd'/>" lay-verify="date"  placeholder="yyyy-mm-dd" autocomplete="off" class="form-control" onclick="layui.laydate({elem: this})">
			</div>
		</div>--%>
		<div class="form-group">
			<label class="col-sm-2 control-label">发布状态:</label>
			<div class="col-sm-10">
                <%--
				<c:if test="${cmsinfo.cmsInfoState==0}">
					<input type="checkbox" name="cmsInfoState" lay-skin="switch" lay-text="启用|禁用"  value="1" >
				</c:if>
				<c:if test="${cmsinfo.cmsInfoState==1}">
					<input type="checkbox" name="cmsInfoState" lay-skin="switch" lay-text="启用|禁用" checked value="1" >
				</c:if>
				--%>
				<input type="number" name="cmsInfoState" value="${cmsinfo.cmsInfoState}"   maxlength="10"  autocomplete="off" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">所属标签:</label>
			<div class="col-sm-10">
				<c:forEach items="${cmsTags}" var ="cmstags" >
					<c:if test="${cmstags.tag == true}">
						<input type="checkbox"  name="cmstag" value="${cmstags.cmsTagId}" title="${cmstags.cmsName}" checked >
					</c:if>
					<c:if test="${cmstags.tag == false}">
						<input type="checkbox"  name="cmstag" value="${cmstags.cmsTagId}" title="${cmstags.cmsName}" >
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label"><em class="required">*</em>文章内容：</label>
			<div class="col-sm-10">
				<textarea id="editor" type="text/plain" style="width:100%;height:300px;" value="${cmsinfo.cmsInfoContent}" ></textarea>
                <input type="hidden" name="cmsInfoContent" id="cmsInfoContent">
                    <%--<textarea name="cmsInfoContent"  required placeholder="请输入文章内容" class="layui-textarea">${cmsinfo.cmsInfoContent}</textarea>--%>
			</div>
		</div>
		<%--<div class="layui-form-item">
			<label class="layui-form-label">发布开始时间:</label>
			<div class="layui-input-block">
				<input type="text" name="publishStartime" value="<fmt:formatDate value='${cmsinfo.publishStartime}' type='both' pattern='yyyy-MM-dd'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布结束时间:</label>
			<div class="layui-input-block">
				<input type="text" name="publishEndtime" value="<fmt:formatDate value='${cmsinfo.publishEndtime}' type='both' pattern='yyyy-MM-dd'/>"  placeholder="yyyy-mm-dd" autocomplete="off" class="layui-input" onclick="layui.laydate({elem: this})">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布人:</label>
			<div class="layui-input-block">
				<input type="text" name="author" value="${cmsinfo.author}"  placeholder="请输入添加内容的管理员" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章点击数:</label>
			<div class="layui-input-block">
				<input type="number" name="countClick" value="${cmsinfo.countClick}"   maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章来源:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsFrom" value="${cmsinfo.cmsNewsFrom}"  placeholder="请输入文章来源" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章来源地址:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsUrl" value="${cmsinfo.cmsNewsUrl}"  placeholder="请输入文章来源地址" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章作者:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsNewsAuthor" value="${cmsinfo.cmsNewsAuthor}"  placeholder="请输入文章作者" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">seo关键词:</label>
			<div class="layui-input-block">
				<input type="text" name="newSeoKey" value="${cmsinfo.newSeoKey}"  placeholder="请输入seo关键词" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">seo描述:</label>
			<div class="layui-input-block">
				<input type="text" name="newSeoDes" value="${cmsinfo.newSeoDes}"  placeholder="请输入seo描述" autocomplete="off" class="layui-input">
			</div>
		</div>--%>
		<div class="form-group">
			<div class="col-sm-2 control-label">
				<button type="submit" class="btn btn-default" >保存</button>
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
    //select2插件
    $(function() {
        $("#cmsNodeId").append('${cmsnodeList}');
        $("#cmsNodeId").select2tree({
            placeholder: '请选择一个栏目',
            allowClear: true
        });
        //实例化编辑器
        window.UEDITOR_CONFIG.charset="utf-8";
        UE.getEditor('editor');
        //表单验证加提交
        $("#formid").validate({
            submitHandler: function () {
                var ue = UE.getEditor('editor');
                $("#cmsInfoContent").val(ue.getContent());
                $.ajax({
                    url:"/ez/cms/cmsinfo/update.do",
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
    /*layui.use(['layer', 'form','jquery','laydate','upload','element'], function(){
        var layer = layui.layer
            ,form = layui.form()
            ,element = layui.element()
            ,$ = layui.jquery
            ,laydate = layui.laydate;
        //实例化编辑器
        window.UEDITOR_CONFIG.charset="utf-8";
        var ue = UE.getEditor('editor');
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
		//监听提交
		form.on('submit(edit)', function(data){
            $("#cmsInfoContent").val(ue.getContent());
			//layer.msg(JSON.stringify(data.field));
			$.ajax({
				url: "/ez/cms/cmsinfo/update.do",
				type: "POST",
				data:$('#formid').serialize(),// 你的formid
				success: function (result) {
					if("suc"==(result.msg)){
						//关闭窗口
						top.layer.closeAll();
						top.layer.msg('修改成功!',{icon: 1});
					}else{
						top.layer.msg('修改失败!'+result.message,{icon: 2});
					}
				}
			});
			return false;
		});
	});*/
</script>
</body>
</html>
