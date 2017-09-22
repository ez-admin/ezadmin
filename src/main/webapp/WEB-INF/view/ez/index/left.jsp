<!-- Sidebar Menu -->
<ul class="sidebar-menu" data-widget="tree" id="sidebar-menu">
    <!-- Optionally, you can add icons to the links -->
    <li class="active"><a href="ez/syslogin/tab.do" class="J_menuItem"><i class="fa fa-dashboard"></i> <span>我的工作台</span></a></li>
</ul>
<!-- /.sidebar-menu -->
<!--左侧菜单-->
<script>
    var zNodes=${myMenuList};
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
                html+='';
                if(a[i].menuUrl =="#"){
                    html+='<li class="treeview"><a href="javascript:;"><i class="fa '+ a[i].menuIcon+'"></i><span>'+a[i].menuName+'</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>';
                }else {
                    html+='<li><a href="'+a[i].menuUrl+'" class="J_menuItem"><i class="fa '+ a[i].menuIcon+'"></i><span>'+a[i].menuName+'</span></a>';
                }
                //最后一级菜单不需要ul标签
                if(a[i].menuUrl =="#"){
                    html+='<ul class="treeview-menu">';
                    html+=this.getDom(this.groups[a[i].menuId]);
                    html+='</ul></li>';
                }else{
                    html+=this.getDom(this.groups[a[i].menuId]);
                    html+='</li>';
                }
            };
            return html;
        }
    };
    var html=new treeMenu(zNodes).init(0);
    $("#sidebar-menu").append(html);

</script>