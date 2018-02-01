<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<title>角色名称列表</title>
	<%@ include file="/WEB-INF/view/ez/index/listhead.jsp"%>
</head>
<body>
	<form class="form-inline" id="formSearch">
		<shiro:hasPermission name="sysrole_query">
		<%--下面一行代码是处理，当只有一个查询框的时候，enter事件会把input框清空：此问题留后人研究--%>
		<input type="text" style="display: none">
		<div class="form-group">
			<input id="roleName" name="roleName" placeholder="请输入角色名称" type="text" class="form-control">
		</div>
		<button class="btn btn-primary" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
		</shiro:hasPermission>
		<div class="btn-group">
			<shiro:hasPermission name="sysrole_add">
			<button id="btn_add" type="button" class="btn btn-primary">
					<i class="fa fa-plus"></i>新增
			</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="sysrole_deleteall">
			<button id="btn_delete" type="button" class="btn btn-primary">
				<i class="fa fa-remove"></i>批量删除
			</button>
			</shiro:hasPermission>
		</div>
	</form>
	<table id="table"></table>
<script>
	$(function () {
		//初始化表格
		$('#table').bootstrapTable({
			url: 'ez/system/sysrole/showlist.do',
			method: 'post',                      //请求方式（*）
			<shiro:hasPermission name="sysrole_export">
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
			sortName: "ROLE_ID",
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
			uniqueId: "roleId",                     //每一行的唯一标识，一般为主键列
			showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: false,                  //是否显示父子表
			columns: [{
				checkbox: true
			},{
                filed: '',
                title: '操作区',
                align: 'center',
                width:'35%',
                events: operateEvents,
                formatter: operateFormatter
/*            }, {
				field: '',
				title: '序号',
				align: 'center',
				width:'5%',
				formatter: function (value, row, index) {
					return index+1;
				}*/
            }, {
                field: 'roleId',
                title: '角色ID',
                align: 'center',
                sortName:'role_id',
                sortable: true,
                width:'5%'
			}, {
				field: 'roleName',
				title: '角色名称',
				align: 'center',
                sortName:'ROLE_NAME',
                sortable: true,
				width:'30%'
			}, {
				field: 'roleLvel',
				title: '角色等级',
                sortName:'ROLE_LVEL',
                sortable: true,
				align: 'center',
				width:'30%'

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
	//新增
	$("#btn_add").click(function () {
		top.layer.open({
			type: 2,//iframe层
			title: '新增',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['1000px' , '600px'],
			content: '/ez/system/sysrole/addUI.do',
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
				url: "/ez/system/sysrole/deleteAll.do",
				type: "POST",
				//获取所有选中行
				data: getSelectId(arrselections),
				dataType:"json",
				success: function (result) {
					//删除后的提示
					handleResult(result);
				}
			});
			//关闭
			closeWin(index);
		});
	});
	//操作区
	function operateFormatter(value, row, index) {
		/*if (row.roleId!="1"){*/
			return [
				<%--<shiro:hasPermission name="sysrole_view">
                '<a class="rolebutton" href="javascript:void(0)" title="分配权限">',
                '分配权限',
                '</a>    ',
				</shiro:hasPermission>--%>
				<shiro:hasPermission name="sysrole_modify">
				'<a class="edit" href="javascript:void(0)" title="修改">',
				'修改',
				'</a>    ',
				</shiro:hasPermission>
				<shiro:hasPermission name="sysrole_delete">
				'<a class="remove" href="javascript:void(0)" title="删除">',
				'删除',
				'</a>'
				</shiro:hasPermission>
			].join('');
		/*}*/
	};
	//操作区事件
	window.operateEvents = {
        /*'click .rolebutton': function (e, value, row, index) {
            top.layer.open({
                type: 2,//iframe层
                title: '分配权限',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area : ['1100px' , '600px'],
                content: '/ez/system/sysrole/roleButton.do?roleId='+row.roleId,
                end:function(){
                    $("#table").bootstrapTable('refresh');//刷新表格
                }
            });
        },*/
		'click .edit': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '编辑',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['600px' , '400px'],
				content: '/ez/system/sysrole/getById.do?typeKey=1&sysroleId='+row.roleId,
				end:function(){
					$("#table").bootstrapTable('refresh');//刷新表格
				}
			});
		},
		'click .remove': function (e, value, row, index) {
			top.layer.confirm("确认要删除该行的数据吗？",{icon: 7},function(index){
				//删除记录
				$.ajax({
					url: "/ez/system/sysrole/deleteById.do",
					type: "POST",
					async: false,
					data: { "ids": row.roleId },
					dataType:"json",
					success: function (result) {
						handleResult(result);
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
			ids += arrselections[i].roleId;
			if(i!=arrselectionsLength-1){
				ids += ",";
			}
		}
		return {"ids":ids};
	}
	//删除后的提示
	function handleResult(result){
        if (result.status) {
            top.layer.msg('删除成功！',{icon: 1});
        } else {
            if (result.falsemsg != null){
                var obj = eval("("+result.falsemsg+")");//把json转为object对象
                var trs = "";
                $.each(obj, function (n, value) {
                    //alert(n + ' ' + value);
                    trs +=value.rolename + ":" + value.msg + "<br>";
                });
                top.layer.alert(trs,{area: ['500px', '300px']});
            }else {
            	top.layer.msg('删除失败！'+result.message,{icon: 2});
			}
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
		return $(window).height()-10;
		/*return $(window).height() - $('.fixed-table-toolbar').outerHeight(true);*/
	}
</script>
</body>
</html>