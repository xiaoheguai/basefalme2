<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<link rel="stylesheet" href="<%=basePath%>/plugins/kit-admin/css/layui.css" id="layui">
<script src="<%=basePath%>/js/jquery.js"></script>
<script src="<%=basePath%>/plugins/kit-admin/layui.all.js"></script>
    <div data-v-968758ba="" class="study-progress">
        <h3 data-v-968758ba="" class="bg-sky-blue padding-left padding-right position-relative"><img data-v-968758ba="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAuCAMAAABzsJvxAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAADbUExURUxpcR+C8ABr4Qlw5f3vsSKE8fznifzrm/vicwty5lua4/vid/vlgyGD8fvhcvzkgABr4QBr4fztpP3zwiKE8QBr4QBr4fraU/zokx5/5SKE8QBr4f5WXndhpPrQJvrUOYZgnAx05wJs4/raUxFq2Bp/7vjMGvrYSPnMEfvfaPrcXSOE7v///0md+zqT9jSC4o9tqNpcdH6ikSdqy/BXZv720XeYfGBjsKCtaqVdjO/QQMZae5SjYliTrt/AIL23Ts3BV//88ca4PndyuVCUxTxmwk9kuIlgmrO5cyad5X0AAAAzdFJOUwDT8Yj68BX6/nUHXf4j6qmtJjz6rMjdh4zz/////////////////////////////////oXiGmoAAAG0SURBVDjLnZTZcoIwFEARkbjgvg4BCxQsKi2K+273/v8XNQGREIN0el4yE453yY3huEQaQolLpygIgpiu9cACVNM1ABwBpFoNCWlS464jiiKQmg6QqmJieaVqJY8AjiOhpVKp9pgdD4f5ZnPx6jjCMIQZbVTB0gKMQtjn132M073s12s8JPGeSLxa3bcKkMbbPoRsPQh55JUz8i0/V+1soJ/VuPKYYcnnfsh2jDyeY8WS3X7Eh4XCcTmWdhhEeDLW/G1LN2ItLG3E2+GEl/VVswyq071tD5YQGt7Atk9XTacPZHncz/Cqu+tjFM2ACRh+SaEGoRWVb5He/zRzqihzVI65U0JWDG2KP+xUNbIUJUmjYGjuracyNFSVaW5QfZ9mCKsFuNI0DWqbGV4JJhOX1CY4zcR1329yT0lNSUYmhqUmWkQ0NPovVVXnaHejxrjU1iEv0myufMcnb106zQa3l76WgaRfJo21lpyGhSyunEvTjAL+M5dbd0UrsCieA9IeyZeAe093FmUfB+B0GbZW8E86wK+qzQxGd6J3EoPdHgQN/ebofPEPmg4L7BbasYnyWTLYL2vgjYly9C9GAAAAAElFTkSuQmCC" alt="" style="top: 0px;" /> <span data-v-968758ba="" class="color-white vertical-top inline-block font-bold-500">我的订单</span>
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
                                    <div onclick="getData(2)" id="tab-2" aria-controls="pane-0" role="tab"
                                         class="el-tabs__item is-top">
                                        全部
                                    </div>
                                    <div onclick="getData(1)" id="tab-1" aria-controls="pane-1" role="tab"
                                         class="el-tabs__item is-top" aria-selected="true">
                                        已完成
                                    </div>
                                    <div id="tab-0" onclick="getData(0)" aria-controls="pane-2" role="tab"
                                         class="el-tabs__item is-top is-active">
                                        待支付
                                    </div>

                                </div>
                            </div>
                        </div>
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
                        <div class="el-table__header-wrapper">
                            <table cellspacing="0" cellpadding="0" border="0" class="el-table__header" style="width: 1020px;">
                                <colgroup>
                                    <col name="el-table_3_column_16" width="80" />
                                    <col name="el-table_3_column_17" width="174" />
                                    <col name="el-table_3_column_18" width="173" />
                                    <col name="el-table_3_column_19" width="130" />
                                    <col name="el-table_3_column_20" width="130" />
                                    <col name="el-table_3_column_21" width="160" />
                                    <col name="el-table_3_column_22" width="173" />
                                    <col name="gutter" width="0" />
                                </colgroup>
                                <thead class="has-gutter">
                                <tr class="">
                                    <th colspan="1" rowspan="1" class="el-table_3_column_16     is-leaf">
                                        <div class="cell">
                                            状态
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_17     is-leaf">
                                        <div class="cell">
                                            订单号
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_18     is-leaf">
                                        <div class="cell">
                                            商品信息
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_19     is-leaf">
                                        <div class="cell">
                                            订单价格(元)
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_20     is-leaf">
                                        <div class="cell">
                                            实付款(元)
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_21     is-leaf">
                                        <div class="cell">
                                            订单时间
                                        </div></th>
                                    <th colspan="1" rowspan="1" class="el-table_3_column_22     is-leaf">
                                        <div class="cell">
                                            操作
                                        </div></th>
                                    <th class="gutter" style="width: 0px; display: none;"></th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div id="dataDiv" class="el-table__body-wrapper is-scrolling-none">
                            <table cellspacing="0" cellpadding="0" border="0" class="el-table__body" style="width: 1020px;">
                                <colgroup>
                                    <col name="el-table_3_column_16" width="80" />
                                    <col name="el-table_3_column_17" width="174" />
                                    <col name="el-table_3_column_18" width="173" />
                                    <col name="el-table_3_column_19" width="130" />
                                    <col name="el-table_3_column_20" width="130" />
                                    <col name="el-table_3_column_21" width="160" />
                                    <col name="el-table_3_column_22" width="173" />
                                </colgroup>
                                <tbody id="DataConation">
                                <!---->

                                </tbody>
                            </table>
                            <!---->
                        </div>
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
<script>
    $(function () {
        getData(0);
    })

    var gotoPay = function(id){
        $.post("${basePath}/m/gotoPay",
            {
                id : id
            },
            function (data) {
                if(data.status == 200){
                    alert('支付成功！');
                    getData(0);
                }else{
                    alert(data.message);
                    getData(0);
                }
            }
        )
    }
    //type 0:未支付 1:已支付 2:全部
    var getData = function (type){
        //根据type将相应变样式
        $("div[role='tab']").removeClass("is-active");
        $("#tab-"+type).addClass("is-active");
        $.post("${basePath}/m/getPurchaseXinXi",
            {
                type : type
            },function (data) {
                $("#DataConation").html("");
                $("#dataDiv table").next().remove();
                var json = eval(data);
                var html = "";
                if(json.length>0){
                    for(var i = 0;i<json.length;i++){
                        html += '<tr class="">'
                                +'<th colspan="1" rowspan="1" class="el-table_3_column_16     is-leaf">'
                                +'<div class="cell">';
                           // +'状态'
                        if(json[i].isPayment == 0){
                            html += '未支付';
                        }else if(json[i].isPayment == 1){
                            html += '支付成功';
                        }else if(json[i].isPayment == 2){
                            html += '付款失败';
                        }
                            html +='</div></th>'
                                +'<th colspan="1" rowspan="1" class="el-table_3_column_17     is-leaf">'
                                +'<div class="cell">'
                            //订单编号
                            +json[i].id
                                +'</div></th>'
                                +'<th colspan="1" rowspan="1" class="el-table_3_column_18     is-leaf">'
                                +'<div class="cell">'
                            //商品信息
                            +json[i].goodsName
                                +'</div></th>'
                                +'<th colspan="1" rowspan="1" class="el-table_3_column_19     is-leaf">'
                                +'<div class="cell">'
                            //+'订单价格'
                            +json[i].totalAmount
                                +'</div></th>'
                                +'<th colspan="1" rowspan="1" class="el-table_3_column_20     is-leaf">'
                                +'<div class="cell">'
                            //+'实付款'
                            +json[i].discountAmount
                                +'</div></th>'
                                +'<th colspan="1" rowspan="1" class="el-table_3_column_21     is-leaf">'
                                +'<div class="cell">'
                            //+'订单时间'
                            +json[i].purchaseTime
                                +'</div></th>'
                                +'<th colspan="1" rowspan="1" class="el-table_3_column_22     is-leaf">'
                                +'<div class="cell">'
                            //+'操作':去支付，已支付

                        if(json[i].isPayment == 1){
                            html += '<a href="javascript:void(0)" class="el-button el-button--primary el-button--mini">'
                                    +'<span>已支付';
                        }else{
                            html +=
                                '<a href="javascript:void(0)" onclick="gotoPay(\''+json[i].id+'\')" class="el-button el-button--primary el-button--mini">'
                                    +'<span>去支付';
                        }
                            html += '</span>'
                                +'</a>'
                                +'</div></th>'
                                +'<th class="gutter" style="width: 0px; display: none;"></th>'
                                +'</tr>';
                    }
                    $("#DataConation").append(html);
                }else {
                    html = '<div class="el-table__empty-block" style="width: 1020px;">'
                            +'<span class="el-table__empty-text">暂无数据</span>'
                            +'</div>';
                    $("#dataDiv").append(html);
                }


            })
    }
</script>