layui.define(["layer","jquery"],function (exports) {
    var $ = layui.jquery;
   var obj = {
       simpleajax : function (url,data) {
           $.post(url,data,function (result) {
             if (result.status == 200){
                 layer.msg(result.msg,{icon:1}
                     //,function () {
                     //window.location.href = targetUrl;
                     //}
                 );
             }else{
                 layer.msg(result.msg,{icon:2}
                     // ,function () {
                     //     window.location.href = targetUrl;
                     // }
                 );
             }
           });
       }
   }
   exports("simpleajax",obj);
})