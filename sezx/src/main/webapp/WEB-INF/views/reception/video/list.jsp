<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="org.apache.shiro.session.Session" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<html>
<head>

    <link href="<%=basePath%>/plugins/receptionfile/css/app.css" rel="stylesheet"/>
    <%--<link rel="stylesheet" type="text/css" href="<%=basePath%>/plugins/receptionfile/css/all-dce9f06ec3.css">--%>
    <%--<link rel="stylesheet" href="<%=basePath%>/plugins/receptionfile/css/all_v2-fe98895c6e.css">--%>
    <script src="<%=basePath%>/js/jquery.js"></script>

    <link rel="stylesheet" href="<%=basePath%>/plugins/Video5/css/video-js.min.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>/plugins/Video5/js/video.min.js"></script>

    <script>
        videojs.options.flash.swf = "${basePath}/plugins/Video5/js/video-js.swf";
    </script>
</head>
<body>
<c:choose>
<c:when test="${not empty  rcourseList}">
<div data-v-6f8b1b76="" data-v-41369d32="" class="container studyground">
    <c:if test="${url == '/m/worksList'}">
        <div  class="el-menu-demo el-menu--horizontal el-menu"
           style="background-color: rgb(84, 92, 100);">
            <button type="button" class="el-button el-button--primary el-button--small " style="float: right;clear:
            both;margin-top: 15px;">
                <span onclick="gotoUpload()">上传视频</span>
            </button>
        </div>
    </c:if>
    <div data-v-6c71e3f8="" data-v-6f8b1b76="" class="presentation-container">
        <div data-v-6c71e3f8="" class="inner_tab1 el-tabs el-tabs--top">
            <div class="el-tabs__content">


                <div data-v-72506126="" role="tabpanel" class="el-tab-pane"
                     style="">
                    <div data-v-6c71e3f8="" class="presentation-box" style="height: auto;">

                        <c:forEach items="${rcourseList}" var="rc" varStatus="status" step="1">

                            <div data-v-b7d09246="" data-v-6c71e3f8=""
                                 class="el-card work-box is-always-shadow">
                                <!---->
                                <div class="el-card__body">
                                    <div data-v-b7d09246="" onclick="getToDetail('${rc.courseType}','${rc.id}')"
                                         style="cursor: pointer;"   >

                                        <%--<img class="video_first" video_first_src="${rc.courseUrl}"--%>
                                             <%--onclick="getToDetail('${rc.courseType}','${rc.id}')"--%>
                                             <%--data-v-b7d09246=""--%>
                                             <%--src="<%=basePath%>/plugins/receptionfile/img/moren.png"--%>
                                        <%--/>--%>
                                            <video id="video_${status.index}" muted
                                                    style="object-fit: fill;"
                                                   class="video-js vjs-default-skin vjs-big-play-centered video_first"
                                                   preload="none" width="250"
                                                   height="170" >
                                                <source  src="${rc.courseUrl}" type='video/mp4' />
                                                <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                                                <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                                            </video>
                                    </div>
                                    <div data-v-b7d09246="" class="production-info">
                                        <p data-v-b7d09246="" class="title_top">
                                            <span data-v-b7d09246=""
                                                  class="margin-bottom-s  inline-block text-overflow info-tit">${rc.courseName}</span>
                                        </p>
                                        <span data-v-b7d09246="" class="font-s color-light ">
                                            <img
                                                data-v-b7d09246=""
                                                src="<%=basePath%>/plugins/receptionfile/img/hits.png"
                                                alt=""/> ${rc.hits}
                                        </span>
                                        <c:choose>
                                            <c:when test="${isSelf == 1}">
                                                        <c:choose>
                                                            <c:when test="${empty rc.goodsId}">
                                                                <span style="float:right; clear:both;">
                                                                    <a style="color: #0F9E5E;"
                                                                       onclick="gotoDel('${rc.id}')"
                                                                       href="javascript:void(0)">
                                                                        删除&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    </a>
                                                                    <a style="color: #0F9E5E;"
                                                                       onclick="gotoEdit('${rc.id}','${rc.courseName}',
                                                                               '${rc.courseDescribe}','${rc.courseUrl}')"
                                                                       href="javascript:void(0)">
                                                                        编辑&nbsp;&nbsp;&nbsp;&nbsp;
                                                                    </a>
                                                                    <a style="color: #0F9E5E;"
                                                                       onclick="shangjia(1,'${rc.id}')"
                                                                       href="javascript:void(0)">上架</a>
                                                                </span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="float:right; clear:both;" >
                                                                    <a style="color: red;"
                                                                       onclick="shangjia(0,'${rc.id}')"
                                                                       href="javascript:void(0)">下架</a>
                                                                </span>
                                                            </c:otherwise>
                                                        </c:choose>
                                            </c:when>
                                            <c:otherwise>

                                                <c:if test="${!empty rc.goodsId}">
                                                     <span style="float:right; clear:both;"
                                                            onclick="goumai('${rc.goodsId}')">
                                                         <a  href="javascript:void(0)">
                                                            ￥${rc.goodsPrice}
                                                            &nbsp;&nbsp;&nbsp;&nbsp;购买
                                                         </a>
                                                    </span>
                                                </c:if>

                                            </c:otherwise>
                                        </c:choose>


                                        <%--<span data-v-b7d09246="" class="font-s color-light "><img--%>
                                                <%--data-v-b7d09246=""--%>
                                                <%--src="<%=basePath%>/plugins/receptionfile/img/pinglun.png"--%>
                                                <%--alt="" style="transform: translateY(2px);"/>rc.comment</span>--%>


                                    </div>
                                    <div data-v-b7d09246=""
                                         class="bottom-info  border-top  float-left width-100 position-relative">
                                        <div data-v-b7d09246="" class="author float-left">
                                            <img data-v-b7d09246=""
                                                 src="https://studyapi.codepku.com/img/default_avatar/0714/20180714163614.png"
                                                 alt="" class="border-radius-50" style="width: 30px;"/>
                                            <span data-v-b7d09246=""
                                                  class="font-s inline-block vertical-top margin-top-s">${rc.makerName}</span>
                                        </div>
                                        <time data-v-b7d09246=""
                                              class="color-light position-absolute vertical-top font-s margin-top-s"
                                              style="right: 16px;"><fmt:formatDate pattern="yyyy-MM-dd"
                                                                  value="${rc.uploadTime}" />
                                        </time>
                                    </div>
                                    <div data-v-b7d09246="" class="position-absolute shadow-operate">
                                        <div data-v-b7d09246=""
                                             class="select-boxs cursor-pointer border-radius-50">
                                            <!---->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                        <div id="pagetab" data-v-6c71e3f8="">

                        </div>
                </div>
            </div>
        </div>

    </div>
</div>

                    </c:when>
                    <c:otherwise>
<div data-v-6f8b1b76="" data-v-41369d32="" class="container">
<div data-v-6f8b1b76="" data-v-41369d32="" class="margin-top-xl" style="min-height: 500px;">
    <div data-v-6c71e3f8="" data-v-6f8b1b76="" class="absolute_center">
                        <img src="<%=basePath%>/plugins/receptionfile/img/nolist.png" alt=""/>
                        <p data-v-72506126="" class="margin-top-m" style="color: rgb(110, 134, 163);">一个视频都没有</p>
    </div>
</div>
</div>
                    </c:otherwise>
                    </c:choose>
<script>

    function MakePoster(video,$item){
        //canvas转Blob
        var dataURLtoBlob=function (dataurl) {
            var arr = dataurl.split(','),
                mime = arr[0].match(/:(.*?);/)[1],
                bstr = atob(arr[1]),
                n = bstr.length,
                u8arr = new Uint8Array(n);
            while(n--) {
                u8arr[n] = bstr.charCodeAt(n);
            }
            return new Blob([u8arr],{type:mime});
        };
        var scale = 0.7;//截图绽放比例
        var canvas = document.createElement("canvas");
        canvas.width = video.videoWidth * scale;
        canvas.height = video.videoHeight * scale;
        canvas.getContext('2d').drawImage(video, 0, 0, canvas.width,canvas.height);
        var imgsrc = canvas.toDataURL('image/jpeg',0.8);//第二个参数指图片质量
        var poster=dataURLtoBlob(imgsrc);//这是我们要上传的封面图片
        $drop.append('<img src="'+imgsrc+'">');//把图片显示到#drop里，实现封面的预览
        $item.src = poster;
    };
    $(function() {

        $(".video_first").each(function (i,item) {
            // debugger;
            // var html="<video src=\""+$(item).attr("video_first_src")+"\" controls ></video>";
            // var $drop = $("#drop1");
            // $drop.html("");
            // $drop.html("<div class='row'><div id='video' class='col-6'></div><div id='img' class='col-6'></div></div>");
            // var $video=$(html).appendTo($drop.find("#video"));
            // with($(html)){
            //     on("error",function(){console.log("加载"+$(item).attr('video_first_src')+"视频失败!请上传正确的视频！");return false;});
            //     on("loadeddata",function(){MakePoster($(html)[0],$(item));});
            // };
            debugger;
            var myPlayer = videojs("video_"+i);
            try{
                myPlayer.play();

            }catch (e) {
                console.error(e);
            }

        })

    });
</script>


<style>
    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 30%;
        width: 40%;
        height: 50%;
        border: 16px solid lightblue;
        background-color: white;
        z-index:1002;
        overflow: auto;
    }

    .video_white_content {
        display: none;
        position: absolute;
        top: 5%;
        left: 20%;
        width: 60%;
        height: 90%;
        border: 16px solid lightblue;
        background-color: white;
        z-index:1002;
        overflow: auto;
    }

</style>

<link rel="stylesheet" href="<%=basePath%>/plugins/kit-admin/css/layui.css" id="layui">
<script src="<%=basePath%>/plugins/kit-admin/layui.all.js"></script>

<link rel="stylesheet" href="${basePath}/plugins/Video5/css/video-js.min.css" rel="stylesheet" type="text/css">
<script src="${basePath}/plugins/Video5/js/video.min.js"></script>
<script>
    videojs.options.flash.swf = "${basePath}/plugins/Video5/js/video-js.swf";
</script>

<!-- 上架隐藏div -->
<div id="shangjiadiv" style="display: none" class="white_content">
    <div style="text-align: right; cursor: default; height: 40px;">
        <a href="javascript:void(0)" style="font-size: 16px;" onclick="cancelShangJia()">关闭</a>
    </div>
    <div class="el-form-item__label" style="margin-bottom: 20px;fonts-size:30px;width: 100%;text-align: center;">上架</div>

    <input type="hidden" id = "shangjiaid">
    <div class="msgbox-body">
        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">卖价</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入视频描述" maxlength="100"
                           id = "goods_price" class="el-input__inner" required>
                </div>
                <!---->
                <!---->
            </div>
        </div>
    </div>
    <div class="msgbox-footer" style="margin-left:35%;margin-top: 30px;">
        <button type="button" class="layui-btn"  onclick="goToShangJia()">上架</button>
        <button type="button" class="layui-btn" onclick="cancelShangJia()">取消</button>
    </div>
</div>

<!-- 购买隐藏div -->
<div id="GouMaidiv" style="display: none" class="white_content">
    <div style="text-align: right; cursor: default; height: 40px;">
        <a href="javascript:void(0)" style="font-size: 16px;" onclick="cancelGouMai()">关闭</a>
    </div>
    <div class="el-form-item__label" style="margin-bottom: 20px;fonts-size:30px;width: 100%;text-align: center;">购买</div>

    <input type="hidden" id = "videoId">
    <div class="msgbox-body">

        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">选择折扣</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <select name="discountId" class="form-control reg-mobile" id="discountId"
                            required>
                        <option value="" >请选择</option>
                        <c:choose>
                            <c:when test="${!empty discounts}">
                                <c:forEach items="${discounts}" var="discount">
                                    <option value="${discount.id}">${discount.discountName}</option>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <option value="" >暂无</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
                <!---->
                <!---->
            </div>
        </div>
    </div>
    <div class="msgbox-footer" style="margin-left:35%;margin-top: 30px;">
        <button type="button" class="layui-btn" onclick="goToGouMai()">购买</button>
        <button type="button" class="layui-btn" onclick="cancelGouMai()">取消</button>
    </div>
</div>

<!-- 上传视频 -->
<div id="UploadVideoDiv" style="display: none" class="video_white_content">
    <div style="text-align: right; cursor: default; height: 40px;">
        <a href="javascript:void(0)" style="font-size: 16px;" onclick="cancelUploadVideo()">关闭</a>
    </div>
    <div class="el-form-item__label" style="margin-bottom: 20px;fonts-size:30px;width: 100%;text-align: center;">上传视频</div>



    <div class="msgbox-body">
        <!-- 作品名称 -->
        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">视频名称</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入视频名" maxlength="25"
                          id = "upload_works_name" class="el-input__inner">
                </div>
                <!---->
                <!---->
            </div>
        </div>

        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">视频描述</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入视频描述" maxlength="100"
                           id = "upload_works_describe" class="el-input__inner">
                </div>
                <!---->
                <!---->
            </div>
        </div>


        <div class="el-form-item" style="width: 90%;">
            <label class="el-form-item__label" style="width: 80px;margin-left: 30px;">
                <button type="button"  class="layui-btn"
                        id="uploadVideoButton">
                    上传视频
                </button>
            </label>
            <div class="el-form-item__content" style="margin-left: 130px;">
                <input autocomplete="off" placeholder="视频文件名称" maxlength="16"
                    id = "upload_works_name1" disabled = "disabled" style="width: 60%;" class="el-input__inner">
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 30px;">
            <video id="upload_video_show" class="video-js vjs-default-skin vjs-big-play-centered" controls
                   preload="none" width="640"
                height="264" data-setup=''>
                <source id="mp4source" src="http://视频地址格式1.mp4" type='video/mp4' />
                <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
            </video>
        </div>
        <input type="hidden" name="upload_works_url" id="upload_works_url">
    </div>
    <div class="msgbox-footer" style="margin-left:35%;">
        <button type="button" class="layui-btn"  id="goToUploadVideo">提交上传</button>
        <button type="button" class="layui-btn" onclick="cancelUploadVideo()">取消上传</button>
    </div>
</div>

<!-- 编辑视频-->
<div id="EditVideoDiv" style="display: none" class="video_white_content">

    <div style="text-align: right; cursor: default; height: 40px;">
        <a href="javascript:void(0)" style="font-size: 16px;" onclick="cancelEditVideo()">关闭</a>
    </div>
    <div class="el-form-item__label" style="margin-bottom: 20px;fonts-size:30px;width: 100%;text-align: center;">编辑视频
    </div>

    <input type="hidden" id = "EditVideoId">

    <div class="msgbox-body">
        <!-- 作品名称 -->
        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">视频名称</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入视频名" maxlength="25"
                           id = "edit_works_name" class="el-input__inner">
                </div>
                <!---->
                <!---->
            </div>
        </div>

        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">视频描述</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入视频描述" maxlength="100"
                           id = "edit_works_describe" class="el-input__inner">
                </div>
                <!---->
                <!---->
            </div>
        </div>


        <div class="el-form-item" style="width: 90%;">
            <label class="el-form-item__label" style="width: 80px;margin-left: 30px;">
                <button type="button"  class="layui-btn"
                        id="editVideoButton">
                    上传视频
                </button>
            </label>
            <div class="el-form-item__content" style="margin-left: 130px;">
                <input autocomplete="off" placeholder="视频文件名称" maxlength="16"
                       id = "edit_works_name1" disabled = "disabled" style="width: 60%;" class="el-input__inner">
            </div>
        </div>
        <div class="layui-form-item" style="margin-left: 30px;">
            <video id="edit_video_show" class="video-js vjs-default-skin vjs-big-play-centered" controls
                   preload="none" width="640"
                   height="264" data-setup=''>
                <source id="editvideourl"  src="http://视频地址格式1.mp4" type='video/mp4' />
                <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
            </video>
        </div>
        <input type="hidden" name="edit_works_url" id="edit_works_url">
    </div>
    <div class="msgbox-footer" style="margin-left:35%;">
        <button type="button" class="layui-btn"  id="goToEidtVideo">提交编辑</button>
        <button type="button" class="layui-btn" onclick="cancelEditVideo()">取消编辑</button>
    </div>
</div>

</body>
<script>

    $(function () {
        $("#pagetab").load("${basePage}/m/pagetab?totalPage=${totalPage}&currentPage=${currentPage}&url=${url}");
    })
    var getToDetail = function (type,id) {
        $("#root_main").load("${basePage}/m/rcourseDetail?type="+type+"&id="+id);
    }

    var shangjia = function (bo,id) {
        if(bo == 0){
        //下架
            $.post("${basePath}/m/xiajia",
                    {
                        id : id
                    },
                function (data) {
                    if(data.status == 200){
                        alert("下架成功");
                        $("#root_main").load("/m/worksList");
                    }else{
                        alert(data.message);
                    }
                }
            )
        }else if(bo == 1){
            $("#shangjiaid").val(id);
            $("#shangjiadiv").show();
        }
    }
    function cancelShangJia(){
        $("#shangjiaid").val("");
        $("#goods_price").val("")
        $("#shangjiadiv").hide();
    }

    function goToShangJia(){
        //去上架
        var price = $("#goods_price").val();
        if(price == "" || isNaN(price) || parseFloat(price) <0){
            alert("请输入正确的卖价");
            return false;
        }
        var id = $("#shangjiaid").val();
        $.post("${basePath}/m/shangjia",
                {
                    id : id,
                    goods_price : price
                },
                function (data) {
                    if(data.status == 200){
                        alert("上架成功");
                        $("#shangjiaid").val("");
                        $("#goods_price").val("")
                        $("#shangjiadiv").hide();
                        $("#root_main").load("/m/worksList");
                    }else{
                        alert(data.message);
                    }
                }
            )
    }
    function goumai(id) {
        $("#videoId").val(id);
        $("#GouMaidiv").show();
    }
    function cancelGouMai() {
        $("#videoId").val("");
        $("#GouMaidiv").hide();
    }
    function goToGouMai() {
        var discountId = $("#discountId").val();

        var videoId = $("#videoId").val();
    $.post("${basePath}/m/goToGouMai",
            {
                goodsId : videoId,
                discountId : discountId
            },
            function (data) {
                if(data.status == 200){
                    alert("购买成功");
                    $("#videoId").val("");
                    $("#GouMaidiv").hide();
                }else{
                    alert(data.message);
                }
            }
        )
    }

    //去上传视频窗口
    var gotoUpload = function(){

        $("#UploadVideoDiv").show();
    }
    //关闭上传视频窗口
    var cancelUploadVideo = function () {
        $("#UploadVideoDiv").hide();
    }

    //去修改视频窗口
    var gotoEdit = function (id,worksname,worksdescribe,worksurl) {
        $("#EditVideoId").val(id);
        $("#edit_works_name").val(worksname);
        $("#edit_works_describe").val(worksdescribe);
        $("#edit_works_url").val(worksurl);
        var myPlayer1 = videojs('edit_video_show');
        myPlayer1.src(worksurl);
        myPlayer1.load(worksurl);
        myPlayer1.play();
        setTimeout(function(){
            myPlayer1.pause();
        }, 1000)
        $("#EditVideoDiv").show();
    }
    //关闭修改视频窗口
    var cancelEditVideo = function () {
        $("#EditVideoDiv").hide();
    }

    //删除未上架的视频
    var gotoDel = function (id) {
        $.post("${basePath}/m/worksDel",
            {
                id : id
            },function (data) {
                if(data.status!=200){
                    alert(data.message);
                }
                if(data.status==200){
                    alert("删除成功");
                    $("#root_main").load('${url}');
                }
            })
    }
</script>
<script>
    layui.
    <%--config({--%>
        <%--base: '${basePath}/plugins/simpleajax/'//模块存放的目录--%>
    <%--}).--%>
    use(['form','upload','jquery'], function(){
        var form = layui.form ,layer = layui.layer;
        var $ = layui.jquery
            ,upload = layui.upload;

        //视频上传
        var uploadInst = upload.render({
            elem: '#uploadVideoButton'
            ,url: '/upload/add'
            ,accept: 'file'
            // ,auto : false
            //,exts: 'jpg|png|jpeg'
            ,before: function(obj){//自动上传用before，禁止自动上传用choose
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    var ext = file["name"].substring(file["name"].lastIndexOf(".")+1).toLowerCase();
                    if("mp4"!=ext && "webm"!=ext){
                        alert('请上传mp4或webm格式视频');
                        return false;
                    }
                    var size = file["size"];
                    if(300*1024*1024<size){
                        alert('请上传小于300M的视频');
                        return false;
                    }
                    var name = file["name"];
                    $("#upload_works_name").val(name);
                    $("#upload_works_name1").val(name);
                    //videojs("example_video", {}, function() {
                    // window.myPlayer = this;
                    //$("#mp4source").attr("src", result);
                    var myPlayer = videojs('upload_video_show');
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
                $("#upload_works_url").val(res.path);
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
        $("#goToUploadVideo").on('click',function(){
            $.post("${basePath}/m/worksAdd",
                {
                    worksName : $("#upload_works_name").val(),
                    worksDescribe   : $("#upload_works_describe").val(),
                    worksUrl : $("#upload_works_url").val()
                },function(data){
                // 获取 session
                if(data.status!=200){
                    alert(data.message);
                }
                if(data.status==200){

                    alert("上传成功");
                    $("#UploadVideoDiv").hide();
                    $("#root_main").load('${url}');
                }
            });
        });

        //视频编辑
        var uploadInst1 = upload.render({
            elem: '#editVideoButton'
            ,url: '/upload/add'
            ,accept: 'file'
            // ,auto : false
            //,exts: 'jpg|png|jpeg'
            ,before: function(obj){//自动上传用before，禁止自动上传用choose
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    var ext = file["name"].substring(file["name"].lastIndexOf(".")+1).toLowerCase();
                    if("mp4"!=ext && "webm"!=ext){
                        alert('请上传mp4或webm格式视频');
                        return false;
                    }
                    var size = file["size"];
                    if(300*1024*1024<size){
                        alert('请上传小于300M的视频');
                        return false;
                    }
                    var name = file["name"];
                    $("#edit_works_name").val(name);
                    $("#edit_works_name1").val(name);
                    //videojs("example_video", {}, function() {
                    // window.myPlayer = this;
                    //$("#mp4source").attr("src", result);
                    var myPlayer = videojs('edit_video_show');
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
                $("#edit_works_url").val(res.path);
                //上传成功
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst1.upload();
                });
            }
        });
        //监听提交，发送请求
        $("#goToEidtVideo").on('click',function(){
            $.post("${basePath}/m/worksEdit",
                {
                    id : $("#EditVideoId").val(),
                    worksName : $("#edit_works_name").val(),
                    worksDescribe   : $("#edit_works_describe").val(),
                    worksUrl : $("#edit_works_url").val()
                },function(data){
                    // 获取 session
                    if(data.status!=200){
                        alert(data.message);
                    }
                    if(data.status==200){
                        alert("编辑成功");
                        $("#EditVideoDiv").hide();
                        $("#root_main").load('${url}');
                    }
                });
        });

    });
</script>
</html>