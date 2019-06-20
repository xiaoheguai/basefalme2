<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">作品管理</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                        <!-- <span>所有会员列表</span> -->
                         <@shiro.hasPermission name="/works/add">
                        <a id="add" class="layui-btn layui-btn-xs">
                            <i class="layui-icon"></i>
                            <span>新增</span>
                        </a>
                         </@shiro.hasPermission>
                        <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">
                            <i class="layui-icon"></i>
                        </a>
                    </div>
                    <table class="layui-table" id="workstable" lay-filter="workstable2"></table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="indexTpl">
        {{d.LAY_TABLE_INDEX+1}}
    </script>
    <script type="text/html" id="wantshangjia">
        <input type="checkbox" value="{{ d.id }}" {{# if(d.wanToGoods == 1){ }} checked="" {{# } }} name="iswanToGoods"
               lay-skin="switch" lay-filter="ahType" lay-text="开|关" openType = "wanToGoods">
    </script>

    <script type="text/html" id="isshangjia">
        <input type="checkbox" value="{{ d.id }}" {{# if(d.isGoods == 1){ }} checked="" {{# } }} name="isshangjia"
               lay-skin="switch" lay-filter="ahType" lay-text="开|关" openType = "isGoods">
    </script>


    <script type="text/html" id="barDemo">
        <@shiro.hasPermission name="/comment/list">
       <button class="layui-btn layui-btn-xs" lay-event="comment">查看评论</button>
        </@shiro.hasPermission>
        <@shiro.hasPermission name="/works/update">
       <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
       <@shiro.hasPermission name="/works/del">
       <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
       </@shiro.hasPermission>
    </script>
    <script>
        layui.use(['jquery', 'layer','form', 'table'], function () {
            var layer = layui.layer,table = layui.table,form = layui.form;
            //让层自适应iframe
            $('#add').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/works/goAdd',
                    area: ['800px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("workstable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            //表格渲染
            table.render({
                elem: '#workstable'
                ,url:'${basePath}/works/getworksPage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'',align:'center', width:70,  title: '序号', toolbar: '#indexTpl'}
                    ,{field:'worksName',  title: '名称'}
                    ,{field:'worksTypeId',  title: '类型'}
                    ,{field:'worksDescribe',width:150,  title: '描述'}
                    ,{field:'worksUrl',  title: '地址'}
                    ,{field:'wanToGoods',  title: '申请上架',toolbar:'#wantshangjia'}
                    ,{field:'isGoods',  title: '是否上架',toolbar:'#isshangjia'}
                    ,{field:'uploadTime',  title: '上传日期'}
                    ,{field:'hits',  title: '点击量'}
                   // ,{field:'userName',  title: '用户名称'}
                    ,{field:'right',align:'center', width:200, toolbar: '#barDemo', title: '操作'}
                ]]
            });

            // 监听开关事件
            form.on('switch(ahType)', function (data) {
                var a = data.elem.checked;
                var b = 0;
                var id = data.value;
                if (a) {
                    b = 1;
                } else {
                    b = 0;
                }
                var type = $(data.elem).attr("openType");
            // 开关方法
            $.post("${basePath}/works/updateOpen", {id: id, isOpen: b, type:type}, function (data) {
                if (data.status == 200) {
                    layer.msg(data.message, {icon: 1, time: 1000});
                } else {
                    layer.msg(data.message, {icon: 0, time: 1000});
                }
            });
            });
            //监听修改按钮
            table.on('tool(workstable2)', function(obj){
                var data = obj.data;
                if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/works/goUpdate?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("workstable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/works/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("workstable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }else if(obj.event === 'comment'){
                    window.location.href = "#/comment/list?worksId="+data.id+"&worksType=0";
                }
            });
        });
    </script>