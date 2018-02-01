﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>系统字典名称列表</title>
    <%@ include file="/WEB-INF/view/ez/index/listpublicsubtop.jsp"%>
</head>
<body>
<blockquote class="layui-elem-quote" style="padding: 8px 15px">
    <form id="formSearch" class="form-inline">
        <shiro:hasPermission name="sysmenu_query">
            <div class="form-group">
                <input id="menuId" name="menuId"  placeholder="请输入菜单ID" type="text" class="form-control">
            </div>
            <div class="form-group">
                <input id="menuName" name="menuName" placeholder="请输入菜单名称" type="text" class="form-control">
            </div>
            <button type="button" id="btn_query" class="btn btn-primary"><i class="fa fa-search"></i>查询</button>
        </shiro:hasPermission>
        <div class="btn-group">
            <shiro:hasPermission name="sysmenu_addfirst">
                <button id="btn_add" type="button" class="btn btn-primary">
                    <i class="fa fa-plus"></i>新增一级菜单
                </button>
            </shiro:hasPermission>
        </div>
        <div class="clear"></div>
    </form>
</blockquote>
<table id="table"></table>
<%@ include file="/WEB-INF/view/ez/index/listpublicsubjs.jsp"%>
<script type="text/javascript">
    $(function () {
        //初始化表格
        $('#table').bootstrapTable({
            url: 'ez/system/sysmenu/getParentMenu.do',
            method: 'post',                      //请求方式（*）
            //toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sortName: "MENU_ID",
            queryParams: queryParams=function(params) {
                return "&menuId="+$("#menuId").val()+
                    "&menuName="+$("#menuName").val()+
                    "&orderBy="+params.sort+" "+ params.order;
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
            columns: [
            {
                filed: '',
                title: '操作区',
                width: '20%',
                align: 'center',
                events: operateEvents,
                formatter: operateFormatter
            },{
                field: 'menuName',
                title: '菜单名称',
                width: '19%',
                align: 'center'
            }, {
                field: 'menuIcon',
                title: '菜单图标',
                width: '5%',
                align: 'center',
                formatter:  menuicon
            }, {
                field: 'menuUrl',
                title: '菜单地址',
                width: '30%',
                align: 'center'
            }, {
                field: 'menuId',
                title: '菜单主键',
                width: '5%',
                align: 'center'
            }, {
                field: 'parentId',
                title: '父级主键',
                width: '5%',
                align: 'center'
            }, {
                field: 'menuOrder',
                title: '菜单顺序',
                width: '5%',
                align: 'center'
            }, {
                field: 'menuType',
                title: '菜单类型',
                width: '10%',
                align: 'center',
                formatter: menuTypeFormatter
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
            pagination: false,                   //是否显示分页（*）
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            sortable: true,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sortName: "MENU_ID",
            queryParams: queryParams=function(params) {
                return "&menuId="+$("#menuId").val()+
                    "&menuName="+$("#menuName").val()+
                    "&parentId="+parentId+
                    "&orderBy="+params.sort+" "+ params.order;
            },
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
            //height: getHeight(),               //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "menuId",                 //每一行的唯一标识，一般为主键列
            showToggle:false,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: true,                   //是否显示父子表
            showHeader:false,                    //是否显示列头
            columns: [
            {
                filed: '',
                title: '操作区',
                width: '20%',
                align: 'center',
                events: operateEvents,
                formatter: operateFormatter
            },{
                field: 'menuName',
                title: '菜单名称',
                width: '19%',
                align: 'center'
            }, {
                field: 'menuIcon',
                title: '菜单图标',
                width: '5%',
                align: 'center',
                formatter:  menuicon
            }, {
                field: 'menuUrl',
                title: '菜单地址',
                width: '30%',
                align: 'center'
            }, {
                field: 'menuId',
                title: '菜单主键',
                width: '5%',
                align: 'center'
            }, {
                field: 'parentId',
                title: '父级主键',
                width: '5%',
                align: 'center'
            }, {
                field: 'menuOrder',
                title: '菜单顺序',
                width: '5%',
                align: 'center'
            }, {
                field: 'menuType',
                title: '菜单类型',
                width: '10%',
                align: 'center',
                formatter: menuTypeFormatter
            }],
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
            area : ['600px' , '550px'],
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
                area : ['600px' , '580px'],
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
                area : ['600px' , '580px'],
                content: '/ez/system/sysmenu/getById.do?typeKey=2&sysmenuId='+row.menuId
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
            top.layer.confirm("确认要删除该行及其子数据吗？",{icon: 7},function(index){
                //删除记录
                $.ajax({
                    url: "/ez/system/sysmenu/deleteById.do",
                    type: "POST",
                    async:false,
                    data: { "ids": row.menuId },
                    dataType:"json",
                    success: function (result) {
                        handleResult(result);
                    }
                });
                closeWin(index);
            });
        }
    };
    //删除后的提示
    function handleResult(result){
        if(result.status){
            top.layer.msg('删除成功！',{icon: 1});
        }else{
            top.layer.msg('删除失败！'+result.message,{icon: 2});
        }
    }
    //关闭弹窗并刷新
    function closeWin(index){
        location.reload();
        top.layer.close(index);
    }
    //获取表格高度
    function getHeight() {
        return $(window).height() - $('blockquote').outerHeight(true);
    }
</script>
</body>
</html>
