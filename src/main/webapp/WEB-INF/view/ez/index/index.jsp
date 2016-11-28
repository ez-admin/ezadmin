<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="top.jsp"%>
	<!-- 即时通讯 -->
	<link rel="stylesheet" type="text/css" href="plugins/websocketInstantMsg/ext4/resources/css/ext-all.css">
	<link rel="stylesheet" type="text/css" href="plugins/websocketInstantMsg/css/websocket.css" />
	<script type="text/javascript" src="plugins/websocketInstantMsg/ext4/ext-all-debug.js"></script>
	<script type="text/javascript" src="plugins/websocketInstantMsg/websocket.js"></script>
	<!-- 即时通讯 -->
</head>

<body class="no-skin">
	<!-- 页面顶部¨ -->
	<%@ include file="head.jsp"%>
	<div id="websocket_button"></div>

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try{ace.settings.check('main-container' , 'fixed')}catch(e){}
		</script>
		<!-- 左侧菜单 -->
		<%@ include file="left.jsp"%>
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<!-- #section:basics/content.breadcrumbs -->
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
					</script>
					<ul class="breadcrumb">
						<li>
							<i class="ace-icon fa fa-home home-icon"></i>
							<a href="#">后台首页</a>
						</li>
					</ul><!-- /.breadcrumb -->
					<!-- #section:basics/content.searchbox -->
					<!--<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon">
								<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
								<i class="ace-icon fa fa-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					 /.nav-search -->
					<!-- /section:basics/content.searchbox -->
				</div>
				<!-- /section:basics/content.breadcrumbs -->
				<div class="page-content">
					<!--浮动设置框-->
					<%@ include file="settingbox.jsp"%>
					<div id="main-tab"></div>
					<!-- /section:settings.box -->
					<%--<div class="page-content-area" data-ajax-content="true">
						<!-- ajax content goes here -->
					</div>--%>
					<!-- /.page-content-area -->
				</div><!-- /.page-content -->
			</div>
		</div><!-- /.main-content -->
		<%@ include file="foot.jsp"%>
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
	</div><!-- /.main-container -->

	<!-- basic scripts -->
	<!--[if !IE]> -->
	<script src="static/components/jquery/dist/jquery.js"></script>
	<!-- <![endif]-->
	<!--[if IE]>
	<script src="static/components/jquery.1x/dist/jquery.js"></script>
	<![endif]-->
	<script type="text/javascript">
		if('ontouchstart' in document.documentElement) document.write("<script src='static/components/_mod/jquery.mobile.custom/jquery.mobile.custom.js'>"+"<"+"/script>");
	</script>
	<script src="static/components/bootstrap/dist/js/bootstrap.js"></script>
	<!-- ace scripts -->
	<script src="static/assets/js/src/elements.scroller.js"></script>
	<script src="static/assets/js/src/elements.colorpicker.js"></script>
	<script src="static/assets/js/src/elements.fileinput.js"></script>
	<script src="static/assets/js/src/elements.typeahead.js"></script>
	<script src="static/assets/js/src/elements.wysiwyg.js"></script>
	<script src="static/assets/js/src/elements.spinner.js"></script>
	<script src="static/assets/js/src/elements.treeview.js"></script>
	<script src="static/assets/js/src/elements.wizard.js"></script>
	<script src="static/assets/js/src/elements.aside.js"></script>
	<script src="static/assets/js/src/ace.js"></script>
	<script src="static/assets/js/src/ace.basics.js"></script>
	<script src="static/assets/js/src/ace.scrolltop.js"></script>
	<%--<script src="static/assets/js/src/ace.ajax-content.js"></script>--%>
	<script src="static/assets/js/src/ace.touch-drag.js"></script>
	<script src="static/assets/js/src/ace.sidebar.js"></script>
	<script src="static/assets/js/src/ace.sidebar-scroll-1.js"></script>
	<script src="static/assets/js/src/ace.submenu-hover.js"></script>
	<script src="static/assets/js/src/ace.widget-box.js"></script>
	<script src="static/assets/js/src/ace.settings.js"></script>
	<script src="static/assets/js/src/ace.settings-rtl.js"></script>
	<script src="static/assets/js/src/ace.settings-skin.js"></script>
	<script src="static/assets/js/src/ace.widget-on-reload.js"></script>
	<script src="static/assets/js/src/ace.searchbox-autocomplete.js"></script>

	<!-- 引入 菜单缩放功能-->
	<script type="text/javascript" src="static/assets/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="static/assets/js/myjs/menusf.js"></script>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/assets/js/myjs/righttab.js"></script>
	<!--左侧菜单-->
	<script>
		var zNodes=${menulist};
		function treeMenu(a){
			this.tree=a||[];
			this.groups={};
		};
		treeMenu.prototype={
			init:function(parentId){
				this.group();
				return this.getDom(this.groups[parentId]);
			},
			group:function(){
				for(var i=0;i<this.tree.length;i++){
					if(this.groups[this.tree[i].parentId]){
						this.groups[this.tree[i].parentId].push(this.tree[i]);
					}else{
						this.groups[this.tree[i].parentId]=[];
						this.groups[this.tree[i].parentId].push(this.tree[i]);
					}
				}
			},
			getDom:function(a){
				if(!a){return ''}
				var html='';
				//此处逻辑 定义#为上级菜单；非#为最后一级菜单
				for(var i=0;i<a.length;i++){
					html+='<li>';
					if(a[i].menuUrl =="#"){
						html+='<a href="#" class="dropdown-toggle" >';
					}else {
						html+='<a  target="mainFrame" onclick="siMenu(\''+a[i].menuId+'\',\''+a[i].menuName+'\',\''+a[i].menuUrl+'\',this)" style="cursor:pointer;" class="dropdown-toggle" >';
					}
					html+='<i class="menu-icon fa '+ a[i].menuIcon+'"></i><span class="menu-text"> '+a[i].menuName+'</span>';
					if(a[i].menuUrl =="#"){
						html+='<b class="arrow fa fa-angle-down"></b>';
					}
					//最后一级菜单不需要ul标签
					if(a[i].menuUrl =="#"){
						html+='</a><b class="arrow"></b><ul class="submenu">';
						html+=this.getDom(this.groups[a[i].menuId]);
						html+='</ul></li>\n';
					}else{
						html+='</a><b class="arrow"></b>';
						html+=this.getDom(this.groups[a[i].menuId]);
						html+='</li>\n';
					}
				};
				return html;
			}
		};
		var html=new treeMenu(zNodes).init(0);
		$("#fhindex").after(html);

		//首页
		$(function () {
			//首页默认
			$("#main-tab").aceaddtab({ title: "后台首页", url: "ez/syslogin/tab.do" });
		});
	</script>
</body>
</html>





