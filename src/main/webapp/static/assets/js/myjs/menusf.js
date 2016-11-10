$(function() {
	if(typeof($.cookie('menusf')) == "undefined"){ // 读取 cookie
		$("#sidebar").attr("class","sidebar responsive ace-save-state ");
	}else{
		$("#sidebar").attr("class","sidebar responsive ace-save-state menu-min");
	}
});

//保存缩放菜单状态
function menusf(){
	if(document.getElementsByName('menusf')[0].checked){
		$.cookie('menusf', 'ok');// 存储 cookie
		$("#sidebar").attr("class","sidebar responsive ace-save-state menu-min");
		$("#sidebar-toggle-icon").attr("class","ace-save-state ace-icon fa fa-angle-double-left");
	}else{
		$.cookie('menusf', '', {expires: -1});// 删除cookie;expires设置cookie的时长,其中-1代表删除
		$("#sidebar").attr("class","sidebar responsive ace-save-state");
		$("#sidebar-toggle-icon").attr("class","ace-save-state ace-icon fa fa-angle-double-right");
	}
}
