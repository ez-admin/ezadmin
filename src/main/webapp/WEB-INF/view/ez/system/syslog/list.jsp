<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>系统日志列表</title>
	<%@ include file="/WEB-INF/view/ez/index/listhead.jsp"%>
</head>

<body>
<form class="form-inline" id="formSearch">
	<shiro:hasPermission name="syslog_query">
		<div class="form-group">
			<input id="mehtoddescription" name="mehtoddescription"  placeholder="请输入方法描述" type="text" class="form-control">
		</div>
		<div class="form-group">
			<input id="usernm" name="usernm" placeholder="请输入操作员" type="text" class="form-control">
		</div>
		<button class="btn btn-primary" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
	</shiro:hasPermission>
</form>
<table id="table"></table>
<script>
	$(function () {
		//初始化表格
		$('#table').bootstrapTable({
			url: 'ez/system/syslog/showlist.do',
			method: 'post',                      //请求方式（*）
			<shiro:hasPermission name="syslog_export">
			showExport: true,//显示导出按钮
			</shiro:hasPermission>
			exportDataType: "basic",//导出类型
			toolbar: '#formSearch',                //工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: true,                   //是否显示分页（*）
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
			sortable: true,                     //是否启用排序
			sortOrder: "desc",                   //排序方式
			sortName: "id",
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
				field: 'mehtoddescription',
				title: '操作描述',
				align: 'center',
				width: '25%',
				sortable: true
			}, {
				field: 'usernm',
				title: '操作员',
				align: 'center',
				width: '10%'
			}, {
				field: 'logtype',
				title: '日志类型',
				align: 'center',
				width: '5%',
				formatter:logTypeFormatter
			}, {
				field: 'exceptionCode',
				title: '异常代码',
				width: '15%',
				align: 'center'

			}, {
				field: 'exceptionDetail',
				title: '异常信息',
				align: 'center',
				width: '15%'

			}, {
				field: 'createDate',
				title: '操作时间',
				align: 'center',
				width: '15%'
			}, {
				field: 'requestIp',
				title: 'IP地址',
				align: 'center',
				width: '10%'
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
	//刷新
	$("#btn_query").click(function () {
		$("#table").bootstrapTable('refresh');
	});
	//日志类型
	function logTypeFormatter(value, row, index) {
		var a="未知类型";
		if(value==0){
			a="正常记录";
		}else if(value==1){
			a="异常记录";
		}
		return a;
	}
	//获取表格高度
	function getHeight() {
		return $(window).height() - 15;
		/*return $(window).height() - $('.fixed-table-toolbar').outerHeight(true);*/
	}
</script>
</body>
</html>