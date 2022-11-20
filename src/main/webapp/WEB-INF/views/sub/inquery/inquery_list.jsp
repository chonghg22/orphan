<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="orderby" uri="/WEB-INF/tlds/orderby.tld" %>
<%@ include file="/WEB-INF/jsp/egovframework/user/sub/include/userLoginChk_include.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>나의 요청/문의 내역</title>
</head>
<body>
        				<div class="sub-title sub4">
					<h2>커뮤니티</h2>
				</div><!--// sub-title-->
			<jsp:include page="/WEB-INF/jsp/layout/include_location_4.jsp">
					<jsp:param name="depth2" value="3" />
				</jsp:include>

      			<div class="content-title">
      				<h3>나의 요청/문의 내역</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->
       			<div class="content">
       			<form name="listForm" id="listForm" method="get">
       			<input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
                <input type="hidden" name="schCode" value="${paramMap.schCode}" />
                <input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
                <input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
                <input type="hidden" name="page" value="${paramMap.page}" />
                <input type="hidden" name="ci" value="${userInfo.ci}">
				<input type="hidden" name="di" value="${userInfo.di}">
                <input type="hidden" name="seq" value=""/>
                <input type="hidden" name="reason" value="" />
       				<div class="board-wrap">
						<div class="board-top">
							<div class="total-num">
								<span>전체</span>
								<strong>${paginationInfo.totalRecordCount}</strong>
								<span>건</span>
							</div>
							<div class="sorting">
								<select title="검색구분" name="schType" id="schType" onchange="fn_schType()">
       								<option value="0" ${ufn:selected(paramMap.schType, '0') }>분류전체</option>
									<option value="1" ${ufn:selected(paramMap.schType, '1') }>공연장 등록</option>
									<option value="2" ${ufn:selected(paramMap.schType, '2') }>공연장 정보변경</option>
									<option value="3" ${ufn:selected(paramMap.schType, '3') }>안전관리조직 정보 변경</option>
									<option value="4" ${ufn:selected(paramMap.schType, '4') }>안전진단 주기 문의</option>
       							</select>
								<select title="검색구분" name="schStatus" id="schStatus" onchange="fn_schStatus()">
       								<option value="0" ${ufn:selected(paramMap.schStatus, '0') }>처리현황 전체</option>
									<option value="1" ${ufn:selected(paramMap.schStatus, '1') }>대기</option>
									<option value="2" ${ufn:selected(paramMap.schStatus, '2') }>승인</option>
									<option value="3" ${ufn:selected(paramMap.schStatus, '3') }>반려</option>
									<option value="4" ${ufn:selected(paramMap.schStatus, '4') }>답변완료</option>
       							</select>
							</div><!--// sorting-->
						</div><!--// board-top-->

						<div class="board-common">
							<table class="table board-list">
								<caption>처리현황에 대한 표로써 번호, 분류, 공연장명, 등록일, 처리현황,처리일 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:5%">
									<col style="width:5%">
									<col style="width:10%">
									<col style="width:5%">
									<col style="width:3%">
									<col style="width:5%">

								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">분류</th>
										<th scope="col">공연장명</th>
										<th scope="col">등록일</th>
										<th scope="col">처리현황</th>
										<th scope="col">처리일</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty resultList }">
									<tr>
										<td colspan="6">
											<div class="no-list"><span>등록된 글이 없습니다.</span></div>
										</td>
									</tr>
									</c:if>
									<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr>
										<td class="num"><c:out value="${listNo - status.index}"/></td>
										<td class="apply-type">
										<c:if test="${result.typeEtc eq '1' }">공연장 등록</c:if>
										<c:if test="${result.typeEtc eq '2' }">공연장 정보변경</c:if>
										<c:if test="${result.type eq '2' }">안전관리조직 정보 변경</c:if>
										<c:if test="${result.type eq '3' }">안전진단 주기 문의</c:if>
										</td>
										<td class="txt-left">
										<a href="javascript:void(0);"  name="seq" onclick="fn_view('${result.seq}');" class="title" ><strong><c:out value="${result.theaterNm}"/></strong>
											<c:if test = "${result.inputDate>=nowday }">
											<span class="ico-new">NEW</span>
											</c:if>
										</a>
										</td>
										<td class="mo-inline apply-date-start"><c:out value="${result.inputDate}"/></td>
										<td class="mo-inline apply-status">
										<c:if test="${result.status eq '1' }"><span class="my-status bg-grey">대기</span></c:if>
										<c:if test="${result.status eq '2' }"><span class="my-status bg-blue">승인</span></c:if>
										<c:if test="${result.status eq '3' }"><span class="my-status bg-red">반려</span></c:if>
										<c:if test="${result.status eq '4' }"><span class="my-status bg-blue">답변완료</span></c:if>
										</td>
										<td class="mo-inline apply-date-end"><c:out value="${result.processDate}"/></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--// board-common-->

						<div class="board-bottom">
							<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>
						</div><!--// board-bottom-->
       				</div><!--// board-wrap-->

                 </div><!--// content-->
<script>
/* 분류 fucntion */
function fn_schType(){
	var f = document.listForm;
	f.schType.value= $("#schType").val();
	f.action = "inquery_list.do";
	f.submit();
}

/* 상세보기 function*/
function fn_view(seq){
	var f = document.listForm;
	f.seq.value = seq;
	f.action = "inquery_view.do";
	f.submit();
}

/* 처리현황 fucntion */
function fn_schStatus(){
	var f = document.listForm;
	f.schStatus.value= $("#schStatus").val();
	f.action = "inquery_list.do";
	f.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	var f = document.listForm;
	f.action = "inquery_list.do";
	f.page.value = pageNo;
	f.submit();
}

function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "inquery_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}

function fn_orderby(fld, orderby){
	var f = document.listForm;
	f.action = "inquery_list.do";
	f.ordFld.value = fld;
	f.ordBy.value = orderby;
	f.submit();
}
</script>
</body>
</html>