<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<div class="layui-header beg-layout-header">
	<div class="beg-layout-main beg-layout-logo">
		<a href="ez/syslogin/index.do" target="_blank">
			<span class="fs22">${SYSNAME}</span>
		</a>
	</div>
	<div class="beg-layout-main beg-layout-side-toggle">
		<i class="fa fa-bars" aria-hidden="true"></i>
	</div>
	<!--一级菜单-->
	<div class="beg-layout-main beg-layout-menu" id="menu">
		<ul class="layui-nav beg-layout-nav" lay-filter="">
			<c:forEach items="${firstmenulist}" var ="menu" varStatus="status">
				<c:choose>
					<c:when test="${status.first}">
						<li class="layui-nav-item layui-this">
					</c:when>
					<c:otherwise>
						<li class="layui-nav-item">
					</c:otherwise>
				</c:choose>
				<a href="javascript:;" data-module-id="${menu.id}">
					<i class="fa ${menu.icon}" aria-hidden="true"></i>
					<cite>${menu.title}</cite>
				</a>
				</li>
			</c:forEach>
		</ul>
	</div>
	<div class="beg-layout-main beg-layout-panel">
		<ul class="layui-nav beg-layout-nav" lay-filter="user">
			<li class="layui-nav-item">
				<a href="/BeginnerAdmin/index.html">案例模板</a>
			</li>
			<li class="layui-nav-item">
				<a href="javascript:;" class="beg-layou-head">
					<div id="usericon">
						<!-- Current avatar -->
						<div class="avatar-view"  title="头像设置">
							<img src="/static/images/0.jpg" alt="Avatar" data-toggle="modal" data-target="#avatar-modal" >
						</div>
						<!-- Cropping modal -->
						<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1" style="display: none;">
							<div class="modal-dialog modal-lg">
								<div class="modal-content">
									<!--<form class="avatar-form" action="upload-logo.php" enctype="multipart/form-data" method="post">-->
									<form class="avatar-form">
										<div class="modal-header">
											<button class="close" data-dismiss="modal" type="button">×</button>
											<h4 class="modal-title" id="avatar-modal-label">上传图片</h4>
										</div>
										<div class="modal-body">
											<div class="avatar-body">
												<div class="avatar-upload">
													<input class="avatar-src" name="avatar_src" type="hidden">
													<input class="avatar-data" name="avatar_data" type="hidden">
													<label for="avatarInput" >图片上传：</label>
													<button class="btn btn-danger" type="button" style="height: 35px;" onclick="$('input[id=avatarInput]').click();">请选择图片</button>
													<span id="avatar-name"></span>
													<input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file"></div>
												<div class="row">
													<div class="col-md-9">
														<div class="avatar-wrapper"></div>
													</div>
													<div class="col-md-3">
														<div class="avatar-preview preview-lg" id="imageHead"></div>
														<!--<div class="avatar-preview preview-md"></div>
                                                		<div class="avatar-preview preview-sm"></div>-->
													</div>
												</div>
												<div class="row avatar-btns">
													<div class="col-md-4">
														<div class="btn-group">
															<button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"> 向左旋转</button>
														</div>
														<div class="btn-group">
															<button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"> 向右旋转</button>
														</div>
													</div>
													<div class="col-md-5" style="text-align: right;">
														<button class="btn btn-danger fa fa-arrows" data-method="setDragMode" data-option="move" type="button" title="移动">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
							            </span>
														</button>
														<button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom" data-option="0.1" title="放大图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
							              <!--<span class="fa fa-search-plus"></span>-->
							            </span>
														</button>
														<button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom" data-option="-0.1" title="缩小图片">
							            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
							              <!--<span class="fa fa-search-minus"></span>-->
							            </span>
														</button>
														<button type="button" class="btn btn-danger fa fa-refresh" data-method="reset" title="重置图片">
								            <span class="docs-tooltip" data-toggle="tooltip" title="" data-original-title="$().cropper(&quot;reset&quot;)" aria-describedby="tooltip866214">
								       </span></button>
													</div>
													<div class="col-md-3">
														<button class="btn btn-danger btn-block avatar-save fa fa-save" type="button" data-dismiss="modal"> 保存修改</button>
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
					<span id="username">${sysuser.userrelnm}</span>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-tab="true" data-url='ez/system/sysuser/persetting.do'>
							<i class="fa fa-user-circle" aria-hidden="true"></i>
							<cite>个人信息</cite>
						</a>
					</dd>
					<shiro:hasPermission name="option_listmodify">
					<dd>
						<a href="javascript:;" data-tab="true" data-url="ez/system/sysoption/listedit.do">
							<i class="fa fa-gear" aria-hidden="true"></i>
							<cite>设置</cite>
						</a>
					</dd>
					</shiro:hasPermission>
					<dd>
						<a href="ez/syslogin/logout.do">
							<i class="fa fa-sign-out" aria-hidden="true"></i>
							<cite>注销</cite>
						</a>
					</dd>
				</dl>
			</li>
		</ul>
	</div>
</div>

