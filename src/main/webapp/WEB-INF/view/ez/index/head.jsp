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
					<img src="/static/images/0.jpg" />
					<span>${sysuser.userrelnm}</span>
				</a>
				<dl class="layui-nav-child">
					<dd>
						<a href="javascript:;" data-tab="true" data-url='user.html'>
							<i class="fa fa-user-circle" aria-hidden="true"></i>
							<cite>个人信息</cite>
						</a>
					</dd>
					<dd>
						<a href="javascript:;" data-tab="true" data-url="setting.html">
							<i class="fa fa-gear" aria-hidden="true"></i>
							<cite>设置</cite>
						</a>
					</dd>
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

