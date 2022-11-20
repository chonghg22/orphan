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
	<title>통합검색</title>
</head>
<body>
      			<div class="content-title">
					<h3>통합검색</h3>
      			</div><!--// content-title-->

       			<div class="content">
       				<div class="search-wrap">
						<form name="middleSearchFrm" method="get" action="/web/sub/search/search_list.do" onsubmit="return fn_goMiddleSearchPageReturn();">
						<input type="hidden" name="page" value="<c:out value="${paramMap.page}" />" />
						<input type="hidden" name="schType" value="<c:out value="${paramMap.schType}" />" />
       					<div class="section">
       						<div class="search-type1">
       							<input type="text" name="schStr" title="검색입력란" value="<c:out value="${paramMap.schStr}" />">
       							<a href="#" class="submit-btn" title="검색" onclick="fn_goMiddleSearchPage();"><span class="hidden">검색</span></a>
       						</div>
       					</div>
       					</form>
       				</div><!--//search-wrap-->

					<h4 class="title bo-0"><strong class="txt-color-blue">‘<c:out value="${paramMap.schStr}" />'</strong> 에 대한 통합검색 결과 총 <strong class="txt-color-blue">
					<c:choose>
					<c:when test="${paramMap.schType eq 'united'}">
						<c:out value="${paramMap.contentsCnt + paramMap.bbsCnt}" />
					</c:when>
					<c:when test="${paramMap.schType eq 'contents'}">
						<c:out value="${paramMap.contentsCnt}" />
					</c:when>
					<c:when test="${paramMap.schType eq 'bbs'}">
						<c:out value="${paramMap.bbsCnt}" />
					</c:when>
					</c:choose>
					</strong> 건이 검색되었습니다.</h4>

					<c:set var="replaceSearchStr" value="<span style='color:red'>${paramMap.schStr}</span>"/>
					<c:if test="${paramMap.schType eq 'united' or paramMap.schType eq 'contents'}">
       				<div class="board-wrap">
						<div class="board-top">
							<div class="total-num">
								<span>웹페이지 검색결과</span>
								<strong>(<c:out value="${paramMap.contentsCnt}" />)</strong>
							</div>
						</div><!--// board-top-->

						<ul class="search-result">
							<c:forEach var="result" items="${contentsList}" varStatus="status">
							<li>
								<a href="/web/sub/contents/${result.link}.do">
									<div class="pg-location">
										${result.title}
									</div>
									<p>
										<c:set var="antiHtmlStr" value="${ufn:getAntiHtml(result.contents, '')}"/>
										<c:set var="indexofStr" value="${fn:indexOf(antiHtmlStr, paramMap.schStr) - 50}"/>
										<c:set var="contents" value="${fn:substring(antiHtmlStr, indexofStr, fn:length(antiHtmlStr))}"/>
										<c:if test="${indexofStr gt 10}">... </c:if><c:out value="${fn:replace(ufn:cutString(contents, 300, '...'), paramMap.schStr, replaceSearchStr)}" escapeXml="false"/>
									</p>
								</a>
							</li>
							</c:forEach>
							<c:if test="${paramMap.contentsCnt eq 0}">
							<li>
								<div class="mt-20" style="text-align:center">
									검색 결과가 없습니다.
								</div>
							</li>
							</c:if>
						</ul><!--// search-result-->
						<c:if test="${paramMap.schType eq 'united' and paramMap.contentsCnt > 0}">
						<div class="mt-20" style="text-align:right">
							<a href="#none" onclick="fn_contentsMore()" class="more-btn">MORE +</a>
						</div>
						</c:if>
						<c:if test="${paramMap.schType eq 'contents'}">
						<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>
						</c:if>
       				</div><!--// board-wrap-->
       				</c:if>

					<c:if test="${paramMap.schType eq 'united'}">
					<div class="mt-20"></div>
					</c:if>

					<c:if test="${paramMap.schType eq 'united' or paramMap.schType eq 'bbs'}">
       				<div class="board-wrap">
						<div class="board-top">
							<div class="total-num">
								<span>게시판 검색결과</span>
								<strong>(<c:out value="${paramMap.bbsCnt}" />)</strong>
							</div>
						</div><!--// board-top-->

						<ul class="search-result">
							<c:forEach var="result" items="${bbsList}" varStatus="status">
							<li>
								<c:choose>
									<c:when test="${result.bbsId ne 'faq'}">
								<a href="/web/sub/board/${result.bbsId}_view.do?viewCount=10&schCode=&ordFld=&ordBy=&page=1&seq=${result.seq}">
									</c:when>
									<c:otherwise>
								<a href="/web/sub/board/faq_list.do?viewCount=10&schCode=&ordFld=&ordBy=&page=1&seq=&fileId=&reason=&openYn=Y&schFld=0&schStr=<c:out value="${paramMap.schStr}"/>&typeEtc=0">
									</c:otherwise>
								</c:choose>
									
									<div class="pg-location">
										${result.title}
									</div>
									<p class="title" style ="color: #000000; font-weight:bold;">${result.boardTitle}</p>
									<p>
										<c:set var="antiHtmlStr" value="${ufn:getAntiHtml(result.contents, '')}"/>
										<c:set var="indexofStr" value="${fn:indexOf(antiHtmlStr, paramMap.schStr) - 50}"/>
										<c:set var="contents" value="${fn:substring(antiHtmlStr, indexofStr, fn:length(antiHtmlStr))}"/>
										<c:if test="${indexofStr gt 10}">... </c:if><c:out value="${fn:replace(ufn:cutString(contents, 300, '...'), paramMap.schStr, replaceSearchStr)}" escapeXml="false"/>
									</p>
								</a>
							</li>
							</c:forEach>
							<c:if test="${paramMap.bbsCnt eq 0}">
							<li>
								<div class="mt-20" style="text-align:center">
									검색 결과가 없습니다.
								</div>
							</li>
							</c:if>
						</ul><!--// search-result-->
						<c:if test="${paramMap.schType eq 'united' and paramMap.bbsCnt > 0}">
						<div class="mt-20" style="text-align:right">
							<a href="#none" onclick="fn_bbsMore()" class="more-btn">MORE +</a>
						</div>
						</c:if>
						<c:if test="${paramMap.schType eq 'bbs'}">
						<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>
						</c:if>
       				</div><!--// board-wrap-->
       				</c:if>
       			</div>
<script>
function fn_goMiddleSearchPageReturn() {
	fn_goMiddleSearchPage();
	return false;
}

function fn_goMiddleSearchPage() {
	var f = document.middleSearchFrm;
	if (!f.schStr.value) {
		alert("검색어를 입력하세요.");
		return;
	}

	f.schType.value = "united";
	f.page.value = 1;
	f.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	var f = document.middleSearchFrm;
	f.page.value = pageNo;
	f.submit();
}

function fn_contentsMore() {
	var frm = document.middleSearchFrm;
	frm.schType.value = "contents";
	frm.submit();
}

function fn_bbsMore() {
	var frm = document.middleSearchFrm;
	frm.schType.value = "bbs";
	frm.submit();
}
</script>
</body>
</html>