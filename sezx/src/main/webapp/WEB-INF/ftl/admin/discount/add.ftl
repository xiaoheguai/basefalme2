
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>折扣添加</title>
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
            <label class="layui-form-label">折扣名称</label>
            <div class="layui-input-block">
                <input name="discountName" lay-verify="required" placeholder="请输入折扣名称" autocomplete="off" class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">折扣公式</label>
            <div class="layui-input-block">
                <input name="discountExpression" lay-verify="required" placeholder="P为当前价格占位" autocomplete="off" class="layui-input"
                       type="text">
            </div>
        </div>



        <div class="layui-form-item">
            <label class="layui-form-label">商品类别</label>
            <div class="layui-input-block">
                <select  id = "goodsTypeId" name="goodsTypeId" lay-verify="">
                    <option value="">请选择</option>
                    <#list goodsTypes as goodsType >
                        <option value="${goodsType.id}" >${goodsType
                        .typeName}</option>
                    </#list>

                </select>
            </div>
        </div>


        <div class="layui-inline">
            <label class="layui-form-label">开始时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="beginTime" name="beginTime"
                       lay-key="6">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">结束时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" id="endTime" name="endTime"  lay-key="6">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">启用</label>
            <input type="checkbox" id = "switchopen" lay-filter="ahType" checked="" name="switchopen" lay-skin="switch"
                   lay-text="开|关">
            <input type="hidden" id="isOpen" name="isOpen" value="1">
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
            $.post("${basePath}/discount/add",data.field,function(data){
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
