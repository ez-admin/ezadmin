<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>系统字典名称列表</title>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">

    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap-table.css">
    <style>
        .clear{
            clear: both;
        }
        .layui-input-quote{
            display: block;
            width: 150px;
            padding-left: 10px;
            height: 34px;
            line-height: 34px;
            border: 1px solid #e6e6e6;
            background-color: #fff;
            border-radius: 2px;
        }
        .layui-form-mid i,.layui-word-aux i{
            line-height: inherit;
        }
    </style>
</head>
<body>
<blockquote class="layui-elem-quote" style="padding: 8px 15px">
    <form class="layui-form" id="formSearch">
        <shiro:hasPermission name="sysmenu_query">
        <div class="layui-input-inline">
            <input id="menuId" name="menuId"  placeholder="请输入菜单ID" type="text" class="layui-input-quote">
        </div>
        <div class="layui-input-inline">
            <input id="menuName" name="menuName" placeholder="请输入菜单名称" type="text" class="layui-input-quote">
        </div>
        <button class="layui-btn layui-btn-small" type="button" id="btn_query"><i class="fa fa-search"></i>查询</button>
        </shiro:hasPermission>
        <shiro:hasPermission name="sysmenu_addfirst">
        <div id="toolbar" class="btn-group pull-right">
            <button id="btn_add" type="button" class="layui-btn layui-btn-small">
                <i class="fa fa-plus"></i>新增一级菜单
            </button>
        </div>
        </shiro:hasPermission>
        <div class="clear"></div>
    </form>
</blockquote>
<table id="table"></table>

<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/layui/lay/dest/layui.all.js"></script>
<script src="/static/plugins/bootstrap-table/bootstrap.min.js"></script>
<script src="/static/plugins/bootstrap-table/bootstrap-table.js"></script>
<script src="/static/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.js"></script>
<script>
    $(function () {

        //初始化表格
        $('#table').bootstrapTable({
            url: 'ez/system/sysmenu/getParentMenu.do',
            method: 'post',                      //请求方式（*）
            //toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sortName: "MENU_ID",
            queryParams: queryParams=function(params) {
                return {
                    limit: params.limit,   //页面大小
                    offset: params.offset,  //页码
                    order: params.order,
                    ordername: params.sort,
                    menuId: $("#menuId").val(),
                    menuName: $("#menuName").val()
                };
            },
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: ${systemBackPageSize},                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                       //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                  //是否显示所有的列
            showRefresh: false,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: false,                //是否启用点击选中行
            height: getHeight(),                //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "menuId",                     //每一行的唯一标识，一般为主键列
            showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: true,                  //是否显示父子表
            columns: [{
                field: 'menuName',
                title: '菜单名称',
                align: 'center'
            }, {
                field: 'menuIcon',
                title: '菜单图标',
                align: 'center',
                formatter:  menuicon
            }, {
                field: 'menuUrl',
                title: '菜单地址',
                align: 'center'
            }, {
                field: 'menuId',
                title: '菜单Id',
                align: 'center'
            }, {
                field: 'parentId',
                title: '父级菜单Id',
                align: 'center'
            }, {
                field: 'menuOrder',
                title: '菜单顺序',
                align: 'center'
            }, {
                field: 'menuType',
                title: '菜单类型',
                align: 'center',
                formatter: menuTypeFormatter
            },{
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
    });
    //创建子表
    function expandTable(index, row, $detail) {
        var parentId = row.menuId;
        var cur_table = $detail.html('<table></table>').find('table');
        $(cur_table).bootstrapTable({
            url: 'ez/system/sysmenu/getChildrenMenu.do',
            method: 'post',                      //请求方式（*）
            //toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sortName: "MENU_ID",
            queryParams: queryParams=function(params) {
                return {
                    limit: params.limit,   //页面大小
                    offset: params.offset,  //页码
                    order: params.order,
                    ordername: params.sort,
                    menuId: $("#menuId").val(),
                    menuName: $("#menuName").val(),
                    parentId: parentId
                };
            },
            dataType:'json',
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1,                       //初始化加载第一页，默认第一页
            pageSize: ${systemBackPageSize},                       //每页的记录行数（*）
            pageList: [10, 25, 50, 100],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
            strictSearch: true,
            showColumns: false,                 //是否显示所有的列
            showRefresh: false,                 //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: false,               //是否启用点击选中行
            height: getHeight(),                //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "menuId",                 //每一行的唯一标识，一般为主键列
            showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: true,                   //是否显示父子表
            showHeader:true,
            columns: [{
                field: 'menuName',
                title: '菜单名称',
                align: 'center'
            }, {
                field: 'menuIcon',
                title: '菜单图标',
                align: 'center',
                formatter:  menuicon
            }, {
                field: 'menuUrl',
                title: '菜单地址',
                align: 'center'
            }, {
                field: 'menuId',
                title: '菜单Id',
                align: 'center'
            }, {
                field: 'parentId',
                title: '父级菜单Id',
                align: 'center'
            }, {
                field: 'menuOrder',
                title: '菜单顺序',
                align: 'center'
            }, {
                field: 'menuType',
                title: '菜单类型',
                align: 'center',
                formatter: menuTypeFormatter
            },{
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
            title: '新增一级菜单',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area : ['600px' , '450px'],
            content: '/ez/system/sysmenu/addUI.do',
            end:function(){
                $("#table").bootstrapTable('refresh');//刷新表格
            }
        });
    });
    //菜单图标
    function menuicon(value, row, index) {
        return [
            '<i class="fa '+value+'"></i>'
            /*'<i class="fa '+value+'"></i>'+value*/
        ].join('');
    };
    //菜单类型
    function menuTypeFormatter(value, row, index){
        var a="未知类型";
        if (value==0){
            a="开发者菜单";
        }else if(value==1){
            a="系统菜单";
        }else if(value==2){
            a="业务菜单";
        }
        return a;
    };
    //操作区
    function operateFormatter(value, row, index) {
        return [
            <shiro:hasPermission name="sysmenu_addchidren">
            '<a class="addSub" href="javascript:void(0)" title="新增子菜单">',
            '新增子菜单',
            '</a>    ',
            </shiro:hasPermission>
            <shiro:hasPermission name="sysmenu_view">
            '<a class="view" href="javascript:void(0)" title="查看">',
            '查看',
            '</a>    ',
            </shiro:hasPermission>
            <shiro:hasPermission name="sysmenu_modify">
            '<a class="edit" href="javascript:void(0)" title="修改">',
            '修改',
            '</a>    ',
            </shiro:hasPermission>
            <shiro:hasPermission name="sysmenu_delete">
            '<a class="remove" href="javascript:void(0)" title="删除">',
            '删除',
            '</a>'
            </shiro:hasPermission>
        ].join('');
    }
    //操作区事件
    window.operateEvents = {
        'click .addSub': function (e, value, row, index) {
            top.layer.open({
                type: 2,//iframe层
                title: '新增子菜单',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area : ['600px' , '500px'],
                content: '/ez/system/sysmenu/addSub.do?parentId='+row.menuId,
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
                area : ['600px' , '560px'],
                content: '/ez/system/sysmenu/getById.do?typeKey=2&sysmenuId='+row.menuId,
            });
        },
        'click .edit': function (e, value, row, index) {
            top.layer.open({
                type: 2,//iframe层
                title: '编辑',
                maxmin: true,
                shadeClose: true, //点击遮罩关闭层
                area : ['600px' , '450px'],
                content: '/ez/system/sysmenu/getById.do?typeKey=1&sysmenuId='+row.menuId,
                end:function(){
                    $("#table").bootstrapTable('refresh');//刷新表格
                }
            });
        },
        'click .remove': function (e, value, row, index) {
            top.layer.confirm("确认要删除该行的数据吗？",{icon: 7},function(index){
                //删除记录
                $.ajax({
                    url: "/ez/system/sysmenu/deleteById.do",
                    type: "POST",
                    async:false,
                    data: { "ids": row.menuId },
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
        //$("#table").bootstrapTable('refresh');
        top.layer.close(index);
    }
    //获取表格高度
    function getHeight() {
        return $(window).height() - $('blockquote').outerHeight(true);
    }
</script>
</body>
</html>
