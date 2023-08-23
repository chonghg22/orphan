<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>저작물 목록 관리</title>
</head>
<body>
        		<h3 class="result-title">저작물 목록 관리</h3>
      			<div class="sub-content">
					<div class="tab_wrap">
				        <form name="listForm" id="listForm" method="get">
						<input type="hidden" name="schFld" value="<c:out value="${paramMap.schFld }" />" />
						<input type="hidden" name="page" value="<c:out value="${paramMap.page }" />" />
						<input type="hidden" name="ordFld" value="<c:out value="${paramMap.ordFld }" />" />
						<input type="hidden" name="ordBy" value="<c:out value="${paramMap.ordBy }" />" />
						<input type="hidden" name="bookSeq" value="<c:out value="${paramMap.bookSeq }" />" />
						<input type="hidden" name="viewCount" value="<c:out value="${paramMap.viewCount}" />" />
						<input type="hidden" name="schCode" id="schCode" value="${paramMap.schCode}"/>
						<input type="hidden" name="schStr" id="schStr" value="${paramMap.schStr}"/>
						<input type="hidden" name="schBiz" id="schBiz" value="${paramMap.schBiz}"/>
						<input type="hidden" name="bizCode" id="bizCode" value="${paramMap.bizCode}"/>
						</form>
						<div id="tab-1" class="tab-content current">
							<div class="table-wrap">
								<div class="table_cont">
									<table class="table detail_tb">
										<colgroup>
											<col style="width:15%"/>
										</colgroup>
										<tbody>
										<tr>
											<th><span>저작물명</span></th>
											<td><c:out value="${resultList.bookName}"/></td>
										</tr>
				 						<tr>
											<th><span>저작자명</span></th>
											<td><c:out value="${resultList.bookAuthor}"/></td>
										</tr>
										<tr>
											<th>출판사명</th>
											<td><c:out value="${resultList.bookPublisher}"/></td>
										</tr>
										<tr>
											<th>발행년도</th>
											<td><c:out value="${resultList.bookPubYear}"/></td>
										</tr>
										<tr>
											<th><span>제어번호</span></th>
											<td><c:out value="${resultList.controlNo}" /></td>
										</tr>
										<tr>
											<th><span>등록일</span></th>
											<td><c:out value="${fn:substring(resultList.regdt,0,10)}" /></td>
										</tr>
										<tr>
											<th><span>연번</span></th>
											<td><c:out value="${resultList.bookSeq}" /></td>
										</tr>
										<tr>
											<th><span>저작물상태</span></th>
											<td>
											<c:choose>
												<c:when test="${resultList.status eq '10'}">배분완료</c:when>
												<c:when test="${resultList.status eq '11'}">재조사 요청</c:when>
												<c:when test="${resultList.status eq '20'}">검증 요청</c:when>
												<c:when test="${resultList.status eq '30'}">승인 요청</c:when>
												<c:when test="${resultList.status eq '40'}">반려</c:when>
												<c:when test="${resultList.status eq '99'}">최종승인</c:when>
												<c:otherwise>배분대기</c:otherwise>
											</c:choose>
											</td>
										</tr>
										<tr>
											<th>배분일</th>
											<td><c:out value="${ufn:printDatePattern(resultList.distributedt, 'yyyy-mm-dd')}"/></td>
										</tr>
										<c:if test="${not empty resultList.searcherNo}">
										<tr>
											<th><span>조사자ID</span></th>
											<td><c:out value="${resultList.searcherId}" /></td>
										</tr>
										</c:if>
										<tr>
											<th>검증요청일</th>
											<td><c:out value="${ufn:printDatePattern(resultList.verityReqDt, 'yyyy-mm-dd')}"/></td>
										</tr>
										<tr>
											<th>검증자ID</th>
											<td><c:out value="${resultList.verifierId}"/></td>
										</tr>
										<tr>
											<th>승인요청일</th>
											<td><c:out value="${ufn:printDatePattern(resultList.confirmReqDt, 'yyyy-mm-dd')}"/></td>
										</tr>
										<c:if test="${resultList.status eq '40' }">
										<tr>
											<th>반려자ID</th>
											<td><c:out value="${resultList.approvalId}"/></td>
										</tr>
										<tr>
											<th>반려일</th>
											<td><c:out value="${ufn:printDatePattern(resultList.confirmdt, 'yyyy-mm-dd')}"/></td>
										</tr>
										</c:if>
										<c:if test="${resultList.status eq '99' }">
										<tr>
											<th>승인자ID</th>
											<td><c:out value="${resultList.approvalId}"/></td>
										</tr>
										<tr>
											<th>승인일</th>
											<td><c:out value="${ufn:printDatePattern(resultList.confirmdt, 'yyyy-mm-dd')}"/></td>
										</tr>
										</c:if>
										</tbody>
									</table>
								</div><!-- /.col -->
							</div>
							<div id="tab-3" class="tab-content"></div>
							<div class="btn_wrap right">
								<a href="#none" onclick="fn_goList();" class="btn gray_btn left">목록</a>
								<a href="#none" onclick="fn_goDel();" class="btn black_btn">삭제</a>
								<a href="#none" onclick="fn_goEdit();" class="btn">수정</a>
							</div><!-- btn_wrap -->
		                </div><!-- tab-content -->
					</div><!-- tab_wrap -->
				</div><!-- sub-content -->

<script type="text/javascript">
function fn_goList() {
	var f = document.listForm;
	f.action = "bookInfo_list.do";
	f.submit();
}

function fn_goEdit() {
	var f = document.listForm;
	f.action = "bookInfo_edit.do";
	f.submit();
}

function fn_goDel(){
	if(confirm("삭제하시겠습니까?")){
		var frm = document.listForm;
		frm.encoding = "application/x-www-form-urlencoded";
		frm.action = "bookInfo_delete_proc.do";
		frm.submit();
	}
}

//]]>
</script>
</body>
</html>