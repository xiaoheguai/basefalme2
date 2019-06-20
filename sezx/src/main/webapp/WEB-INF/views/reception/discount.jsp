<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<div data-v-968758ba="" class="study-progress">
    <h3 data-v-968758ba="" class="bg-sky-blue padding-left padding-right position-relative"><img data-v-968758ba="" src="<%=basePath%>/plugins/receptionfile/img/discount.png" alt="" style="top: 0px;" /> <span data-v-968758ba="" class="color-white vertical-top inline-block font-bold-500">我的订单</span>
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
                            <div role="tablist" class="el-tabs__nav is-top" style="transform: translateX(0px);">
                                <div class="el-tabs__active-bar is-top" style="width: 42px; transform: translateX(68px);"></div>
                                <div id="tab-0" aria-controls="pane-0" role="tab" tabindex="-1" class="el-tabs__item is-top">
                                    全部
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="el-tabs__content">
                    <div data-v-ad92c926="" role="tabpanel" id="pane-0" aria-labelledby="tab-0" class="el-tab-pane" aria-hidden="true" style="display: none;"></div>
                    <div data-v-ad92c926="" role="tabpanel" id="pane-1" aria-labelledby="tab-1" class="el-tab-pane" style=""></div>
                    <div data-v-ad92c926="" role="tabpanel" id="pane-2" aria-labelledby="tab-2" class="el-tab-pane" aria-hidden="true" style="display: none;"></div>
                    <div data-v-ad92c926="" role="tabpanel" id="pane-3" aria-labelledby="tab-3" class="el-tab-pane" aria-hidden="true" style="display: none;"></div>
                </div>
            </div>
            <div data-v-0d926490="" data-v-ad92c926="" element-loading-text="努力加载中..." class="">
                <div data-v-0d926490="" class="el-table el-table--fit el-table--striped el-table--enable-row-hover" style="width: 100%;">
                    <div class="hidden-columns">
                        <!---->
                        <!---->
                        <!---->
                        <div data-v-0d926490="" highlight-current-row=""></div>
                        <!---->
                        <div data-v-0d926490="" highlight-current-row=""></div>
                        <div data-v-ad92c926=""></div>
                        <!---->
                        <!---->
                        <div data-v-0d926490="" highlight-current-row=""></div>
                        <!---->
                        <div data-v-0d926490="" highlight-current-row=""></div>
                        <!---->
                        <div data-v-0d926490="" highlight-current-row=""></div>
                        <!---->
                        <div data-v-ad92c926=""></div>
                        <!---->
                    </div>
                    <div class="el-table__empty-block" style="width: 1020px;">
                        <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 1020px;">
                            <colgroup>
                                <%--<col name="el-table_3_column_16" width="80" />--%>
                                <col name="el-table_3_column_17" width="174" />
                                <col name="el-table_3_column_18" width="173" />
                                <col name="el-table_3_column_19" width="180" />
                                <col name="el-table_3_column_20" width="180" />
                                <%--<col name="el-table_3_column_21" width="160" />--%>
                                <%--<col name="el-table_3_column_22" width="173" />--%>
                                <%--<col name="gutter" width="0" />--%>
                            </colgroup>
                            <thead >
                            <tr class="">
                                <%--<th colspan="1" rowspan="1" class="el-table_3_column_16     is-leaf">--%>
                                    <%--<div class="cell">--%>

                                    <%--</div></th>--%>
                                <th colspan="1" rowspan="1" class="el-table_3_column_17     is-leaf">
                                    <div class="cell">
                                        折扣名称
                                    </div></th>
                                <th colspan="1" rowspan="1" class="el-table_3_column_18     is-leaf">
                                    <div class="cell">
                                        折扣公式
                                    </div></th>
                                <th colspan="1" rowspan="1" class="el-table_3_column_19     is-leaf">
                                    <div class="cell">
                                        开始时间
                                    </div></th>
                                <th colspan="1" rowspan="1" class="el-table_3_column_20     is-leaf">
                                    <div class="cell">
                                        结束时间
                                    </div></th>
                                <%--<th colspan="1" rowspan="1" class="el-table_3_column_21     is-leaf">--%>
                                    <%--<div class="cell">--%>
                                        <%--订单时间--%>
                                    <%--</div></th>--%>
                                <%--<th colspan="1" rowspan="1" class="el-table_3_column_22     is-leaf">--%>
                                    <%--<div class="cell">--%>
                                        <%--操作--%>
                                    <%--</div></th>--%>
                                <%--<th class="gutter" style="width: 0px; display: none;"></th>--%>
                            </tr>
                            </thead>
                        </table>
                    </div>

                        <div class="el-table__empty-block" style="width: 1020px;">
                            <table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 1020px;">
                                <colgroup>
                                    <%--<col name="el-table_3_column_16" width="80" />--%>
                                    <col name="el-table_3_column_17" width="174" />
                                    <col name="el-table_3_column_18" width="173" />
                                    <col name="el-table_3_column_19" width="180" />
                                    <col name="el-table_3_column_20" width="180" />
                                    <%--<col name="el-table_3_column_21" width="160" />--%>
                                    <%--<col name="el-table_3_column_22" width="173" />--%>
                                </colgroup>
                                <tbody class="has-gutter">
                                <c:choose >
                                    <c:when test="${!empty discounts}">
                                <c:forEach items="${discounts}" var="discount">
                                <tr class="">
                                        <%--<th colspan="1" rowspan="1" class="el-table_3_column_16     is-leaf">--%>
                                        <%--<div class="cell">--%>

                                        <%--</div></th>--%>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_17     is-leaf">
                                        <div class="cell">
                                            ${discount.discountName}
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_18     is-leaf">
                                        <div class="cell">
                                                ${discount.discountExpression}
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_19     is-leaf">
                                        <div class="cell">
                                                <c:choose >
                                                    <c:when test="${!empty discount.beginTime}">
                                                        <fmt:formatDate pattern="yyyy-MM-dd"  value="${discount.beginTime}" />
                                                    </c:when>
                                                </c:choose>

                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_20     is-leaf">
                                        <div class="cell">
                                                <c:choose >
                                                    <c:when test="${!empty discount.endTime}">
                                                        <fmt:formatDate pattern="yyyy-MM-dd"  value="${discount.endTime}" />
                                                    </c:when>
                                                </c:choose>
                                        </div></th>
                                    <th class="gutter" style="width: 0px; display: none;"></th>
                                </tr>
                                </c:forEach>

                                    </c:when>
                                    <c:otherwise>
                                        <span class="el-table__empty-text">暂无数据</span>
                                    </c:otherwise>
                                </c:choose>
                                </tbody>
                            </table>

                        </div>
                        <!---->
                    <!---->
                    <!---->
                    <!---->
                    <!---->
                    <div class="el-table__column-resize-proxy" style="display: none;"></div>
                </div>
                <!---->

            </div>
        </div>
    </div>
</div>

