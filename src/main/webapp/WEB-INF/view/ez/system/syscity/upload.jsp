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
</head>
<body>

<div class="layui-field-box">
    <form id="formid" class="layui-form">
        <blockquote class="layui-elem-quote">
            <p>温馨提示：<a href="/ez/system/syscity/exportfile.do" class="red underline">点击这里</a>下载导入的excel数据模板！</p>
        </blockquote>
        <div class="layui-form-item">
            <label class="layui-form-label" >上传文件:</label>
            <div class="layui-input-inline" style="width: 130px">
                <input type="file" name="file" lay-ext="xls|xlsx" class="layui-upload-file" id="uploadfile">
            </div>
            <input type="hidden" name="filepath" id="filepath">
            <div class="layui-form-mid layui-word-aux layui-hidden" id="filestate">
                <span></span>
                上传成功！
                <i class="fa fa-check blue"></i>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="uploadadd"><i class="fa fa-file-excel-o"></i>&nbsp;新增上传数据</button>
                <button class="layui-btn" lay-submit lay-filter="uploadmodify"><i class="fa fa-file-excel-o"></i>&nbsp;更新全部数据</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
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
</script>
</body>
</html>