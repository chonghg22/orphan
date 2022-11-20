<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<%@ taglib prefix="orderby" uri="/WEB-INF/tlds/orderby.tld" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title><c:out value="${bbsMap.bbsName}" /> - 공연장안전지원센터</title>
</head>
<body>

        		<div class="sub-title sub4">
					<c:if test="${bbsMap.bbsId eq 'safety'}"><h2>안전현황</h2></c:if>
					<c:if test="${bbsMap.bbsId eq 'base'}"><h2>기관.법령</h2></c:if>
					<c:if test="${bbsMap.bbsId eq 'notice'}"><h2>커뮤니티</h2></c:if>
					<c:if test="${bbsMap.bbsId eq 'faq'}"><h2>커뮤니티</h2></c:if>
				</div><!--// sub-title-->
				<c:choose>
					<c:when test="${bbsMap.bbsId eq 'safety'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_2.jsp">
							<jsp:param name="depth2" value="2" />
							<jsp:param name="depth3" value="2" />
						</jsp:include>
					</c:when>
					<c:when test="${bbsMap.bbsId eq 'base'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_3.jsp">
							<jsp:param name="depth2" value="4" />
						</jsp:include>
					</c:when>
					<c:when test="${bbsMap.bbsId eq 'notice'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_4.jsp">
							<jsp:param name="depth2" value="1" />
						</jsp:include>
					</c:when>
					<c:when test="${bbsMap.bbsId eq 'faq'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_4.jsp">
							<jsp:param name="depth2" value="2" />
						</jsp:include>
					</c:when>
				</c:choose>

      			<div class="content-title">
      				<h3><c:out value="${bbsMap.bbsName}" /></h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       			 <form name="listForm" id="listForm" method="post">
		                <input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
		                <input type="hidden" name="schCode" value="${paramMap.schCode}" />
		                <input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
		                <input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
		                <input type="hidden" name="page" value="${paramMap.page}" />
		                <input type="hidden" name="seq" value="" />
		                <input type="hidden" name="fileId" value=""/>
		                <input type="hidden" name="reason" value="" />
		                <input type="hidden" name="openYn" value="Y" />

       				<div class="search-wrap">
       					<div class="section">
       						<div class="search-type2">
       						<select name="schFld" id="schFld">
								<option value="0" ${ufn:selected(paramMap.schFld, '0') }>전체</option>
								<option value="1" ${ufn:selected(paramMap.schFld, '1') }>제목</option>
								<option value="3" ${ufn:selected(paramMap.schFld, '3') }>내용</option>
							</select>
       							<div class="input-box">
       								<input type="text" name="schStr" id="schStr" value="<c:out value="${paramMap.schStr }" />" class="" placeholder="검색어 입력">
       								<a href="#none" class="submit-btn" title="검색" onclick="fn_search()"><span class="hidden">검색</span></a>
       							</div>
       						</div>
       					</div>
       				</div><!--//search-wrap-->

       				<div class="board-wrap">
						<div class="board-top">
							<div class="total-num">
								<span>전체</span>
								<strong>${paginationInfo.totalRecordCount}</strong>
								<span>건</span>
							</div>

							<c:if test="${bbsMap.bbsId eq 'faq'}">
							<div class="sorting">
								<select name="typeEtc" id="typeEtc" onchange="fn_selectSearch()">
									<option value="" ${ufn:selected(paramMap.typeEtc, '') }>전체</option>
									<option value="0" ${ufn:selected(paramMap.typeEtc, '0') }>이용안내</option>
									<option value="1" ${ufn:selected(paramMap.typeEtc, '1') }>공연장 등록</option>
									<option value="2" ${ufn:selected(paramMap.typeEtc, '2') }>안전진단</option>
									<option value="3" ${ufn:selected(paramMap.typeEtc, '3') }>재해대처계획</option>
									<option value="4" ${ufn:selected(paramMap.typeEtc, '4') }>기타</option>
								</select>
							</div>
							</c:if>
						</div><!--// board-top-->
						<c:choose>
							<c:when test="${bbsMap.bbsId eq 'faq'}">
							<ul class="faq-list">
	              			<c:forEach var="result" items="${resultList}" varStatus="status">
								<li class="drop">
									<button type="button" class="faq-open-btn drop-btn">
										<span class="category">
											<c:choose>
												<c:when test="${result.typeEtc eq '0' }">이용안내</c:when>
												<c:when test="${result.typeEtc eq '1' }">공연장 등록</c:when>
												<c:when test="${result.typeEtc eq '2' }">안전진단</c:when>
												<c:when test="${result.typeEtc eq '3' }">재해대처계획</c:when>
												<c:when test="${result.typeEtc eq '4' }">기타</c:when>
											</c:choose>
										</span>
										<c:out value="${result.title}"/>
									</button>
									<div class="faq-content drop-list"><c:out value="${result.contents }" escapeXml="false"/></div>
								</li>
							</c:forEach>
							</ul><!--// faq-list-->
							<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>
							</c:when>
							<c:otherwise>
								<div class="board-common">
								<table class="table board-list">
								<c:if test="${bbsMap.bbsId eq 'safety'}"><caption>안전진단기관 결과 평가에 대한 표로써 번호, 제목, 첨부파일, 등록일, 조회수 항목으로 구성됩니다.</caption></c:if>
								<c:if test="${bbsMap.bbsId eq 'base'}"><caption>기준 및 지침에 대한 표로써 번호, 제목, 첨부파일, 등록일, 조회수 항목으로 구성됩니다.</caption></c:if>
								<c:if test="${bbsMap.bbsId eq 'notice'}"><caption>공지사항에 대한 표로써 번호, 제목, 첨부파일, 등록일, 조회수 항목으로 구성됩니다.</caption></c:if>
									<colgroup>
										<col style="width:7%">
										<col style="width:57%">
										<col style="width:12%" span="3">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">제목</th>
											<th scope="col">첨부파일</th>
											<th scope="col">등록일</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="noticeList" items="${noticeList}" varStatus="status">
										<tr class="notice-bg">
											<td class="num">공지</td>
											<td class="txt-left">
											<a href="#none;" onclick="fn_goView('<c:out value="${noticeList.seq }" />','<c:out value="${noticeList.fileId }" />')" class="title"><c:out value="${noticeList.title}"/>
												<c:if test = "${noticeList.inputDate>=nowday }"><span class="ico-new">NEW</span></c:if>
											</a>
											</td>
											<td class="mo-inline file">
											<c:if test="${not empty noticeList.fileName }">
											<span class="ico-file"></span>
											</c:if>
											<c:if test="${empty noticeList.fileName }">-</c:if>
											<span class="hidden">첨부파일다운로드</span></td>
											<td class="mo-inline date"><c:out value="${fn:substring(noticeList.inputDate,0,10)}"/></td>
											<td class="mo-inline hits"><c:out value="${noticeList.hit}"/></td>
										</tr>
										</c:forEach>
										<c:if test="${empty resultList }">
										<tr>
											<td colspan="5">
												<div class="no-list"><span>등록된 글이 없습니다.</span></div>
											</td>
										</tr>
										</c:if>
										<c:forEach var="result" items="${resultList}" varStatus="status">
										<tr>
											<td class="num"><c:out value="${listNo - status.index}"/></td>
											<td class="txt-left">
											<a href="#none;"  onclick="fn_goView('<c:out value="${result.seq }" />','<c:out value="${result.fileId }" />')" class="title"><c:out value="${result.title}"/>
												<c:if test = "${result.inputDate>=nowday }"><span class="ico-new">NEW</span></c:if>
											</a>
											</td>
											<td class="mo-inline file">
											<c:if test="${not empty result.fileName }"><span class="ico-file"></span></c:if>
											<c:if test="${empty result.fileName }">-</c:if>
											<span class="hidden">첨부파일다운로드</span></td>
											<td class="mo-inline date"><c:out value="${fn:substring(result.inputDate,0,10)}"/></td>
											<td class="mo-inline hits"><c:out value="${result.hit}"/></td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="board-bottom">
								<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>
							</div><!--// board-bottom-->
							</c:otherwise>
						</c:choose>
       				</div><!--// board-wrap-->
       				</form>
       				</div>
<script>
function fn_selectSearch(){
	var f = document.listForm;
	f.typeEtc.value = $("#typeEtc").val();
	f.action = "${bbsMap.bbsId}_list.do";
	f.submit();
}
/* 글 상세보기 화면 function */
function fn_goView(seq,fileId) {
	var f = document.listForm;
	f.seq.value = seq;
	f.fileId.value = fileId;
	f.action = "${bbsMap.bbsId}_view.do";
	f.submit();
}
/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	var f = document.listForm;
	f.action = "${bbsMap.bbsId}_list.do";
	f.page.value = pageNo;
	f.submit();
}
function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "${bbsMap.bbsId}_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}
function fn_orderby(fld, orderby){
	var f = document.listForm;
	f.action = "${bbsMap.bbsId}_list.do";
	f.ordFld.value = fld;
	f.ordBy.value = orderby;
	f.submit();
}
function fn_search(){
	var f = document.listForm;
	f.page.value = 1;
	f.action = "${bbsMap.bbsId}_list.do";
	f.submit();
}
</script>
</body>
</html>