
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">评论管理</div>
                <!--这里写页面的代码-->
                <div class="layui-card-body">
                    <div class="layui-card-header">
                     <@shiro.hasPermission name="/comment/add">
                                 <button class="layui-btn layui-btn layui-btn-xs"
                                         lay-event="add" onclick="add('','${worksId!}','${worksType!}')">
                                     <i class="layui-icon"></i>
                                     新增
                                 </button>
                     </@shiro.hasPermission>
                        <a href="javascript:;" class="layui-btn layui-btn-xs layui-btn-primary" id="rhqvf8w5t6q8">
                            <i class="layui-icon"></i>
                        </a>
                    </div>
                    <#--<table class="layui-table" id="commenttable" lay-filter="commenttable2"></table>-->
                    <#if rootMap?? && (rootMap?size>0)>
                            <table class="layui-table">
                                <colgroup>
                                    <col width="7%">
                                    <col width="19%">
                                    <col width="33%">
                                    <col width="10%">
                                    <col width="15%">
                                    <col width="16%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th >
                                            序号
                                        </th>
                                        <th>
                                            用户名
                                        </th>
                                        <th >
                                            评论
                                        </th>
                                        <th >
                                            用户类型
                                        </th>
                                        <th >
                                            日期
                                        </th>

                                        <th>
                                            操作
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                        <#assign i = 0>
                                        <#list rootMap?keys as key>
                                            <#assign i = i + 1>
                                    <tr>
                                        <td>
                                                ${i}
                                        </td>
                                        <td>
                                                ${rootMap[key].userName!}
                                        </td>
                                        <td>
                                                ${rootMap[key].message!}
                                        </td>
                                        <td>
                                                <#if (rootMap[key].userType)??>
                                                    <#if (rootMap[key].userType == 0)>
                                                        学员
                                                    <#elseif (rootMap[key].userType == 1)>
                                                        教师
                                                    <#elseif (rootMap[key].userType == 2)>
                                                        管理员
                                                    </#if>
                                                </#if>
                                        </td>
                                        <td>
                                                ${(rootMap[key].commentTime?string("yyyy-MM-hh HH:mm:ss"))!}
                                        </td>

                                        <td >
                                             <@shiro.hasPermission name="/comment/add">
                                                 <button class="layui-btn layui-btn layui-btn-sm"
                                                         lay-event="add" onclick="add('${rootMap[key].id}',
                                                         '${worksId}','${worksType}')">
                                                     <i class="layui-icon">&#xe642;</i>回复
                                                 </button>
                                             </@shiro.hasPermission>
                                            <@shiro.hasPermission name="/comment/del">
                                                <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del"
                                                        onclick="del('${rootMap[key].id}')">
                                                    <i class="layui-icon">&#xe642;</i>删除
                                                </button>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>

                                        <#if (childMap[key])?? && ((childMap[key])?size>0)>
                                            <#list childMap[key] as commentchild >
                                                <#assign i = i + 1>
                                                <tr >
                                                    <td >
                                                            ${i}
                                                    </td>
                                                    <td >
                                                            <font color="#e1e1e1">&nbsp;|--&nbsp;&nbsp;|--&nbsp;
                                                                &nbsp;</font>
                                                            ${commentchild.userName!}
                                                    </td>
                                                    <td >

                                                            ${commentchild.message!}
                                                    </td>
                                                    <td >
                                                                <#if (commentchild.userType)??>
                                                                    <#if (commentchild.userType == 0)>
                                                                        学员
                                                                    <#elseif (commentchild.userType == 1)>
                                                                        教师
                                                                    <#elseif (commentchild.userType == 2)>
                                                                        管理员
                                                                    </#if>
                                                                </#if>
                                                    </td>
                                                    <td>
                                                            ${(commentchild.commentTime?string("yyyy-MM-hh HH:mm:ss"))!}
                                                    </td>

                                                    <td>
                                                                   <@shiro.hasPermission name="/comment/add">
                                                 <button class="layui-btn layui-btn layui-btn-sm"
                                                         lay-event="add" onclick="add('${commentchild.id}','${worksId}','${worksType}')">
                                                     <i class="layui-icon">&#xe642;</i>回复
                                                 </button>
                                                                   </@shiro.hasPermission>
                                            <@shiro.hasPermission name="/comment/del">
                                                <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del"
                                                        onclick="del('${commentchild.id}')">
                                                    <i class="layui-icon">&#xe642;</i>删除
                                                </button>
                                            </@shiro.hasPermission>
                                                    </td>
                                                </tr>
                                            </#list>
                                        </#if>

                                        </#list>
                                 </td>
                              </tr>
                           </tbody>
                        </table>

                    <#else>

                    </#if>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="indexTpl">
        {{d.LAY_TABLE_INDEX+1}}
    </script>

    <script type="text/html" id="barDemo">
        <@shiro.hasPermission name="/comment/update">
       <button class="layui-btn layui-btn-xs" lay-event="edit">评论</button>
        </@shiro.hasPermission>
       <@shiro.hasPermission name="/comment/del">
       <button class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</button>
       </@shiro.hasPermission>
    </script>
    <script type="text/html" id="uType1">
        {{# if(d.userType == 0){ }}
        <span>学员</span>
        {{# }else if(d.userType == 1){ }}
        <span>教师</span>
        {{# }else if(d.userType == 2){ }}
        <span>管理员</span>
        {{# }  }}
    </script>
   <script>
        var del = function (id) {
            layer.confirm('真的要删除么？', function(index){
                // 写删除方法
                $.post("${basePath}/comment/del", {"id": id}, function (data) {
                    if (data.status == 200) {
                        layer.msg(data.message, {icon: 1, time: 1000});
                        // 前端修改
                        layer.close(index);
                        window.location.reload();
                    } else {
                        layer.msg(data.message, {icon: 0, time: 1000});
                        layer.close(index);
                    }
                });
            });
        }

        var add = function (id,worksId,worksType) {
            var index = layer.open({
                type: 2,
                content: '${basePath}/comment/goAdd?id='+id+"&worksId="+worksId+"&worksType="+worksType,
                area: ['800px', '500px'],
                maxmin: true,
                end: function () {
                    window.location.reload();
                }
            });
            parent.layer.iframeAuto(index);
        }
   </script>