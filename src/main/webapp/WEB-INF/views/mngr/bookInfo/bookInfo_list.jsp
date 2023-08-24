<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<jsp:include page="/WEB-INF/views/layout/admin_all.jsp"/>
        		<h3 class="result-title">도서 목록 관리</h3>
      			<div class="sub-content">
	                <form name="listForm" id="listForm" method="get">
					<input type="hidden" name="nowPage" id="nowPage" value="${resultMap.nowPage}"/>
					<input type="hidden" name="bookSeq" id="bookSeq" value=""/>
					<div class="search_list">
						<div class="search-set">
							<span class="info-tit">검색어</span>
							<select name="schFld" id="schFld">
								<option value="" <c:if test="${resultMap.schFld eq ''}">selected</c:if>>전체</option>
								<option value="1" <c:if test="${resultMap.schFld eq '1'}">selected</c:if>>도서명</option>
								<option value="2" <c:if test="${resultMap.schFld eq '2'}">selected</c:if>>저자명</option>
								<option value="3" <c:if test="${resultMap.schFld eq '3'}">selected</c:if>>출판사</option>
								<option value="4" <c:if test="${resultMap.schFld eq '4'}">selected</c:if>>발행년도</option>
								<option value="5" <c:if test="${resultMap.schFld eq '5'}">selected</c:if>>제어번호</option>
							</select>
							<input type="text" name="schStr" id="schStr" value="<c:out value="${resultMap.schStr }" />" class="" placeholder="검색어 입력">
						</div>
						<div class="btn_wrap">
							<a href="/mngr/bookInfo/bookInfoList" class="btn">초기화</a>
							<a href="#none" class="btn black_btn" onclick="goPage('${resultMap.nowPage}')">검색</a>
						</div>
					</div><!--// list_search-->
					<div class="shop-list">
						<div class="detail-con">
							<div class="tab_wrap"></div>
							<p class="title">전체 <span>${resultMap.totalCnt}</span> 건</p>
							<div class="table-wrap">
								<div class="table_top_btn">
<%--									<a href="#none" class="btn excel_btn">엑셀다운로드</a>--%>
									<select id="limit" name="limit" onchange="goPage('${resultMap.nowPage}')">
										<option value="10" <c:if test="${resultMap.limit eq '10'}">selected</c:if>>10개씩 보기</option>
										<option value="30" <c:if test="${resultMap.limit eq '30'}">selected</c:if>>30개씩 보기</option>
										<option value="50" <c:if test="${resultMap.limit eq '50'}">selected</c:if>>50개씩 보기</option>
									</select>
								</div>
								<div class="table_cont">
									<table class="table">
										<colgroup>
											<col style="width:5%">
											<col style="width:20%">
											<col style="width:20%">
											<col style="width:10%">
											<col style="width:10%">
											<col style="width:15%">
											<col style="width:10%">
											<col style="width:10%">
										</colgroup>
										<thead>
											<tr>
												<th><input type="checkBox" name="chkAll" id="chkAll" value="Y" title="전체선택/해제" onclick="fn_checkAll(this);" /></th>
												<th>도서명</th>
												<th>저자명</th>
												<th>출판사</th>
												<th>발행년도</th>
												<th>제어번호</th>
												<th>대여횟수</th>
												<th>등록일자</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="result" items="${bookInfoList}" varStatus="status">
											<tr>
												<td><input type="checkbox" name="chkSeq" value="<c:out value="${result.bookSeq }" />" title="선택" /></td>
												<td><a href="#none" onclick="fn_goView('${result.bookSeq}')"><c:out value="${result.bookTitle}" /></a></td>
												<td><c:out value="${result.bookAuthor}" /></td>
												<td><c:out value="${result.bookPublisher}" /></td>
												<td><c:out value="${result.publicationYear}" /></td>
												<td><c:out value="${result.controlNo}" /></td>
												<td><c:out value="${result.stockQuantity}" /></td>
												<td><c:out value="${fn:substring(result.createdDate , 0 ,10)}" /></td>
											</tr>
											</c:forEach>
											<c:if test="${result.totalCnt eq 0}">
											<tr>
												<td colspan="8">등록된 도서가 없습니다.</td>
											</tr>
											</c:if>
										</tbody>
									</table>
								</div>
								<a href="#none" onclick="fn_chkDel();" class="btn gray_btn tb_list_l_btn">삭제</a>
								<a href="#none" onclick="fn_goRegist();" class="btn tb_list_r_btn">등록</a>
							</div><!--// table-wrap-->
						</div><!--// detail-con-->
						</form>
					</div><!--// shop-list-->
				</div><!-- sub content -->
<jsp:include page="/WEB-INF/views/mngr/pagination/comm_pagination_include.jsp"/>
<jsp:include page="/WEB-INF/views/layout/admin_close.jsp"/>

<script type="text/javascript">
/* pagination 페이지 링크 function */
function goPage( nowPage ){
	let form = $("#listForm");
	$("#nowPage").val(nowPage);
	form.attr('action', "/mngr/bookInfo/bookInfoList");
	form.submit();
}

function fn_goRegist() {
	location.href="/mngr/bookInfo/insertBookInfo";
}

function fn_checkAll(obj) {
	$("input[name=chkSeq]").each(function() {
		$(this).prop("checked", obj.checked);
	});
}

function fn_chkDel(){
	if($("input[name=chkSeq]:checked").size() == 0){
		alert("삭제할 관리자를 선택 해 주세요.");
		return false;
	}else{
		if(confirm("선택한 관리자를 삭제하시겠습니까?")){
			var formData = $("#listForm").serialize();
			$.ajax({
				url  : "/mngr/bookInfo/checkDeleteBookInfo",
				data : formData,
				type : "POST",
				dataType : "JSON",
				success : function(res){
					if(res>0){
						alert("삭제되었습니다.");
						location.reload();
					}
				},
				error : function(e){
					console.log(e.responseText);
					alert("There are some problems in System. <br />Please Try again.");
				}
			})
		}
	}
}

/* 글 상세보기 화면 function */
function fn_goView(bookSeq) {
	var frm = document.listForm;
	frm.bookSeq.value = bookSeq;
	frm.action = "/mngr/bookInfo/bookInfoView";
	frm.submit();
}
</script>
</body>
</html>