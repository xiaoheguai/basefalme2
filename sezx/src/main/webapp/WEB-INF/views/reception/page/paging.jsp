<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>


<%

    int totalPage=Integer.valueOf(String.valueOf(request.getAttribute("totalPage")));
    int currentPage=Integer.valueOf(String.valueOf(request.getAttribute("currentPage")));
    String url=String.valueOf(request.getAttribute("url"));
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    String fengefu = "?";
    if(url.indexOf("?")>-1){
        fengefu = "&";
    }

%>
<div id="met_pager" class="el-pagination" style="margin-top: 20px; margin-bottom: 20px;">
    <span class="el-pagination__total">共 ${totalPage} 页</span>
    <span class="el-pagination__sizes"> </span>

    <%
        if(currentPage==1){
    %>
    <button type="button" disabled="disabled" class="btn-prev"><i class="el-icon el-icon-arrow-left"></i></button>

    <%
        }else{
    %>
    <button onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${currentPage-1}" type="button"
            class="btn-prev"><i 
            class="el-icon el-icon-arrow-left"></i></button>
    <%
        }
    %>
    <ul class="el-pager">
    <%
        if(totalPage>18){
        if(currentPage>=6&&currentPage+5<=totalPage){
    %>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${1}" class="number">1</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${2}" class="number">2</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${3}" class="number">3</li>
    <li class="el-icon more btn-quicknext el-icon-more"></li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${currentPage-1}" class="number">${currentPage-1}</li>
    <li class='number active'>${currentPage}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${currentPage+1}" class="number">${currentPage+1}</li>
    <li onclick="buttonjump(this)" class="el-icon more btn-quicknext el-icon-more"></li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage-2}" class="number">${totalPage-2}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage-1}" class="number">${totalPage-1}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage}" class="number">${totalPage}</li>
    <%
        }else {
    %>
        <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${1}" class="number">1</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${2}" class="number">2</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${3}" class="number">3</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${4}" class="number">4</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${5}" class="number">5</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${6}" class="number">6</li>
    <li class="el-icon more btn-quicknext el-icon-more"></li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage-5}" class="number">${totalPage-5}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage-4}" class="number">${totalPage-4}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage-3}" class="number">${totalPage-3}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage-2}" class="number">${totalPage-2}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage-1}" class="number">${totalPage-1}</li>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${totalPage}" class="number">${totalPage}</li>
    <%
        }
        }else{
        for(int i = 1;i<=totalPage;i++){
        if(i==currentPage){
    %>
    <li   class='number active'>1</li>
    <%
        }else{
    %>
    <li onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${i}" class="number">${i}</li>
    <%
        }
        }
        }
    %>
    </ul>
    <%
        if(currentPage==totalPage){
    %>
    <button type="button" disabled="disabled" class="btn-next"><i class="el-icon el-icon-arrow-right"></i> </button>
    <%
        }else{
    %>
    <button onclick="buttonjump(this)" ahref="<%=basePath%>/${url}${fengefu}page=${currentPage+1}" type="button" class="btn-next"><i
            class="el-icon el-icon-arrow-right"></i> </button>
    <%
        }
    %>


    <span class="el-pagination__jump">前往
     <div class="el-input el-pagination__editor is-in-pagination">
      <input type="number" id='metPageT' onblur="jump()" autocomplete="off" min="1" class="el-input__inner"
             max="${totalPage}" value="${currentPage}" />
     </div>页</span>
    <script type="text/javascript">
        var jump = function(){
            var metPage = parseInt($("#metPageT").val());
            if(isNaN(metPage) || metPage>'${totalPage}' || metPage<=0 ){
                alert("请输入正确的页码");
                return;
            }
            var url="<%=basePath%>/${url}${fengefu}page="+metPage;
            $("#root_main").load(url);
        }
        //控制当前页页面大于18的页码
        $(function(){
            if(("${6-currentPage}">=0)||(("${totalPage-currentPage-5}")<=0)){
                var $a = $("[ahref]");
                $a.each(function(){
                    var number=$(this).text();
                    if(number=="${currentPage}"){
                        $(this).addClass("active");
                    }

                })

            }
        })
        var  buttonjump = function (obj) {
            var url = $(obj).attr("ahref");
            $("#root_main").load(url);
        }
    </script>
</div>



</body>
</html>
