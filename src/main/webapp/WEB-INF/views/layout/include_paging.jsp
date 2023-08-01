<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>

<!-- paging -->
<nav aria-label="..." style="margin-left:35%;" >
    <ul class="pagination pagination-lg" id="divPaging">
    </ul>
</nav>

<script>
    function setPagingView(totalSize, nowPage, rowCnt) {
        var totalPage = calTotalPage(totalSize, rowCnt);
        var startPage = 1;


        var addHtml = "";


        for (var i=startPage; i<totalPage+1; i++) {
            if (nowPage == i) {
                addHtml = addHtml + "<li class=\"page-item active\" aria-current=\"page\"><a class=\"page-link\">"+i+"</a></li>";
            } else {
                addHtml = addHtml + "<li class=\"page-item\" aria-current=\"page\"><a class=\"page-link\" onclick=\"goPage('"+i+"')\">"+i+"</a></li>";
            }
        }

        $("#divPaging").html(addHtml);
    }

    function calTotalPage(totalSize, pageSize) {
        var resultPage = 0;

        if (totalSize != 0) {
            resultPage = totalSize / pageSize;
            resultPage = parseInt(resultPage);
            if ((totalSize % pageSize) > 0) {
                resultPage = resultPage + 1;
            }
        }

        return resultPage;
    }
    if( "${resultMap.totalCnt}" != "" &&  parseInt("${resultMap.totalCnt}") >  parseInt("${resultMap.limit}") ){
        setPagingView("${resultMap.totalCnt}","${resultMap.nowPage}","${resultMap.limit}");
    }


    function pageView( isView ){
        if( isView ){
            $("#divPaging").show();
        }else{
            $("#divPaging").hide();
        }

    }

</script>
