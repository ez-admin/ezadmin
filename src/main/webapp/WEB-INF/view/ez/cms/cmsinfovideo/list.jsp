<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>视频管理列表</title>
	<%@ include file="/WEB-INF/view/ez/index/listpublictop.jsp"%>
</head>
<body>
<form class="layui-form" id="formSearch">
	<shiro:hasPermission name="cmsinfovideo_query">
	<div class="layui-input-inline">
		<input id="emVideoTitle" name="emVideoTitle" placeholder="请输入标题" type="text" class="layui-input-quote" maxlength="255" autocomplete="off">
	</div>
	<div class="layui-input-inline">
		<select name="positionId" id="positionId">
			<option value="">请选择视频位置</option>
		</select>
	</div>
	<div class="layui-input-inline">
		<select name="emVideoStat">
			<option value="">请选择发布状态</option>
			<option value="0">禁用</option>
			<option value="1">启用</option>
		</select>
	</div>
	<button class="layui-btn layui-btn-small" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="cmsinfovideo_add">
		<button id="btn_add" type="button" class="layui-btn layui-btn-small">
			<i class="fa fa-plus"></i>新增
		</button>
	</shiro:hasPermission>
	<shiro:hasPermission name="cmsinfovideo_deleteall">
		<button id="btn_delete" type="button" class="layui-btn layui-btn-small">
			<i class="fa fa-remove"></i>批量删除
		</button>
	</shiro:hasPermission>
</form>

<table id="table"></table>
<%@ include file="/WEB-INF/view/ez/index/listpublicjs.jsp"%>
<script>
	$(function () {
        var form = layui.form();
        //后台获取select值
        $.ajax({
            url: '/ez/system/sysdictionary/getSdBySdtCode.do',
            type: "POST",
            data:{code:1027},
            dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
            success: function (result) {
                $("#positionId").append(result);
                form.render('select');
            }
        });
		//初始化表格
		$('#table').bootstrapTable({
			url: '/ez/cms/cmsinfovideo/showlist.do',
			method: 'post',
			<shiro:hasPermission name="cmsinfovideo_export">
			showExport: true,
			</shiro:hasPermission>
			exportDataType: "basic",
			toolbar: '#formSearch',
			striped: true,
			cache: false,
			pagination: true,
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",
			sortable: true,
			sortOrder: "asc",
			sortName: "em_video_id",
			queryParams: queryParams=function(params) {
				var pageNum=params.offset/params.limit+1;
				return $('#formSearch').serialize()+
						"&pageNum="+pageNum+
						"&pageSize="+params.limit+
						"&orderBy="+params.sort+" "+ params.order;
			},//传递参数（*）
			sidePagination: "server",
			pageNumber:1,
			pageSize: ${systemBackPageSize},
			pageList: [10, 25, 50, 100 , 'All'],
			search: false,
			strictSearch: true,
			showColumns: true,
			showRefresh: true,
			minimumCountColumns: 2,
			clickToSelect: false,
			height: getHeight(),
			uniqueId: "emVideoId",
			showToggle:false,
			cardView: false,
			detailView: false,
			columns: [
				{checkbox: true, width:'2%'},
				{field: '', title: '序号', align: 'center', width:'5%', formatter: function (value, row, index) {return index+1;}},
				{field: 'emVideoTitle', title: '视频标题', align: 'center', width:'18%',sortName:'em_video_title',sortable: true},
				{field: 'positionName', title: '视频位置', align: 'center', width:'9%',sortName:'position_id',sortable: true},
				/*{field: 'emVideoPicpath', title: '标题图', align: 'center', width:'9%',sortName:'em_video_picpath',sortable: true},*/
				{field: 'emVideoOrder', title: '视频排序', align: 'center', width:'9%',sortName:'em_video_order',sortable: true},
				{field: 'emVideoStat', title: '发布状态', align: 'center', width:'9%',sortName:'em_video_stat',sortable: true,formatter: stateFormatter},
                {field: 'emVideoInserttime', title: '操作时间', align: 'center', width:'18%',sortName:'em_video_inserttime',sortable: true},
                {field: 'authorname', title: '发布人', align: 'center', width:'9%',sortName:'author',sortable: true},
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
			content: '/ez/cms/cmsinfovideo/addUI.do',
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
				url: "/ez/cms/cmsinfovideo/deleteAll.do",
				type: "POST",
                async:false,//数据量大等待全部
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
    function stateFormatter(value,row,index) {
        var state="";
        if (0==value) {
            state = "禁用";
        }else if (1 ==value){
            state="启用";
        }else {
            state="未知发布状态";
        }
        return state;
    }
	//操作区
	function operateFormatter(value, row, index) {
		return [
			<shiro:hasPermission name="cmsinfovideo_view">
			'<a class="view" href="javascript:void(0)" title="查看">',
			'查看',
			'</a>    ',
			</shiro:hasPermission>
			<shiro:hasPermission name="cmsinfovideo_modify">
			'<a class="edit" href="javascript:void(0)" title="修改">',
			'修改',
			'</a>    ',
			</shiro:hasPermission>
			<shiro:hasPermission name="cmsinfovideo_delete">
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
				content: '/ez/cms/cmsinfovideo/getById.do?typeKey=2&cmsinfovideoId='+row.emVideoId,
			});
		},
		'click .edit': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '编辑',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/cms/cmsinfovideo/getById.do?typeKey=1&cmsinfovideoId='+row.emVideoId,
				end:function(){
					$("#table").bootstrapTable('refresh');//刷新表格
				}
			});
		},
		'click .remove': function (e, value, row, index) {
			top.layer.confirm("确认要删除该行的数据吗？",{icon: 7},function(index){
				//删除记录
				$.ajax({
					url: "/ez/cms/cmsinfovideo/deleteById.do",
					type: "POST",
					data: { "ids": row.emVideoId },
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
			ids += arrselections[i].emVideoId ;
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