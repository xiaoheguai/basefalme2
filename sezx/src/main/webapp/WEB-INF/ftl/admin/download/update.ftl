
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>文件编辑</title>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/layui.css" id="layui">
    <style>
        .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
    </style>
</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">
        <input type="hidden" name="id" value="${download.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">
                <button type="button" style="margin-left: -20px;margin-top: -10px;" class="layui-btn" id="test1">
                    <i class="layui-icon">&#xe67c;</i>上传文件
                </button>
            </label>
            <div class="layui-input-block">
                <input name="fileName" id="fileName" value="${download.fileName}"  lay-verify="required" readonly
                       placeholder="请上传文件"
                       autocomplete="off"
                       class="layui-input" type="text">

            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                <button onclick="window.open('${download.fileUrl!}')";
                style="margin-left: -20px;margin-top: -10px;" class="layui-btn"
                >
                    <i class="layui-icon">&#xe67c;</i>下载文件
                </button>
            </label>

        <input name="fileUrl" id="fileUrl" value="${download.fileUrl}" type="hidden">

        <div class="layui-form-item">
            <label class="layui-form-label">文件描述</label>
            <div class="layui-input-block">
                <input name="fileDescribe" id="fileDescribe" lay-verify="fileDescribe" value="${download.fileDescribe}"
                       placeholder="请输入描述"
                       autocomplete="off"
                       class="layui-input"
                       type="text">
            </div>
        </div>


        <div class="layui-form-item">
            <button class="layui-btn" lay-submit="" lay-filter="update">提交</button>
        </div>
    </form>

    <!--这里写页面的代码-->
</div>

<script src="${basePath}/js/jquery.js"></script>
<script src="${basePath}/plugins/layui-treeselect/plugins/layui/layui.js"></script>

<script>
    layui.use(['form', 'layedit','table','laydate','upload'], function(){
        var form = layui.form ,layer = layui.layer;
        var table = layui.table;
        var $ = layui.jquery
                ,upload = layui.upload;

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload/add'
            ,accept: 'file'
            //,auto : false
            //,exts: 'jpg|png|jpeg'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    var name = file["name"];

                    $('#fileName').val(name); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                $("#fileUrl").val(res.path);
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
        form.on('submit(update)', function(data){
            $.post("${basePath}/download/update",data.field,function(data){
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
