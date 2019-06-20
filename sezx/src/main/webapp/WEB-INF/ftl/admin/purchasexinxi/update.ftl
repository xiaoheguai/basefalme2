
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>订单修改</title>
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

        <input name="id" value="${purchase.id}" hidden="hidden"/>

        <div class="layui-form-item">
            <label class="layui-form-label">购买数量</label>
            <div class="layui-input-block">
                <input  id="purchaseNum" value="${purchase.purchaseNum}" name="purchaseNum" lay-verify="required"
                        placeholder="请输入购买数量"
                        autocomplete="off"
                        class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">购买总金额</label>
            <div class="layui-input-block">
                <input onblur="getDiscountAmount()" value="${purchase.totalAmount}" id="totalAmount" name="totalAmount" lay-verify="required"
                       placeholder="请输入购买总金额"
                       autocomplete="off"
                       class="layui-input" type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">折扣</label>
            <div class="layui-input-block">
                <select lay-filter="zhekouchange"   id = "discountId" name="discountId" >
                    <option value="">请选择</option>
                    <#list discounts as discount >
                        <option value="${discount.id}" <#if (discount.isOpen==0)
                        >disabled="disabled"</#if> <#if (discount.id==purchase.discountId)
                        >selected="selected"</#if>>${discount
                        .discountName}</option>
                    </#list>

                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">折后总金额</label>
            <div class="layui-input-block">
                <input id="discountAmount" value = "${purchase.discountAmount}" readonly name="discountAmount"
                placeholder="自动算出不需输入"
                       autocomplete="off"
                       class="layui-input"
                       type="text">
            </div>
        </div>


        <input type="hidden" id="customerName" value="${purchase.customerName}" name="customerName">
        <div class="layui-form-item">
            <label class="layui-form-label">顾客姓名</label>
            <div class="layui-input-block">

                <select lay-filter="addname"  id="customerId" name="customerId" >
                    <option value="">请选择</option>
                         <#list customs as custom >
                             <option value="${custom.id}" <#if (custom.id==purchase.customerId)
                             >selected="selected"</#if> >${custom.nickname}</option>
                         </#list>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">是否已付款</label>
            <div class="layui-input-block">
                <input id="isPayment" value="${purchase.isPayment}" name="isPayment"  placeholder="是否已付款"
                       autocomplete="off"
                       class="layui-input"
                       type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">付款方式</label>
            <div class="layui-input-block">
                <input id="payType" value="${purchase.payType}" name="payType"  placeholder="付款方式(0:现金交易1:支付宝2:微信3:刷卡支付)"
                       autocomplete="off"
                       class="layui-input"
                       type="text">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">付款记录id</label>
            <div class="layui-input-block">
                <input id="payRecordId" value="${purchase.payRecordId!}" name="payRecordId"  placeholder="付款记录id"
                       autocomplete="off"
                       class="layui-input"
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
            $.post("${basePath}/px/update",data.field,function(data){
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
        form.on("select(zhekouchange)",function () {
            getDiscountAmount();
        })

        //监听下拉框的onchange事件
        form.on("select(addname)",function () {
            var option = $("#customerId").find(":selected").text();
            $("#customerName").val(option);
        })

    });

    var getDiscountAmount = function () {
        var totalAmount = parseFloat($("#totalAmount").val());
        if (isNaN(totalAmount)){
            //$("#discountAmount").val(totalAmount);
            return;
        }
        var discountId = parseFloat($("#discountId").val());
        if (!isNaN(discountId)){
            $.post("${basePath}/discount/getDiscountAmount",
                    {totalAmount : totalAmount,discountId : discountId},function (data) {
                        // 获取 session
                        if (data.status != 200) {
                            layer.alert(data.message, {offset: 't', icon: 2});
                            $("#discountAmount").val(totalAmount);
                        }
                        if (data.status == 200) {
                            $("#discountAmount").val(data.amount);
                        }
                    }
            );
        } else {
            $("#discountAmount").val(totalAmount);
        }

    }
</script>
</body>
</html>
