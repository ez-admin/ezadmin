<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>文章管理新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<style>
		.replaceselect .layui-form-select{
			display: none;
		}
		.replaceselect  .select2-search {
			display: none;
		}
		.replaceselect  .select2-search__field{
			display: none;
		}
		.layui-form-label{
			width:110px;
		}
		.layui-form-onswitch i {
			left: 26px;
		}
		.layui-form-switch {
			width: 50px;
		}
		.select2-container--bootstrap .select2-results>.select2-results__options {
			max-height: 400px;
		}
		.layui-form-onswitch i {
			left: 30px;
		}
	</style>
</head>
<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
		<div class="layui-form-item replaceselect">
			<label class="layui-form-label"><em class="required">*</em>所属栏目:</label>
			<div class="layui-input-block">
				<select id="cmsNodeId" name="cmsNodeId" style="width: 100%" lay-verify="required">
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>文章标题:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoTitle" required  lay-verify="required" placeholder="请输入文章标题" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章关键字:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoKey" placeholder="请输入文章关键字" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章摘要:</label>
			<div class="layui-input-block">
				<input type="text" name="cmsInfoDes" placeholder="请输入文章摘要" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文章标题图:</label>
			<div class="layui-input-block">
				<input type="file" name="file" lay-ext="jpg|png|gif|jpeg" class="layui-upload-file">
				<input type="hidden" name="cmsInfoPicpath">
				<img id="cmsInfoPicpath" src="" alt="">
				<%--<input type="text" name="cmsInfoPicpath" placeholder="请输入文章标题图" autocomplete="off" class="layui-input">--%>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>排序:</label>
			<div class="layui-input-block">
				<input type="number" name="cmsInfoOrder" value="1"   lay-verify="required" maxlength="10"  autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">发布状态:</label>
			<div class="layui-input-block">
				<input type="checkbox" name="cmsInfoState" lay-skin="switch" lay-text="启用|禁用" checked value="1">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">所属标签:</label>
			<div class="layui-input-block">
				<c:forEach items="${cmsTags}" var ="cmstags" >
					<input type="checkbox"  name="cmstag" value="${cmstags.cmsTagId}" title="${cmstags.cmsName}" >
					<%--<c:if test="${sysrole.hasRole== true}">
						<input type="checkbox"  name="roleId" value="${sysrole.roleId}" title="${sysrole.roleName}" checked>
					</c:if>
					<c:if test="${sysrole.hasRole== false}">
						<input type="checkbox"  name="roleId" value="${sysrole.roleId}" title="${sysrole.roleName}" >
					</c:if>--%>
				</c:forEach>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label"><em class="required">*</em>文章内容：</label>
			<div class="layui-input-block">
				<script id="editor" type="text/plain" style="width:100%;height:300px;" ></script>
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
<script>

    //select2插件
    $(function() {
        $("#cmsNodeId").append('${cmsnodeList}');
        $("#cmsNodeId").select2tree({
            placeholder: '请选择一个栏目',
            allowClear: true
        });
    });
	//Demo
    layui.use(['layer', 'form','jquery','laydate','upload','element'], function(){
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
        });*/
        //实例化编辑器
        window.UEDITOR_CONFIG.charset="utf-8";
        var ue = UE.getEditor('editor');
        //监听提交
		form.on('submit(add)', function(data){
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
						top.layer.msg('保存失败!'+result.message,{icon: 2},function () {
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
