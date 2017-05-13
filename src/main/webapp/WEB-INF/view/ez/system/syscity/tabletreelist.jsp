<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>城市区域列表</title>
	<link rel="stylesheet" href="/static/plugins/treeTable/themes/vsStyle/treeTable.min.css">
	<script src="/static/plugins/treeTable/jquery.treeTable.min.js" type="text/javascript"></script>
	<script type="text/javascript">
        $(document).ready(function() {
            var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
            var data = ${fns:toJson(list)}, rootId = "0";
            addRow("#treeTableList", tpl, data, rootId, true);
            $("#treeTable").treeTable({expandLevel : 5});
        });
        function addRow(list, tpl, data, pid, root){
            for (var i=0; i<data.length; i++){
                var row = data[i];
                if ((${fns:jsGetVal('row.parentId')}) == pid){
                    $(list).append(Mustache.render(tpl, {
                        dict: {
                            type: getDictLabel(${fns:toJson(fns:getDictList('sys_area_type'))}, row.type)
                        }, pid: (root?0:pid), row: row
                    }));
                    addRow(list, tpl, data, row.id);
                }
            }
        }
	</script>
</head>
<body>
<form class="layui-form" id="formSearch">
	<shiro:hasPermission name="syscity_query">
	<div class="layui-input-inline">
		<input id="name" name="name" placeholder="请输入城市名" type="text" class="layui-input-quote" maxlength="20" autocomplete="off">
	</div>
<%--	<div class="layui-input-inline">
		<input id="url" name="url" placeholder="请输入url地址" type="text" class="layui-input-quote" maxlength="50" autocomplete="off">
	</div>
	<div class="layui-input-inline">
		<input id="leaf" name="leaf" placeholder="请输入是否最明细科目（0否1是）" type="text" class="layui-input-quote" maxlength="1" autocomplete="off">
	</div>--%>
	<div class="layui-input-inline">
		<input id="id" name="id" placeholder="请输入城市id" type="text" class="layui-input-quote" maxlength="10" autocomplete="off">
	</div>
	<div class="layui-input-inline">
		<input id="parentId" name="parentId" placeholder="请输入父级id" type="text" class="layui-input-quote" maxlength="10" autocomplete="off">
	</div>

	<button class="layui-btn layui-btn-small" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="syscity_add">
		<button id="btn_add" type="button" class="layui-btn layui-btn-small">
			<i class="fa fa-plus"></i>新增
		</button>
	</shiro:hasPermission>

</form>

<table id="table"></table>

<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/layui/lay/dest/layui.all.js"></script>
<script src="/static/plugins/bootstrap-table/bootstrap.min.js"></script>
<script src="/static/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script src="/static/plugins/bootstrap-table/extensions/export/bootstrap-table-export.js"></script>
<script src="/static/plugins/bootstrap-table/extensions/tableExport/tableExport.js"></script>
<script>
	$(function () {
		//初始化表格
		$('#table').bootstrapTable({
			url: '/ez/system/syscity/showlist.do',
			method: 'post',                      //请求方式（*）
			<shiro:hasPermission name="syscity_export">
			showExport: true,                   //显示导出按钮
			</shiro:hasPermission>
			exportDataType: "basic",             //导出类型
			toolbar: '#formSearch',              //工具按钮用哪个容器
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: true,                   //是否显示分页（*）
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
			sortable: true,                       //是否启用排序
			sortOrder: "asc",                      //排序方式
			sortName: "id",
			queryParams: queryParams=function(params) {
				var pageNum=params.offset/params.limit+1;
				return $('#formSearch').serialize()+
						"&pageNum="+pageNum+
						"&pageSize="+params.limit+
						"&orderBy="+params.sort+" "+ params.order;
			},//传递参数（*）
			sidePagination: "server",             //分页方式：client客户端分页，server服务端分页（*）
			pageNumber:1,                         //初始化加载第一页，默认第一页
			pageSize: ${systemBackPageSize},  //每页的记录行数（*）
			pageList: [10, 25, 50, 100 , 'All'],  //可供选择的每页的行数（*）
			search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: true,
			showColumns: true,                  //是否显示所有的列
			showRefresh: true,                  //是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: false,               //是否启用点击选中行
			height: getHeight(),                //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId: "id",                     //每一行的唯一标识，一般为主键列
			showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                  //是否显示父子表
			columns: [
				{checkbox: true, width:'2%'},
				{field: '', title: '序号', align: 'center', width:'5%', formatter: function (value, row, index) {return index+1;}},
				{field: 'name', title: '城市名', align: 'center', width:'17%',sortName:'NAME',sortable: true},
				{field: 'url', title: 'url地址', align: 'center', width:'17%',sortName:'URL',sortable: true},
				{field: 'leaf', title: '是否最明细科目（0否1是）', align: 'center', width:'17%',sortName:'LEAF',sortable: true},
				{field: 'parentId', title: '父级id', align: 'center', width:'17%',sortName:'PARENT_ID',sortable: true},
				 {
					filed: '',
					title: '操作区',
					align: 'center',
					width:'13%',
					events: operateEvents,
					formatter: operateFormatter
				}
			]
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
	//新增
	$("#btn_add").click(function () {
		top.layer.open({
			type: 2,//iframe层
			title: '新增',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['800px' , '600px'],
			content: '/ez/system/syscity/addUI.do',
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
				url: "/ez/system/syscity/deleteAll.do",
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
		return [
			<shiro:hasPermission name="syscity_view">
			'<a class="view" href="javascript:void(0)" title="查看">',
			'查看',
			'</a>    ',
			</shiro:hasPermission>
			<shiro:hasPermission name="syscity_modify">
			'<a class="edit" href="javascript:void(0)" title="修改">',
			'修改',
			'</a>    ',
			</shiro:hasPermission>
			<shiro:hasPermission name="syscity_delete">
			'<a class="remove" href="javascript:void(0)" title="删除">',
			'删除',
			'</a>'
			</shiro:hasPermission>
		].join('');
	};
	//操作区事件
	window.operateEvents = {
		'click .view': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '查看',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/system/syscity/getById.do?typeKey=2&syscityId='+row.id,
			});
		},
		'click .edit': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '编辑',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/system/syscity/getById.do?typeKey=1&syscityId='+row.id,
				end:function(){
					$("#table").bootstrapTable('refresh');//刷新表格
				}
			});
		},
		'click .remove': function (e, value, row, index) {
			top.layer.confirm("确认要删除该行的数据吗？",{icon: 7},function(index){
				//删除记录
				$.ajax({
					url: "/ez/system/syscity/deleteById.do",
					type: "POST",
					data: { "ids": row.id },
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
			ids += arrselections[i].id ;
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
		top.layer.close(index);
	}
	//获取表格高度
	function getHeight() {
		return $(window).height() - 15;
	}
</script>

</body>
</html>