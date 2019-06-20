
<div class="layui-fluid">
    <div class="layui-row">
        <div class="layui-col-xs12">
            <div class="layui-card">
                <div class="layui-card-header">试题管理</div>
                <!--这里写页面的代码-->

                <div class="layui-card-body">
                    <div class="layui-card-header">
                 <@shiro.hasPermission name="/test/add">
                                 <button class="layui-btn layui-btn layui-btn-xs"
                                         lay-event="add" onclick="add('','${worksId!}','${worksType!}')">
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
                                    <col width="8%">
                                    <col width="10%">
                                    <col width="66%">
                                    <col width="16%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th >
                                            序号
                                        </th>
                                        <th>
                                            题号
                                        </th>
                                        <th >
                                            问题
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
                                                ${rootMap[key].questionNo!}
                                        </td>
                                        <td>
                                                ${rootMap[key].question!}
                                        </td>


                                        <td >
                                             <@shiro.hasPermission name="/test/add">
                                                 <button class="layui-btn layui-btn layui-btn-sm"
                                                         lay-event="add" onclick="update('${rootMap[key].id}')">
                                                     <i class="layui-icon">&#xe642;</i>修改
                                                 </button>
                                             </@shiro.hasPermission>
                                            <@shiro.hasPermission name="/test/del">
                                                <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="del"
                                                        onclick="del('${rootMap[key].id}')">
                                                    <i class="layui-icon">&#xe642;</i>删除
                                                </button>
                                            </@shiro.hasPermission>
                                        </td>
                                    </tr>

                                        <#if (childMap[key])?? && ((childMap[key])?size>0)>
                                            <tr>
                                            <td colspan="4">
                                            <#list childMap[key] as testchild >

                                                    <#if (testchild.answerNo)??>
                                                        <#if (testchild.answerNo==1)>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;A.
                                                        <#elseif (testchild.answerNo==2)>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;B.
                                                        <#elseif (testchild.answerNo==3)>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;C.
                                                        <#elseif (testchild.answerNo==4)>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;D.
                                                        </#if>
                                                    </#if>
                                             <span <#if (testchild.isTrue==1)>style="color: green" </#if>>
                                                 ${testchild.answer}
                                             </span>
                                            </#list>
                                            </td>
                                            </tr>

                                        </#if>

                                        </#list>
                                 </td>
                              </tr>
                           </tbody>
                        </table>

                    </#if>
                </div>
            </div>
        </div>
    </div>
    <script type="text/html" id="indexTpl">
        {{d.LAY_TABLE_INDEX+1}}
    </script>

    <script type="text/html" id="barDemo">
        <@shiro.hasPermission name="/test/update">
       <button class="layui-btn layui-btn-xs" lay-event="edit">评论</button>
        </@shiro.hasPermission>
       <@shiro.hasPermission name="/test/del">
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
                $.post("${basePath}/test/del", {"id": id}, function (data) {
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

        var update = function (id) {
            var index = layer.open({
                type: 2,
                content: '${basePath}/test/goUpdate?id='+id,
                area: ['800px', '500px'],
                maxmin: true,
                end: function () {
                    window.location.reload();
                }
            });
            parent.layer.iframeAuto(index);
        }

        var add = function (id,worksId,worksType) {
            var index = layer.open({
                type: 2,
                content: '/test/goAdd?id='+id+"&courseId="+worksId+"&courseType="+worksType,
                area: ['800px', '500px'],
                maxmin: true,
                end: function () {
                    window.location.reload();
                }
            });
            parent.layer.iframeAuto(index);
        }
   </script>