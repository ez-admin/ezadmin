<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>组织结构表列表</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
	<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/plugins/layui/lay/dest/layui.all.js"></script>
	<!--树组件start -->
	<script type="text/javascript" src="/static/plugins/zTree/qui/ztree.js"></script>
	<link href="/static/plugins/zTree/qui/ztree.css" rel="stylesheet" type="text/css"/>
	<!--树组件end -->
	<style>
		.layui-form-label {width: auto!important;  }
		.ztree li span { line-height: inherit; margin-right: 2px; }
		.layui-input-block { margin-left: 90px; }
		.layui-input, .layui-select, .layui-textarea { height:30px;line-height: 30px; }
		.layui-form-label { padding: 3px 10px; }
		.layui-form-radio { line-height: 19px; }
		.layui-form-item .layui-input-inline { width: 60%; margin-left: 14px; }
		.layui-form-mid { padding:0; }
		.ztree li span {
			font-size: 12px!important;
		}
	</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">

			<div class="site-tips col-md-6" style=" padding: 10px;  vertical-align: top;">
				<form class="layui-form" action="">
					<div class="layui-form-item">
						<label class="layui-form-label">部门名称：</label>
						<div class="layui-input-block">
							<input type="text"  id="selectNode" readOnly class="layui-input layui-disabled"/>
							<input type="hidden" id="selectNodeid"/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">描述：</label>
						<div class="layui-input-block">
							<input type="text" id="nodeDes" class="layui-input"/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">负责人：</label>
						<div class="layui-input-inline">
							<input type="text" id="nodePerson" readonly  class="layui-input layui-disabled"/>
							<input type="hidden" id="userId" />
						</div>
						<shiro:hasPermission name="sysorg_query">
						<div class="layui-form-mid layui-word-aux">
							<button type="button" class="layui-btn layui-btn-small" onclick="selectUser()">
								选择负责人
							</button>
						</div>
						</shiro:hasPermission>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">电话：</label>
						<div class="layui-input-block">
							<input type="text" id="nodePhone" class="layui-input"/>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">组织类型：</label>
						<div class="layui-input-block">
							<input type="radio" id="nodetype"  name="nodetype" value="0" title="组织">
							<input type="radio" id="nodetype1"  name="nodetype" value="1" title="部门">
						</div>
					</div>
					<div class="layui-form-item">
						<shiro:hasPermission name="sysorg_submit">
						<div class="layui-input-block">
							<button type="button" class="layui-btn" id="btn_update">提交</button>
							<button type="reset" class="layui-btn layui-btn-primary">重置</button>
						</div>
						</shiro:hasPermission>
					</div>
				</form>
			</div>
			<div class="col-md-6" style="  padding: 10px; border: 1px solid #ddd; overflow: auto;">
				<div>
					<ul id="tree-1" class="ztree"></ul>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	//渲染form表单
	layui.use('form', function(){
		var form = layui.form();
		form.render('radio');
	});
	var layer = layui.layer;
	//设定不可编辑的节点id
	var noeditArray=["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17"];

	//树的设置
	var setting1 = {
		view: {
			<shiro:hasPermission name="sysorg_add">
			addHoverDom: addHoverDom,
			</shiro:hasPermission>
			removeHoverDom: removeHoverDom,
			selectedMulti: false
		},
		edit: {
			enable: false,
			<shiro:hasPermission name="sysorg_modify">
			enable: true,
			renameTitle:"修改",
			removeTitle:"删除"
			</shiro:hasPermission>
		},
		callback: {
			onClick: onClick1,
			//不允许拖拽
			beforeDrag: beforeDrag1,
			//修改前确认
			beforeEditName: beforeEditName1,
			//修改完时的处理
			beforeRename: beforeRename1,
			//修改成功后处理
			onRename: onRename1,
			//删除前确认
			beforeRemove: beforeRemove1
		}};

	//定义树节点初始数据
	var zNodes1 =[
		{ id:"0", parentId:"-1", name:"组织机构管理", open:true,icon:"/static/plugins/zTree/qui/img/diy/1_open.png"}
	];

	//初始化函数
	$(function (){
		//初始化树
		getOrgTreeData();

		//监听按钮点击事件
		$("#btn_update").click(function(){
			var orgId = $("#selectNodeid").val();
			var orgName = $("#selectNode").val();
			var orgDesc = $("#nodeDes").val();
			var orgManager = $("#nodePerson").val();
			var orgPhone = $("#nodePhone").val();
			var userId=$("#userId").val();
			var resType=$("input[name='nodetype']:checked").val();
			if(orgName!=null && orgName!="" ){
				//此处进行ajax后台数据处理
				$.post("/ez/system/sysorg/update.do",
						{"orgId" : orgId,
							"orgName" :orgName,
							"orgDescription" : orgDesc,
							"orgManager" : userId,
							"orgPhone" : orgPhone,
							"orgType" : resType},
						function(result){
							var organization = result.organization;
							if(organization != null){
								var node = getTree().getNodesByParam("id",organization.orgId,null)[0];
								node.desc = organization.orgDescription;
								node.manager = organization.orgManageName;
								node.phone = organization.orgPhone;
								node.menuType=organization.orgType;
								getTree().updateNode(node, false);
								//设置表单的值
								setForm(node.name,node.desc,node.manager,node.phone,node.menuType);
								top.layer.msg("修改节点信息成功！",{icon: 1});
							}else{
								top.layer.msg("修改节点信息失败！"+result.message,{icon: 2});
							}
						});
			}else {
				top.layer.msg("请先选择节点！",{icon:5});
			}

		});
	});

	//获取数据初始化树
	function getOrgTreeData(){
		$.ajax({
			type : 'POST',
			url : '/ez/system/sysorg/showlist.do',
			data : null,
			success : function(result){
				var nodes = zNodes1.concat(result.treeNodes);
				$.fn.zTree.init($("#tree-1"), setting1, nodes);
			},
			error : function(a){
				layer.msg("访问服务器端出错！");
			},
			dataType : 'json'
		});
	}


	//获取树对象
	function getTree(){
		return $.fn.zTree.getZTreeObj("tree-1");
	}

	//点击树节点
	function onClick1(event, treeId, treeNode, clickFlag){
		//设置表单的值
		setForm(treeNode.name,treeNode.desc,treeNode.manager,treeNode.phone,treeNode.menuType);
		$("#selectNodeid").val(treeNode.id);
        $("input[name='nodetype'][value='"+treeNode.menuType+"']").click();
        layui.use('form', function(){
            var form = layui.form();
            form.render('radio');
        });

	}

	//不允许拖拽
	function beforeDrag1(treeId, treeNodes) {
		return false;
	}

	//确认是否进入编辑状态
	function beforeEditName1(treeId, treeNode) {
		if(treeNode.id==0){
			top.Dialog.alert("根节点不能修改！");
			return false;
		}
		/*else if(getPosition(treeNode.id,noeditArray)!=-1){
			//top.Dialog.alert("为保证数据的完整性，由管理员添加的数据无法修改或删除。可以为新添加的数据来修改和删除。");
			//return false;
		}*/
		var zTree = getTree();
		//选中该节点
		zTree.selectNode(treeNode);
		//设置表单的值
		setForm(treeNode.name,treeNode.desc,treeNode.manager,treeNode.phone,treeNode.menuType);
		zTree.editName(treeNode);
		return true;
	}

	//修改完时处理 不进行后台数据处理
	function beforeRename1(treeId, treeNode, newName) {
		if (newName.length == 0) {
			alert("节点名称不能为空.");
			var zTree = getTree();
			setTimeout(function(){zTree.editName(treeNode)}, 10);
			return false;
		}
		return true;
	}
	//修改成功后处理
	function onRename1(event, treeId, treeNode) {
		if(treeNode.existed){
			updateNode(treeNode);
		}else{
			addNode(treeNode);
		}
	}

	//添加节点
	function addNode(treeNode){
		//设置表单的值
		setForm(treeNode.name,"","","","");
		//此处进行ajax后台数据处理
		$.post("/ez/system/sysorg/add.do",		//数据提交的地址
				{"orgName" : treeNode.name,
					"orgParentid" : treeNode.getParentNode().id},				//提交的数据
				function(result){//回调函数
					var org = result.organization;
					if(org != null && org.orgId != null && org.orgId != ""){
						$("#selectNodeid").val(org.orgId);
						treeNode.id = org.orgId;
						treeNode.name = org.orgName;
						treeNode.existed = true;
						getTree().updateNode(treeNode, false);
						top.layer.msg("创建成功！",{icon: 1})
					}else{
						getTree().removeNode(treeNode, false);
						setForm("","","","","");
						top.layer.msg("创建失败！"+result.message,{icon: 2});
					}
				});												//预期返回的数据类型
	}


	//修改节点名称
	function updateNode(treeNode){
		//此处进行ajax后台数据处理
		$.post("/ez/system/sysorg/update.do",		//数据提交的地址
				{"orgId" : treeNode.id,					//提交的数据
					"orgName" : treeNode.name},
				function(result){									//回调函数
					var org = result.organization;
					if(org != null && org.orgId != null && org.orgId != ""){
						treeNode.id = org.orgId;
						treeNode.name = org.orgName;
						setForm(treeNode.name,treeNode.desc,treeNode.manager,treeNode.phone,treeNode.menuType);
						getTree().updateNode(treeNode, false);
						top.layer.msg("修改成功！",{icon: 1});
					}else{
						setForm("","","","","");
						top.layer.msg("修改失败！"+result.message,{icon: 2});
					}
				});												//预期返回的数据类型
	}

	//确认是否删除+删除处理
	function beforeRemove1(treeId, treeNode) {
		if(treeNode.id==0){
			layer.msg("根节点不能删除！");
			return false;
		}
		/*else if(getPosition(treeNode.id,noeditArray)!=-1){
			//top.Dialog.alert("为保证数据的完整性，由管理员添加的数据无法修改或删除。可以为新添加的数据来修改和删除。");
			//return false;
		}*/
		var zTree = $.fn.zTree.getZTreeObj("tree-1");
		//选中该节点
		zTree.selectNode(treeNode);
		top.layer.confirm("确认删除 节点 -- " + treeNode.name + " 吗？",{icon: 7},function(index){
			//删除记录
			//此处进行ajax后台数据处理
			$.post("/ez/system/sysorg/deleteById.do",
					{"ids" : treeNode.id},
					function(result){
						if(result.status == 1){
							zTree.removeNode(treeNode);
							//设置表单的值
							setForm("","","","","");
							top.layer.msg('删除成功！',{icon: 1});
						}else{
							top.layer.msg('删除节点失败！'+result.message,{icon: 2});
						}
					});
			closeWin(index);
		});


		return false;
	}

	//添加新增按钮
	var newCount = 1;
	function addHoverDom(treeId, treeNode) {
		if (treeNode.editNameFlag || $("#addBtn_" + treeNode.id).length > 0) return;

		var sObj = $("#" + treeNode.tId + "_span");
		var addStr = "<span class='zbutton add' id='addBtn_" + treeNode.id + "' title='添加' onfocus='this.blur();'></span>";
		sObj.append(addStr);

		var btn = $("#addBtn_" + treeNode.id);
		if (btn){
			btn.bind("click", function(){
				var zTree = $.fn.zTree.getZTreeObj("tree-1");
				var newNode;
				newNode = zTree.addNodes(treeNode, {id:(100 + newCount), parentId:treeNode.id, name:"新增" + (newCount++)});
				if (newNode) {
					zTree.editName(newNode[0]);
					//设置表单的值
					setForm(newNode[0].name,"","","","");
				}
				return false;
			});
		}
	};
	function removeHoverDom(treeId, treeNode) {
		$("#addBtn_" + treeNode.id).unbind().remove();
	};

	//设置表单值
	function setForm(val1,val2,val3,val4,val5){
		$("#selectNode").val(val1 == 'null' ? '' : val1);
		$("#nodeDes").val(val2 == 'null' ? '' : val2);
		$("#nodePerson").val(val3 == 'null' ? '' : val3);
		$("#nodePhone").val(val4 == 'null' ? '' : val4);
		if(val5=="0"){
			$("#nodetype").attr("checked",true);
			layui.use('form', function(){var form = layui.form();form.render('radio');});
		}else if(val5=="1"){
			$("#nodetype1").attr("checked",true);
			layui.use('form', function(){var form = layui.form();form.render('radio'); });
		}

	}

	function selectUser(){
		top.layer.open({
		 type: 2,//iframe层
		 title: '选择',
		 maxmin: true,
		 shadeClose: true, //点击遮罩关闭层
		 area : ['900px' , '600px'],
		 content: '/ez/system/sysorg/queryuser.do'
		 });
	}
	//关闭弹窗并刷新
	function closeWin(index){
		//location.reload();
		top.layer.close(index);
	}

</script>

</body>
</html>