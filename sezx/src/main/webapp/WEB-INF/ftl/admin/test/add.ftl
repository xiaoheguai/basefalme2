
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>试题新增</title>
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
            <label class="layui-form-label">题号</label>
            <div class="layui-input-block">
                <input name="questionNo" id="questionNo" lay-verify="required|number" placeholder="请输入题号" autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">试题</label>
            <div class="layui-input-block">
                <input name="question" id="question" lay-verify="required" placeholder="请输入问题" autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">答案A</label>
            <div class="layui-input-block">
                <input name="answer1" id="answer1" placeholder="请输入答案" autocomplete="off"
                       class="layui-input" type="text">
                <input type="radio" name="right" value="1" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">答案B</label>
            <div class="layui-input-block">
                <input name="answer2" id="answer2" placeholder="请输入答案" autocomplete="off"
                       class="layui-input" type="text">
                <input type="radio" name="right" value="2">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">答案C</label>
            <div class="layui-input-block">
                <input name="answer3" id="answer3" placeholder="请输入答案" autocomplete="off"
                       class="layui-input" type="text">
                <input type="radio" name="right" value="3" >
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">答案D</label>
            <div class="layui-input-block">
                <input name="answer4" id="answer4" placeholder="请输入答案" autocomplete="off"
                       class="layui-input" type="text">
                <input type="radio" name="right" value="4" >
            </div>
        </div>



<input type="hidden" id="courseId" name="courseId" value="${courseId!""}">
<input type="hidden" id="courseType" name="courseType" value="${courseType!""}">






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
        var laydate = layui.laydate;
        var $ = layui.jquery
                ,upload = layui.upload;

        //日期时间选择器
        laydate.render({
            elem: '#beginTime'
            ,type: 'datetime'
        });
        laydate.render({
            elem: '#endTime'
            ,type: 'datetime'
        });
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload/'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, touxiang, result){
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
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
            var isright = $("input[name='right']:checked").val();
            $.post("${basePath}/test/add",{
                questionNo : $("#questionNo").val(),
                question : $("#question").val(),
                answer1 : $("#answer1").val(),
                answer2 : $("#answer2").val(),
                answer3 : $("#answer3").val(),
                answer4 : $("#answer4").val(),
                isright : isright,
                courseId : $("#courseId").val(),
                courseType : $("#courseType").val()
            },function(data){
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
        // 监听开关事件
        form.on('switch(ahType)', function (data) {
            var a = data.elem.checked;
            if (a) {
                $("#isOpen").val(1);
            } else {
                $("#isOpen").val(0);
            }

        });
    });
</script>
</body>
</html>
