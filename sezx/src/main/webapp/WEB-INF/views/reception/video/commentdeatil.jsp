<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<html>
<head>
</head>
<body>

    <h3 class="margin-bottom-m border-bottom padding-bottom-l">
        <span class="font-bold-400">实时评论</span>
        <div class="float-right">
            <a  href="#submitmessage" class="el-button el-button--primary el-button--mini">
                <span>评论</span>
            </a>
        </div>
    </h3>
    <div class="work-comment-list" >
        <c:if test="${!empty rootMap}">
        <c:forEach items="${rootMap}" var="root">
            <div class="work-comment border-bottom padding-bottom margin-bottom flex">
                <c:set var="userkey" value="${root.key}"></c:set>
                <c:if test="${!empty userVoMap[userkey]}">
                    <c:choose>
                        <c:when test="${root.value.userType != 2}">
                            <img class="comment-avatar border-radius-50" style="width: 60px;height: 60px;"
                                 src="${(userVoMap[userkey]).touxiang}">
                        </c:when>
                        <c:otherwise>
                            <img class="comment-avatar border-radius-50" style="width: 60px;height: 60px;"
                                 src="<%=basePath%>/plugins/receptionfile/img/nolist.png">
                        </c:otherwise>
                    </c:choose>

                </c:if>
                <c class="inline-block vertical-top margin-left flex-item">
                    <h6 class="font-bold-400 vertical-top width-100">
                        <c:if test="${!empty userVoMap[userkey]}">
                            <span class="inline-block font-m">
                                    ${(userVoMap[userkey]).nickname}
                            </span>
                        </c:if>
                        <time class="color-gray font-s margin-left-m">
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${root.value.commentTime}" />
                        </time>
                    </h6>
                    <p style="margin-left: 10px;margin-bottom: 20px;margin-top: 20px;font-size:
                    18px;">${root.value.message}</p>
                    <h6 class="color-gray font-bold-400">
                        <img onclick="huifu(this,'${root.value.id}',0)"
                             src="<%=basePath%>/plugins/receptionfile/img/comment.png">
                        <button onclick="huifu(this,'${root.value.id}',1)"  type="button"
                                class="el-button color-gray el-button--text el-button--small">
                            <span>回复</span>
                        </button>
                            <%--<div class="inline-block margin-left color-gray">--%>
                            <%--<button type="button"--%>
                            <%--class="el-button color-gray el-button--text el-button--small">--%>
                            <%--<span>条回复--%>
                            <%--<i class="el-icon-caret-bottom"></i>--%>
                            <%--</span>--%>
                            <%--</button>--%>
                            <%--</div>--%>
                    </h6>
                    <c:if test="${!empty rootMap}">
                    <c:forEach items="${childMap[userkey]}" var="child">
                        <c:set var="childkey" value="${child.userType}-${child.id}"></c:set>
                    <div  data-v-08ca7bae="" class="padding" data-old-padding-top=""
                          data-old-padding-bottom="" data-old-overflow="" style="">
                        <div data-v-08ca7bae="" class="work-comment border-bottom padding-bottom margin-bottom flex">

                            <c:if test="${!empty userVoMap[childkey]}">
                                <c:choose>
                                    <c:when test="${child.userType != 2}">
                                        <img data-v-08ca7bae="" src="${(userVoMap[childkey]).touxiang}"
                                             class="comment-avatar border-radius-50" style="width: 30px; height: 30px;">
                                    </c:when>
                                    <c:otherwise>
                                        <img data-v-08ca7bae="" src="<%=basePath%>/plugins/receptionfile/img/nolist.png"
                                             class="comment-avatar border-radius-50" style="width: 30px; height: 30px;">
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <div data-v-08ca7bae="" class="inline-block vertical-top margin-left flex-item">
                                <h6 data-v-08ca7bae="" class="font-bold-400 vertical-top width-100">
                                    <c:if test="${!empty userVoMap[childkey]}">
                                    <span data-v-08ca7bae="" class="inline-block font-n">
                                            ${(userVoMap[childkey]).nickname}
                                    </span>
                                    </c:if>
                                    <time data-v-08ca7bae="" class="color-gray font-s margin-left-m">
                                        <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"  value="${child.commentTime}" />
                                    </time>
                                </h6> <p data-v-08ca7bae="" style="margin-left: 5px;margin-bottom: 10px;margin-top:
                                10px;">
                                <p>${child.message}</p></p>
                                <h6 data-v-08ca7bae="" class="color-gray font-bold-400">

                                </h6> <!---->
                            </div>
                        </div>
                    </div>

                </c:forEach>
                    </c:if>
                </div>
            </div>
        </c:forEach>
        <div id="pages" class="el-pagination" style="margin-top: 20px; margin-bottom: 20px;">

        </div>
        </c:if>
    </div>
    <h3 class="font-bold-500 margin-bottom-m">
        <span class="comment-tit-name">我要评论</span>
    </h3>
    <form class="el-form" >
        <div class="el-form-item is-required">
            <div class="el-form-item__content">
                <textarea name="submitmessage" id="submitmessage"  cols="130" rows="10"></textarea>
            </div>
        </div>
    </form>
    <div onclick="fabiao(this,'')" class="position-relative width-100 inline-block" style="margin-bottom: 60px;
    margin-top: 20px;">
        <button  type="button" class="el-button el-button--primary el-button--small">
            <span>发&nbsp;&nbsp;&nbsp;&nbsp;表</span>
        </button>
    </div>
</div>
</body>
<script>
    var fabiao = function (obj,pId) {
        var $input = $(obj).prev().find("textarea");
        if($input.val() == null || $input.val() == ""){
                alert("请输入回复内容");
        }else{
            var worksId = '${commentVo.worksId}';
            var worksType = '${commentVo.worksType}';
            var addworksType = '${addworkType}';
            $.post("${basePath}/m/addComment",
                {
                    worksId :worksId,
                    worksType : addworksType,
                    pId : pId,
                    message : $input.val()
                },
                function(data) {
                    $("#comment_page").load("/m/commentdeatil?id="+worksId+"&type="+worksType);
                });

        }


    }
    var huifu = function (obj,pId,type) {
        var $isadd ;
        if(type == 0){
            $isadd =$(obj).next().next();
        }else{
            $isadd =$(obj).next();
        }

        if($isadd.length && $isadd.length>0){
            $isadd.remove();
            $isadd.next().remove();
        }else{
            var str = '<div><form class="el-form" >'
                        +'<div class="el-form-item is-required">'
                        +'<div class="el-form-item__content">'
                        +'<textarea name="submitmessage"  cols="130" rows="10"></textarea>'
                        +'</div>'
                        +'</div>'
                        +'</form>'
                        +'<div onclick="fabiao(this,\''+pId+'\')" class="position-relative width-100 inline-block"'
                        +'style="margin-bottom: 60px; margin-top: 20px;">'
                        +'<button  type="button" class="el-button el-button--primary el-button--small">'
                        +'<span>发&nbsp;&nbsp;&nbsp;&nbsp;表</span>'
                        +'</button>'
                        +'</div></div>';
            $(obj).parent().append(str);
        }

    }
    $(function () {
        $("#pages").load("${basePage}/m/pagetab?totalPage=${totalPage}&currentPage=${currentPage}&url='/m/'");
    })
</script>
</html>
