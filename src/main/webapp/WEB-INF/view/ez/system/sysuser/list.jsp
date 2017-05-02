<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>用户列表</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
	<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap-table.css">
	<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="/static/plugins/layui/lay/dest/layui.all.js"></script>
	<script src="/static/plugins/bootstrap-table/bootstrap.min.js"></script>
	<script src="/static/plugins/bootstrap-table/bootstrap-table.js"></script>
	<script src="/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
	<script src="/static/plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
	<script src="/static/plugins/bootstrap-table/extensions/tableExport/tableExport.js"></script>
	<!--树组件start -->
	<script type="text/javascript" src="/static/plugins/zTree/qui/ztree.js"></script>
	<link href="/static/plugins/zTree/qui/ztree.css" rel="stylesheet" type="text/css"/>
	<!--树组件end -->
	<style>
		.ztree li span {
			font-size: 12px!important;
		}
	</style>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2">
				<ul id="tree" class="ztree"></ul>
			</div>

			<div class="col-md-10">
				<table id="table"></table>
			</div>
		</div>
	</div>


	<form class="layui-form" id="formSearch">
		<input type="hidden" id="userOrgId" name="dptno" />
		<shiro:hasPermission name="sysuser_query">
		<div class="layui-input-inline">
			<input id="lognm" name="lognm" placeholder="请输入登陆账号" type="text" class="layui-input-quote">
		</div>
		<div class="layui-input-inline">
			<input id="userrelnm" name="userrelnm" placeholder="请输入用户姓名" type="text" class="layui-input-quote">
		</div>
		<button class="layui-btn layui-btn-small" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="sysuser_add">
			<button id="btn_add" type="button" class="layui-btn layui-btn-small">
				<i class="fa fa-plus"></i>新增
			</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="sysuser_deleteall">
			<button id="btn_delete" type="button" class="layui-btn layui-btn-small">
				<i class="fa fa-remove"></i>批量删除
			</button>
		</shiro:hasPermission>
	</form>

<script>
	var layer = layui.layer;
	//定义选中的树节点
	var selectTreeNode = null;
	//定义树节点初始数据
	var nodes =[
		{ id:"0", parentId:-1, name:"组织机构树", open:true,icon:"/static/plugins/zTree/qui/img/diy/1_open.png"}
	];
	//树属性配置
	var selectionSetting = {
		view: {
			dblClickExpand: true
		},
		callback: {
			onClick: zTreeSelect
		}
	};

	$(function () {
		//初始化tree
		initTree();
		//初始化表格
		$('#table').bootstrapTable({
			url: 'ez/system/sysuser/showlist.do?',
			method: 'post',                      //请求方式（*）
			<shiro:hasPermission name="sysuser_export">
			showExport: true,//显示导出按钮
			</shiro:hasPermission>
			exportDataType: "basic",//导出类型
			toolbar: '#formSearch',                //工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: true,                   //是否显示分页（*）
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
			sortable: true,                     //是否启用排序
			sortOrder: "asc",                   //排序方式
			sortName: "userno",
			queryParams: queryParams=function(params) {
				var pageNum=params.offset/params.limit+1;
				return $('#formSearch').serialize()+
						"&pageNum="+pageNum+
						"&pageSize="+params.limit+
						"&orderBy="+params.sort+" "+ params.order;
			},//传递参数（*）
			sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
			pageNumber:1,                       //初始化加载第一页，默认第一页
			pageSize: 10,                       //每页的记录行数（*）
			pageList: [10, 25, 50, 100 , 'All'],        //可供选择的每页的行数（*）
			search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: true,
			showColumns: true,                  //是否显示所有的列
			showRefresh: true,                  //是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: false,                //是否启用点击选中行
			height: getHeight(),                //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId: "id",                     //每一行的唯一标识，一般为主键列
			showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                  //是否显示父子表
			columns: [{
				checkbox: true
			}, {
				field: '',
				title: '序号',
				align: 'center',
				width:'5%',
				formatter: function (value, row, index) {
					return index+1;
				}
			}, {
				field: 'lognm',
				title: '登陆账号',
				width:'10%',
				align: 'center'
			}, {
				field: 'userrelnm',
				title: '用户姓名',
				width:'10%',
				align: 'center'
			}, {
				field: 'companynm',
				title: '公司名称',
				width:'10%',
				align: 'center'
			}, {
				field: 'dptnm',
				title: '部门名称',
				width:'10%',
				align: 'center'
			/*}, {
				field: 'rlnm',
				title: '角色名称',
				align: 'center',
				width:'15%'*/
			}, {
				field: 'lastlogin',
				title: '最近一次登陆时间',
				align: 'center',
				width:'10%'
			}, {
				field: 'loginlocation',
				title: '登陆地区',
				align: 'center',
				width:'10%'
			},{
				filed: '',
				title: '操作区',
				align: 'center',
				width:'25%',
				events: operateEvents,
				formatter: operateFormatter
			} ]
		});
		//监听页面的回车事件
		document.onkeydown = function (e) {
			var theEvent = window.event || e;
			var code = theEvent.keyCode || theEvent.which;
			if (code == 13) {
				$("#btn_query").click();

			}
		};
		//重置刷新页面
		$(window).resize(function () {
			$('#table').bootstrapTable('resetView', {
				height: getHeight()
			});
		});
		//清除工具栏浮动，让父页面高度撑起了
		$('<div class="clear"></div>').appendTo("body .fixed-table-toolbar:first-child");
	});
	//初始化tree处理
	function initTree() {
		$.ajax({
			type : 'POST',
			url : '/ez/system/sysorg/showlist.do',
			success : function(result){
				nodes = nodes.concat(result.treeNodes);
				$.fn.zTree.init($("#tree"), selectionSetting, nodes);
			},
			error : function(a){
				layer.msg("访问服务器端出错！");
			},
			dataType : 'json'
		});
	}

	//刷新
	$("#btn_query").click(function () {
		$("#table").bootstrapTable('refresh');
	});
	//新增
	$("#btn_add").click(function () {
		top.layer.open({
			type: 2,//iframe层
			title: '新增',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['800px' , '600px'],
			content: '/ez/system/sysuser/addUI.do',
			end:function(){
				$("#table").bootstrapTable('refresh');//刷新表格
			}
		});
	});
	//删除
	$("#btn_delete").click(function () {
		var arrselections = $("#table").bootstrapTable('getSelections');
		if (arrselections.length <= 0) {
			top.layer.msg('请选择有效数据!',{icon: 7});
			return;
		}
		top.layer.confirm("确认要删除选择的数据吗？",{icon: 7},function(index){
			//删除记录
			$.ajax({
				url: "/ez/system/sysuser/deleteAll.do",
				type: "POST",
				//获取所有选中行
				data: getSelectId(arrselections),
				success: function (result) {
					//删除后的提示
					handleResult(result.status,result.message);
				}
			});
			//关闭
			closeWin(index);
		});
	});
	//操作区
	function operateFormatter(value, row, index) {
		if (row.userno!="1000") {
			return [
				'<a class="assignrolelist" href="javascript:void(0)" title="分配角色">',
				'分配角色  ',
				'</a>',
				<shiro:hasPermission name="sysuser_view">
				'<a class="view" href="javascript:void(0)" title="查看">',
				'查看  ',
				'</a>',
				</shiro:hasPermission>
				<shiro:hasPermission name="sysuser_modify">
				'<a class="edit" href="javascript:void(0)" title="修改">',
				'修改  ',
				'</a>',
				</shiro:hasPermission>
				<shiro:hasPermission name="sysuser_delete">
				'<a class="remove" href="javascript:void(0)" title="删除">',
				'删除',
				'</a>'
				</shiro:hasPermission>
			].join('');
		}else {
			return [
				<shiro:hasPermission name="sysuser_view">
				'<a class="view" href="javascript:void(0)" title="查看">',
				'查看',
				'</a>'
				</shiro:hasPermission>
			].join('');
		}
	};
	//操作区事件
	window.operateEvents = {
		'click .assignrolelist': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '分配角色',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/system/sysuser/assignrolelist.do?userno='+row.userno,
				end:function(){
					$("#table").bootstrapTable('refresh');//刷新表格
				}
			});
		},
		'click .view': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '查看',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/system/sysuser/getById.do?typeKey=2&userno='+row.userno,
			});
		},
		'click .edit': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '编辑',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/system/sysuser/getById.do?typeKey=1&userno='+row.userno,
				end:function(){
					$("#table").bootstrapTable('refresh');//刷新表格
				}
			});
		},
		'click .remove': function (e, value, row, index) {
			top.layer.confirm("确认要删除该行的数据吗？",{icon: 7},function(index){
				//删除记录
				$.ajax({
					url: "/ez/system/sysuser/deleteById.do",
					type: "POST",
					data: { "ids": row.userno },
					success: function (result) {
						handleResult(result.status,result.message);
					}
				});
				closeWin(index);
			});
		}
	};
	//获取所有选中行获取选中行的id 格式为 "ids":1,2
	function getSelectId(arrselections) {
		var arrselectionsLength = arrselections.length;
		var ids = "";
		for(var i = 0;i<arrselectionsLength;i++) {
			ids += arrselections[i].userno ;
			if(i!=arrselectionsLength-1){
				ids += ",";
			}
		}
		return {"ids":ids};
	}
	//删除后的提示
	function handleResult(status,message){
		if(status =="1"){
			top.layer.msg('删除成功！',{icon: 1});
		}else{
			top.layer.msg('删除失败！'+message,{icon: 2});
		}
	}
	//关闭弹窗并刷新
	function closeWin(index){
		location.reload();
		//$("#table").bootstrapTable('refresh');
		top.layer.close(index);
	}
	//点击树节点刷选对应的表格数据
	function zTreeSelect(event,treeId,treeNode) {
		selectTreeNode = treeNode;
		$("#userOrgId").val(treeNode.id);
		$("#table").bootstrapTable('refresh');//刷新表格
	}
	//获取表格高度
	function getHeight() {
		return $(window).height() - 15;
	}
</script>
</body>
</html>