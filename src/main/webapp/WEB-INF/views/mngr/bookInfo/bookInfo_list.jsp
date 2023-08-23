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
					<input type="hidden" name="nowPage" id="nowPage" value="${returnMap.nowPage}"/>
					<div class="search_list">
						<div class="search-set">
							<span class="info-tit">검색어</span>
							<select name="schFld" id="schFld">
								<option value="" <c:if test="${returnMap.schFld eq ''}">selected</c:if>>전체</option>
								<option value="1" <c:if test="${returnMap.schFld eq '1'}">selected</c:if>>도서명</option>
								<option value="2" <c:if test="${returnMap.schFld eq '2'}">selected</c:if>>저자명</option>
								<option value="3" <c:if test="${returnMap.schFld eq '3'}">selected</c:if>>출판사</option>
								<option value="4" <c:if test="${returnMap.schFld eq '4'}">selected</c:if>>발행년도</option>
								<option value="5" <c:if test="${returnMap.schFld eq '5'}">selected</c:if>>제어번호</option>
							</select>
							<input type="text" name="schStr" id="schStr" value="<c:out value="${returnMap.schStr }" />" class="" placeholder="검색어 입력">
						</div>
						<div class="btn_wrap">
							<a href="bookInfo_list.do" class="btn">초기화</a>
							<a href="#none" class="btn black_btn">검색</a>
						</div>
					</div><!--// list_search-->
					<div class="shop-list">
						<div class="detail-con">
							<div class="tab_wrap"></div>
							<p class="title">전체 <span>${resultMap.totalCnt}</span> 건</p>
							<div class="table-wrap">
								<div class="table_top_btn">
									<a href="#none" class="btn excel_btn">엑셀다운로드</a>
									<select id="listCount">
										<option value="10" <c:if test="${returnMap.schFld eq '5'}">selected</c:if>>10개씩 보기</option>
										<option value="30" <c:if test="${returnMap.schFld eq '5'}">selected</c:if>>30개씩 보기</option>
										<option value="50" <c:if test="${returnMap.schFld eq '5'}">selected</c:if>>50개씩 보기</option>
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
												<td><input type="checkbox" name="chkSeq" value="<c:out value="${result.bookSeq }" />@<c:out value="${result.bizCode}" />" title="선택" /></td>
												<td><a href="#none"><c:out value="${result.book_title}" /></a></td>
												<td><c:out value="${result.book_author}" /></td>
												<td><c:out value="${result.book_publisher}" /></td>
												<td><c:out value="${result.publication_year}" /></td>
												<td><c:out value="${result.stock_quantity}" /></td>
												<td><c:out value="${result.stock_quantity}" /></td>
												<td><c:out value="${fn:substring(result.created_date , 0 ,10)}" /></td>
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

function fn_checkAll(obj) {
	$("input[name=chkSeq]").each(function() {
		$(this).prop("checked", obj.checked);
	});
}
</script>
</body>
</html>