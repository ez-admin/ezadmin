<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>404 Error Page - Ace Admin</title>
		<meta name="description" content="404 Error Page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
	</head>
	<body>
		<div class="container-fluid" id="main-container">
			<div id="main-content" class="clearfix">
					<div id="page-content" class="clearfix">
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS HERE -->
								<div class="error-container">
									<div class="well">
										<h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-sitemap"></i>
												404
											</span>
											页面没找到
										</h1>
										<hr />
										<h3 class="lighter smaller">我们找遍了天涯海角也没找到!</h3>
										<div>
											<div class="space"></div>
											<h4 class="smaller">查找是否是以下原因:</h4>
											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													检查路径是不是有误！
												</li>
												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													检查代码是不是有误！
												</li>
												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													检查环境配置是不是有误！
												</li>
											</ul>
										</div>
										<hr />
										<div class="space"></div>
									</div>
								</div>
								<!-- PAGE CONTENT ENDS HERE -->
								</div>
						 </div><!--/row-->
					</div><!--/#page-content-->
			</div><!-- #main-content -->
		</div><!--/.fluid-container#main-container-->
	</body>
</html>