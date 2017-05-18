<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>系统字典名称列表</title>
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
	<style>
		body{
			padding: 10px;
		}
	</style>
</head>

<body>
<form class="layui-form" id="formSearch">
	<div class="layui-input-inline">
		<input id="lognm" name="lognm" placeholder="请输入登陆账号" type="text" class="layui-input-quote">
	</div>
	<div class="layui-input-inline">
		<input id="userrelnm" name="userrelnm" placeholder="请输入用户姓名" type="text" class="layui-input-quote">
	</div>
	<button class="layui-btn layui-btn-small" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>

</form>
<table id="table"></table>

<script>
	$(function () {
		//初始化表格
		$('#table').bootstrapTable({
			url: 'ez/system/sysuser/showlist.do?optype='+${otype},
			method: 'post',                      //请求方式（*）
			showExport: true,//显示导出按钮
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
			pageSize: ${systemBackPageSize},                       //每页的记录行数（*）
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
				width:'15%',
				align: 'center'
			}, {
				field: 'userrelnm',
				title: '用户姓名',
				width:'15%',
				align: 'center'
			}, {
				field: 'rlnm',
				title: '角色名称',
				align: 'center',
				width:'20%'
			}, {
				field: 'lastlogin',
				title: '最近一次登陆时间',
				align: 'center',
				width:'10%'
			}, {
				field: 'location',
				title: '所属地区',
				align: 'center',
				width:'10%'
			},{
				filed: '',
				title: '操作区',
				align: 'center',
				width:'15%',
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
		/*//监听查询框的回车事件
		 $("#searchInput").keydown(function(event){
		 if(event.keyCode==13){
		 $("#btn_query").click();
		 }
		 });*/
		//重置刷新页面
		$(window).resize(function () {
			$('#table').bootstrapTable('resetView', {
				height: getHeight()
			});
		});
		//清除工具栏浮动，让父页面高度撑起了
		$('<div class="clear"></div>').appendTo("body .fixed-table-toolbar:first-child");
	});
	//刷新
	$("#btn_query").click(function () {
		$("#table").bootstrapTable('refresh');
	});
	//操作区
	function operateFormatter(value, row, index) {
		if (row.userno!="1000") {
			return [
				'<a class="select" href="javascript:void(0)" title="选择">',
				'选择    ',
				'</a>'
			].join('');
		}
	};
	//操作区事件
	window.operateEvents = {
		'click .select': function (e, value, row, index) {
			//var userName = parent.frames["ezsystemsysorglist"].document.getElementById('userId').value;
			$(window.parent.ezsystemsysorglist.document).find('#userId').val(row.userno);
			$(window.parent.ezsystemsysorglist.document).find('#nodePerson').val(row.userrelnm);
			top.layer.closeAll();
		}
	};
	//获取表格高度
	function getHeight() {
		return $(window).height() - 35;
	}
</script>
</body>
</html>