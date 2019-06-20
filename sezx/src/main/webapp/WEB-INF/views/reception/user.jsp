<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<link rel="stylesheet" href="<%=basePath%>/plugins/kit-admin/css/layui.css" id="layui">
<script src="<%=basePath%>/js/jquery.js"></script>
<script src="<%=basePath%>/plugins/kit-admin/layui.all.js"></script>

<h3 data-v-968758ba="" class="bg-sky-blue padding-left padding-right position-relative"><img data-v-968758ba=""
                                                                                             src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAuCAMAAABzsJvxAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAADbUExURUxpcR+C8ABr4Qlw5f3vsSKE8fznifzrm/vicwty5lua4/vid/vlgyGD8fvhcvzkgABr4QBr4fztpP3zwiKE8QBr4QBr4fraU/zokx5/5SKE8QBr4f5WXndhpPrQJvrUOYZgnAx05wJs4/raUxFq2Bp/7vjMGvrYSPnMEfvfaPrcXSOE7v///0md+zqT9jSC4o9tqNpcdH6ikSdqy/BXZv720XeYfGBjsKCtaqVdjO/QQMZae5SjYliTrt/AIL23Ts3BV//88ca4PndyuVCUxTxmwk9kuIlgmrO5cyad5X0AAAAzdFJOUwDT8Yj68BX6/nUHXf4j6qmtJjz6rMjdh4zz/////////////////////////////////oXiGmoAAAG0SURBVDjLnZTZcoIwFEARkbjgvg4BCxQsKi2K+273/v8XNQGREIN0el4yE453yY3huEQaQolLpygIgpiu9cACVNM1ABwBpFoNCWlS464jiiKQmg6QqmJieaVqJY8AjiOhpVKp9pgdD4f5ZnPx6jjCMIQZbVTB0gKMQtjn132M073s12s8JPGeSLxa3bcKkMbbPoRsPQh55JUz8i0/V+1soJ/VuPKYYcnnfsh2jDyeY8WS3X7Eh4XCcTmWdhhEeDLW/G1LN2ItLG3E2+GEl/VVswyq071tD5YQGt7Atk9XTacPZHncz/Cqu+tjFM2ACRh+SaEGoRWVb5He/zRzqihzVI65U0JWDG2KP+xUNbIUJUmjYGjuracyNFSVaW5QfZ9mCKsFuNI0DWqbGV4JJhOX1CY4zcR1329yT0lNSUYmhqUmWkQ0NPovVVXnaHejxrjU1iEv0myufMcnb106zQa3l76WgaRfJo21lpyGhSyunEvTjAL+M5dbd0UrsCieA9IeyZeAe093FmUfB+B0GbZW8E86wK+qzQxGd6J3EoPdHgQN/ebofPEPmg4L7BbasYnyWTLYL2vgjYly9C9GAAAAAElFTkSuQmCC" alt="" style="top: 0px;" />
    <span data-v-968758ba="" class="color-white vertical-top inline-block font-bold-500">个人资料</span>
    <div data-v-968758ba="" class="position-absolute" style="right: 10px; top: 0px;">
        <button  onclick="gotoindex()" data-v-968758ba="" type="button" class="el-button color-white height-100 el-button--text">
            <!---->
            <!----><span>返回首页</span></button>
    </div></h3>
<div data-v-968758ba="" class="margin-top-m">
    <div data-v-ad92c926="" data-v-968758ba="" class="bg-white padding-m">
        <div data-v-ad92c926="" class="el-tabs el-tabs--top">
            <div class="el-tabs__header is-top">
                <div class="el-tabs__nav-wrap is-top">
                    <div class="el-tabs__nav-scroll">


        <div  data-v-2227e212="" class="layui-upload el-form-item"
              style="margin: 10px auto;width:120px;text-align:center;">

            <input type="hidden" name="touxiang" id="touxiang" >
            <div id="m_touxiang" class="layui-upload-list" >
                <img class="layui-upload-img" id="demo1" style="width: 100px;height: 100px;"
                <c:choose>
                     <c:when  test="${muser.touxiang!=null && muser.touxiang!=''}">src="${muser.touxiang}"</c:when>
                    <c:otherwise></c:otherwise>
                </c:choose>
                >
                <p id="demoText"></p>
            </div>
            <button type="button" class="layui-btn" id="test1">上传头像</button>
            <input class="layui-upload-file"  type="file" accept="undefined" name="touxiang1" id="touxiang1">

        </div>
        <div data-v-2227e212="" class="el-form-item is-required" style="width: 90%;">
            <label   class="el-form-item__label" style="width: 100px;">登陆名</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入登陆名" style="width: 50%;"
                           value="${muser.loginId}" disabled="disabled"
                           class="el-input__inner">
                        <button onclick="removedisable(this,'loginId')"  data-v-2227e212="" type="button"
                                class="el-button el-button--text el-button--small">
                            <!---->
                            <!----><span>修改</span>
                        </button>
                </div>
                <!---->
                <!---->
            </div>
        </div>
        <div data-v-2227e212="" class="el-form-item is-required" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">用户名</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入用户名" maxlength="16"
                           value="${muser.nickname}" disabled="disabled" style="width: 50%;"
                           class="el-input__inner">
                        <button onclick="removedisable(this,'nickname')"  data-v-2227e212="" type="button"
                                class="el-button el-button--text el-button--small">
                            <!---->
                            <!----><span>修改</span>
                        </button>
                    </div>
                <!---->
                <!---->
            </div>
        </div>

        <div data-v-2227e212="" class="el-form-item is-required" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">个性签名</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入个性签名"
                           value="${muser.sign}" disabled="disabled" style="width: 80%;"
                           class="el-input__inner">
                        <button onclick="removedisable(this,'sign')"  data-v-2227e212="" type="button"
                                class="el-button el-button--text el-button--small">
                            <!---->
                            <!----><span>修改</span>
                        </button>
                </div>
                <!---->
                <!---->
            </div>
        </div>
        <%--<div data-v-2227e212="" class="el-form-item">--%>
            <%--<label  class="el-form-item__label" style="width: 100px;">性别</label>--%>
            <%--<div class="el-form-item__content" style="margin-left: 100px;">--%>
                <%--<div data-v-2227e212="" role="radiogroup" class="el-radio-group">--%>
                    <%--<label data-v-2227e212="" role="radio" tabindex="-1" class="el-radio"><span class="el-radio__input"><span class="el-radio__inner"></span><input type="radio" aria-hidden="true" tabindex="-1" class="el-radio__original" value="1" /></span><span class="el-radio__label">男--%>
                        <%--<!----></span></label>--%>
                    <%--<label data-v-2227e212="" role="radio" tabindex="-1" class="el-radio"><span class="el-radio__input"><span class="el-radio__inner"></span><input type="radio" aria-hidden="true" tabindex="-1" class="el-radio__original" value="2" /></span><span class="el-radio__label">女--%>
                        <%--<!----></span></label>--%>
                    <%--<label data-v-2227e212="" role="radio" tabindex="0" class="el-radio is-checked" aria-checked="true"><span class="el-radio__input is-checked"><span class="el-radio__inner"></span><input type="radio" aria-hidden="true" tabindex="-1" class="el-radio__original" value="0" /></span><span class="el-radio__label">保密--%>
                        <%--<!----></span></label>--%>
                <%--</div>--%>
                <%--<!---->--%>
            <%--</div>--%>
        <%--</div>--%>
        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">手机号</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <input type="text" autocomplete="off" placeholder="请输入手机号"
                       value="${muser.mobile}" disabled="disabled" style="width: 50%;"
                       class="el-input__inner">
                    <button onclick="removedisable(this,'mobile')"  data-v-2227e212="" type="button"
                            class="el-button el-button--text el-button--small">
                        <!---->
                        <!----><span>修改</span>
                    </button>
            </div>
        </div>




        <%--<div data-v-2227e212="" class="el-form-item padding-top account padding-right">--%>
            <%--<label for="binding_account" class="el-form-item__label" style="width: 100px;">绑定账号</label>--%>
            <%--<div class="el-form-item__content" style="margin-left: 100px;">--%>
                <%--<div data-v-2227e212="" class="wechat">--%>
                    <%--<i data-v-2227e212="" class="fa fa-wechat"></i>--%>
                    <%--<span data-v-2227e212="">微信</span>--%>
                    <%--<button data-v-2227e212="" type="button" class="el-button el-button--primary el-button--mini">--%>
                        <%--<!---->--%>
                        <%--<!----><span>绑定</span></button>--%>
                <%--</div>--%>
                <%--<!---->--%>
            <%--</div>--%>
        <%--</div>--%>

</div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use([ 'upload'], function(){
        var layer = layui.layer;
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
                submits($("#m_touxiang")[0],"touxiang");
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



    });
    var  removedisable = function (obj,type) {
        $(obj).prev().removeAttr("disabled");
        $(obj).prev().focus();
        var str =
            '<button onclick="submits(this,\''+type+'\')"  data-v-2227e212="" type="button" '
            +'class="el-button el-button--text el-button--small">'
            +'<span>提交&nbsp;&nbsp;&nbsp;&nbsp;</span>'
            +'</button>'
            +'<button onclick="cancles(this)"  data-v-2227e212="" type="button" class="el-button el-button--text el-button--small">'
            +'<span>取消</span>'
            +'</button>';

        $(obj).parent().append(str);
        $(obj).remove();
    }
    var submits = function(obj,type){
        var val = $(obj).prev().val();
            $.post("${basePath}/m/updateByType",{type:type,value:val},
                    function (rs) {
                        if(rs.status!=200){
                            layer.alert(rs.message, {offset: 't',icon: 2});
                        }
                        if(rs.status==200){
                            layer.msg('修改成功！');

                            setTimeout(function(){
                                window.location.reload();
                            },1000)
                        }
                    });
    }
    var cancles = function(obj){
        var str =
                '<button onclick="removedisable(this)"  data-v-2227e212="" type="button" '
                +'class="el-button el-button--text el-button--small">'
                +'<span>修改</span>'
                +'</button>';

        $(obj).parent().append(str);
        $(obj).prev().prev().attr("disabled","disabled");
        $(obj).prev().remove();
        $(obj).remove();

    }
</script>