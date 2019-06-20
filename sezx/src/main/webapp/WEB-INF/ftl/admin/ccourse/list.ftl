<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">试听课管理</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                        <!-- <span>所有会员列表</span> -->
                         <@shiro.hasPermission name="/ccourse/add">
                        <a id="add" class="layui-btn layui-btn-xs">
                            <i class="layui-icon"></i>
                            <span>新增</span>
                        </a>
                         </@shiro.hasPermission>
                        <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">
                            <i class="layui-icon"></i>
                        </a>
                    </div>
                    <table class="layui-table" id="ccoursetable" lay-filter="ccoursetable2"></table>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="indexTpl">
        {{d.LAY_TABLE_INDEX+1}}
    </script>
    <script type="text/html" id="barDemo">
        <@shiro.hasPermission name="/comment/list">
       <button class="layui-btn layui-btn-xs" lay-event="comment">查看评论</button>
        </@shiro.hasPermission>
         <@shiro.hasPermission name="/test/list">
       <button class="layui-btn layui-btn-xs" lay-event="test">查看试题</button>
         </@shiro.hasPermission>
        <@shiro.hasPermission name="/ccourse/update">
       <button class="layui-btn layui-btn-xs" lay-event="edit">编辑</button>
        </@shiro.hasPermission>
       <@shiro.hasPermission name="/ccourse/del">
       <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
       </@shiro.hasPermission>
    </script>
    <script>
        layui.use(['jquery', 'layer', 'table'], function () {
            var layer = layui.layer,table = layui.table;
            //让层自适应iframe
            $('#add').on('click', function(){
                var index = layer.open({
                    type: 2,
                    content: '${basePath}/ccourse/goAdd',
                    area: ['800px', '500px'],
                    maxmin: true,
                    end: function () {
                        table.reload("ccoursetable",{});
                    }
                });
                parent.layer.iframeAuto(index);
            });
            //表格渲染
            table.render({
                elem: '#ccoursetable'
                ,url:'${basePath}/ccourse/getCcoursePage'
                ,method:'post'
                ,page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip']}
                ,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
                ,cols: [[
                    {field:'',align:'center', width:70,  title: '序号', toolbar: '#indexTpl'}
                    ,{field:'courseName',  title: '课程名'}
                    ,{field:'courseDescribe',  title: '课程描述'}
                    ,{field:'courseUrl',  title: '课程地址'}
                    ,{field:'hits', title: '点击量'}
                    ,{field:'uploadTime',  title: '上传时间'}
                    ,{field:'right',align:'center',  width:250, toolbar: '#barDemo', title: '操作'}
                ]]
            });

            //监听修改按钮
            table.on('tool(ccoursetable2)', function(obj){
                var data = obj.data;
                if(obj.event === 'edit'){
                    // 编辑
                    var index = layer.open({
                        type: 2,
                        content: '${basePath}/ccourse/goUpdate?id='+data.id,
                        area: ['800px', '500px'],
                        maxmin: true,
                        end: function () {
                            table.reload("ccoursetable",{});
                        }
                    });
                    parent.layer.iframeAuto(index);

                } else if(obj.event === 'del'){
                    layer.confirm('真的要删除么？', function(index){
                        // 写删除方法
                        $.post("${basePath}/ccourse/del", {"id": data.id}, function (data) {
                            if (data.status == 200) {
                                layer.msg(data.message, {icon: 1, time: 1000});
                                // 前端修改
                                layer.close(index);
                                table.reload("ccoursetable",{});
                            } else {
                                layer.msg(data.message, {icon: 0, time: 1000});
                                layer.close(index);
                            }
                        });
                    });
                }else if(obj.event === 'comment'){
                    window.location.href = "#/comment/list?worksId="+data.id+"&worksType=2";
                } else if(obj.event === 'test'){
                    window.location.href = "#/test/list?courseId="+data.id+"&courseType=2";
                }
            });
        });
    </script>