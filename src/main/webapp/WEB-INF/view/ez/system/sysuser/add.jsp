<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/ez/index/tablibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>用户/会员新增</title>
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
	<style>
		.layui-form-select{
			display: none;
		}
		.select2-search {
			display: none;
		}
		.select2-search__field{
			display: none;
		}
		.layui-form-label{
			width:120px;
		}
		.layui-form-onswitch i {
			left: 26px;
		}
		.layui-form-switch {
			width: 50px;
		}
		.select2-container--bootstrap .select2-results>.select2-results__options {
			max-height: 400px;
		}
	</style>
	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>
<body>
	<div class="layui-field-box">
		<form id="formid" class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-inline">
					<input type="text" name="lognm"  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-inline">
					<input type="text" name="logpwd" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">所属公司:</label>
				<div class="layui-input-inline" style="width: 400px">
					<select id="companyno" name="companyno" style="width: 100%" lay-verify="required" >
						<option value="">请选择</option>
					</select>
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">所属部门:</label>
				<div class="layui-input-inline" style="width: 400px">
					<select id="dptno" name="dptno" style="width: 100%" lay-verify="required">
						<option value="">请选择</option>
					</select>
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户类型:</label>
				<div class="layui-input-block">
					<input type="radio" name="optype" value="0" title="系统用户" checked>
					<input type="radio" name="optype" value="1" title="前台会员">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">是否启用:</label>
				<div class="layui-input-block">
					<input type="checkbox" name="isused" value="1" lay-skin="switch" lay-text="是|否" checked>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">头像:</label>
				<div class="layui-input-inline">
					<input type="file" name="usericom" class="layui-upload-file" lay-title="上传图片">
					<div class="container" id="crop-avatar">
						<!-- Current avatar -->
						<div class="avatar-view" title="更换头像">
							<%--<img src="/static/images/0.jpg" alt="Avatar">--%>
							<img src="/static/plugins/cropper/img/picture.jpg" alt="Avatar">
						</div>
						<!-- Cropping modal -->
						<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<form class="avatar-form" action="crop.php" enctype="multipart/form-data" method="post" style="display: block">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal">&times;</button>
											<h4 class="modal-title" id="avatar-modal-label">更换头像</h4>
										</div>
										<div class="modal-body">
											<div class="avatar-body">
												<!-- Upload image and data -->
												<div class="avatar-upload">
													<input type="hidden" class="avatar-src" name="avatar_src">
													<input type="hidden" class="avatar-data" name="avatar_data">
													<label for="avatarInput" style="line-height:35px;">上传图片：</label>
													<button class="btn btn-primary" type="button" style="height: 35px;" onclick="$('input[id=avatarInput]').click();">请选择图片</button>
													<span id="avatar-name"></span>
													<input type="file" class="avatar-input hide" id="avatarInput" name="avatar_file">
												</div>
												<!-- Crop and preview -->
												<div class="row">
													<div class="col-md-9">
														<div class="avatar-wrapper"></div>
													</div>
													<div class="col-md-3">
														<div class="avatar-preview preview-lg"></div>
													</div>
												</div>
												<div class="row avatar-btns">
													<div class="col-md-4" >
														<div class="btn-group">
															<button type="button" class="btn btn-primary fa fa-undo" data-method="rotate" data-option="-90" title="Rotate -90 degrees">向左旋转
															</button>
														</div>
														<div class="btn-group">
															<button type="button" class="btn btn-primary fa fa-repeat" data-method="rotate" data-option="90" title="Rotate 90 degrees">向右旋转
															</button>
														</div>
													</div>
													<div class="col-md-5" style="text-align: right;">
														<button type="button" class="btn btn-primary fa fa-search-plus" data-method="zoom" data-option="0.1" title="放大图片">
															放大图片
															<span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)"></span>
														</button>
														<button type="button" class="btn btn-primary fa fa-search-minus" data-method="zoom" data-option="-0.1" title="缩小图片">
															缩小图片
															<span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)"></span>
														</button>
														<button type="button" class="btn btn-primary fa fa-refresh" data-method="reset" title="重置图片">
															重置图片
															<span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)"></span>
														</button>
													</div>
													<div class="col-md-3">
														<button type="submit" class="btn btn-danger btn-block avatar-save fa fa-save">保存修改</button>
													</div>
												</div>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div><!-- /.modal -->
						<!-- Loading state -->
						<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
					</div>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">真实姓名:</label>
				<div class="layui-input-inline">
					<input type="text" name="userrelnm" lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">性别:</label>
				<div class="layui-input-inline">
					<select name="sex" id="sex" lay-verify="required" >
						<option value="">请选择</option>
					</select>
				</div>
				<div class="layui-form-mid layui-word-aux"><i class="fa fa-star red"></i></div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">年龄:</label>
				<div class="layui-input-inline">
					<input type="number" name="age" autocomplete="off" maxlength="3" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">身份证号:</label>
				<div class="layui-input-inline">
					<input type="text" name="idnum"  placeholder="请输入身份证号" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">手机号码:</label>
				<div class="layui-input-inline">
					<input type="text" name="mobile" placeholder="请输入手机号码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">邮箱:</label>
				<div class="layui-input-inline">
					<input type="text" name="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="add">保存</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="/static/js/jquery-2.0.3.min.js"></script>
	<script type="text/javascript" src="/static/plugins/layui/layui.js" charset="utf-8"></script>
	<%--select2tree plugins--%>
	<link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css" class="css">
	<link rel="stylesheet" href="/static/plugins/select2tree/css/select2.min.css" class="css">
	<link rel="stylesheet" href="/static/plugins/select2tree/css/select2-bootstrap.min.css" class="css">
	<script type="text/javascript" src="/static/plugins/select2tree/js/select2.min.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/plugins/select2tree/js/zh-CN.js" charset="utf-8"></script>
	<script type="text/javascript" src="/static/plugins/select2tree/js/select2tree.js" charset="utf-8"></script>
	<%--Cropper plugins--%>
	<link rel="stylesheet" href="/static/plugins/cropper/css/cropper.min.css">
	<link rel="stylesheet" href="/static/plugins/cropper/css/main.css">
	<script src="/static/plugins/bootstrap3.3.7/js/bootstrap.min.js"></script>
	<script src="/static/plugins/cropper/js/cropper.min.js"></script>
	<script src="/static/plugins/cropper/js/main.js"></script>
	<script src="/static/plugins/cropper/js/html2canvas.min.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
        //做个下简易的验证  大小 格式
        $('#avatarInput').on('change', function(e) {
            var filemaxsize = 1024 * 5;//5M
            var target = $(e.target);
            var Size = target[0].files[0].size / 1024;
            if(Size > filemaxsize) {
                alert('图片过大，请重新选择!');
                $(".avatar-wrapper").childre().remove;
                return false;
            }
            if(!this.files[0].type.match(/image.*/)) {
                alert('请选择正确的图片!')
            } else {
                var filename = document.querySelector("#avatar-name");
                var texts = document.querySelector("#avatarInput").value;
                var teststr = texts; //你这里的路径写错了
                testend = teststr.match(/[^\\]+\.[^\(]+/i); //直接完整文件名的
                filename.innerHTML = testend;
            }

        });

        $(".avatar-save").on("click", function() {
            var img_lg = document.getElementById('imageHead');
            // 截图小的显示框内的内容
            html2canvas(img_lg, {
                allowTaint: true,
                taintTest: false,
                onrendered: function(canvas) {
                    canvas.id = "mycanvas";
                    //生成base64图片数据
                    var dataUrl = canvas.toDataURL("image/jpeg");
                    var newImg = document.createElement("img");
                    newImg.src = dataUrl;
                    imagesAjax(dataUrl)
                }
            });
        })

        function imagesAjax(src) {
            var data = {};
            data.img = src;
            data.jid = $('#jid').val();
            $.ajax({
                url: "upload-logo.php",
                data: data,
                type: "POST",
                dataType: 'json',
                success: function(re) {
                    if(re.status == '1') {
                        $('.user_pic img').attr('src',src );
                    }
                }
            });
        }
	</script>
	<script>
        //select2插件
		$(function() {
			$("#companyno").append('${companyList}');
			$("#dptno").append('${dptList}');
			$("#companyno").select2tree({
				placeholder: '请选择一个公司',
				allowClear: true
			});
			$("#dptno").select2tree({
				placeholder: '请选择一个部门',
				allowClear: true
			});
		});
		//Demo
		layui.use(['layer', 'form','jquery','upload'], function(){
			var layer = layui.layer
					,form = layui.form()
					,$ = layui.jquery;

			//后台获取select值
			$.ajax({
				url: '/ez/system/sysdictionary/getSdBySdtCode.do',
				type: "POST",
				data:{code:1002},
				dataType: 'html',//(string)预期返回的数据类型。xml,html,json,text等
				success: function (result) {
					$("#sex").append(result);
					$("#sex").select2tree({
						placeholder: '请选择性别'
					});
				}
			});
			//监听提交
			form.on('submit(add)', function(data){
				//layer.msg(JSON.stringify(data.field));
				$.ajax({
					url: "/ez/system/sysuser/add.do",
					type: "POST",
					data:$('#formid').serialize(),// 你的formid
					success: function (result) {
						if("suc"==(result.msg)){
							//关闭窗口
							top.layer.closeAll();
							top.layer.msg('保存成功!',{icon: 1});
						}else{
							top.layer.msg('保存失败!'+result.message,{icon: 2},function () {
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