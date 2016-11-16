//处理iframe高度问题
	function cmainFrame(){
		var hmain = $("#main-tab .tab-content");
		var bheight = document.documentElement.clientHeight;
		hmain .style.width = '100%';
		hmain .style.height = (bheight  - 51) + 'px';
		var bkbgjz = document.getElementById("bkbgjz");
		bkbgjz .style.height = (bheight  - 41) + 'px';
	}
	cmainFrame();
	window.onresize=function(){
		cmainFrame();
	};
