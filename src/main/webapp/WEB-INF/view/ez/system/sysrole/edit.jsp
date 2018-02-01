<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>角色名称修改</title>
	<%@ include file="/WEB-INF/view/ez/index/aevhead.jsp"%>
	<script src="/static/js/jquery.tips.js"></script>
	<link rel="stylesheet" href="/static/plugins/zTree/3.5.12/css/zTreeStyle/zTreeStyle.min.css"/>
	<script type="text/javascript" src="/static/plugins/zTree/3.5.12/js/jquery.ztree.all-3.5.min.js"></script>
</head>
<body class="container-fluid">
<div class="form-horizontal">
	<form id="formid" class="layui-form">
		<input type="hidden" name="roleId" value="${sysrole.roleId}">
		<div class="form-group col-sm-6">
			<label class="col-sm-3 control-label"><em class="required">*</em>角色名称:</label>
			<div class="col-sm-9">
				<input type="text" name="roleName" value="${sysrole.roleName}" required  placeholder="请输入角色名称" class="form-control">
			</div>
		</div>
		<div class="form-group col-sm-6">
			<label class="col-sm-3 control-label"><em class="required">*</em>角色等级<i class="fa fa-exclamation-triangle red roleleveltips"></i>:</label>
			<div class="col-sm-9">
				<input type="number" name="roleLvel" value="${sysrole.roleLvel}" required maxlength="3" placeholder="请输入角色等级" class="form-control">
				<span class="help-block"></span>
			</div>
		</div>
		<div class="form-group col-sm-12">
			<label>菜单权限：</label>
			<ul id="tree" class="ztree"></ul>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-primary">编辑</button>
				<button type="reset" class="btn btn-default">重置</button>
			</div>
		</div>
	</form>
</div>
<script type="text/javascript">
    var zTree;
    //初始化表格
    var setting = {
        showLine: true,
        checkable: true,
        showIcon :true,
        check:{enable:true,nocheckInherit:true},
        view:{selectedMulti:false},
        data:{simpleData:{enable:true}},
        callback:{beforeClick:function(id, node){
            tree.checkNode(node, !node.checked, true, true);
            return false;
        }}
    };

    var zn = '${zTreeNodes}';
    var zTreeNodes = eval(zn);
    $(function () {
        // 初始化树结构
        zTree = $.fn.zTree.init($("#tree"), setting, zTreeNodes);
        // 不选择父节点
        zTree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
        // 默认展开全部节点
        zTree.expandAll(true);

        //让第三级按钮菜单横向排列
        $("#tree").find("ul").find("ul").find("li").css("float","left");
        $("#tree").find("ul").find("ul").append("<div class='clearfix'></div>");
        $("#tree").find("ul").find("ul").find("li").find("span:first-child").css("background","none");
        $("#tree").find("ul").find("ul").find("li").find("a").find("span:first-child").css("width","0");
        //让第四级按钮菜单横向排列
		/*      $("#tree").find("ul").find("ul").find("ul").find("li").css("float","left");
		 $("#tree").find("ul").find("ul").find("ul").append("<div class='clearfix'></div>");
		 $("#tree").find("ul").find("ul").find("ul").find("li").find("span:first-child").css("background","none");
		 $("#tree").find("ul").find("ul").find("ul").find("li").find("a").find("span:first-child").css("width","0");
		 */
        //表单验证提交
        //treenodes

        $("#formid").validate({
            submitHandler: function(form){
                var nodes = zTree.getCheckedNodes();
                var tmpNode;
                var ids = "";
                for(var i=0; i<nodes.length; i++){
                    tmpNode = nodes[i];
                    if(i!=nodes.length-1){
                        ids += tmpNode.id+",";
                    }else{
                        ids += tmpNode.id;
                    }
                };
                var roleName = $("input[name='roleName']").val();
                var roleLvel = $("input[name='roleLvel']").val();
                var postData = {"roleLvel":roleLvel,"roleName":roleName,"ids":ids};
                $.ajax({
                    url: "/ez/system/sysrole/add.do",
                    type: "POST",
                    data: postData,
                    dataType: 'json',
                    beforeSend: function () {
                        // 禁用按钮防止重复提交
                        $("button[type='submit']").attr({ disabled: "disabled" });
                    },
                    complete: function () {
                        $("button[type='submit']").removeAttr("disabled");
                    },
                    success: function (result) {
                        if(result.status){
                            //关闭窗口
                            top.layer.closeAll();
                            top.layer.msg('保存成功!',{icon: 1});
                        }else{
                            top.layer.msg('保存失败!'+result.message,{icon: 2,time: 5000});
                        }
                    }
                });
            }
        });
    });
    $(".roleleveltips").mouseover(function(){
        var _this = $(this);
        _this.tips({
            msg:'数字越小权限越大!',
            side:2,  //提示窗显示位置  1，2，3，4 分别代表 上右下左 默认为1（上） 可选
            color:'#FFF', //提示文字色 默认为白色 可选
            bg:'#dd4b39',//提示窗背景色 默认为红色 可选
            time:2,//自动关闭时间 默认2秒 设置0则不自动关闭 可选
            x:0,//横向偏移  正数向右偏移 负数向左偏移 默认为0 可选y:0,//纵向偏移  正数向下偏移 负数向上偏移 默认为0 可选
        });
    })
    //Demo
	/*layui.use(['layer', 'form','jquery'], function(){
	 var layer = layui.layer
	 ,form = layui.form()
	 ,$ = layui.jquery;
	 //后台获取select值
	 $.ajax({
	 url: '/ez/system/sysdictionary/getSdBySdtCode.do',
	 type: "POST",
	 data:{code:1024},
	 dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
	 success: function (result) {
	 $("#roleType").append(result);
	 form.render('select');
	 }
	 });
	 //监听提交
	 form.on('submit(add)', function(data){
	 //layer.msg(JSON.stringify(data.field));
	 $.ajax({
	 url: "/ez/system/sysrole/add.do",
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
	 });*/
</script>
<%--<body>
<div class="layui-field-box">
	<form id="formid" class="layui-form">
        <input type="hidden" name="roleId" value="${sysrole.roleId}">
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>角色类型:</label>
			<div class="layui-input-block">
				<select name="roleType" id="roleType"  lay-verify="required" lay-filter="roleType">
					<option value="">请选择</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label"><em class="required">*</em>角色名称:</label>
			<div class="layui-input-block">
				<input type="text" name="roleName" value="${sysrole.roleName}" required  lay-verify="required" placeholder="请输入角色名称" autocomplete="off" class="layui-input">
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
	layui.use(['layer', 'form','jquery'], function(){
		var layer = layui.layer
				,form = layui.form()
				,$ = layui.jquery;
		//后台获取select值
		$.ajax({
			url: '/ez/system/sysdictionary/getSdBySdtCode.do',
			type: "POST",
			data:{code:1024,selected:'${sysrole.roleType}'},
			dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
			success: function (result) {
				$("#roleType").append(result);
				form.render('select');
			}
		});
		//监听提交
		form.on('submit(edit)', function(data){
			//layer.msg(JSON.stringify(data.field));
            //alert($('#formid').serialize());
			$.ajax({
				url: "/ez/system/sysrole/update.do",
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
	});
</script>--%>
</body>
</html>