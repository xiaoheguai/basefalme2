
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>学员添加</title>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/layui.css" id="layui">
    <style>
        .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
    </style>
</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input name="loginId" lay-verify="required" placeholder="请输入登陆账号" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input name="loginPwd" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input"
                       type="password">
            </div>
        </div>

        <div class="layui-upload">
            <button type="button" class="layui-btn" id="test1">上传头像</button>
            <input class="layui-upload-file"  type="file" accept="undefined" name="touxiang1" id="touxiang1">
            <div class="layui-upload-list">
                <img class="layui-upload-img" id="demo1">
                <p id="demoText"></p>
            </div>
        </div>
        <input type="hidden" name="touxiang" id="touxiang" >

        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input name="nickname" lay-verify="required" placeholder="请输入昵称"
                       autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">联系手机</label>
            <div class="layui-input-block">
                <input name="mobile" lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input"
                       type="text">
            </div>
        </div>





        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="add">提交</button>
        </div>

    </form>

    <!--这里写页面的代码-->
</div>

<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/kit-admin/layui.js"></script>
<script>
    layui.use(['form', 'layedit','table','laydate','upload'], function(){
        var form = layui.form ,layer = layui.layer;
        var table = layui.table;
        var $ = layui.jquery
                ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '${basePath}/upload/add'
            ,exts: 'jpg|png|jpeg'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, touxiang, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                    $("#touxiang1").val(touxiang["name"]);
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                $("#touxiang").val(res.path);
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        //监听提交，发送请求
        form.on('submit(add)', function(data){
            $.post("${basePath}/student/add",data.field,function(data){
                // 获取 session
                if(data.status!=200){
                    layer.alert(data.message, {offset: 't',icon: 2});
                }
                if(data.status==200){
                    layer.alert(data.message, {offset: 't',icon: 1},function (index) {
                       layer.close(index);
                        var index2 = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index2);
                    });

                }
            });
            return false;
        });

    });
</script>
</body>
</html>
