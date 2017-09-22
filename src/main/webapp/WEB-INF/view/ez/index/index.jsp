<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path;
%>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
  <base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>${SYSNAME}</title>
  <!-- Tell the browser to be responsive to screen width -->
  <!--<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">-->
  <link rel="stylesheet" href="/static/plugins/bootstrap3.3.7/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="/static/plugins/onicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/static/plugins/adminlte/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="/static/plugins/adminlte/css/skin-blue.min.css">
   <!--index css by myself-->
  <link rel="stylesheet" href="/static/css/index.css">


  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="/static/js/html5shiv.min.js"></script>
  <script src="/static/js/respond.min.js"></script>
  <![endif]-->

  <!-- jQuery 2 -->
  <script src="/static/js/jquery-2.0.3.min.js"></script>
  <!-- Bootstrap 3.3.7 -->
  <script src="/static/plugins/bootstrap3.3.7/js/bootstrap.min.js"></script>
  <!-- AdminLTE App -->
  <script src="/static/plugins/adminlte/js/adminlte.min.js"></script>
  <!--right multi tabs-->
  <script src="/static/js/contabs.js"></script>
  <!--layer v3.0.3-->
  <script type="text/javascript" src="/static/plugins/layer/layer.js"></script>

  <script>
      $(function() {
          $(".sidebar-menu>li:first>a").click(function () {//我的工作台
              $(".sidebar-menu").find("li").removeClass("active");
              $(this).parent().addClass("active");
          });
          $(".treeview-menu>li:not(.treeview)>a").click(function() {//二级菜单(三级菜单样式有点问题)
                $(this).parent().parent().find("li").removeClass("active");
                $(this).parent().parent().parent().parent().find("li").not($(this).parent().parent().parent()[0]).removeClass("active");
                $(this).parent("li").addClass("active");
                $(this).parent().parent().parent("li").addClass("active");
          });
      });
  </script>
</head>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="ez/syslogin/index.do" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>E</b>Z</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>EZ</b>Admin</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li>
            <a href="/ez/front/index.do" title="网站首页"><i class="fa fa-home"></i></a>
          </li>
          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- Inner Menu: contains the notifications -->
                <ul class="menu">
                  <li><!-- start notification -->
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <!-- end notification -->
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- Inner menu: contains the tasks -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <!-- Task title and progress text -->
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <!-- The progress bar -->
                      <div class="progress xs">
                        <!-- Change the css width attribute to simulate progress -->
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar"
                             aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- The user image in the navbar-->
              <img src="${sysuser.usericom}" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">${sysuser.userrelnm}</span>
            </a>
            <ul class="dropdown-menu">
              <!-- The user image in the menu -->
              <li class="user-header">
                <img src="${sysuser.usericom}" class="img-circle" alt="User Image">

                <p>
                  ${sysuser.userrelnm}
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="ez/system/sysuser/persetting.do" class="btn btn-default btn-flat">个人资料</a>
                </div>
                <div class="pull-right">
                  <a href="ez/syslogin/logout.do" class="btn btn-default btn-flat">退出系统</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li><a href="ez/syslogin/logout.do" title="退出"><i class="fa fa fa-sign-out"></i>退出</a></li>
        </ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <%@ include file="left.jsp"%>
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
      <div class="content-tabs">
          <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
          </button>
          <nav class="page-tabs J_menuTabs">
              <div class="page-tabs-content">
                  <a href="javascript:;" class="active J_menuTab" data-id="ez/syslogin/tab.do">我的工作台</a>
              </div>
          </nav>
          <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
          </button>
          <div class="btn-group roll-nav roll-right">
              <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>
              </button>
              <ul role="menu" class="dropdown-menu dropdown-menu-right">
                  <li class="J_tabShowActive"><a>定位当前选项卡</a>
                  </li>
                  <li class="divider"></li>
                  <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                  </li>
                  <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                  </li>
              </ul>
          </div>
          <%--<a href="ez/syslogin/logout.do" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出 </a>--%>
      </div>
      <div class="J_mainContent" >
          <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="ez/syslogin/tab.do" frameborder="0" data-id="ez/syslogin/tab.do" seamless></iframe>
      </div>
           
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      热爱我的热爱
    </div>
    <!-- Default to the left -->
    ${footerContent}
    <!--<strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.-->
 </footer>

</div>
<!-- ./wrapper -->
</body>
</html>