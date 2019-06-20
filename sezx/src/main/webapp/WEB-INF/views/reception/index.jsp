<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="org.apache.shiro.session.Session" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="shortcut icon" href="https://study.codepku.com/static/favicon.ico" />
    <title>少儿在线学习-个人中心</title>
    <link href="<%=basePath%>/plugins/receptionfile/more/c1.css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePath%>/plugins/kit-admin/css/layui.css">
    <script type="text/javascript" src="<%=basePath%>/plugins/receptionfile/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript"  async="" src="<%=basePath%>/plugins/kit-admin/layui.js"></script>
</head>
<body>
<div id="app">
    <div data-v-41369d32="">
        <header data-v-ff6185f2="" data-v-41369d32="" class="el-header width-100" style="height: 60px;">
            <div data-v-ff6185f2="" class="header-main">
                <ul data-v-ff6185f2="" role="menubar" class="float-left el-menu--horizontal el-menu" style="background-color: rgb(56, 138, 255);">
                    <li  data-v-ff6185f2="" role="menuitem" tabindex="0" class="el-menu-item is-active lihover"
                        style="color:
                    rgb(255, 208, 75); border-bottom-color: rgb(255, 208, 75); background-color: rgb(56, 138, 255);"
                        onclick="window.location.href='<%=basePath%>/m/index'">主页</li>
                    <!---->
                    <!---->
                    <li  onclick="reloadRootMain(this,'/m/rcourseList')"  data-v-ff6185f2=""
                         class="el-menu-item flex clicked lihover" style="color: rgb(255,
                    255, 255); border-bottom-color: transparent; background-color: rgb(56, 138, 255);"
                        style="z-index: 0;">必修课</li>

                    <li data-v-ff6185f2="" role="menuitem" tabindex="0" class="el-menu-item flex clicked lihover"
                        style="color: rgb(255,
                    255, 255); border-bottom-color: transparent; background-color: rgb(56, 138, 255);"
                        onclick="reloadRootMain(this,'/m/ccourseList')">试听课</li>
                    <li data-v-ff6185f2="" role="menuitem" tabindex="0" class="el-menu-item flex clicked lihover"
                        style="color: rgb(255,
                    255, 255); border-bottom-color: transparent; background-color: rgb(56, 138, 255);"
                        onclick="reloadRootMain(this,'/m/worksList')">我的作品</li>
                    <li data-v-ff6185f2="" role="menuitem" tabindex="0" class="el-menu-item flex clicked lihover"
                        style="color: rgb(255,
                    255, 255); border-bottom-color: transparent; background-color: rgb(56, 138, 255);"
                        onclick="reloadRootMain(this,'/m/allvideoList')">学习园地</li>

                </ul>
                <div data-v-ff6185f2="" class="box-right">
                    <div data-v-ff6185f2="" class="message-notice">
                        <div data-v-ff6185f2="" class="el-badge">
                            <%--<i data-v-ff6185f2="" class="iconfont icon-zixundianji"></i>--%>
                            <%--<sup class="el-badge__content is-fixed" style="display: none;">0</sup>--%>
                            <img src="<%=basePath%>plugins/receptionfile/img/password.png"
                                 style="width: 50px;height: 40px;" onclick="gotoUpdatePWD()">
                        </div>
                    </div>
                    <div data-v-ff6185f2="" class="user_info">
                        <div data-v-ff6185f2="" class="el-dropdown">
                            <span data-v-ff6185f2="" class="el-dropdown-link el-dropdown-selfdefine"
                                  aria-haspopup="list" aria-controls="dropdown-menu-6020" role="button"
                                  tabindex="0"><a data-v-ff6185f2="" href="javascript:void(0);"
                                                  class="router-link-exact-active router-link-active">
                                <img onclick="logout()" data-v-ff6185f2="" class="avatar"
                                        <c:choose>
                                            <c:when test="${muser.touxiang!=null && muser.touxiang!=''}">src="${muser.touxiang}"</c:when>
                                            <c:otherwise>src="<%=basePath%>/plugins/receptionfile/more/20180714163534.png"</c:otherwise>
                                        </c:choose>
                                /></a></span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <main id="root_main" data-v-41369d32="" class="el-main width-100" style="min-height: 550px;">
            <div data-v-968758ba="" data-v-41369d32="">
                <section data-v-968758ba="" class="el-container container padding-top-m">
                    <aside data-v-968758ba="" class="el-aside" style="width: 300px;">
                        <div data-v-968758ba="" class="up-box bg-sky-blue border-radius border padding-left-m padding-right-m padding-top-xl">
                            <div data-v-968758ba="" class="align-center">
                                <div data-v-2227e212="" data-v-968758ba="" class="edit-data">
           <span data-v-2227e212="">
            <i data-v-2227e212="" onclick="getPop()" class="el-icon-edit-outline el-popover__reference"
                     aria-describedby="el-popover-7051" tabindex="0"></i></span>
                                    <div data-v-2227e212="" class="dialog_wrap">
                                        <div data-v-4a59a58b="" data-v-2227e212="">
                                            <div data-v-4a59a58b="" class="el-dialog__wrapper" style="display: none;">
                                                <div class="el-dialog" style="width: 30%; margin-top: 15vh;">
                                                    <div class="el-dialog__header">
                                                        <span class="el-dialog__title">绑定微信</span>
                                                        <button type="button" aria-label="Close" class="el-dialog__headerbtn"><i class="el-dialog__close el-icon el-icon-close"></i></button>
                                                    </div>
                                                    <!---->
                                                    <!---->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div data-v-2227e212="" class="dialog_wrap">
                                        <div data-v-637b85d0="" data-v-2227e212="" class="el-dialog__wrapper align-left auth-dialog" style="display: none;">
                                            <div class="el-dialog" style="width: 30%; margin-top: 15%;">
                                                <div class="el-dialog__header">
                                                    <span class="el-dialog__title">验证手机</span>
                                                    <button type="button" aria-label="Close" class="el-dialog__headerbtn"><i class="el-dialog__close el-icon el-icon-close"></i></button>
                                                </div>
                                                <!---->
                                                <!---->
                                            </div>
                                        </div>
                                    </div>
                                    <div data-v-2227e212="" class="dialog_wrap">
                                        <div data-v-fd6198a8="" data-v-2227e212="" class="el-dialog__wrapper" style="display: none;">
                                            <div class="el-dialog" style="width: 35%; margin-top: 15vh;">
                                                <div class="el-dialog__header">
                                                    <span class="el-dialog__title">修改密码</span>
                                                    <button type="button" aria-label="Close" class="el-dialog__headerbtn"><i class="el-dialog__close el-icon el-icon-close"></i></button>
                                                </div>
                                                <!---->
                                                <div class="el-dialog__footer">
                                                    <div data-v-fd6198a8="">
                                                        <button data-v-fd6198a8="" type="button" class="el-button el-button--default el-button--mini">
                                                            <!---->
                                                            <!----><span>取消</span></button>
                                                        <button data-v-fd6198a8="" type="button" class="el-button el-button--primary el-button--mini">
                                                            <!---->
                                                            <!----><span>确定</span></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <img data-v-968758ba=""
                                     class="avatar border-radius-50 cursor-pointer"
                                        <c:choose>
                                            <c:when test="${muser.touxiang!=null && muser.touxiang!=''}">src="${muser.touxiang}"</c:when>
                                            <c:otherwise>src="<%=basePath%>/plugins/receptionfile/more/20180714163534.png"</c:otherwise>
                                        </c:choose>
                                      />
                                <h3 data-v-968758ba="" class="margin-top margin-bottom font-bold-500
                                color-white">${muser.nickname}</h3>
                                <h6 data-v-968758ba="" class="margin-top
                                margin-bottom font-bold-500 color-white">
                                    <c:choose>
                                        <c:when test="${muser.isStudent==0}">教师</c:when>
                                        <c:otherwise>学员</c:otherwise>
                                    </c:choose>

                                </h6>
                                <%----%>
                                <span data-v-968758ba="" class="color-white font-n width-100 inline-block margin-bottom-m">
                                    <c:choose>
                                        <c:when test="${muser.sign!=null && muser.sign!=''}">${muser.sign}</c:when>
                                        <c:otherwise>尚未设置个性签名</c:otherwise>
                                    </c:choose>
                                </span>

                                <!---->
                            </div>
                        </div>
                        <div id="m_m" data-v-968758ba=""
                             class="down-box bg-sky-blue border-radius margin-top border padding-top-m padding-bottom-m">
                            <div id ="m_order" onclick="order()" data-v-968758ba="" class="flex clicked">
                                <div data-v-968758ba="">
                                    <img data-v-968758ba="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAMAAAC6CgRnAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAGhUExURUxpcUpTvklVuE9cxyPE2zpTmUNv1GJ9jU1SvF9LwjWf1DmP1z5kskZTuyh5wmGJoVJ0gnumqjE+djCfzyW62CcfZjVNnT49d4eTyOHg4dTV3iPG20lUuoKcyN7h4CXG2xjb4LPi19nh4YMX0a8Ay6x317AW1kVdu7Cc0BTl4g3m5FpGwBS01n0AtWwAoRamyXQAqTB6vxWq1hql0+PjkAOq3gOe0B3A2h7I3DxtwhW02B2f0qsFySuHy+Hh4a0iyptIwMOo1avVpiGp0wW34S5/x1zDw5nN3q7S4OHil3TLuwKi09nX36hix+Kj175IyQeu02vB2dPI2UJiwOHW4TSk5U28xyDC2uPjiAOj3DOL0kZOwxfW3AO/5U9axWVpzEWz10yz1w6i0qUAuiK+y13CtAK50JEAtti22XB9xZUkv3fL0L160gSoz5oUwHM5v6M6x7fX4Z/V3wzB0YjKzVM5vLJizyGTyyK132bBv3/JtmU1sYYAsYrdy2IMtU6tssAl0LyQ0X3D2sI6ymFJuX2ayNxg05waxuOF3wmn1KkzyF38YhsAAAAydFJOUwDfex7eEPuGPDL7N8NQ9qJ7nzmf3m68cUxz6c6HfKKpQuIdIllrslrlq2Kzzd8sYYtOBvf2EQAAAU5JREFUKM9jYKAxkJCSxCkn6yOHW6OiEk4pTg1VZawSega66ck2NmoqmFK8/g559vb2Dfb+2uhS+vkhZY6+Gb6ODkEOOqhS3KVtPgVBWT4Ojr6NfnWaKHJ8NiFlOUF5dgU5jll2yVFaSFKG7R12NiF+NnbN/nbpGX41LEhyPPklraXZmS0l8XHZ0Zm11VwKcClm1zQzs+LcgOLclNT61JS0mBh5uJy6rZF3YVFhUYCpl4mniVushYU0XI7J1iipKTAwECYXboGwUMbV2MzD3cPdGyLngizHa2mdlJiQmGAUWRVhElHpYm4hgnAnI1CjmZm3c2SYk5NTmIu5uTBCjiPO1hgEnI1MTU2tzM25WJE8yBTNZ20EBlZWVhWh3CiBJh7PZltubQ3UGhrFI4Qa2IIeoozBwZaWlmxi7uxoccQvAAweTg4OTlYGdnYKkyQA1xlMgls4kbAAAAAASUVORK5CYII=" alt="" class="margin-right-s" />
                                    <span data-v-968758ba="">我的订单</span>
                                </div>
                            </div>
                            <div  id ="m_discount" onclick="discount()" data-v-968758ba="" class="flex">
                                <div data-v-968758ba="">
                                    <img data-v-968758ba="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAMAAAC6CgRnAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAEUUExURUxpcfx+DDaB/42J+vKe99OZ+f9qDv5WAsaQ+v2wD/zFI/2SDvbCJO+fi+ac986V+uah9/9VAP9UAP6XByeC/+id9gCJ/4KBtY1oe/fLKbWY3Nqa9/6g9/y4F/+sDP9XAPef9vzKG0iB//Wf9v/VDOyX9vy8GJlndv2kE5uJ/9u1isaR/v51Bf6DBf9TAP25Gv9gAv////9rC//ZBv2mBv2aB/zOG//OAv3ACv6RCeKa96qH//6YRf7gk/9XALujwf/Gl96y+v2qNf6aLP/Yqv+pZb2Y///jEM+lvf3UWf6FIP+XWP86AODM/v25RMKevL6ObW2C07SIec+f3NWqtcieqOKMZ86rzP2zTvzNPtS4x//y6VZFThkAAAAsdFJOUwCV+Q79+4CA/P79O0MHI8OUYN+xUFCxx/d0tnWz0cDHwSLH3o24Xsj9psPY5oBhzQAAAUdJREFUKM+1ktlygjAUhhVBAfdqXdvavbaTEMImoIDgrlW7r+//Hg3TCm1Hrjr9JpNz8eU/cyZJLPav7O5FqhxNH0ao7AlN02cRskCbplmI6GmajOvmt+dMllky7G+ZayayTYZ1XZYds42fwzMsoTtejrs+l99d/v5hOp0+v63XzuOT4ziNTCaT/nKJq4ksyxN/kzs+OkL7m2Bd1rSONetouq7pHEKI4w427lTTNH32qvMW4pCFlLailDbuqM7zOk9OYwsOsUq4qSaCcc6RYs0UdfXu4RdoGHcUdRzOyikrTzU8jPEAQnhLUeXwptuqNzBgr4/7PQBAtRK2jMUNOBwB0BsSJ0pSPDTpkgHhYA6ANMIjSSS0ikEKQpKZS5IoLURBtG1b2AkcSQj9hSCK9rXwSeDSyWQyRRbholbzS6q47Rkr5T9/yg98QzR+GaZTJgAAAABJRU5ErkJggg==" alt="" class="margin-right-s" style="margin-right: 14px; margin-left: -11px;" />
                                    <span data-v-968758ba="">优惠券</span>
                                </div>
                            </div>
                            <div  id ="m_download" onclick="download()" data-v-968758ba="" class="flex">
                                <div data-v-968758ba="">
                                    <img data-v-968758ba="" src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAbCAMAAAC6CgRnAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAFHUExURUxpcdlqDAsUy9vO0c5tLVQ84tx2IsV+mdeJjCoX1ODd3A0Uzd/GzSgV0wsQzSMO1eHb0FMf3wkOzC4X1QkRy08i3eLNq+SgRuLavsldDeOcTOLHn+R1AAwWy+O5hggOy+LAnOLQuhQO0AsOzOWOKlUl4eHZy0oO36iN4+SqZ0sZ4eHcx3lH3ZuB45Nz4+LTn9HG4UMJ4hMUzx05zSBPzBNgwRJzyACl1x1WzBlmzi9szQCy2AK/3hs1zBYmzSIl1Don2waR1DUuyQaT1QSTyQ+N1gCu1R+Z4kRe4Sif3eDb1hhMuRAcyypc0SE/zQx90itP0Atwuj5K3Dxu2ix+1iAX2xSg2wqx3kKG4VN230SS4xe34AOey+HWsQ13zUU00UI74B+X0INg0Dmb4I103nrT3Gin5OPLk1CY2Ii+zeO6b1bJ5Csp0FI7ofUAAAAydFJOUwAmxCMY/ncFCCIz3xNd8TRwnfzOfnCd91hLO2vLumAOP76gjvWA4YtN1OaGwhpy2bn9r5oxSgAAAURJREFUKM+VUtd2gkAQ3aioiL2nmt4rXUDBhlhj76b3/P97hHNMQNaHzMOes3Nn7p0GwH/MsRyyOZdCzpXldGs2LQKSBKzrGq8Nphp1qdAqcJgz/Tsqsx2m6TpU0+x2WC1x/+zZ3ljQQj0HEZ/mc+9vzQvTzBOSpOw9chpAATiJqQHWObbbFZU2xw2HyM1lNKby/pa5h4s1ji6WSs8j5eXryqrXCuL1GtXM98fjwsf0/dowbQtOsHQhLwvC5HNaRi6Arj00mCaTtxlG5oVy+a17HnfrSH3eFEnROUYWXr+LytOZsTssVanQGYbn86UBcmxsPWEhSOoux/CTx9HD0eK4NlMzzRzT7w1aAdMsLQRLNTO9YidrxhxYnaXoQqedjZiXgFbrbDLJtSQUsiFPlSAbDTEEPaUwnk7jOAq/s7DXi/n+vj/TLC8fSNWcOwAAAABJRU5ErkJggg==" alt="" class="margin-right-s" />
                                    <span data-v-968758ba="">软件下载</span>
                                </div>
                            </div>


                            <!---->
                        </div>
                    </aside>

                    <main data-v-968758ba="" id="main" class="el-main" style="padding: 0px 20px;">

                    </main>

                    <!---->
                    <!---->
                    <!---->
                    <!---->
                    <!---->

                </section>


            </div>
        </main>
        <footer data-v-0b4ec03a="" data-v-41369d32="" class="el-footer width-100" style="height: 60px;margin-top:
        10px;">
            <div data-v-0b4ec03a="" class="footer_content">
                <div data-v-0b4ec03a="" class="about_us">


                </div>
                <div data-v-0b4ec03a="" class="contact_us">
                    <h4 data-v-0b4ec03a="">联系我们</h4>
                    <ul data-v-0b4ec03a="">
                        <li data-v-0b4ec03a="">xxxx科技有限公司</li>
                        <li data-v-0b4ec03a="">地址：xxxx</li>
                        <li data-v-0b4ec03a="">电话：xxxx</li>
                        <li data-v-0b4ec03a="">邮箱：xxxx</li>
                    </ul>
                </div>
                <div data-v-0b4ec03a="" class="other_service">

            </div>
            </div>
        </footer>
    </div>
</div>
<div class="el-menu--horizontal" x-placement="bottom-start" style="position: absolute; top: 60px; left: 261px; z-index: 2045; display: none;">
    <ul role="menu" class="el-menu el-menu--popup el-menu--popup-bottom-start" style="background-color: rgb(56, 138, 255);">
        <li data-v-ff6185f2="" role="menuitem" tabindex="-1" class="el-menu-item" style="color: rgb(255, 255, 255); background-color: rgb(56, 138, 255);">录播课</li>
        <li data-v-ff6185f2="" role="menuitem" tabindex="-1" class="el-menu-item" style="color: rgb(255, 255, 255); background-color: rgb(56, 138, 255);">直播课</li>
    </ul>
</div>
<div class="el-menu--horizontal" x-placement="bottom-start" style="position: absolute; top: 60px; left: 823px; z-index: 2019; display: none;">
    <ul role="menu" class="el-menu el-menu--popup el-menu--popup-bottom-start" style="background-color: rgb(56, 138, 255);">
        <li data-v-ff6185f2="" role="menuitem" tabindex="-1" class="el-menu-item" style="color: rgb(255, 255, 255); background-color: rgb(56, 138, 255);"><a data-v-ff6185f2="" href="https://ide.codepku.com/?type=Scratch" target="_blank" class="wannaCreate">Scratch</a></li>
        <li data-v-ff6185f2="" role="menuitem" tabindex="-1" class="el-menu-item" style="color: rgb(255, 255, 255); background-color: rgb(56, 138, 255);"><a data-v-ff6185f2="" href="https://ide.codepku.com/?type=Arduino" target="_blank" class="wannaCreate">Arduino</a></li>
        <li data-v-ff6185f2="" role="menuitem" tabindex="-1" class="el-menu-item" style="color: rgb(255, 255, 255); background-color: rgb(56, 138, 255);"><a data-v-ff6185f2="" href="https://study.codepku.com/python/create_first" target="_blank" class="wannaCreate">Python</a></li>
        <li data-v-ff6185f2="" role="menuitem" tabindex="-1" class="el-menu-item" style="color: rgb(255, 255, 255); background-color: rgb(56, 138, 255);"><a data-v-ff6185f2="" href="https://study.codepku.com/noip/topic_list" target="_blank" class="wannaCreate">NOIP</a></li>
        <li data-v-ff6185f2="" role="menuitem" tabindex="-1" class="el-menu-item" style="color: rgb(255, 255, 255); background-color: rgb(56, 138, 255);"><a data-v-ff6185f2="" href="https://ide.codepku.com/?type=Art" target="_blank" class="wannaCreate">艺术编程</a></li>
    </ul>
</div>
<ul id="zhuxiao" data-v-ff6185f2="" class="el-dropdown-menu el-popper user-dropdown" id="dropdown-menu-6020"
     style="transform-origin: center top; z-index: 2025; display: none;">
    <li data-v-ff6185f2="" onclick="javascript:window.location.href='m/logout';" tabindex="-1"
        class="el-dropdown-menu__item color-primary logout">注销</li>
    <%--<li data-v-ff6185f2="" tabindex="-1" class="el-dropdown-menu__item user-photo">--%>
        <%--<div data-v-ff6185f2="" class="dropdown_item">--%>
            <%--<a data-v-ff6185f2="" href="https://study.codepku.com/"--%>
               <%--class="flex flex-align-item flex-direction-row router-link-exact-active router-link-active"><img--%>
                    <%--onclick="logout()"  data-v-ff6185f2="" src="<%=basePath%>/plugins/receptionfile/more/20180714163534.png" /> <span data-v-ff6185f2="" style="margin-left: 10px;">haha&middot;</span></a>--%>
        <%--</div></li>--%>
    <!---->
    <div x-arrow="" class="popper__arrow" style="left: 224.5px;"></div>

</ul>

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
</style>

<link rel="stylesheet" href="<%=basePath%>/plugins/kit-admin/css/layui.css" id="layui">
<script src="<%=basePath%>/plugins/kit-admin/layui.all.js"></script>

<!-- 修改密码隐藏div -->
<div id="UpdatePWDDiv" style="display: none" class="white_content">
    <div style="text-align: right; cursor: default; height: 40px;">
        <a href="javascript:void(0)" style="font-size: 16px;" onclick="cancelUpdatePWD()">关闭</a>
    </div>
    <div class="el-form-item__label" style="margin-bottom: 20px;fonts-size:30px;width: 100%;text-align: center;">修改密码
    </div>

    <div class="msgbox-body">
        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">原密码</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入原始密码" maxlength="100"
                           id = "old_pwd" class="el-input__inner" required>
                </div>
                <!---->
                <!---->
            </div>
        </div>

        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">新密码</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="请输入新密码" maxlength="100"
                           id = "new_pwd" class="el-input__inner" required>
                </div>
                <!---->
                <!---->
            </div>
        </div>

        <div data-v-2227e212="" class="el-form-item" style="width: 90%;">
            <label  class="el-form-item__label" style="width: 100px;">确认密码</label>
            <div class="el-form-item__content" style="margin-left: 100px;">
                <div data-v-2227e212="">
                    <input type="text" autocomplete="off" placeholder="确认密码" maxlength="100"
                           id = "check_pwd" class="el-input__inner" required>
                </div>
                <!---->
                <!---->
            </div>
        </div>
    </div>
    <div class="msgbox-footer" style="margin-left:35%;margin-top: 30px;">
        <button type="button" class="layui-btn"  onclick="UpdatePWD()">修改</button>
        <button type="button" class="layui-btn" onclick="cancelUpdatePWD()">取消</button>
    </div>
</div>

<script type="text/javascript">
$(function(){
    $("#main").load("/m/order");
    $('.lihover').bind({
        mouseenter: function (e) {
            // Hover event handler
            $(this).css({"background-color":"rgb(45,110,204)"});
        },
        mouseleave: function (e) {
            // Hover event handler
            $(this).css({"background-color":"rgb(56, 138, 255)"});
        }
    });
})
    var getPop = function(){
        $("#main").load("/m/user");
    }
var gotoindex = function(){
    $("#main").load("/m/order");
}
var discount = function(){
    $("#m_m").find("div").removeClass("clicked");
    $("#m_discount").addClass("clicked");
    $("#main").load("/m/discount");
}
var download = function(){
    $("#m_m").find("div").removeClass("clicked");
    $("#m_download").addClass("clicked");
    $("#main").load("/m/download");
}
var order = function(){
    $("#m_m").find("div").removeClass("clicked");
    $("#m_order").addClass("clicked");
    $("#main").load("/m/order");
}
//更换root_main
var reloadRootMain = function(obj,url){
    // var ifamel = "<iframe src=\""+url+"\" frameborder=\"0\" style='width: '></iframe>"
    // $("#root_main").html(ifamel);
    $(obj).siblings().each(function (index,item) {
        $(this).removeClass("is-active");
        $(this).css({"color":"rgb(255,255, 255)","border-bottom-color":"transparent","background-color":"rgb(56, 138, 255)"});
    })
    $(obj).addClass("is-active");
    $(obj).css({"color":"rgb(255, 208, 75)","border-bottom-color":"rgb(255, 208, 75)","background-color":"rgb(56, 138, 255)"});

    $("#root_main").load(url);
}
    $("body").click(function(event){
        var $this = $(event.target);
        if(!$this.id == "el-popover-7051" && !$this.id == "zhuxiao"){
            $("#el-popover-7051").hide();
            $("#zhuxiao").hide();
        }
    });

//去修改密码页面
var gotoUpdatePWD = function(){

    $("#UpdatePWDDiv").show();
}

var UpdatePWD = function () {
    var new_pwd = $("#new_pwd").val();
    var check_pwd = $("#check_pwd").val();
    var old_pwd = $("#old_pwd").val();
    if(new_pwd == ""){
        alert("新密码不能为空");
        return false;
    }
    if(new_pwd != check_pwd){
        alert("两次输入的新密码不一致，请重新输入！");
        return false;
    }
    $.post("${basePath}/m/updatePWD",
        {
            oldPWD : old_pwd,
            newPWD : new_pwd
        },
        function (data) {
            if(data.status!=200){
                alert(data.message);
            }
            if(data.status==200){
                alert('修改密码成功！');
                cancelUpdatePWD();
            }
        });
}

var cancelUpdatePWD = function () {
    $("#new_pwd").val("");
    $("#check_pwd").val("");
    $("#old_pwd").val("");
    $("#UpdatePWDDiv").hide();
}
//window.location.href = "/m/logout";
var logout = function(){
    $.get("${basePath}/m/logout",
                null,
                function (data) {
                    if(data.status!=200){
                        alert(data.message);
                    }
                    if(data.status==200){
                        alert('注销成功！');


                        setTimeout(function(){
                            //登录返回
                            window.location.href = "${basePath}/m/login";
                        },1000)
                    }});
}

</script>
</body>
</html>