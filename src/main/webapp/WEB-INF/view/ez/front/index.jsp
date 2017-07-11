<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path;
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
	<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>安徽智侒信信息技术有限公司</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="软件研发、门户网站、安徽智侒信信息技术有限公司、智侒信、" />
	<meta name="keywords" content="计算机软硬件研发及销售；网络产品、安全产品、电子产品、预包装食品兼散装食品（许可证有效期至2017年9月9日）、农副产品（限食用农产品）的销售；系统集成、工程施工、建筑安装。（依法须经批准的项目，经相关部门批准后方可开展经营活动）" />
	<meta name="author" content="陈恩泽" />
	
	<!-- Animate.css -->
	<link rel="stylesheet" href="/static/plugins/front/css/animate.css">
	<!-- font-awesome -->
	<link rel="stylesheet" href="/static/plugins/font-awesome/css/font-awesome.min.css">
	<!-- Magnific Popup -->
	<link rel="stylesheet" href="/static/plugins/front/css/magnific-popup.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
	<!-- 
	Default Theme Style 
	You can change the style.css (default color purple) to one of these styles
	1. pink.css
	2. blue.css
	3. turquoise.css
	4. orange.css
	5. lightblue.css
	6. brown.css
	7. green.css
	-->
	<link rel="stylesheet" href="/static/plugins/front/css/style.css">

	<!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
	<link rel="stylesheet" id="theme-switch" href="/static/plugins/front/css/style.css">
	<!-- End demo purposes only -->


	<style>
	/* For demo purpose only */
	
	/* For Demo Purposes Only ( You can delete this anytime :-) */
	#colour-variations {
		padding: 10px;
		-webkit-transition: 0.5s;
	  	-o-transition: 0.5s;
	  	transition: 0.5s;
		width: 140px;
		position: fixed;
		left: 0;
		top: 100px;
		z-index: 999999;
		background: #fff;
		/*border-radius: 4px;*/
		border-top-right-radius: 4px;
		border-bottom-right-radius: 4px;
		-webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
	}
	#colour-variations.sleep {
		margin-left: -140px;
	}
	#colour-variations h3 {
		text-align: center;;
		font-size: 11px;
		letter-spacing: 2px;
		text-transform: uppercase;
		color: #777;
		margin: 0 0 10px 0;
		padding: 0;;
	}
	#colour-variations ul,
	#colour-variations ul li {
		padding: 0;
		margin: 0;
	}
	#colour-variations li {
		list-style: none;
		display: block;
		margin-bottom: 5px!important;
		float: left;
		width: 100%;
	}
	#colour-variations li a {
		width: 100%;
		position: relative;
		display: block;
		overflow: hidden;
		-webkit-border-radius: 4px;
		-moz-border-radius: 4px;
		-ms-border-radius: 4px;
		border-radius: 4px;
		-webkit-transition: 0.4s;
		-o-transition: 0.4s;
		transition: 0.4s;
	}
	#colour-variations li a:hover {
	  	opacity: .9;
	}
	#colour-variations li a > span {
		width: 33.33%;
		height: 20px;
		float: left;
		display: -moz-inline-stack;
		display: inline-block;
		zoom: 1;
		*display: inline;
	}
	.option-toggle {
		position: absolute;
		right: 0;
		top: 0;
		margin-top: 5px;
		margin-right: -30px;
		width: 30px;
		height: 30px;
		background: #f64662;
		text-align: center;
		border-top-right-radius: 4px;
		border-bottom-right-radius: 4px;
		color: #fff;
		cursor: pointer;
		-webkit-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-moz-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		-ms-box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
		box-shadow: 0 0 9px 0 rgba(0,0,0,.1);
	}
	.option-toggle i {
		top: 2px;
		position: relative;
	}
	.option-toggle:hover, .option-toggle:focus, .option-toggle:active {
		color:  #fff;
		text-decoration: none;
		outline: none;
	}
	</style>
	<!-- End demo purposes only -->


	<!-- Modernizr JS -->
	<script src="/static/plugins/front/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="/static/plugins/front/js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>
	<header role="banner" id="fh5co-header">
			<div class="container">
				<!-- <div class="row"> -->
			    <nav class="navbar navbar-default">
		        <div class="navbar-header">
		        	<!-- Mobile Toggle Menu Button -->
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		         <a class="navbar-brand" href="#">智侒信</a>
					<a href="/ez/syslogin/login_toLogin.do">系统后台</a>
		        </div>
		        <div id="navbar" class="navbar-collapse collapse">
		          <ul class="nav navbar-nav navbar-right">
		            <li class="active"><a href="#" data-nav-section="home"><span>首页</span></a></li>
		            <li><a href="#" data-nav-section="work"><span>案例</span></a></li>
		            <li><a href="#" data-nav-section="testimonials"><span>口碑</span></a></li>
		            <li><a href="#" data-nav-section="services"><span>服务</span></a></li>
		            <li><a href="#" data-nav-section="about"><span>关于我们</span></a></li>
		            <li><a href="#" data-nav-section="contact"><span>联系我们</span></a></li>
		          </ul>

		        </div>
			    </nav>
			  <!-- </div> -->
		  </div>
	</header>

	<section id="fh5co-home" data-section="home" style="background-image: url(images/full_image_2.jpg);" data-stellar-background-ratio="0.5">
		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-8 col-md-offset-2">
							<h1 class="to-animate">热爱我的热爱！</h1>
							<h2 class="to-animate">为您提供全新的互联网服务！实现你的idea,创造出21世纪有价值的Product!</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>

	<section id="fh5co-intro">
		<div class="container">
			<div class="row row-bottom-padded-lg">
				<div class="fh5co-block to-animate" style="background-image: url(images/img_10.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon fa fa-database"></i>
						<h2>Big Data</h2>
						<p>对大数据进行加工、整理、规划，深度整合用户需求，形成定制化产品。</p>
						<p><a href="/ez/front/bigdata.do" class="btn btn-primary">查看更多</a></p>
					</div>
				</div>
				<div class="fh5co-block to-animate" style="background-image: url(images/img_8.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon fa fa-android"></i>
						<h2>Androind</h2>
						<p>安卓手机定制化服务，结合用户需求，让你的手机软件低调、奢华、有内涵。</p>
						<p><a href="#" class="btn btn-primary">查看更多</a></p>
					</div>
				</div>
				<div class="fh5co-block to-animate" style="background-image: url(images/img_9.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon fa fa-apple"></i>
						<h2>Apple</h2>
						<p>平果手机软件定制，结合用户需求，让您的软件高端、大气、上档次。</p>
						<p><a href="#" class="btn btn-primary">查看更多</a></p>
					</div>
				</div>
				<div class="fh5co-block to-animate" style="background-image: url(images/img_7.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<i class="fh5co-intro-icon fa fa-html5"></i>
						<h2>HTML5</h2>
						<p>打造移动、PC官网，一个网站，手机、电脑都可以完美展示，让您的网站轻松营销。</p>
						<p><a href="#" class="btn btn-primary">查看更多</a></p>
					</div>
				</div>
			</div>
			<div class="row watch-video text-center to-animate">
				<span>查看视频</span>
				<a href="video/preview.mp4" class="popup-vimeo btn-video"><i class="fa fa-play"></i></a>
			</div>
		</div>
	</section>

	<section id="fh5co-work" data-section="work">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">案例</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>我们为了无数品牌和公司，提供无数次服务，例如：web页面开发、系统后台管理、公司OA系统、金融理财系统等等...</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-bottom-padded-sm">
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="images/1.jpg" class="fh5co-project-item image-popup to-animate">
						<img src="images/1.jpg" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>国元投资门户网站</h2>
						<span>国元旗下的公司的门户网站宣传。</span>
						</div>
					</a>
				</div>
				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="images/2.jpg" class="fh5co-project-item image-popup to-animate">
						<img src="images/2.jpg" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>国元网金P2P理财</h2>
						<span>安徽首个国有资产控股的P2P理财项目。</span>
						</div>
					</a>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-4 col-sm-6 col-xxs-12">
					<a href="images/3.jpg" class="fh5co-project-item image-popup to-animate">
						<img src="images/3.jpg" alt="Image" class="img-responsive">
						<div class="fh5co-text">
						<h2>新华财经生成加工平台</h2>
						<span>新华财经集采编发的系统后台管理系统。</span>
						</div>
					</a>
				</div>
			<!-- 	<div class="col-md-4 col-sm-6 col-xxs-12">
				<a href="images/work_4.jpg" class="fh5co-project-item image-popup to-animate">
					<img src="images/work_4.jpg" alt="Image" class="img-responsive">
					<div class="fh5co-text">
					<h2>Project 4</h2>
					<span>UI/UX</span>
					</div>
				</a>
			</div>
			
			<div class="clearfix visible-sm-block"></div>
			
			<div class="col-md-4 col-sm-6 col-xxs-12">
				<a href="images/work_5.jpg" class="fh5co-project-item image-popup to-animate">
					<img src="images/work_5.jpg" alt="Image" class="img-responsive">
					<div class="fh5co-text">
					<h2>Project 1</h2>
					<span>Photography</span>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-xxs-12">
				<a href="images/work_6.jpg" class="fh5co-project-item image-popup to-animate">
					<img src="images/work_6.jpg" alt="Image" class="img-responsive">
					<div class="fh5co-text">
					<h2>Project 2</h2>
					<span>Illustration</span>
					</div>
				</a>
			</div>
			
			<div class="clearfix visible-sm-block"></div>
			
			<div class="col-md-4 col-sm-6 col-xxs-12">
				<a href="images/work_7.jpg" class="fh5co-project-item image-popup to-animate">
					<img src="images/work_7.jpg" alt="Image" class="img-responsive">
					<div class="fh5co-text">
					<h2>Project 3</h2>
					<span>Web</span>
					</div>
				</a>
			</div>
			<div class="col-md-4 col-sm-6 col-xxs-12">
				<a href="images/work_8.jpg" class="fh5co-project-item image-popup to-animate">
					<img src="images/work_8.jpg" alt="Image" class="img-responsive">
					<div class="fh5co-text">
					<h2>Project 4</h2>
					<span>Sketch</span>
					</div>
				</a>
			</div>
			
			<div class="clearfix visible-sm-block"></div>
			
			<div class="col-md-4 col-sm-6 col-xxs-12">
				<a href="images/work_1.jpg" class="fh5co-project-item image-popup to-animate">
					<img src="images/work_1.jpg" alt="Image" class="img-responsive">
					<div class="fh5co-text">
					<h2>Project 2</h2>
					<span>Illustration</span>
					</div>
				</a>
			</div>
						</div> -->
			<!-- <div class="row">
				<div class="col-md-12 text-center to-animate">
					<p>* Demo images from <a href="http://plmd.me/" target="_blank">plmd.me</a></p>
				</div>
			</div> -->
		</div>
	</section>

	<section id="fh5co-testimonials" data-section="testimonials">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">口碑</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>每位用户的好评，都是我们前进的动力！</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;与智侒信合作的过程中，就像交朋友一样，给人亲切友好，也能很好把我们的需求转变我们想要的产品，期待下次合作！&rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src="images/person1.jpg" alt="Person"></figure>
							<p>
							张三, CEO <a href="http://jq22.com/" target="_blank">国元投资</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;最初，我们在把我们的需求和他们沟通的时候，我们还没想好自己的产品，只是有初步的需求方案，可能再一些细节上还是没有相通。在我们多次的充分沟通的基础上，他们做出来的产品加入他们的理解，正好契合我们的想法，真的很棒！&rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src="images/person2.jpg" alt="Person"></figure>
							<p>
							李四, 理财规划师 <a href="http://jq22.com/" target="_blank">国元网金</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="box-testimony">
						<blockquote class="to-animate-2">
							<p>&ldquo;我们提出需求到完成上线，他们总是非常的配合，没有耽误我们的每次产品上线和升级，很不错的一只团队！ &rdquo;</p>
						</blockquote>
						<div class="author to-animate">
							<figure><img src="images/person3.jpg" alt="Person"></figure>
							<p>
							王五, 记者 <a href="http://jq22.com/" target="_blank">中国经济信息社</a> <span class="subtext">Creative Director</span>
							</p>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</section>


	<section id="fh5co-services" data-section="services">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-left">
					<h2 class=" left-border to-animate">服务</h2>
					<div class="row">
						<div class="col-md-8 subtext to-animate">
							<h3>在智侒信，满足您一切的需求.</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-anchor"></i>
					<h3>软硬件服务</h3>
					<p>实时、动态、完整地揭示账户资金、权益、委托、 持仓等全部信息 交易过程中无需来回查询,收益风险一览无余</p>
				</div>
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-layers2"></i>
					<h3>网站开发服务</h3>
					<p>首创“自动开平”功能和多区域下单 为不同用户提供全鼠标或全键盘的简洁、快速操作支持</p>
				</div>

				<div class="clearfix visible-sm-block"></div>

				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-video2"></i>
					<h3>手机软件服务</h3>
					<p>支持多种下单模式组合，键盘一键下单、鼠标一键下单、一键平仓、一键撤单改单、一键反手等功能受到广大交易者喜爱</p>
				</div>
				<div class="col-md-6 col-sm-6 fh5co-service to-animate">
					<i class="icon to-animate-2 icon-monitor"></i>
					<h3>系统后台服务</h3>
					<p>预设的多种风格和灵活的自定义界面及操作设置 可最大程度满足现有用户的界面风格和操作习惯</p>
				</div>
				
			</div>
		</div>
	</section>
	
	<section id="fh5co-about" data-section="about">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">关于我们</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>我们是一支年轻有朝气的团队！</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4">
					<div class="fh5co-person text-center to-animate">
						<figure><img src="images/person1.jpg" alt="Image"></figure>
						<h3>张三</h3>
						<span class="fh5co-position">UI设计师</span>
						<p>抓住生活的细节，用心观察生活，利用大自然的设计语言，结合用户的需求</p>
						<ul class="social social-circle">
							<li><a href="#"><i class="fa fa-weixin"></i></a></li>
							<li><a href="#"><i class="fa fa-weibo"></i></a></li>
							<li><a href="#"><i class="fa fa-qq"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="fh5co-person text-center to-animate">
						<figure><img src="images/person2.jpg" alt="Image"></figure>
						<h3>李四</h3>
						<span class="fh5co-position">前端工程师</span>
						<p>增加交互动态功能，开发JavaScript以及Flash模块，同时结合后台开发技术模拟整体效果，进行丰富互联网的Web开发，致力于通过技术改善用户体验。</p>
						<ul class="social social-circle">
							<li><a href="#"><i class="fa fa-weixin"></i></a></li>
							<li><a href="#"><i class="fa fa-weibo"></i></a></li>
							<li><a href="#"><i class="fa fa-qq"></i></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4">
					<div class="fh5co-person text-center to-animate">
						<figure><img src="images/person3.jpg" alt="Image"></figure>
						<h3>王五</h3>
						<span class="fh5co-position">后端工程师</span>
						<p>我们不是在敲代码，我们都是在搬砖！</p>
						<ul class="social social-circle">
							<li><a href="#"><i class="fa fa-weixin"></i></a></li>
							<li><a href="#"><i class="fa fa-weibo"></i></a></li>
							<li><a href="#"><i class="fa fa-qq"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section id="fh5co-counters" style="background-image: url(images/full_image_1.jpg);" data-stellar-background-ratio="0.5">
		<div class="fh5co-overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center to-animate">
					<h2>趣味实情</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-briefcase to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="89" data-speed="5000" data-refresh-interval="50">89</span>
						<span class="fh5co-counter-label">合作项目</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-code to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="2343409" data-speed="5000" data-refresh-interval="50">2343409</span>
						<span class="fh5co-counter-label">代码行数</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-cup to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="1302" data-speed="5000" data-refresh-interval="50">1302</span>
						<span class="fh5co-counter-label">提供咖啡</span>
					</div>
				</div>
				<div class="col-md-3 col-sm-6 col-xs-12">
					<div class="fh5co-counter to-animate">
						<i class="fh5co-counter-icon icon-people to-animate-2"></i>
						<span class="fh5co-counter-number js-counter" data-from="0" data-to="52" data-speed="5000" data-refresh-interval="50">52</span>
						<span class="fh5co-counter-label">合作客户</span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section id="fh5co-contact" data-section="contact">
		<div class="container">
			<div class="row">
				<div class="col-md-12 section-heading text-center">
					<h2 class="to-animate">联系我们</h2>
					<div class="row">
						<div class="col-md-8 col-md-offset-2 subtext to-animate">
							<h3>欢迎您的致电和邮箱联系，我们7*24为您服务！</h3>
						</div>
					</div>
				</div>
			</div>
			<div class="row row-bottom-padded-md">
				<div class="col-md-6 to-animate">
					<h3>联系方式</h3>
					<ul class="fh5co-contact-info">
						<li class="fh5co-contact-address ">
							<i class="fa fa-home"></i>
							安徽省合肥市高新区, <br>创新产业产业园E栋308
						</li>
						<li><i class="fa fa-phone"></i> (0550) 2648709</li>
						<li><i class="fa fa-envelope"></i>zhianxin@163.com</li>
						
					</ul>
				</div>

				<div class="col-md-6 to-animate">
					<h3>联系内容</h3>
					<div class="form-group ">
						<label for="name" class="sr-only">姓名</label>
						<input id="name" class="form-control" placeholder="姓名" type="text">
					</div>
					<div class="form-group ">
						<label for="email" class="sr-only">邮件</label>
						<input id="email" class="form-control" placeholder="邮件" type="email">
					</div>
					<div class="form-group ">
						<label for="phone" class="sr-only">电话</label>
						<input id="phone" class="form-control" placeholder="电话" type="text">
					</div>
					<div class="form-group ">
						<label for="message" class="sr-only">内容</label>
						<textarea name="" id="message" cols="30" rows="5" class="form-control" placeholder="内容"></textarea>
					</div>
					<div class="form-group ">
						<input class="btn btn-primary btn-lg" value="提 交" type="submit">
					</div>
					</div>
				</div>

			</div>
		</div>
		<div id="map" class="to-animate"></div>
	</section>
	
	
	<footer id="footer" role="contentinfo">
		<a href="#" class="gotop js-gotop"><i class="fa fa-long-arrow-up"></i></a>
		<div class="container">
			<div class="">
				<div class="col-md-12 text-center">
					<p>&copy; 安徽智侒信信息技术有限公司. All Rights Reserved. <br>Created by chenenz technology support 2017</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">
					<ul class="social social-circle">
						<li><a href="#"><i class="fa fa-weixin"></i></a></li>
						<li><a href="#"><i class="fa fa-weibo"></i></a></li>
						<li><a href="#"><i class="fa fa-qq"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>
	
	
	<!-- For demo purposes Only ( You may delete this anytime :-) -->
	<div id="colour-variations">
		<a class="option-toggle"><i class="fa fa-gear" aria-hidden="true"></i></a>
		<h3>预置颜色</h3>
		<ul>
			<li>
				<a href="javascript: void(0);" data-theme="style">
					<span style="background: #3f95ea;"></span>
					<span style="background: #52d3aa;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			<li>
				<a href="javascript: void(0);" data-theme="style2">
					<span style="background: #329998;"></span>
					<span style="background: #6cc99c;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			<li>
				<a href="javascript: void(0);" data-theme="style3">
					<span style="background: #9f466e;"></span>
					<span style="background: #c24d67;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			<li>
				<a href="javascript: void(0);" data-theme="style4">
					<span style="background: #21825C;"></span>
					<span style="background: #A4D792;"></span>
					<span style="background: #f2f2f2;"></span>
				</a>
			</li>
			
		</ul>
	</div>
	<!-- End demo purposes only -->

	
	<!-- jQuery -->
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<!-- jQuery Easing -->
	<script src="/static/plugins/front/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="http://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
	<!-- Waypoints -->
	<script src="/static/plugins/front/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script src="/static/plugins/front/js/jquery.stellar.min.js"></script>
	<!-- Counter -->
	<script src="/static/plugins/front/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script src="/static/plugins/front/js/jquery.magnific-popup.min.js"></script>
	<script src="/static/plugins/front/js/magnific-popup-options.js"></script>
	<!-- Google Map -->


	<!-- For demo purposes only styleswitcher ( You may delete this anytime ) -->
	<script src="/static/plugins/front/js/jquery.style.switcher.js"></script>
	<script>
		$(function(){
			$('#colour-variations ul').styleSwitcher({
				defaultThemeId: 'theme-switch',
				hasPreview: false,
				cookie: {
		          	expires: 30,
		          	isManagingLoad: true
		      	}
			});	
			$('.option-toggle').click(function() {
				$('#colour-variations').toggleClass('sleep');
			});
		});
	</script>
	<!-- End demo purposes only -->

	<!-- Main JS (Do not remove) -->
	<script src="/static/plugins/front/js/main.js"></script>

	</body>
</html>

