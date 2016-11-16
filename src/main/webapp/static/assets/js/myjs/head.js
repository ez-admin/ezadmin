//菜单状态切换
function siMenu(id,MENU_NAME,MENU_URL,obj){
	var new_active = $(obj).parent();//somehow get a reference to our newly clicked(selected) element's parent "LI"
	//$('.nav-list li.active').removeClass('active open'); or
	$('.nav-list li.active').attr("class","");//remove ".active" class from all (previously) ".active" elements
	new_active.addClass('active').parents('.nav-list li').addClass('active');//add ".active" class to our newly selected item and all its parent "LI" elements
	$("#main-tab").aceaddtab({ title: MENU_NAME, url: MENU_URL });
}



var USER_ID;

var user = "FH";	//用于即时通讯（ 当前登录用户）

$(function(){
	$.ajax({
		type: "POST",
		url: 'head/getUname.do',
		dataType:'json',
		//beforeSend: validateData,
		cache: false,
		success: function(data){
			//登陆者资料
			$("#user_info").html(''+data.sysUser.lognm+'');

			//alert(data.list.length);
			 /*$.each(data.list, function(i, list){
				 //登陆者资料
				 $("#user_info").html('<small>Welcome</small> '+list.NAME+'');
				 user = list.USERNAME;
				 USER_ID = list.USER_ID;//用户ID
				 hf(list.SKIN);//皮肤
				 if(list.USERNAME != 'admin'){
					 $("#adminmenu").hide();	//隐藏菜单设置
					 $("#adminzidian").hide();	//隐藏数据字典
					 $("#systemset").hide();	//隐藏系统设置
					 $("#productCode").hide();	//隐藏代码生成
				 }
				 online();//连接在线管理
			 });*/
		}
	});
});

//在线管理
var websocket;
function online(){
	if (window.WebSocket) {
		websocket = new WebSocket(encodeURI('ws://127.0.0.1:8889'));
		
		websocket.onopen = function() {
			//连接成功
			websocket.send('[join]'+user);
		};
		websocket.onerror = function() {
			//连接失败
		};
		websocket.onclose = function() {
			//连接断开
		};
		//消息接收
		websocket.onmessage = function(message) {
			var message = JSON.parse(message.data);
			if (message.type == 'count') {
				userCount = message.msg;
			}else if(message.type == 'goOut'){
				$("body").html("");
				goOut("此用户在其它终端已经早于您登录,您暂时无法登录");
			}else if(message.type == 'thegoout'){
				$("body").html("");
				goOut("您被系统管理员强制下线");
			}else if(message.type == 'userlist'){
				userlist = message.list;
			}
		};
	}
}

//在线总数
var userCount = 0;
function getUserCount(){
	websocket.send('[count]'+user);
	return userCount;
}
//用户列表
var userlist = "";
function getUserlist(){
	websocket.send('[getUserlist]'+user);
	return userlist;
}
//强制下线
function goOut(msg){
	alert(msg);
	window.location.href=locat+"/logout";
}
//强制某用户下线
function goOutUser(theuser){
	websocket.send('[goOut]'+theuser);
}


//修改个人资料
function editUserH(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="个人资料";
	 diag.URL = locat+'/user/goEditU.do?USER_ID='+USER_ID+'&fx=head';
	 diag.Width = 225;
	 diag.Height = 389;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}

//系统设置
function editSys(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="系统设置";
	 diag.URL = locat+'/head/goSystem.do';
	 diag.Width = 600;
	 diag.Height = 596;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
}


//数据字典
function zidian(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="数据字典";
	 diag.URL = locat+'/dictionaries.do?PARENT_ID=0';
	 diag.Width = 799;
	 diag.Height = 460;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
	 
}

//菜单
function menu(){
	 jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="菜单编辑";
	 diag.URL = locat+'/menu.do';
	 diag.Width = 720;
	 diag.Height = 390;
	 diag.CancelEvent = function(){ //关闭事件
		diag.close();
	 };
	 diag.show();
	 
}
