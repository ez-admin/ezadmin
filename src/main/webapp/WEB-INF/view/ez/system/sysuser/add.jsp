<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>用户/会员新增</title>
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
			width:120px;
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
		#headicon{
			width: 40px;
			height: 40px;
			border-radius: 100%;
		}
	</style>
</head>
<body>
	<div class="layui-field-box">
		<form id="formid" class="layui-form">
			<input type="hidden" name="usericom" id="usericom" value="/static/images/0.jpg">
			<div class="layui-form-item">
				<label class="layui-form-label">头像:</label>
				<div class="layui-input-inline" >
					<input type="file" name="file" lay-ext="jpg|png|gif" class="layui-upload-file">
					<img id="headicon" src="/static/images/0.jpg" alt="头像">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><em class="required">*</em>用户名:</label>
				<div class="layui-input-inline">
					<input type="text" name="lognm"  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><em class="required">*</em>密码:</label>
				<div class="layui-input-inline">
					<input type="text" id="logpwd" name="logpwd" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item replaceselect">
				<label class="layui-form-label"><em class="required">*</em>所属公司:</label>
				<div class="layui-input-inline" style="width: 400px">
					<select id="companyno" name="companyno" style="width: 100%" lay-verify="required" >
						<option value="">请选择</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item replaceselect" >
				<label class="layui-form-label"><em class="required">*</em>所属部门:</label>
				<div class="layui-input-inline" style="width: 400px">
					<select id="dptno" name="dptno" style="width: 100%" lay-verify="required">
						<option value="">请选择</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户类型:</label>
				<div class="layui-input-block">
					<input type="radio" name="optype" value="0" title="系统用户" checked>
					<input type="radio" name="optype" value="1" title="前台会员">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">是否启用:</label>
				<div class="layui-input-block">
					<input type="checkbox" name="isused" value="1" lay-skin="switch" lay-text="是|否" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><em class="required">*</em>真实姓名:</label>
				<div class="layui-input-inline">
					<input type="text" name="userrelnm" lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label"><em class="required">*</em>性别:</label>
				<div class="layui-input-inline">
					<select name="sex" id="sex" lay-verify="required" >
						<option value="">请选择</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">年龄:</label>
				<div class="layui-input-inline">
					<input type="number" name="age" autocomplete="off" maxlength="3" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">身份证号:</label>
				<div class="layui-input-inline">
					<input type="text" name="idnum"  placeholder="请输入身份证号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">地区</label>
				<div class="layui-input-inline">
					<select id="quiz1" lay-filter="quiz1">
						<option value="">请选择</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select id="quiz2" lay-filter="quiz2">
						<option value="">请选择</option>
					</select>
				</div>
				<div class="layui-input-inline">
					<select id="location" name="location">
						<option value="">请选择</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号码:</label>
				<div class="layui-input-inline">
					<input type="text" name="mobile" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱:</label>
				<div class="layui-input-inline">
					<input type="text" name="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
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
	<%--select2tree plugins--%>
	<link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
	<link rel="stylesheet" href="/static/plugins/select2tree/css/select2.min.css" class="css">
	<link rel="stylesheet" href="/static/plugins/select2tree/css/select2-bootstrap.min.css" class="css">
	<script type="text/javascript" src="/static/plugins/select2tree/js/select2.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/plugins/select2tree/js/zh-CN.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/plugins/select2tree/js/select2tree.js" charset="utf-8"></script>
	<%--md5 plugins--%>
	<script type="text/javascript" src="/static/plugins/md5/md5.min.js" charset="utf-8"></script>

	<script type="text/javascript">
		//select2插件
		$(function() {
			$("#companyno").append('${companyList}');
			$("#dptno").append('${dptList}');
			$("#companyno").select2tree({
				placeholder: '请选择一个公司',
				allowClear: true
			});
			$("#dptno").select2tree({
				placeholder: '请选择一个部门',
				allowClear: true
			});
		});
		//Demo
		layui.use(['layer', 'form','jquery','upload','element'], function(){
			var layer = layui.layer
					,form = layui.form()
					,element = layui.element()
					,$ = layui.jquery;
			//后台获取sex-select值
			$.ajax({
				url: '/ez/system/sysdictionary/getSdBySdtCode.do',
				type: "POST",
				data:{code:1002},
				dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
				success: function (result) {
					$("#sex").append(result);
                    form.render('select');
				}
			});
			//后台获取第一级select
            $.ajax({
                url: '/ez/system/syscity/getSdBySdtCode.do',
                type: "POST",
                data:{parentId:0},
                dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
                success: function (result) {
                    $("#quiz1").append(result);
                    form.render('select');
                }
            });
            //后台获取第二级select
            form.on('select(quiz1)', function(data){
                var parentid=$("#quiz1").next().find('.layui-this').attr("lay-value");
                $.ajax({
                    url: '/ez/system/syscity/getSdBySdtCode.do',
                    type: "POST",
                    data:{parentId:parentid},
                    async:false,
                    dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
                    success: function (result) {
                        $("#quiz2").html('');
                        $("#quiz2").append('<option>请选择</option>');
                        $("#quiz2").append(result);
                        form.render('select');
                    }
                });
                var id=$("#quiz2").next().find('.layui-this').attr("lay-value");
                //$("#quiz2").next().find('[lay-value="'+id+'"]').click();
                if($("#quiz2"))  $("#quiz12").next().find('[lay-value="'+id2+'"]').click();
            });
            //后台获取第三级select
            form.on('select(quiz2)', function(data){
                var parentid=$("#quiz2").next().find('.layui-this').attr("lay-value");
                $.ajax({
                    url: '/ez/system/syscity/getSdBySdtCode.do',
                    type: "POST",
                    data:{parentId:parentid},
                    dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
                    success: function (result) {
                        $("#location").html('');
                        $("#location").append('<option>请选择</option>');
                        $("#location").append(result);
                        form.render('select');
                    }
                });
            });
            //上传图片
            layui.upload({
                url: '/ez/system/sysuser/headicon.do',
                method: 'post', //上传接口的http类型
                before: function(input){
                    //返回的参数item，即为当前的input DOM对象
                    top.layer.msg('正在上传，请勿操作！');
                },
                success: function(res,input){
                    if(res.msg == "suc"){
                        $("#usericom").attr("value",res.url);
                        $("#headicon").attr("src",res.url);
                        top.layer.msg('上传成功！',{icon:1});
                    }else{
                        top.layer.msg('上传失败!'+res.message,{icon: 2});
                    }
                }
            });
            //监听提交
			form.on('submit(add)', function(data){
				//layer.msg(JSON.stringify(data.field));
				//用户密码加密
				var logpwd=$("#logpwd").val();
				if (logpwd){
                    $("#logpwd").val(md5(logpwd))
				}
				$.ajax({
					url: "/ez/system/sysuser/add.do",
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