<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<html>
<head>

    <link href="<%=basePath%>/plugins/receptionfile/css/app.css" rel="stylesheet"/>
    <script src="<%=basePath%>/js/jquery.js"></script>

    <link rel="stylesheet" href="<%=basePath%>/plugins/Video5/css/video-js.min.css" rel="stylesheet" type="text/css">
    <script src="<%=basePath%>/plugins/Video5/js/video.min.js"></script>

    <script>
        videojs.options.flash.swf = "${basePath}/plugins/Video5/js/video-js.swf";
    </script>
</head>
<body>
<div class="container padding-top-m">

    <div id="comment-top-box" class="bg-white">
        <div id="titleTop" class="top-info clearfix">
                <span class="title">
                    ${video.courseName}
                </span>
        </div>
        <div class="flex work-detail">
            <div id="frameBox" class="work-main flex-item margin-right">
                <video id="works_video" style="width:100%; height:100%; object-fit: fill"
                       class="video-js vjs-default-skin vjs-big-play-centered" controls
                       preload="none" width="100%"
                       height="100%" >
                    <source id="mp4source" src="${video.courseUrl}" type='video/mp4' />
                    <track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                    <track kind="subtitles" src="demo.captions.vtt" srclang="en" label="English"></track><!-- Tracks need an ending tag thanks to IE9 -->
                </video>
            </div>
            <div class="float-left flex-item margin-left-xl author-infos padding-m">
                <div class="author-info align-center padding-top padding-bottom">
                    <c:if test="${!empty muser}">
                        <c:choose>
                            <c:when test="${isUser == 0}">
                                <img class="author-avatar border-radius-50" style="width: 182px;height: 146px;"
                                     src="${muser.touxiang}">
                            </c:when>
                            <c:otherwise>
                                <img class="author-avatar border-radius-50" style="width: 182px;height: 146px;"
                                              src="<%=basePath%>/plugins/receptionfile/img/nolist.png">
                            </c:otherwise>
                        </c:choose>
                        <b class="inline-block width-100 margin-top">${muser.nickname}</b>
                    </c:if>

                </div>
                <h3 class="margin-top-xl align-center">
                    <span class="padding-bottom">
                        视频介绍
                    </span>
                </h3>
                <p class="padding-top-m padding-bottom-m work-state color-gray">
                    ${video.courseDescribe}
                </p>
            </div>

        </div>

        <div class="bg-white margin-top padding-m position-relative">
            <div class="inline-block cursor-pointer">

            </div>
            <%--<div class="inline-block position-relative margin-left-s">--%>
                <%--<span class="color-gray">点赞</span>--%>
                <%--<span class="color-gray">28</span>--%>
            <%--</div>--%>
            <div class="work-status color-gray inline-block margin-left-l">
                <div class="inline-block">
                    <img data-v-b7d09246="" src="http://localhost:8080//plugins/receptionfile/img/hits.png" alt="">
                    <span>&nbsp;&nbsp;${video.hits}</span>
                </div>
                <%--<div class="inline-block margin-left">--%>
                    <%--<i class="fa fa-commenting-o">--%>
                    <%--</i>--%>
                    <%--<span>&nbsp;&nbsp;20</span>--%>
                <%--</div>--%>
                <div class="margin-left-xl inline-block">
                    <span>发布时间：
                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${video.uploadTime}" />
                    </span>
                </div>
            </div>
        </div>
        <div id="comment_page" class="bg-white margin-top padding-m comment-box" >
        </div>
    </div>

</div>


</body>
<script>
$(function () {
    $("#comment_page").load("/m/commentdeatil?id=${id}&type=${type}");
    var myPlayer = videojs('works_video');
    try{
        myPlayer.play();
        setTimeout(function(){
            myPlayer.pause();
        }, 100)
    }catch (e) {
        console.error(e);
    }

})

</script>
</html>