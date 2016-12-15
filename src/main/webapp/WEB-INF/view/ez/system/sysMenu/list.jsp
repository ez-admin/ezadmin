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
	<%@ include file="/WEB-INF/view/ez/index/top.jsp"%>
</head>

<div class="main-container">
	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
				<!-- PAGE CONTENT BEGINS -->
				<!-- div.dataTables_borderWrap -->
				<table id="dynamic-table" class="table table-striped table-bordered table-hover">
					<thead>
					<tr>
						<%--<th class="center">
							<label class="pos-rel">
								<input type="checkbox" class="ace" />
								<span class="lbl"></span>
							</label>
						</th>--%>
						<th class="sorting_disabled center"></th>
						<th class="center">菜单ID</th>
						<th class="center">菜单名称</th>
						<th class="center">菜单地址</th>
						<th class="hidden-480 center">父级菜单ID</th>
						<th class="center">
							<i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>
							菜单排序
						</th>
						<th class="hidden-480 center">菜单图标</th>
						<th class="hidden-480 center">菜单类型</th>
						<th class="sorting_disabled center">操作</th>
					</tr>
					</thead>

					<tbody>
					<tr>
						<th></th>
						<th>menuId</th>
						<th>menuName</th>
						<th>menuUrl</th>
						<th>parentId</th>
						<th>menuOrder</th>
						<th>menuIcon</th>
						<th>menuType</th>
						<th></th>
					</tr>
					</tbody>
				</table>
			<!-- PAGE CONTENT ENDS -->
			</div><!-- /.col -->
		</div><!-- /.row -->
	</div>
	<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
		<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
	</a>
</div>

<!-- page specific plugin scripts -->
<!--[if lte IE 8]>
<script src="/static/components/ExplorerCanvas/excanvas.js"></script>
<![endif]-->

<script src="/static/assets/js/src/ace.js"></script>
<script src="/static/assets/js/src/ace.scrolltop.js"></script>
<script src="/static/assets/js/src/elements.scroller.js"></script>
<script src="/static/components/bootstrap/dist/js/bootstrap.js"></script>
<!-- page specific plugin scripts -->
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="/plugins/datatables/button/dataTables.buttons.min.js"></script>
<script src="/plugins/datatables/button/buttons.flash.min.js"></script>
<script src="/plugins/datatables/button/jszip.min.js"></script>
<script src="/plugins/datatables/button/pdfmake.min.js"></script>
<script src="/plugins/datatables/button/vfs_fonts.js"></script>
<script src="/plugins/datatables/button/buttons.html5.min.js"></script>
<script src="/plugins/datatables/button/buttons.print.min.js"></script>
<script src="/plugins/datatables/button/buttons.colVis.min.js"></script>


<!-- inline scripts related to this page -->
<script type="text/javascript">
	jQuery(function($) {
		//initiate dataTables plugin
		var myTable = $('#dynamic-table').DataTable( {
			dom: '<"top"<"tableTools-container"B>f>rt<"bottom"lip><"clear">',
			buttons: [
				{
					extend: "colvis",
					text: "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>显示/隐藏列</span>",
					className: "btn btn-white btn-primary btn-bold",
					columns: ':not(:first):not(:last)'
				},
				{
					extend: "copy",
					text: "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>复制到剪贴板</span>",
					className: "btn btn-white btn-primary btn-bold",
                    exportOptions: {
                        columns: ':not(:first):not(:last)'
                    }
				},
				{
					extend: "csv",
					text: "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>导出CSV格式</span>",
					className: "btn btn-white btn-primary btn-bold",
                    title:"系统菜单",
                    exportOptions: {
                        columns: ':not(:first):not(:last)'
                    }
				},
				{
					extend: "excel",
					text: "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>导出Excel格式</span>",
					className: "btn btn-white btn-primary btn-bold",
                    title:"系统菜单",
                    exportOptions: {
                        columns: ':not(:first):not(:last)'
                    }
				},
				{
					extend: "pdf",
					text: "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>导出PDF格式</span>",
					className: "btn btn-white btn-primary btn-bold",
                    title:"系统菜单",
                    exportOptions: {
                        columns: ':not(:first):not(:last)'
                    }
				},
				{
					extend: "print",
					text: "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>打印预览</span>",
					className: "btn btn-white btn-primary btn-bold",
                    title:"系统菜单",
					autoPrint: false,
					message: '本次打印采用DataTables制作',
					exportOptions: {
                        modifier: {
                            // DataTables core
                            page:   'current'      // 'all',     'current'
                        },
                        columns: ':not(:first):not(:last)'
					}
				},
                {
                    extend: "",
                    text: "<i class='fa fa-refresh  bigger-110 purple'></i> <span class='hidden'>刷新</span>",
                    className: "btn btn-white btn-primary btn-bold",
                    action: function () {
                        location.reload();
                    }

                },
				{
					extend: "",
					text: "<i class='fa fa-plus-circle  bigger-110 purple'></i> <span class='hidden'>新增</span>",
					className: "btn btn-white btn-primary btn-bold",
					action: function () {
						//alert($("#main-tab",parent.document).height());
						addmenu();
					}

				},
			],
			ScrollX: "100%",
            /*ScrollY: 387,
			ScrollXInner: "120%",
			ScrollCollapse: true,*/
			DisplayLength: 50,
			processing: true,
			serverSide: true,
			ajax: {
				url: '/ez/system/sysmenu/showlist.do',
				type: 'POST'
			},
			ordering: true,
			columns: [
				{ data: null , class:'center'},
				{ data: 'menuId',name:'MENU_ID',class:'center'},
				{ data: 'menuName' ,name:'MENU_NAME',class:'center'},
				{ data: 'menuUrl',name:'MENU_URL'},
				{ data: 'parentId' ,name:'PARENT_ID',class:'center'},
				{ data: 'menuOrder',name:'MENU_ORDER',class:'center'},
				{ data: 'menuIcon',name:'MENU_ICON',class:'center'},
				{ data: 'menuType',name:'MENU_TYPE',class:'center'},
				{ data: null ,class:'center'}
			],
            //序号
            fnDrawCallback: function(){
                var api = this.api();
                var startIndex= api.context[0]._iDisplayStart;//获取到本页开始的条数
                api.column(0).nodes().each(function(cell, i) {
                    cell.innerHTML = startIndex + i + 1;
                });
            },
            /*lengthMenu: [[10, 20, 50, -1], [10, 20, 50, "所有"]],*/
			/*select: {
				style: 'multi'
			},*/
			columnDefs: [
                {
                    //设置第一行不显示
                    // "visible": false,
                    //"targets": 0
                },
                {targets:6,
                    render:function (data,type,row,meta) {
                        return '<i class="ace-icon fa '+ row.menuIcon+' "></i>'
                    }
                },
                {
                    //指定是第9列
                    targets: 8,
                    //data: "menuId",
                    render: function(data, type, row, meta) {
                        //渲染 把数据源中的标题和url组成超链接
                        //return '<a href="' + data + '" target="_blank">' + row.title + '</a>';
                        return '<div class="hidden-sm hidden-xs action-buttons"> ' +
                                    '<a class="blue"  href="javascript:void(0)"  onclick="viewmenu('+row.menuId+');return false;"  >' +
                                        '<i class="ace-icon fa fa-search-plus bigger-130"></i> ' +
                                        '查看'+
                                    '</a>' +
                                    '<a class="green" href="javascript:void(0)" onclick="editmenu('+row.menuId+');return false;">' +
                                        '<i class="ace-icon fa fa-pencil bigger-130"></i> ' +
                                        '修改'+
                                    '</a>' +
                                        '<a class="red" href="javascript:void(0)" onclick="deleteone('+row.menuId+');return false;">' +
                                    '<i class="ace-icon fa fa-trash-o bigger-130"></i>' +
                                        '删除'+
                                    '</a>' +
                                '</div>' +
                                '<div class="hidden-md hidden-lg"> ' +
                                    '<div class="inline pos-rel"> ' +
                                        '<button class="btn btn-minier btn-yellow dropdown-toggle" data-toggle="dropdown" data-position="auto"> ' +
                                            '<i class="ace-icon fa fa-caret-down icon-only bigger-120"></i>' +
                                        '</button>' +
                                        '<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close"> ' +
                                            '<li>' +
                                                '<a href="javascript:void(0)" onclick="viewmenu('+row.menuId+');return false;"  class="tooltip-info pointer" data-rel="tooltip" title="查看"> ' +
                                                    '<span class="blue"> ' +
                                                        '<i class="ace-icon fa fa-search-plus bigger-120"></i> ' +
                                                        '查看'+
                                                    '</span>' +
                                                '</a>' +
                                            '</li>' +
                                            '<li>' +
                                                '<a href="javascript:void(0)" onclick="editmenu('+row.menuId+');return false;" class="tooltip-success pointer" data-rel="tooltip" title="修改">' +
                                                    '<span class="green">' +
                                                        '<i class="ace-icon fa fa-pencil-square-o bigger-120"></i> ' +
                                                        '修改'+
                                                    '</span>' +
                                                '</a>' +
                                            '</li>' +
                                            '<li>' +
                                                '<a href="javascript:void(0)" onclick="deleteone('+row.menuId+');return false;" class="tooltip-error pointer" data-rel="tooltip" title="删除"> ' +
                                                    '<span class="red">' +
                                                        '<i class="ace-icon fa fa-trash-o bigger-120"></i>' +
                                                        '删除'+
                                                    '</span>' +
                                                '</a>' +
                                            '</li>' +
                                        '</ul>' +
                                    '</div>' +
                                '</div>';
                    }
			    }
            ],
			/*"bProcessing": true,
			 "bServerSide": true,
			 "sAjaxSource": "http://127.0.0.1/table.php"	,
			"sScrollY": "200px",
			"bPaginate": false,
			"sScrollX": "100%",
			"sScrollXInner": "120%",
			"bScrollCollapse": true,
			"iDisplayLength": 50*/


			//国际化配置
			language: {
				"sProcessing": "处理中...",
				"sLengthMenu": "每页显示 _MENU_ 项结果，",
				"sZeroRecords": "对不起，没有查询相关数据！",
				"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix": "",
				"sSearch": "在表格中搜索:",
				"sUrl": "",
				"sEmptyTable": "表中数据为空",
				"sLoadingRecords": "载入中...",
				"sInfoThousands": ",",
				"oPaginate": {
					"sFirst": "首页",
					"sPrevious": "上页",
					"sNext": "下页",
					"sLast": "末页"
				},
				"oAria": {
					"sSortAscending": ": 以升序排列此列",
					"sSortDescending": ": 以降序排列此列"
				}
			}
		} );

		/*$.fn.dataTable.Buttons.swfPath = "static/components/datatables.net-buttons-swf/copy_csv_xls_pdf.swf"; //in Ace demo static/components will be replaced by correct assets path
		$.fn.dataTable.Buttons.defaults.dom.container.className = 'dt-buttons btn-overlap btn-group btn-overlap';

		new $.fn.dataTable.Buttons( myTable, {
			buttons: [
				{
					"extend": "colvis",
					"text": "<i class='fa fa-search bigger-110 blue'></i> <span class='hidden'>显示/隐藏列</span>",
					"className": "btn btn-white btn-primary btn-bold",
					columns: ':not(:first):not(:last)'
				},
				{
					"extend": "copy",
					"text": "<i class='fa fa-copy bigger-110 pink'></i> <span class='hidden'>复制当前页到剪贴板</span>",
					"className": "btn btn-white btn-primary btn-bold"
				},
				{
					"extend": "csv",
					"text": "<i class='fa fa-database bigger-110 orange'></i> <span class='hidden'>导出CSV格式</span>",
					"className": "btn btn-white btn-primary btn-bold"
				},
				{
					"extend": "excel",
					"text": "<i class='fa fa-file-excel-o bigger-110 green'></i> <span class='hidden'>导出Excel格式</span>",
					"className": "btn btn-white btn-primary btn-bold"
				},
				{
					"extend": "pdf",
					"text": "<i class='fa fa-file-pdf-o bigger-110 red'></i> <span class='hidden'>导出PDF格式</span>",
					"className": "btn btn-white btn-primary btn-bold"
				},
				{
					"extend": "print",
					"text": "<i class='fa fa-print bigger-110 grey'></i> <span class='hidden'>打印</span>",
					"className": "btn btn-white btn-primary btn-bold",
					autoPrint: false,
					message: '本次打印采用DataTables制作',
					exportOptions: {
						modifier: {
							order:  'applied',
							page: 'all'
						}
					}
				},
				{
					"extend": "",
					"text": "<i class='fa fa-plus-circle  bigger-110 purple'></i> <span class='hidden'>新增</span>",
					"className": "btn btn-white btn-primary btn-bold",
					"action": function ( e, dt, node, config ) {
						//alert($("#main-tab",parent.document).height());
						addmenu();
					}

				},
			]
		} );
		myTable.buttons().container().appendTo( $('.tableTools-container') );*/

		//style the message box
		var defaultCopyAction = myTable.button(1).action();
		myTable.button(1).action(function (e, dt, button, config) {
			defaultCopyAction(e, dt, button, config);
			$('.dt-button-info').addClass('gritter-item-wrapper gritter-info gritter-center white');
		});

		var defaultColvisAction = myTable.button(0).action();
		myTable.button(0).action(function (e, dt, button, config) {
			defaultColvisAction(e, dt, button, config);
			if($('.dt-button-collection > .dropdown-menu').length == 0) {
				$('.dt-button-collection')
						.wrapInner('<ul class="dropdown-menu dropdown-light dropdown-caret dropdown-caret" />')
						.find('a').attr('href', '#').wrap("<li />")
			}
			$('.dt-button-collection').appendTo('.tableTools-container .dt-buttons')
		});
		//button 按钮提示框
		setTimeout(function() {
			$($('.tableTools-container')).find('a.dt-button').each(function() {
				var div = $(this).find(' > div').first();
				if(div.length == 1) div.tooltip({container: 'body', title: div.parent().text(),placement:'bottom'});
				else $(this).tooltip({container: 'body', title: $(this).text(),placement:'bottom'});
			});
		}, 500)


		/*myTable.on( 'select', function ( e, dt, type, index ) {
			if ( type === 'row' ) {
				$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', true);
			}
		} );
		myTable.on( 'deselect', function ( e, dt, type, index ) {
			if ( type === 'row' ) {
				$( myTable.row( index ).node() ).find('input:checkbox').prop('checked', false);
			}
		} );

		$(document).on('click', '#dynamic-table .dropdown-toggle', function(e) {
			e.stopImmediatePropagation();
			e.stopPropagation();
			e.preventDefault();
		});

		/!********************************!/
		//add tooltip for small view action buttons in dropdown menu
		$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

		//tooltip placement on right or left
		function tooltip_placement(context, source) {
			var $source = $(source);
			var $parent = $source.closest('table')
			var off1 = $parent.offset();
			var w1 = $parent.width();

			var off2 = $source.offset();
			//var w2 = $source.width();

			if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
			return 'left';
		}*/


	});

	//新增
	function addmenu(){
		top.layer.open({
			type: 2,//iframe层
			title: '新增菜单',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['800px' , '520px'],
			//btn: ['保存', '取消'],
			content: '/ez/system/sysmenu/addUI.do',
            end:function(){
                location.reload();
            }
		});
	}

	function closeWin() {
		location.reload();
		top.layer.closeAll();
	}
	//查看
	function viewmenu(menuId){
		top.layer.open({
			type: 2,//iframe层
			title: '查看菜单',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['800px' , '520px'],
			//btn: ['保存', '取消'],
			content: '/ez/system/sysmenu/getById.do?typeKey=2&sysmenuId='+menuId
		});
	}
	//修改
	function editmenu(menuId) {
		top.layer.open({
			type: 2,//iframe层
			title: '查看菜单',
			maxmin: true,
			shadeClose: true, //点击遮罩关闭层
			area : ['800px' , '520px'],
			//btn: ['保存', '取消'],
			content: '/ez/system/sysmenu/getById.do?typeKey=1&sysmenuId='+menuId,
            end:function(){
                location.reload();
            }
		});

	}
	//删除
	function deleteone(menuId) {
		top.layer.confirm("确定要删除该记录吗？",{icon: 7},function(index){
			//删除记录
			$.post("/ez/system/sysmenu/deleteById.do",
					{"ids":menuId},
					function(result){
                        //删除后的提示
                        if(result.status =="1"){
                            top.layer.msg('删除成功',{icon: 1});
                        }else{
                            top.layer.msg('删除失败',{icon: 2});
                        }
					},"json");
			//关闭
			top.layer.close(index);
			//刷新表格
			location.reload()
		});
	}

</script>

</body>
</html>
