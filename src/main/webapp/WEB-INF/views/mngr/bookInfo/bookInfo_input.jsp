<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<jsp:include page="/WEB-INF/views/layout/admin_all.jsp"/>
<div id ="Progress_Loading" style="margin-left:46%;"><!-- 로딩바 -->
    <img src="/lib/img/loadingBar.gif" style="width:50px;"/>
</div>
<h3 class="result-title">EXCEL 업로드</h3>
<div class="table-wrap">
    <div class="table_top_btn">
        <a href="/manpa/sample.xls" class="btn excel_btn" download>업로드양식 다운로드</a>
    </div>
    <div class="sub-content">
        <div class="tab_wrap">
            <form name="excelUpForm" id="excelForm" method="post" ecntype="multipart/form-data">
                <div id="tab-1" class="tab-content current">
                    <div class="table-wrap">
                        <div class="table_cont">
                            <table class="table detail_tb">
                                <colgroup>
                                    <col style="width:15%"/>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>Excel*</th>
                                    <td><input type="file" name="excel" id="excel"  value="" title="excel" multiple data-show-upload="false"data-show-caption="true"/></td>
                                </tr>
                                </tbody>
                            </table>
                        </div><!-- /.col -->
                    </div>
                    <div id="tab-3" class="tab-content"></div>
                    <div class="btn_wrap right">
                        <a href="#none" onclick="fn_inputExcel();" class="btn">Excel업로드</a>
                    </div>
                </div><!-- /.box-footer -->
            </form>
        </div>
    </div>
</div>
<h3 class="result-title">도서 등록</h3>
<div class="sub-content">
    <div class="tab_wrap">
        <form name="listForm" id="listForm" method="get">
            <input type="hidden" name="schFld" value="<c:out value="${paramMap.schFld }" />"/>
            <input type="hidden" name="page" value="<c:out value="${paramMap.page }" />"/>
            <input type="hidden" name="ordFld" value="<c:out value="${paramMap.ordFld }" />"/>
            <input type="hidden" name="ordBy" value="<c:out value="${paramMap.ordBy }" />"/>
        </form>
        <form name="form1" id="form1" method="post">
            <div id="tab-1" class="tab-content current">
                <div class="table-wrap">
                    <div class="table_cont">
                        <table class="table detail_tb">
                            <colgroup>
                                <col style="width:15%"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>도서명*</th>
                                <td>
                                    <input type="text" name="bookTitle" id="bookTitle" value=""/>
                                </td>
                            </tr>
                            <tr>
                                <th>저작자명*</th>
                                <td><input type="text" name="bookAuthor" id="bookAuthor" value=""/>
                            </tr>
                            <tr>
                                <th><span>출판사명*</span></th>
                                <td><input type="text" name="bookPublisher" id="bookPublisher" value=""/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>발행년도*</span></th>
                                <td>
                                    <input type="text" name="publicationYear" id="publicationYear" value=""/>
                                </td>
                            </tr>
                            <tr>
                                <th>제어번호</th>
                                <td>
                                    <input type="text" name="controlNo" id="controlNo" value=""/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div><!-- /.col -->
                </div>
                <div id="tab-3" class="tab-content"></div>
                <div class="btn_wrap right">
                    <a href="#none" onclick="fn_goList();" class="btn gray_btn left">목록</a>
                    <a href="#none" onclick="fn_insert();" class="btn">등록</a>
                </div>
            </div><!-- /.box-footer -->
        </form>
    </div>
</div>
<jsp:include page="/WEB-INF/views/layout/admin_close.jsp"/>

<script type="text/javascript">

    $(document).ready(function () {
        $('#Progress_Loading').hide();
    })

        .ajaxStart(function () {
            $('#Progress_Loading').show();
        })
        .ajaxStop(function () {
            $('#Progress_Loading').hide();
        });

    function fn_goList() {
        var f = document.listForm;
        f.action = "/mngr/bookInfo/bookInfoList";
        f.submit();
    }

    //도서 등록
    function fn_insert() {
        let formData = $("#form1").serialize();
        $.ajax({
            url  : "/mngr/bookInfo/insertBookInfoProc",
            data : formData,
            type : "POST",
            dataType : "JSON",
            success : function(res){
                if(res>0){
                    alert("등록 되었습니다.");
                    location.reload();
                }
            },
            error : function(e){
                console.log(e.responseText);
                alert("There are some problems in System. <br />Please Try again.");
            }
        })
    }

</script>
</body>
</html>