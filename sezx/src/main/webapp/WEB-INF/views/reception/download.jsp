
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>

<div data-v-968758ba="" class="study-progress">
    <h3 data-v-968758ba="" class="bg-sky-blue padding-left padding-right position-relative">
        <img data-v-968758ba="" src="<%=basePath%>/plugins/receptionfile/img/dowmload.png" alt="" style="" /> <span
            data-v-968758ba="" class="color-white vertical-top inline-block font-bold-500">我的下载</span>
        <div data-v-968758ba="" class="position-absolute" style="right: 10px; top: 0px;">
            <button data-v-968758ba="" onclick="gotoindex()" type="button" class="el-button color-white height-100 el-button--text">
                <!---->
                <!----><span>返回首页</span></button>
        </div></h3>
    <div data-v-968758ba="" class="margin-top-m">

        <div data-v-194bfcaa="" data-v-968758ba="" class="bg-white margin-top padding-l download-list">
            <div data-v-194bfcaa="" class="el-tabs el-tabs--top">
                <div class="el-tabs__header is-top">
                    <div class="el-tabs__nav-wrap is-top">
                        <div class="el-tabs__nav-scroll">
                            <div role="tablist" class="el-tabs__nav is-top" style="transform: translateX(0px);">
                                <div class="el-tabs__active-bar is-top" style="width: 42px; transform: translateX(0px);"></div>


                            </div>
                        </div>
                    </div>
                </div>
                <div class="el-tabs__content">
                    <c:forEach items="${downloads}" var="download">
                    <div data-v-194bfcaa="" role="tabpanel" id="pane-browser" aria-labelledby="tab-browser" class="el-tab-pane">
                        <div data-v-194bfcaa="" class="download-item">

                            <div data-v-194bfcaa="" class="download-text2">
                                <div data-v-194bfcaa="" class="download-btn">
                                    <button data-v-194bfcaa="" type="button" class="el-button el-button--primary el-button--mini is-plain">
                                        <!---->
                                        <!----><span>
                                                <a data-v-194bfcaa="" href="<%=basePath%>/${download.fileUrl}"
                                                   target="_blank" download="${download.fileName}">
                                                        ${download.fileName}
                                                </a>
                                               </span>
                                    </button>

                                </div>
                                <p data-v-194bfcaa="" class="color-gray" style="line-height: 40px;">
                                        ${download.fileDescribe}
                                </p>

                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>