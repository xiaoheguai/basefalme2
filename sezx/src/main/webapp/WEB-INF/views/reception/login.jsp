<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="ZH-cn">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <style class="vjs-styles-defaults">
        .video-js {
            width: 300px;
            height: 150px;
        }

        .vjs-fluid {
            padding-top: 56.25%
        }

    </style>

    <title>登录 - 少儿在线网站</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/receptionfile/css/all-dce9f06ec3.css">
    <link rel="stylesheet" href="<%=basePath%>/plugins/receptionfile/css/all_v2-fe98895c6e.css">
    <link rel="stylesheet" href="<%=basePath%>/plugins/kit-admin/css/layui.css" id="layui">
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/plugins/kit-admin/layui.all.js"></script>
    <!-- Google Tag Manager -->
    <%--<script>--%>
        <%--(function(w, d, s, l, i) {--%>
            <%--w[l] = w[l] || [];--%>
            <%--w[l].push({--%>
                <%--'gtm.start': new Date().getTime(),--%>
                <%--event: 'gtm.js'--%>
            <%--});--%>
            <%--var f = d.getElementsByTagName(s)[0],--%>
                <%--j = d.createElement(s),--%>
                <%--dl = l != 'dataLayer' ? '&l=' + l : '';--%>
            <%--j.async = true;--%>
            <%--j.src =--%>
                <%--'https://www.googletagmanager.com/gtm.js?id=' + i + dl;--%>
            <%--f.parentNode.insertBefore(j, f);--%>
        <%--})(window, document, 'script', 'dataLayer', 'GTM-NW2X3WN');--%>
    <%--</script>--%>
    <!-- End Google Tag Manager -->
    <style>
        #footerMobile {
            display: none;
        }

        #qiao-mobile-wrap {
            display: none !important;
        }
    </style>
    <style>
        #qiao-wrap {
            display: none !important;
        }

        img[src="https://hmcdn.baidu.com/static/hmt/icon/21.gif"] {
            display: none !important;
        }

        body {
            min-width: 1280px;
        }
    </style>
</head>

<body data-spy="scroll" data-target="#info-container-topbar">

<div class="module-navbar">
    <div class="navbar-area">

        <ul class="navbar pull-right login-register">
            <%--<li class="login-li">--%>
                <%--<a rel="nofollow" href="javascript:void(0)" data-toggle="modal" data-target=".login-modal" class="for-right-line">登录</a>--%>
            <%--</li>--%>
            <li class="register-li">
                <a rel="nofollow" href="javascript:void(0);"  data-toggle="modal"
                   data-target=".login-modal"   >
                    注册
                </a>
            </li>
        </ul>
        <div class="right-info">
            <img src="<%=basePath%>plugins/receptionfile/img/tel.jpg" style="margin-top: -3px;" /><span
                class="bold">400-636-1878</span>
        </div>

    </div>
</div>




<div class="login_guan_home_content">
    <div class="login_guan_home_form">

        <div class="login_guan_form_content">
            <h1 class="login_guan_home_title">少儿编程在线学习系统登录</h1>
            <div style="height: 50px;"></div>
            <div class="tab-content login_guan_home_tabcontent">
                <div role="tabpanel" class="tab-pane active" id="page_account_login">
                    <div class="password_login">
                        <form class="layui-form formLogin" action="">
                             <input class="user_phone_email" type="text" name="loginId" placeholder="用户名" lay-verify="required"  autocomplete="off" >
                             <input class="login_guan_password" type="password" name="loginPwd" placeholder="密码" lay-verify="required"  autocomplete="off" >
                            <button class="layui-btn login_guan_button" lay-submit="" lay-filter="login1">登陆</button>

                            <div class="remember_user">

                                <div class="user_back_password">
                                    <%--<a class="forget_password" href="javascript:void(0)">忘记密码</a>&nbsp;|&nbsp;--%>
                                        <a rel="nofollow" class="to_registered_user" href="javascript:void(0);"  data-toggle="modal"
                                           data-target=".login-modal"   >
                                            注册
                                        </a>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>


            </div>

            <%--<div class="other_entrance_plate">--%>
                <%--<h3 class="other_entrance_title">第三方登录</h3>--%>
                <%--<div class="other_entrance_list">--%>
                    <%--<a href="javascript:;" class="login-by-wechat"><img src="<%=basePath%>/plugins/receptionfile/img/weixin.png"></a>--%>
                    <%--<a href="javascript:;" class="login-by-qq"><img src="<%=basePath%>/plugins/receptionfile/img/qq2.png"></a>--%>
                    <%--<a href="javascript:;" class="login-by-weibo"><img src="<%=basePath%>/plugins/receptionfile/img/weibo.png"></a>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>
</div>


<div class="modal fade login-modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog login-register-modal">
        <div class="modal-content">
            <div class="modal-login-part" id="modalLoginPart">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#account_login" aria-controls="account_login"
                                                                  role="tab" data-toggle="tab">密码登录</a></li>
                        <%--<li role="presentation"><a href="#phone_login" aria-controls="phone_login" role="tab"--%>
                                                   <%--data-toggle="tab">短信登录</a></li>--%>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="account_login">

                        </div>


                </div>
                <%--<div class="modal-footer">--%>
                    <%--<h1 class="cell-footer-title">第三方账号登录</h1>--%>
                    <%--<div class="cell-other-logins mdui-clearfix">--%>
                        <%--<a href="javascript:;"><img alt=""--%>
                                                    <%--class="ea-other-login-img login-by-wechat"></a>--%>
                        <%--<a href="javascript:;"><img alt=""--%>
                                                    <%--class="ea-other-login-img login-by-qq"></a>--%>
                        <%--<a href="javascript:;"><img  alt=""--%>
                                                    <%--class="ea-other-login-img login-by-weibo"></a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            </div>

            <div class="modal-register-part" id="modalRegisterPart">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <h1 class="register-modal-title">注&nbsp;&nbsp;&nbsp;&nbsp;册</h1>
                        <div class="cell-forms-area">
                            <div class="form-group">
                                <input type="text" class="form-control ea-input " name="mobile" id="mobile"
                                       placeholder="请输入手机号码" >
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control ea-input" name="name" id="loginId" placeholder="用户名" >
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control ea-input" name="password" id="password"
                                       placeholder="密码" >
                            </div>
                            <div class="form-group mdui-clearfix">
                                <span>角色:</span>
                                    <select name="isStudent" id="isStudent" style="width: 80%;">
                                        <option value="1" selected >学员</option>
                                        <option value="0">教师</option>
                                    </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" onclick="toRegister()" class="form-control submit-input">注册
                                </button>
                            </div>
                            <%--<div class="cell-forms-more mdui-clearfix">--%>
                                <%--<div class="pull-right forget-pass-register">--%>
                                    <%--<span style="color: #666">已有账号，</span>--%>
                                    <%--<span class="register-login-button changeToLogin">登录</span>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        </div>
                </div>
            </div>


            <div class="footer" style="height: 500px;">

                <h1 class="cell-bottom-navbar-title"><a href="https://www.codepku.com/">首页</a></h1>
                <ul class="cell-index-as" >
                    <li class="ea-index-a liinline">
                        <a rel="nofollow" href="https://www.codepku.com/about">关于我们</a>
                    </li>
                    <li class="ea-index-a">
                        <a rel="nofollow" href="https://www.codepku.com/course">课程介绍</a>
                    </li>
                    <li class="ea-index-a">
                        <a rel="nofollow" href="https://www.codepku.com/teach/mode">教学模式</a>
                    </li>
                    <li class="ea-index-a">
                        <a rel="nofollow" href="https://www.codepku.com/pages/join">加入我们</a>
                    </li>
                </ul>
            </div>

            <%--<script src="<%=basePath%>/plugins/receptionfile/js/jquery-1.9.1.min.js"></script>--%>
            <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/receptionfile/css/wangEditor.min.css">--%>

            <%--<script type="text/javascript" src="<%=basePath%>/plugins/receptionfile/js/wangEditor.min.js"></script>--%>
                <script>
                    var toRegister = function () {
                        var mobile = $("#mobile").val();
                        var loginId = $("#loginId").val();
                        var nickname = $("#loginId").val();
                        var isStudent = $("#isStudent").val();
                        var password = $("#password").val();
                        if(mobile == "" || mobile == null){
                            layer.alert("请输入手机号！", {offset: 't',icon: 2});
                            return false;
                        }
                        if(loginId == "" || loginId == null){
                            layer.alert("请输入登陆名！", {offset: 't',icon: 2});
                            return false;
                        }
                        if(password == "" || password == null){
                            layer.alert("请输入登陆密码！", {offset: 't',icon: 2});
                            return false;
                        }
                        $.post("${basePath}/m/toRegister",
                                {
                                    mobile : mobile,
                                    loginId : loginId,
                                    nickname : nickname,
                                    loginPwd : password,
                                    isStudent : isStudent
                                },
                                function (data) {
                                    if(data.status!=200){
                                        layer.alert(data.message, {offset: 't',icon: 2});
                                    }
                                    if(data.status==200){
                                            window.location.href = "${basePath}/m/login";
                                    }
                                }
                        )
                    }
                </script>
                <script>

                //换用wangeditor。有些变量名未修改
                var allEditors = [];
                var $simTexts = $('.editorArea');
                for(var i = 0; i < $simTexts.length; i++) {
                    var $this = $simTexts.eq(i);
                    console.log($this);
                    var fieldname = $this.attr('name');
                    var form = $this.parents('form').attr('id');
                    var editor = new wangEditor($this);

                    editor.config.uploadImgUrl = '/upload';
                    editor.config.uploadImgFileName = 'upload_file';

                    var fieldname = $this.attr('name');
                    var form = $this.parents('form').attr('id');
                    // 配置自定义参数（举例）
                    editor.config.uploadParams = {
                        '_token': $('meta[name="csrf-token"]').attr('content'), // csrf_token
                        'from_form': form + '#' + fieldname, // 上传文件的来源字段
                    };

                    var menu = $this.data('menubar');
                    var EDITOR_MENU = {
                        'admin': ['source', '|', 'bold', 'underline', 'italic', 'strikethrough', 'eraser', 'forecolor', 'bgcolor', '|', 'quote', 'fontfamily', 'fontsize', 'head', 'unorderlist', 'orderlist', 'alignleft', 'aligncenter', 'alignright', '|', 'link', 'unlink', 'table', 'emotion', '|', 'img', 'video', 'location', 'insertcode', '|', 'undo', 'redo', 'fullscreen'],
                        'normal': ['bold', 'underline', 'italic', 'strikethrough', 'eraser', 'forecolor', 'bgcolor', 'quote', 'fontfamily', 'fontsize', 'head', 'unorderlist', 'orderlist', 'alignleft', 'aligncenter', 'alignright', 'link', 'unlink', 'table', 'emotion', 'img', 'insertcode', 'undo', 'redo', 'fullscreen'],
                        'simple': ['emotion', 'undo', 'redo'],
                    };

                    //设置不同的menu bar
                    if(EDITOR_MENU[menu]) {
                        editor.config.menus = EDITOR_MENU[menu];
                    } else {
                        editor.config.menus = EDITOR_MENU['normal'];
                    }

                    /* 无需
                    editor.config.uploadHeaders = {
                        'enctype': 'multipart/form-data',
                    };
                    */
                    editor.create();
                    allEditors[i] = editor;
                    $.data($this[0], 'editor', allEditors[i]); // save editor instance to the element, for later usage
                }
            </script>
            <script type="text/javascript" src="<%=basePath%>/plugins/receptionfile/js/all-ad3061d971.js"></script>
            <script type="text/javascript" src="<%=basePath%>/plugins/receptionfile/js/app-3d2f01fb46.js"></script>
            <script>
                window.changeURLArg = function(url, arg, arg_val) {
                    var pattern = arg + '=([^&]*)';
                    var replaceText = arg + '=' + arg_val;
                    if(url.match(pattern)) {
                        var tmp = '/(' + arg + '=)([^&]*)/gi';
                        tmp = url.replace(eval(tmp), replaceText);
                        return tmp;
                    } else {
                        if(url.match('[\?]')) {
                            return url + '&' + replaceText;
                        } else {
                            return url + '?' + replaceText;
                        }
                    }
                }

                //.module-navbar a,.module-codePku-Work a,.codePku-work-mobile-page a,.navbar a

                function open53kfWin() {
                    window.open("https://tb.53kf.com/code/client/10179469/1", 'newwindow', 'height=651, width=800, top=0,left=0, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no');
                }

                $(function() {


                    // 滚动到距离底部还有300像素时，展示返回顶部按钮
                    $(window).scroll(function() {
                        var window_height = parseFloat($(window).scrollTop());
                        if(window_height >= 647) {
                            $('.back_top_item').slideDown(200);
                        } else {
                            $('.back_top_item').slideUp(200);
                        }
                    })

                    $('#bind-mobile-modal').on('hide.bs.modal', function() {
                        window.location.reload(); // = '/';
                    })

                    $('#askBtn img').click(function(event) {
                        $("#askBtn").fadeOut(100);
                        $('body,html').animate({
                            scrollTop: 0
                        }, 1000);
                    });

                    function goTop() {
                        $(window).scroll(function(e) {
                            $("#askBtn").fadeIn(1000);
                        });
                    }

                    function getUrlSegment(name) {
                        return decodeURIComponent((new RegExp('[#|&]' + name + '=([^&;]+?)(&|#|;|$)').exec(window.location.hash) || [null, ''])[1].replace(/\+/g, '%20')) || null;
                    }
                })
            </script>

            <script>

                layui.use(['form', 'layedit','table','laydate','upload','layer'], function(){
                    var form = layui.form ,layer1 = layui.layer;
                    var $ = layui.jquery;


                    //监听提交，发送请求
                    form.on('submit(login1)', function(data){
                        $.post("${basePath}/m/submitLogin",data.field,function(data){
                            // 获取 session
                            if(data.status!=200){
                                layer1.alert(data.message, {offset: 't',icon: 2});
                            }
                            if(data.status==200){
                                layer1.msg('登录成功！');
                                // layer.alert(data.message, {offset: 't',icon: 2},function (index) {
                                //     layer.close(index);
                                //    // var index2 = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                                //     //parent.layer.close(index2);
                                //
                                // });

                                setTimeout(function(){
                                    //登录返回
                                    window.location.href = "${basePath}/m/index";
                                },1000)
                            }
                        });
                        return false;
                    });

                });
            </script>


        </div>
    </div>
</div>
</div>
</div>
</body>

</html>