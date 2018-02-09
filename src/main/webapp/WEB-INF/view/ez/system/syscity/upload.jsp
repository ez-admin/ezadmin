<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/19
  Time: 21:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>导入数据</title>
    <%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
    <link rel="stylesheet" href="/static/plugins/bootstrap-table/bootstrap.min.css">
    <link rel="stylesheet" href="/static/plugins/bootstrap-fileinput-4.3.2/css/fileinput.min.css">
    <script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="/static/plugins/layer/layer.js"></script>
    <script src="/static/plugins/bootstrap-table/bootstrap.min.js"></script>
    <script src="/static/plugins/bootstrap-fileinput-4.3.2/js/fileinput.min.js"></script>
    <script src="/static/plugins/bootstrap-fileinput-4.3.2/js/locales/zh.js"></script>
</head>
<body class="container-fluid">
    <form id="formid" class="form-horizontal">
        <blockquote>
            <p>温馨提示：<a href="/ez/system/syscity/exportfile.do" class="red underline">点击这里</a>下载导入的excel数据模板！</p>
        </blockquote>
        <div>
            <label class="control-label">上传文件:</label>
            <input type="file" name="file"  class="layui-upload-file" id="uploadfile">
            <input type="text" name="filepath" id="filepath">
            <p class="help-block">支持xls|xlsx格式</p>
        </div>
        <div class="center-block">
            <button type="button" class="btn btn-primary" id="uploadadd"><i class="fa fa-file-excel-o"></i>&nbsp;新增上传数据</button>
            <button type="button" class="btn btn-default" id="uploadmodify"><i class="fa fa-file-excel-o"></i>&nbsp;更新全部数据</button>

            <%--<button class="layui-btn" lay-submit lay-filter="uploadadd"><i class="fa fa-file-excel-o"></i>&nbsp;新增上传数据</button>
                <button class="layui-btn" lay-submit lay-filter="uploadmodify"><i class="fa fa-file-excel-o"></i>&nbsp;更新全部数据</button>
            </div>--%>
        </div>
    </form>
<script>
    $("#uploadfile").fileinput({
        language: 'zh', //设置语言
        uploadUrl:"/ez/system/syscity/uploadfile.do", //上传的地址
        allowedFileExtensions: ['xls', 'xlsx'],//接收的文件后缀
        //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
        uploadAsync: true, //默认异步上传
        showUpload:true, //是否显示上传按钮
        showRemove :true, //显示移除按钮
        showPreview :true, //是否显示预览
        showCaption:true,//是否显示标题
        browseClass:"btn btn-primary", //按钮样式
        dropZoneEnabled: false,//是否显示拖拽区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        //maxFileSize:0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount:10, //表示允许同时上传的最大文件个数
        enctype:'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<iclass='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
    }).on("fileuploaded", function (event, data, previewId, index){
        if("suc"==data.response.msg){
            $("#filepath").val(data.response.path);
            top.layer.msg('上传成功!',{icon: 1});
        }else{
            top.layer.msg('上传失败!'+data.response.message);
        }
    });

    //监听更新新增数据
    $("#uploadadd").click(function () {
        $.ajax({
            url: "/ez/system/syscity/uploadadd.do",
            type: "POST",
            data:$('#formid').serialize(),// 你的formid
            dataType: 'json',
            beforeSend: function () {
                //判断上传的路径文件不能为空
                if ($("#filepath").val() == '' || $("#filepath").val() == null){
                    console.log("更新文件路径为空！")
                    top.layer.msg('更新失败!没有找到上传文件路径!',{icon: 2,time: 5000});
                    return;
                }else {
                    console.log("更新文件路径不为空！")
                }
                // 禁用按钮防止重复提交
                $("#uploadadd").attr({ disabled: "disabled" });
            },
            complete: function () {
                $("#uploadadd").removeAttr("disabled");
            },
            success: function (result) {
                if(result.status){
                    //关闭窗口
                    top.layer.closeAll();
                    top.layer.msg('更新数据成功!',{icon: 1});
                }else{
                    top.layer.msg('更新数据失败!'+result.message,{icon: 2,time: 5000});
                }
            }
        });
    });
    //监听更新修改数据
    $("#uploadmodify").click(function () {
        $.ajax({
            url: "/ez/system/syscity/uploadmodify.do",
            type: "POST",
            data:$('#formid').serialize(),// 你的formid
            dataType: 'json',
            beforeSend: function () {
                //判断上传的路径文件不能为空
                if ($("#filepath").val() == '' || $("#filepath").val() == null){
                    top.layer.msg('更新失败!没有找到上传文件路径!',{icon: 2,time: 5000});
                    return;
                }
                // 禁用按钮防止重复提交
                $("#uploadmodify").attr({ disabled: "disabled" });
            },
            complete: function () {
                $("#uploadmodify").removeAttr("disabled");
            },
            success: function (result) {
                if(result.status){
                    //关闭窗口
                    top.layer.closeAll();
                    top.layer.msg('更新数据成功!',{icon: 1});
                }else{
                    top.layer.msg('更新数据失败!'+result.message,{icon: 2,time: 5000});
                }
            }
        });
    });

</script>
<%--<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
<script>
    //Demo
    layui.use(['layer', 'form','jquery','upload','laydate'], function(){
        var layer = layui.layer
            ,form = layui.form()
            ,$ = layui.jquery
            ,laydate = layui.laydate;
        //导入
        layui.upload({
            url: '/ez/system/syscity/uploadfile.do'
            ,title: '上传文件'
            ,elem: '#uploadfile' //指定原始元素，默认直接查找class="layui-upload-file"
            ,method: 'post' //上传接口的http类型
            ,before: function(input){
                //layer.msg('数据更新中!');
                layer.load();
            }
            ,success: function(res){
                layer.closeAll("loading");
                console.log(res);
                if("suc"==(res.msg)){
                    $("#filepath").val(res.path);
                    $(window.parent.ezsystemsyscitylist.document).find('#uploadfilepath').val(res.path);
                    $("#filestate").find("span").text(res.filename);
                    $("#filestate").show();
                    top.layer.msg('上传成功!',{icon: 1});
                }else{
                    top.layer.msg('上传失败!'+res.message,{icon: 2},function () {
                        location.reload();
                    });
                }

            }
        });
        //监听更新新增数据
        form.on('submit(uploadadd)', function(data){
            //layer.msg(JSON.stringify(data.field));
            $.ajax({
                url: "/ez/system/syscity/uploadadd.do",
                type: "POST",
                data:$('#formid').serialize(),// 你的formid
                success: function (result) {
                    if("suc"==(result.msg)){
                        //关闭窗口
                        top.layer.closeAll();
                        top.layer.msg('更新数据成功!',{icon: 1});
                    }else{
                        top.layer.msg('更新数据失败!'+result.message,{icon: 2},function () {
                            location.reload();
                        });
                    }
                }
            });
            return false;
        });
        //监听更新修改数据
        form.on('submit(uploadmodify)', function(data){
            //layer.msg(JSON.stringify(data.field));
            $.ajax({
                url: "/ez/system/syscity/uploadmodify.do",
                type: "POST",
                data:$('#formid').serialize(),// 你的formid
                success: function (result) {
                    if("suc"==(result.msg)){
                        //关闭窗口
                        top.layer.closeAll();
                        top.layer.msg('更新数据成功!',{icon: 1});
                    }else{
                        top.layer.msg('更新数据失败!'+result.message,{icon: 2},function () {
                            location.reload();
                        });
                    }
                }
            });
            return false;
        });
    });
</script>--%>
</body>
</html>