
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>订单明细添加</title>
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

        <input type="hidden" name="goodsName" id="goodsName" value="${pxmx.goodsName}">
        <input type="hidden" name="id" id="id" value="${pxmx.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <select lay-filter="shangpingchange" id = "goodsId" name="goodsId" lay-verify="">
                    <option value="">请选择</option>
                    <#list goods as good >
                        <option value="${good.id}"
                            <#if (pxmx.goodsId==good.id)>selected="selected"</#if>
                        >${good
                        .goodsName}</option>
                    </#list>

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品单价</label>
            <div class="layui-input-block">
                <input onchange="totalpricechange()" value="${pxmx.goodsUnitPrice}"  id="goodsUnitPrice" readonly name="goodsUnitPrice"
                       lay-verify="required"
                       placeholder="请输入购买数量"
                       autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品数量</label>
            <div class="layui-input-block">
                <input onblur="totalpricechange()" value="${pxmx.goodsAmount}" id="goodsAmount" name="goodsAmount"  placeholder="请输入商品数量"
                       autocomplete="off"
                       class="layui-input"
                       type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">商品总价</label>
            <div class="layui-input-block">
                <input id="goodsTotalPrice" value="${pxmx.goodsTotalPrice}" readonly name="goodsTotalPrice"  placeholder="自动算出不需输入"
                       autocomplete="off"
                       class="layui-input"
                       type="text">
            </div>
        </div>
        <input type="hidden" name="purchaseXinxiId" value="${pxmx.purchaseXinxiId}">

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
        form.on('submit(update)', function(data){
            $.post("${basePath}/pxmx/update",data.field,function(data){
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



        //监听下拉框的onchange事件
        form.on("select(shangpingchange)",function () {
            var id = $("#goodsId").find(":selected").val();
            if(id==""){
                return;
            }
            $.post("${basePath}/goods/getGoodsById",
                    {id : id},
                    function(data){
                        // 获取 session
                        if (data.status != 200) {
                            layer.alert(data.message, {offset: 't', icon: 2});
                        }
                        if (data.status == 200) {
                            $("#goodsUnitPrice").val(data.goodunitprice);
                            $("#goodsName").val($("#goodsId").find(":selected").text());
                        }
                    })

        })

    });

    var totalpricechange = function () {
        var goodsUnitPrice = parseFloat($("#goodsUnitPrice").val());
        if (isNaN(goodsUnitPrice)){
            //$("#discountAmount").val(totalAmount);
            return;
        }
        var goodsAmount = parseFloat($("#goodsAmount").val());
        if (isNaN(goodsAmount)){
            return;
        }
        var totalparice = goodsAmount*goodsUnitPrice;
        $("#goodsTotalPrice").val(totalparice);
    }
</script>
</body>
</html>
