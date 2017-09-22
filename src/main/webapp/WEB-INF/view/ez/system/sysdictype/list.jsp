<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>系统字典类型列表</title>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path;
	%>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<%--<link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />--%>
	<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="/static/css/public.css" class="css">
	<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
	<link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap-table.css">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="/static/js/html5shiv.min.js"></script>
	<script src="/static/js/respond.min.js"></script>
	<![endif]-->

	<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="/static/plugins/layer/layer.js"></script>
	<%--<script type="text/javascript" src="/static/plugins/layui/lay/dest/layui.all.js"></script>--%>
	<script src="/static/plugins/bootstrap-table/bootstrap.min.js"></script>
	<script src="/static/plugins/bootstrap-table/bootstrap-table.js"></script>
	<script src="/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
	<script src="/static/plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
	<script src="/static/plugins/bootstrap-table/extensions/tableExport/tableExport.js"></script>

	<%--<%@ include file="/WEB-INF/view/ez/index/listpublictop.jsp"%>--%>
</head>

<body>
	<form id="formSearch" class="form-inline">
        <shiro:hasPermission name="sysdictype_query">
		<div class="form-group">
			<input id="code" name="code" maxlength="4" placeholder="请输入类型编码" type="text" class="form-control">
		</div>
		<div class="form-group">
			<input id="name" name="name"  placeholder="请输入类型名称" type="text" class="form-control">
		</div>
		<button type="button" id="btn_query" class="btn btn-primary"><i class="fa fa-search"></i>查询</button>
		</shiro:hasPermission>
		<div class="btn-group">
			<shiro:hasPermission name="sysdictype_add">
			<button id="btn_add" type="button" class="btn btn-primary">
					<i class="fa fa-plus"></i>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="sysdictype_deleteall">
			<button id="btn_delete" type="button" class="btn btn-primary">
				<i class="fa fa-remove"></i>批量删除
			</button>
			</shiro:hasPermission>
		</div>
	</form>
	<table id="table"></table>
<%--	<%@ include file="/WEB-INF/view/ez/index/listpublicjs.jsp"%>--%>
<script>
	$(function () {
		//初始化表格
		$('#table').bootstrapTable({
			url: 'ez/system/sysdictype/showlist.do',
			method: 'post',                      //请求方式（*）
            <shiro:hasPermission name="sysdictype_export">
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
			sortName: "code",
			queryParams: queryParams=function(params) {
				/*return {
					pageNum:params.offset/params.limit+1,
					pageSize:params.limit,
					orderBy: params.sort+" "+ params.order,
					code: $("#code").val(),
					name: $("#name").val()
				};*/
				var pageNum=params.offset/params.limit+1;
				return $('#formSearch').serialize()+
						"&pageNum="+pageNum+
						"&pageSize="+params.limit+
						"&orderBy="+params.sort+" "+ params.order;
			},//传递参数（*）
			sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
			pageNumber:1,                       //初始化加载第一页，默认第一页
			pageSize: ${systemBackPageSize},                       //每页的记录行数（*）
			pageList: [10, 25, 50, 100, 'All'],        //可供选择的每页的行数（*）
			search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: true,
			showColumns: true,                  //是否显示所有的列
			showRefresh: true,                  //是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: false,                //是否启用点击选中行
			height: getHeight(),                //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId: "code",                     //每一行的唯一标识，一般为主键列
			showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                  //是否显示父子表
			columns: [{
				checkbox: true
			}, {
                filed: '',
                title: '操作区',
                width:'15%',
                align:'center',
                events: operateEvents,
                formatter: operateFormatter
            }, {
				field: '',
				title: '序号',
				width:'5%',
				align:'center',
				formatter: function (value, row, index) {
					return index+1;
				}
			}, {
				field: 'code',
				title: '类型编码',
				width:'10%',
				align:'center',
				sortable: true
			}, {
				field: 'name',
				title: '类型名称',
				width:'15%',
				align:'center',
			}, {
				field: 'remark',
				title: '字典备注',
				width:'50%',
				align:'center'
			}, {
				field: 'flag',
				title: '是否启用',
				width:'5%',
				align:'center',
				formatter:flagFormatter
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
		//页面刷新重置
		$(window).resize(function () {
			$('#table').bootstrapTable('resetView', {
				height: getHeight()
			});
		});
		//清除工具栏浮动，让父页面高度撑起了
		$('<div class="clear"></div>').appendTo("body .fixed-table-toolbar:first-child");
	});
	//状态显示转换
	function flagFormatter(value, row, index) {
		var a='';
		if(row.flag == 1 ){
			a="是";
		} else if( row.flag == 0 ){
			a="否";
		}else {
			a="未知";
		}
		return [a].join('');
	}
	//操作区
	function operateFormatter(value, row, index) {
		return [
            <shiro:hasPermission name="sysdictype_view">
            '<a class="view" href="javascript:void(0)" title="查看">',
            '查看',
            '</a>    ',
            </shiro:hasPermission>
            <shiro:hasPermission name="sysdictype_modify">
            '<a class="edit" href="javascript:void(0)" title="修改">',
            '修改',
            '</a>    ',
            </shiro:hasPermission>
            <shiro:hasPermission name="sysdictype_delete">
            '<a class="remove" href="javascript:void(0)" title="删除">',
            '删除',
            '</a>'
            </shiro:hasPermission>
		].join('');
	};
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
			area : ['600px' , '430px'],
			content: '/ez/system/sysdictype/addUI.do',
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
				url: "/ez/system/sysdictype/deleteAll.do",
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
	//操作区事件
	window.operateEvents = {
		'click .view': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '查看',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['600px' , '430px'],
				content: '/ez/system/sysdictype/getById.do?typeKey=2&sysdictypeId='+row.code,
			});
		},
		'click .edit': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '编辑',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['600px' , '430px'],
				content: '/ez/system/sysdictype/getById.do?typeKey=1&sysdictypeId='+row.code,
				end:function(){
					$("#table").bootstrapTable('refresh');//刷新表格
				}
			});
		},
		'click .remove': function (e, value, row, index) {
			top.layer.confirm("确认要删除该行的数据吗？",{icon: 7},function(index){
				//删除记录
				$.ajax({
					url: "/ez/system/sysdictype/deleteById.do",
					type: "POST",
					data: { "ids": row.code },
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
			ids += arrselections[i].code ;
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
	//获取表格高度
	function getHeight() {
		return $(window).height() - 15;
		/*return $(window).height() - $('.fixed-table-toolbar').outerHeight(true);*/
	}
</script>
</body>
</html>