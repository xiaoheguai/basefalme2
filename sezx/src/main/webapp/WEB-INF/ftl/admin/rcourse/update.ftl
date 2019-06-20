
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>必修课修改</title>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/theme/default.css" id="theme">
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/kitadmin.css" id="kitadmin">
    <link rel="stylesheet" href="${basePath}/css/doc.css"></link>
    <link rel="stylesheet" href="${basePath}/plugins/kit-admin/css/layui.css" id="layui">
    <style>
        .layui-upload-img{width: 92px; height: 92px; margin: 0 10px 10px 0;}
    </style>

    <link rel="stylesheet" href="${basePath}/plugins/Video5/css/video-js.min.css" rel="stylesheet" type="text/css">
    <script src="${basePath}/plugins/Video5/js/video.min.js"></script>

    <script>
        videojs.options.flash.swf = "${basePath}/plugins/Video5/js/video-js.swf";
    </script>
</head>
<body>

<div class="kit-doc">
    <form class="layui-form layui-form-pane" action="">

        <input type="hidden" id="id" name="id" value="${rcourse.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">课程名</label>
            <div class="layui-input-block">
                <input id="courseName" name="courseName" value="${rcourse.courseName}" lay-verify="required"
                       placeholder="请输入课程名"
                       autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">课程描述</label>
            <div class="layui-input-block">
                <input name="courseDescribe" value="${rcourse.courseDescribe}" lay-verify="required" placeholder="请输入课程描述" autocomplete="off"
                       class="layui-input"
                       type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">
                <button type="button" style="margin-left: -20px;margin-top: -10px;" class="layui-btn"
                        id="test1">
                    <i class="layui-icon">&#xe67c;</i>上传视频
                </button>
            </label>
            <div class="layui-input-block">
                <input name="courseName2" id="courseName2" value="${rcourse.courseName}" lay-verify="required" readonly placeholder="请上传视频"
                       autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>
        <div class="layui-form-item">
            <video id="example_video" class="video-js vjs-default-skin vjs-big-play-centered" controls preload="none" width="640"
                   height="264" data-setup=''>
                <source id="mp4source" src="${rcourse.courseUrl!'http://视频地址格式1.mp4'}" type='video/mp4' />
                <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
            </video>
        </div>
        <input type="hidden" name="courseUrl" id="courseUrl" value="${rcourse.courseUrl}">


        <div class="layui-form-item">
            <label class="layui-form-label">上架价格</label>
            <div class="layui-input-block">
                <input name="goodsPrice" value="${rcourse.goodsPrice}" lay-verify="required" readonly placeholder="请输入价格"
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
<script src="${basePath}/plugins/kit-admin/layui.js"></script>
<script>


    layui.use(['form', 'layedit','table','laydate','upload'], function(){
        var form = layui.form ,layer = layui.layer;
        var table = layui.table;
        var $ = layui.jquery
                ,upload = layui.upload;


        var myPlayer = videojs('example_video');
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            ,url: '/upload/add'
            ,accept: 'file'
            // ,auto : false
            //,exts: 'jpg|png|jpeg'
            ,before: function(obj){//自动上传用before，禁止自动上传用choose
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    var ext = file["name"].substring(file["name"].lastIndexOf(".")+1).toLowerCase();
                    if("mp4"!=ext && "webm"!=ext){
                        layer.alert('请上传mp4或webm格式视频', {offset: 't',icon: 2});
                        return false;
                    }
                    var size = file["size"];
                    if(300*1024*1024<size){
                        layer.alert('请上传小于300M的视频', {offset: 't',icon: 2});
                        return false;
                    }
                    var name = file["name"];
                    $("#courseName").val(name);
                    $("#courseName2").val(name);
                    //videojs("example_video", {}, function() {
                    // window.myPlayer = this;
                    //$("#mp4source").attr("src", result);
                    myPlayer.src(result);
                    myPlayer.load(result);
                    myPlayer.play();
                    setTimeout(function(){
                        myPlayer.pause();
                    }, 1000)

                    //   });

                    //$('#mp4source').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //如果上传失败
                if(res.code > 0){
                    return layer.msg('上传失败');
                }
                $("#courseUrl").val(res.path);
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
            $.post("${basePath}/rcourse/update",data.field,function(data){
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

    $(function () {

    })
</script>
</body>
</html>
