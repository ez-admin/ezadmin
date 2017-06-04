<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>城市区域列表</title>
	<%@ include file="/WEB-INF/view/ez/index/listpublicsubtop.jsp"%>
</head>
<body>
<blockquote class="layui-elem-quote" style="padding: 8px 15px">
	<form class="layui-form" id="formSearch">
		<shiro:hasPermission name="syscity_query">
		<input type="text" style="display: none"><%--enter事件生效--%>
		<div class="layui-input-inline">
			<input id="name" name="name" placeholder="请输入区域名" type="text" class="layui-input-quote" maxlength="20" autocomplete="off">
		</div>
		<button class="layui-btn layui-btn-small" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
		</shiro:hasPermission>
			<div id="toolbar" class="btn-group pull-right">
				<shiro:hasPermission name="syscity_upload">
				<button id="btn_upload" type="button" class="layui-btn layui-btn-small">
					<i class="fa fa-upload"></i>上传
				</button>
				<input type="hidden" id="uploadfilepath" name="uploadfilepath">
				</shiro:hasPermission>
				<shiro:hasPermission name="syscity_add">
				<button id="btn_add" type="button" class="layui-btn layui-btn-small">
					<i class="fa fa-plus"></i>新增一级区域
				</button>
				</shiro:hasPermission>
			</div>
	</form>
</blockquote>

<table id="table"></table>
<%@ include file="/WEB-INF/view/ez/index/listpublicsubjs.jsp"%>
<script>
	$(function () {
		//初始化表格
		$('#table').bootstrapTable({
			url: '/ez/system/syscity/getParentcityList.do',
			method: 'post',                      //请求方式（*）
			striped: true,                      //是否显示行间隔色
			cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination: false,                   //是否显示分页（*）
			contentType: "application/x-www-form-urlencoded;charset=UTF-8",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
			sortable: true,                       //是否启用排序
			sortOrder: "asc",                      //排序方式
			sortName: "id",
            queryParams: queryParams=function(params) {
                return "&name="+$("#name").val()+
                    "&orderBy="+params.sort+" "+ params.order;
            }, //传递参数（*）
			sidePagination: "server",             //分页方式：client客户端分页，server服务端分页（*）
			pageNumber:1,                         //初始化加载第一页，默认第一页
			pageSize: ${systemBackPageSize},  //每页的记录行数（*）
			pageList: [10, 25, 50, 100 , 'All'],  //可供选择的每页的行数（*）
			search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch: true,
			showColumns: false,                  //是否显示所有的列
			showRefresh: false,                  //是否显示刷新按钮
			minimumCountColumns: 2,             //最少允许的列数
			clickToSelect: false,               //是否启用点击选中行
			uniqueId: "id",                     //每一行的唯一标识，一般为主键列
			showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
			cardView: false,                    //是否显示详细视图
			detailView: true,                  //是否显示父子表
			columns: [
				/*{checkbox: true, width:'2%'},*/
				{field: '', title: '序号', align: 'center',  formatter: function (value, row, index) {return index+1;}},
				{field: 'name', title: '区域名称', align: 'center', sortName:'name',sortable: true},
                {field: 'id', title: '区域id', align: 'center', sortName:'id',sortable: true},
				{field: 'parentId', title: '父级区域id', align: 'center', sortName:'parentId',sortable: true},
				{
					filed: '',
					title: '操作区',
					align: 'center',
					events: operateEvents,
					formatter: operateFormatter
                } ],
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
        var parentId = row.id;
        var cur_table = $detail.html('<table></table>').find('table');
        $(cur_table).bootstrapTable({
            url: 'ez/system/syscity/getChildrencityList.do',
            method: 'post',                      //请求方式（*）
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",//请求数据内容格式 默认是 application/json 自己根据格式自行服务端处理
            sortable: true,                       //是否启用排序
            sortOrder: "asc",                      //排序方式
            sortName: "id",
            queryParams: queryParams=function(params) {
                return "&name="+$("#name").val()+
                    "&parentId="+parentId+
                    "&orderBy="+params.sort+" "+ params.order;
            }, //传递参数（*）
            sidePagination: "server",             //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                         //初始化加载第一页，默认第一页
            pageSize: ${systemBackPageSize},  //每页的记录行数（*）
            pageList: [10, 25, 50, 100 , 'All'],  //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                  //是否显示所有的列
            showRefresh: false,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: false,               //是否启用点击选中行
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: true,                  //是否显示父子表
            columns: [
               /* {checkbox: true, width:'2%'},*/
                {field: '', title: '序号', align: 'center',  formatter: function (value, row, index) {return index+1;}},
                {field: 'name', title: '区域名称', align: 'center', sortName:'name',sortable: true},
                {field: 'id', title: '区域id', align: 'center', sortName:'id',sortable: true},
                {field: 'parentId', title: '父级区域id', align: 'center', sortName:'parentId',sortable: true},
                {
                    filed: '',
                    title: '操作区',
                    align: 'center',
                    events: operateEvents,
                    formatter: operateFormatter
                } ],
            //注册加载子表的事件。注意下这里的三个参数！
            onExpandRow: function (index, row, $detail) {
                expandTable(index, row, $detail);
            }
        });
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
			area : ['800px' , '600px'],
			content: '/ez/system/syscity/addUI.do',
			end:function(){
				$("#table").bootstrapTable('refresh');//刷新表格
			}
		});
	});
	//上传
	$("#btn_upload").click(function () {
		top.layer.open({
			type: 2,//iframe层
			title: '上传导入数据',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['600px' , '250px'],
			content: '/ez/system/syscity/upload.do',
			end:function(){
			    var uploadfilepath=$("#uploadfilepath").val();
			    if (uploadfilepath){
                    $.ajax({
                        url: "/ez/system/syscity/deleteuploadfile.do",
                        type: "POST",
                        data:$('#formSearch').serialize(),// 你的formid
                        success: function (result) {
                            if("suc"==(result.msg)){
                                console.log("删除上传更新城市区域临时文件成功！");
                            }else{
                                console.log("删除上传更新城市区域临时文件失败！"+result.message);
                            }
                        }
                    });
				}
				$("#table").bootstrapTable('refresh');//刷新表格
			}
		});
	});
	//操作区
	function operateFormatter(value, row, index) {
		return [
			<shiro:hasPermission name="syscity_addsub">
			'<a class="addsub" href="javascript:void(0)" title="新增下级区域">',
			'新增下级区域',
			'</a>&nbsp;&nbsp;&nbsp;&nbsp;',
			</shiro:hasPermission>
			<shiro:hasPermission name="syscity_modify">
			'<a class="edit" href="javascript:void(0)" title="修改">',
			'修改',
			'</a>&nbsp;&nbsp;&nbsp;&nbsp;',
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
		'click .addsub': function (e, value, row, index) {
			top.layer.open({
				type: 2,//iframe层
				title: '新增下级区域',
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ['800px' , '600px'],
				content: '/ez/system/syscity/getById.do?typeKey=2&syscityId='+row.id,
                end:function(){
                    $("#table").bootstrapTable('refresh');//刷新表格
                }
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
			top.layer.confirm("确认要删除该行及其子数据吗？",{icon: 7},function(index){
				//删除记录
				$.ajax({
					url: "/ez/system/syscity/deleteById.do",
					type: "POST",
					data: { "ids": row.id },
                    async:false,//同步 由于删除调用递归函数，执行有点满，如果不设置同步，就是页面刷新之后，数据没有删除，过个几秒钟，刷新才会消失
                    success: function (result) {
						handleResult(result.status,result.message);
					}
				});
				closeWin(index);
			});
		}
	};
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
        return $(window).height()-15;
    }
</script>

</body>
</html>