<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>栏目管理列表</title>
	<%@ include file="/WEB-INF/view/ez/index/listpublicsubtop.jsp"%>
</head>
<body>
<blockquote class="container" style="padding: 8px 15px">
	<form class="form" id="formSearch">
		<shiro:hasPermission name="cmsnode_query">
		<div class="form-group">
			<input id="cmsNodeName" name="cmsNodeName" placeholder="请输入栏目名称" type="text" class="form-control" maxlength="20" autocomplete="off">
		</div>
		<div class="form-group">
			<input id="cmsNodeCode" name="cmsNodeCode" placeholder="请输入栏目编码" type="text" class="form-control" maxlength="50" autocomplete="off">
		</div>
		<%--<div class="form-group">
			<select name="cmsNodeType" id="cmsNodeType">
				<option value="">请选择栏目类型</option>
			</select>
		</div>
		<div class="form-group">
			<select name="cmsNodeState" id="cmsNodeState">
				<option value="">请选择栏目状态</option>
				<option value="0">禁用</option>
				<option value="1">启用</option>
			</select>
		</div>--%>
		<button class="btn btn-default" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
		</shiro:hasPermission>

		<div id="toolbar" class="btn-group pull-right">
		<shiro:hasPermission name="cmsnode_add">
			<button id="btn_add" type="button" class="btn btn-default">
				<i class="fa fa-plus"></i>新增
			</button>
		</shiro:hasPermission>
		<shiro:hasPermission name="cmsnode_deleteall">
			<button id="btn_delete" type="button" class="btn btn-default">
				<i class="fa fa-remove"></i>批量删除
			</button>
		</shiro:hasPermission>
		</div>
	</form>
</blockquote>
<table id="table"></table>
<%@ include file="/WEB-INF/view/ez/index/listpublicsubjs.jsp"%>
<script>
	$(function () {
        /*var form = layui.form();
        //后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1026},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#cmsNodeType").append(result);
                form.render('select');
            }
        });*/
		//初始化表格
		$('#table').bootstrapTable({
			url: '/ez/cms/cmsnode/getParentList.do',
            method: 'post',                      //请求方式（*）
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
            sortable: true,
            sortOrder: "asc",
			sortName: "cms_node_id",
			queryParams: queryParams=function(params) {
				return "&cmsNodeName="+$("#cmsNodeName").val()+
                    	"&cmsNodeCode="+$("#cmsNodeCode").val()+
/*                    	"&cmsNodeType="+$("#cmsNodeType").val()+
                    	"&cmsNodeState="+$("#cmsNodeState").val()+*/
						"&orderBy="+params.sort+" "+ params.order;
			},//传递参数（*）
            sidePagination: "server",             //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                         //初始化加载第一页，默认第一页
            pageSize: ${systemBackPageSize},  //每页的记录行数（*）
            pageList: [10, 25, 50, 100 , 'All'],  //可供选择的每页的行数（*）
			search: false,
			strictSearch: true,
			showColumns: false,
			showRefresh: false,
			minimumCountColumns: 2,
			clickToSelect: false,
			//height: getHeight(),
			uniqueId: "cmsNodeId",
			showToggle:false,
			cardView: false,
			detailView: true,
			columns: [
				{field: '', title: '序号', align: 'center', width:'5%', formatter: function (value, row, index) {return index+1;}},
				{field: 'cmsNodeName', title: '栏目名称', align: 'center', width:'15%',sortName:'cms_node_name',sortable: true},
				{field: 'cmsNodeCode', title: '栏目编码', align: 'center', width:'15%',sortName:'cms_node_code',sortable: true},
				{field: 'cmsNodeSort', title: '栏目排序', align: 'center', width:'15%',sortName:'cms_node_sort',sortable: true},
				{field: 'cmsNodeTypename', title: '栏目类型', align: 'center', width:'15%',sortName:'cms_node_type',sortable: true},
				{field: 'cmsNodeState', title: '栏目状态', align: 'center', width:'15%',sortName:'cms_node_state',sortable: true, formatter: stateFormatter},
				/*{field: 'cmsNodeInserttime', title: '操作时间', align: 'center', width:'15%',sortName:'cms_node_inserttime',sortable: true},*/
				 {
					filed: '',
					title: '操作区',
					align: 'center',
					width:'20%',
					events: operateEvents,
					formatter: operateFormatter
				}
			],
            //注册加载子表的事件。注意下这里的三个参数！
            onExpandRow: function (index, row, $detail) {
                expandTable(index, row, $detail);
            }
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
    //创建子表
    function expandTable(index, row, $detail) {
        var parentId = row.cmsNodeId;
        var cur_table = $detail.html('<table></table>').find('table');
        $(cur_table).bootstrapTable({
            url: '/ez/cms/cmsnode/getChildrenList.do',
            method: 'post',                      //请求方式（*）
            showHeader: false,
			striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
            sortable: true,
            sortOrder: "asc",
            sortName: "cms_node_id",
            queryParams: queryParams=function(params) {
                return "&cmsNodeName="+$("#cmsNodeName").val()+
                    "&cmsNodeCode="+$("#cmsNodeCode").val()+
/*                    "&cmsNodeType="+$("#cmsNodeType").val()+
                    "&cmsNodeState="+$("#cmsNodeState").val()+*/
                    "&cmsNodeParentId="+parentId+
                    "&orderBy="+params.sort+" "+ params.order;
            },//传递参数（*）
            sidePagination: "server",             //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                         //初始化加载第一页，默认第一页
            pageSize: ${systemBackPageSize},  //每页的记录行数（*）
            pageList: [10, 25, 50, 100 , 'All'],  //可供选择的每页的行数（*）
            search: false,
            strictSearch: true,
            showColumns: false,
            showRefresh: false,
            minimumCountColumns: 2,
            clickToSelect: false,
            //height: getHeight(),
            uniqueId: "cmsNodeId",
            showToggle:false,
            cardView: false,
            detailView: true,
            columns: [
                {field: '', title: '序号', align: 'center', width:'5%', formatter: function (value, row, index) {return index+1;}},
                {field: 'cmsNodeName', title: '栏目名称', align: 'center', width:'15%',sortName:'cms_node_name',sortable: true},
                {field: 'cmsNodeCode', title: '栏目编码', align: 'center', width:'15%',sortName:'cms_node_code',sortable: true},
                {field: 'cmsNodeSort', title: '栏目排序', align: 'center', width:'15%',sortName:'cms_node_sort',sortable: true},
                {field: 'cmsNodeTypename', title: '栏目类型', align: 'center', width:'15%',sortName:'cms_node_type',sortable: true},
                {field: 'cmsNodeState', title: '栏目状态', align: 'center', width:'15%',sortName:'cms_node_state',sortable: true, formatter: stateFormatter},
                /*{field: 'cmsNodeInserttime', title: '操作时间', align: 'center', width:'15%',sortName:'cms_node_inserttime',sortable: true},*/
                {
                    filed: '',
                    title: '操作区',
                    align: 'center',
                    width:'20%',
                    events: operateEvents,
                    formatter: operateFormatter
                }
            ],
            //注册加载子表的事件。注意下这里的三个参数！
            onExpandRow: function (index, row, $detail) {
                expandTable(index, row, $detail);
            }
        });
    };
    function stateFormatter(value, row, index) {
        var state="";
		if (0==value){
            state="禁用";
		}else if(1==value){
            state="启用";
		}else {
            state="未知";
		}
		return state;
    }
	//刷新
	$("#btn_query").click(function () {
		$("#table").bootstrapTable('refresh');
	});
	//新增
	$("#btn_add").click(function () {
		top.layer.open({
			type: 2,//iframe层
			title: '新增一级栏目',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['800px' , '600px'],
			content: '/ez/cms/cmsnode/addUI.do',
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
				url: "/ez/cms/cmsnode/deleteAll.do",
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
            <shiro:hasPermission name="cmsnode_addsub">
            '<a class="addsub" href="javascript:void(0)" title="新增下级区域">',
            '新增下级栏目',
            '</a>    ',
            </shiro:hasPermission>
			<shiro:hasPermission name="cmsnode_view">
			'<a class="view" href="javascript:void(0)" title="查看">',
			'查看',
			'</a>    ',
			</shiro:hasPermission>
			<shiro:hasPermission name="cmsnode_modify">
			'<a class="edit" href="javascript:void(0)" title="修改">',
			'修改',
			'</a>    ',
			</shiro:hasPermission>
			<shiro:hasPermission name="cmsnode_delete">
			'<a class="remove" href="javascript:void(0)" title="删除">',
			'删除',
			'</a>'
			</shiro:hasPermission>
		].join('');
	};
	//操作区事件
	window.operateEvents = {
        'click .addsub': function (e, value, row, index) {
            top.layer.open({
                type: 2,//iframe层
                title: '新增下级区域',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area : ['800px' , '600px'],
                content: '/ez/cms/cmsnode/getById.do?typeKey=3&cmsnodeId='+row.cmsNodeId,
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
				content: '/ez/cms/cmsnode/getById.do?typeKey=2&cmsnodeId='+row.cmsNodeId,
			});
		},
		'click .edit': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '编辑',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/cms/cmsnode/getById.do?typeKey=1&cmsnodeId='+row.cmsNodeId,
				end:function(){
					$("#table").bootstrapTable('refresh');//刷新表格
				}
			});
		},
		'click .remove': function (e, value, row, index) {
			top.layer.confirm("确认要删除该行的数据吗？",{icon: 7},function(index){
				//删除记录
				$.ajax({
					url: "/ez/cms/cmsnode/deleteById.do",
					type: "POST",
					data: { "ids": row.cmsNodeId },
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
			ids += arrselections[i].cmsNodeId ;
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