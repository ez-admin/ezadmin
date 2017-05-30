<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<title>系统用户/会员新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<style>
		.replaceselect span.select2{
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
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>头像:</label>
			<div class="layui-input-inline" >
				<img id="headicon" src="${sysUser.usericom}" alt="头像">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>用户名:</label>
			<div class="layui-input-inline">
				<input type="text" name="lognm"  value="${sysUser.lognm}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item replaceselect">
			<label class="layui-form-label"><em class="required">*</em>所属公司:</label>
			<div class="layui-input-inline" style="width: 400px">
				<select id="companyno" name="companyno" style="width: 100%" disabled >
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item replaceselect">
			<label class="layui-form-label"><em class="required">*</em>所属部门:</label>
			<div class="layui-input-inline" style="width: 400px">
				<select id="dptno" name="dptno" style="width: 100%" disabled >
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">用户类型:</label>
			<div class="layui-input-block">
				<c:if test="${sysUser.optype ==0}">
					<input type="radio" name="optype" value="0" title="系统用户" checked>
					<input type="radio" name="optype" value="1" title="前台会员" disabled>
				</c:if>
				<c:if test="${sysUser.optype ==1}">
					<input type="radio" name="optype" value="0" title="系统用户" disabled>
					<input type="radio" name="optype" value="1" title="前台会员" checked>
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">是否启用:</label>
			<div class="layui-input-block">
				<c:if test="${sysUser.isused ==1}">
					<input type="checkbox" name="isused" lay-skin="switch" lay-text="是|否" disabled checked>
				</c:if>
				<c:if test="${sysUser.isused ==0}">
					<input type="checkbox" name="isused" lay-skin="switch" lay-text="是|否" disabled >
				</c:if>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>真实姓名:</label>
			<div class="layui-input-inline">
				<input type="text" name="userrelnm" value="${sysUser.userrelnm}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>性别:</label>
			<div class="layui-input-inline">
				<select name="sex" id="sex" lay-verify="required" disabled>
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">年龄:</label>
			<div class="layui-input-inline">
				<input type="number" name="age" value="${sysUser.age}" autocomplete="off" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">身份证号:</label>
			<div class="layui-input-inline">
				<input type="text" name="idnum" value="${sysUser.idnum}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">地区</label>
			<div class="layui-input-inline">
				<select id="quiz1" lay-filter="quiz1" disabled>
					<option value="">请选择</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<select id="quiz2" lay-filter="quiz2" disabled>
					<option value="">请选择</option>
				</select>
			</div>
			<div class="layui-input-inline">
				<select id="location" name="location" disabled>
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">手机号码:</label>
			<div class="layui-input-inline">
				<input type="text" name="mobile" value="${sysUser.mobile}" class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">邮箱:</label>
			<div class="layui-input-inline">
				<input type="text" name="email" value="${sysUser.email}"  class="layui-input layui-disabled" readonly>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" onclick="top.layer.closeAll()">关闭</button>
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
<script>
	//select2插件
	$(function() {
		$("#companyno").append('${companyList}');
		$("#dptno").append('${dptList}');
		$("#companyno").select2tree();
		$("#dptno").select2tree();
	});
	//Demo
	layui.use(['layer', 'form','jquery'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery;
		//后台获取select值
		$.ajax({url: "/ez/system/sysdictionary/getSdBySdtCode.do",
			type: "POST",
			data:{code:1002,selected:'${sysUser.sex}'},
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
            data:{parentId:0,selected:'${quiz1}'},
            async:false,
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#quiz1").append(result);
                form.render('select');
            }
        });
		var parentid1=$("#quiz1").next().find('.layui-this').attr("lay-value");
		$.ajax({
			url: '/ez/system/syscity/getSdBySdtCode.do',
			type: "POST",
			data:{parentId:parentid1,selected:'${quiz2}'},
			async:false,
			dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
			success: function (result) {
				$("#quiz2").html('');
				$("#quiz2").append(result);
				form.render('select');
			}
		});
        var parentid2=$("#quiz2").next().find('.layui-this').attr("lay-value");
        $.ajax({
            url: '/ez/system/syscity/getSdBySdtCode.do',
            type: "POST",
            data:{parentId:parentid2,selected:'${sysUser.location}'},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#location").html('');
                $("#location").append(result);
                form.render('select');
            }
        });

	});
</script>
</body>
</html>