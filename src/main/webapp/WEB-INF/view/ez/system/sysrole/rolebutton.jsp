<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>菜单权限名称列表</title>
    <%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
    <link rel="stylesheet" href="/static/plugins/zTree/2.6/zTreeStyle.css"/>
    <script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
    <style>
        .clearfix{
            clear: both;
        }
    </style>
</head>
<body>
<form id="formid" class="layui-form">
    <div id="zhongxin">
        <ul id="tree" class="tree" style="overflow:auto;"></ul>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="add">保存</button>
            <button class="layui-btn" onclick="top.layer.closeAll()">关闭</button>
        </div>
    </div>
</form>
<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
<script type="text/javascript" src="/static/plugins/zTree/2.6/jquery.ztree-2.6.min.js"></script>
<script>
    var zTree;
    $(function () {
        //初始化表格
        var setting = {
            showLine: true,
            checkable: true,
            showIcon :true
        };
        var zn = '${zTreeNodes}';
        var zTreeNodes = eval(zn);
        zTree = $("#tree").zTree(setting, zTreeNodes);
        //让第四级按钮菜单横向排列
        $("#tree").find("ul").find("ul").find("ul").find("li").css("float","left");
        $("#tree").find("ul").find("ul").find("ul").append("<div class='clearfix'></div>");
        $("#tree").find("ul").find("ul").find("ul").find("li").find("button:first-child").css("background","none");
        $("#tree").find("ul").find("ul").find("ul").find("li").find("a").find("button:first-child").css("width","0");

    });
    //Demo
    layui.use(['layer', 'form','jquery'], function(){
        var layer = layui.layer
                ,form = layui.form()
                ,$ = layui.jquery;
        //监听提交
        form.on('submit(add)', function(data){
            //layer.msg(JSON.stringify(data.field));
            //treenodes
            var nodes = zTree.getCheckedNodes();
            var tmpNode;
            var ids = "";
            for(var i=0; i<nodes.length; i++){
                tmpNode = nodes[i];
                if(i!=nodes.length-1){
                    ids += tmpNode.id+",";
                }else{
                    ids += tmpNode.id;
                }
            };
            var roleId = "${roleId}";
            var msg = "${msg}";
            var postData = {"roleId":roleId,"ids":ids,"msg":msg};
            $.ajax({
                url: "/ez/system/sysrole/roleQxSave.do",
                type: "POST",
                data:postData,
                success: function (result) {
                    if(result.status==1){
                        //关闭窗口
                        top.layer.closeAll();
                        top.layer.msg('保存成功!',{icon: 1});
                    }else{
                        top.layer.msg('保存失败——'+result.message,{icon: 2,time: 5000},function () {
                            location.reload();
                        });
                    }
                }
            });
            return false;
        });
    });
</script>
</body>
</html>
