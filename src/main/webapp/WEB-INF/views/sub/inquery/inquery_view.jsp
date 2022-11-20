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
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관련법령 정보 - 공연장안전지원센터</title>
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
      			<form name="listForm" id="listForm" method="get">
       			<input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
                <input type="hidden" name="schCode" value="${paramMap.schCode}" />
                <input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
                <input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
                <input type="hidden" name="page" value="${paramMap.page}" />
                <input type="hidden" name="seq" value="${paramMap.seq}"/>
                <input type="hidden" name="reason" value="" />
                <c:if test="${result.status eq '4' }">
                <div class="content">       			
       				<div class="my-apply">
						<div class="table-set mb-50">
							<h4 class="title bo-0">처리현황</h4>
							<span class="date"><c:out value="${fn:substring(result.processDate,0,10)}"></c:out></span>
							<table class="table">
								<caption>처리현황에 대한 표로써 상태, 내용 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:30%">
									<col style="width:70%">
								</colgroup>
								<tbody>
									<tr>
										<th scope="col"><span class="my-status bg-blue">답변완료</span></th>
										<td class="txt-left"><strong>답변내용</strong><c:out value="${result.message}"></c:out></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="board-wrap">
							<h4 class="title bo-0">안전진단 주기 문의</h4>
							<span class="date"><c:out value="${fn:substring(result.inputDate,0,10)}"></c:out></span>
							<div class="board-write">
								<div class="section">
									<div class="input-field">
										<strong class="title"><span class="ico-require">*</span>이름(담당자명)</strong>
										<div class="txt"><c:out value="${result.name}"></c:out></div>
									</div>
									<div class="input-field">
										<strong class="title"><span class="ico-require">*</span>공연장명</strong>
										<div class="txt"><c:out value="${result.theaterNm}"></c:out></div>
									</div>
								</div>
								<div class="section">
									<div class="input-field">
										<strong class="title"><span class="ico-require">*</span>휴대폰번호</strong>
										<div class="txt"><c:out value="${result.hp}"></c:out></div>
									</div>
									<div class="input-field input-file">
										<strong class="title"><span class="ico-require">*</span>공연장등록증</strong>
										<div class="txt">
											<c:if test="${not empty result.fileName}">
												<a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','inquery',result.fileName,result.fileOrgName) }" />"><c:out value="${result.fileOrgName}" /></a>
											</c:if>
										</div>
									</div>
								</div>
								<div class="section">
									<div class="input-field input-email">
										<strong class="title"><span class="ico-require">*</span>이메일주소</strong>
										<div class="txt"><c:out value="${result.email}"></c:out></div>
									</div>
								</div>
								<div class="section">
									<div class="input-field input-email">
										<strong class="title"><span class="ico-require">*</span>기타문의사항</strong>
										<div class="txt"><c:out value="${result.contents}"></c:out></div>
									</div>
								</div>
							</div><!--// board-write-->

							<div class="board-bottom">
								<div class="btn-box">
									<a href="#none" onclick="fn_list()" class="btn bg-blue">목록</a>
								</div><!--// btn-box-->
							</div><!--// board-bottom-->
						</div><!--// board-wrap-->
       				</div><!--// my-apply-->
                 </div><!--// content-->
                </c:if>
                <c:if test="${result.status ne '4' }">
                <div class="content">
       				<div class="my-apply">
						<div class="table-set mb-50">
							<h4 class="title bo-0">처리현황</h4>
							<span class="date"><c:out value="${fn:substring(result.processDate,0,10)}"/></span>
							<table class="table">
								<caption>처리현황에 대한 표로써 상태, 내용 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:30%">
									<col style="width:70%">
								</colgroup>
								<tbody>
								<c:if test="${result.status eq '1' }">
									<tr>
										<th scope="col"><span class="my-status bg-grey">대기</span></th>
										<td class="txt-left">※ 관리자의 확인을 기다리는 중입니다. </td>
									</tr>
								</c:if>
								<c:if test="${result.status eq '2' }">
									<tr>
										<th scope="col"><span class="my-status bg-blue">승인</span></th>
										<td class="txt-left">※ 요청하신 사항이 승인되어, ‘공연장 정보 및 안전현황’ 화면에서 확인하시기 바랍니다. </td>
									</tr>
								</c:if>
								<c:if test="${result.status eq '3' }">
									<tr>
										<th scope="col"><span class="my-status bg-red">반려</span></th>
										<td class="txt-left"><strong>반려사유</strong> <c:out value="${result.message}"/></td>
									</tr>
								</c:if>
								</tbody>
							</table>
						</div>
						<div class="board-wrap">
							<h4 class="title bo-0"><c:out value="${result.title}"/></h4>
							<span class="date"><c:out value="${fn:substring(result.inputDate,0,10)}"/></span>
							<div class="board-write">
								<div class="section">
									<div class="input-field">
										<strong class="title"><span class="ico-require">*</span>이름(담당자명)</strong>
										<div class="txt"><c:out value="${result.name}"/></div>
									</div>
									<div class="input-field">
										<strong class="title"><span class="ico-require">*</span>공연장명</strong>
										<div class="txt"><c:out value="${result.theaterNm}"/></div>
									</div>
								</div>
								<div class="section">
									<div class="input-field">
										<strong class="title"><span class="ico-require">*</span>휴대폰번호</strong>
										<div class="txt"><c:out value="${result.hp}"/></div>
									</div>
									<div class="input-field input-file">
										<strong class="title"><span class="ico-require">*</span>
										<c:if test="${result.title eq '안전관리조직 정보 변경 요청'}">
										수료증 등록
										</c:if>
										<c:if test="${result.title eq '공연장 등록 요청'}">
										공연장 등록증
										</c:if>
										<c:if test="${result.title eq '안전진단 주기 문의'}">
										첨부파일(공연장등록증, 최근 안전진단 결과 보고서 등)
										</c:if>
										<c:if test="${result.title eq '공연장 정보 변경 요청'}">
										첨부파일(공연장등록증 등)
										</c:if>
										</strong>
										<div class="txt">
											<c:if test="${not empty result.fileName}">
												<a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','inquery',result.fileName,result.fileOrgName) }" />"><c:out value="${result.fileOrgName}" /></a>
											</c:if>
										</div>
									</div>
								</div>
								<div class="section">
									<div class="input-field input-email">
										<strong class="title"><span class="ico-require">*</span>이메일주소</strong>
										<div class="txt"><c:out value="${result.email}"/></div>
									</div>
									<c:if test="${result.title eq '공연장 정보 변경 요청' or result.title eq '안전관리조직 정보 변경 요청'}">
									<div class="input-field input-email">
										<strong class="title"><span class="ico-require">*</span>공연장 등록번호</strong>
										<div class="txt"><c:out value="${result.theaterRegNm}"/>-<c:out value="${result.theaterRegNo}"/></div>
									</div>
									</c:if>
								</div>
								<c:if test="${result.title eq '안전관리조직 정보 변경 요청'}">
								<div class="section">
									<div class="input-field input-email">
										<strong class="title"><span class="ico-require">*</span>안전총괄책임자</strong>
										<div class="txt">
											<c:if test="${result.safetyOverallChief eq '1'}">있음</c:if>
											<c:if test="${result.safetyOverallChief eq '2'}">없음</c:if>
										</div>
									</div>
									<div class="input-field input-email">
										<strong class="title"><span class="ico-require">*</span>안전관리조직담당자</strong>
										<div class="txt">
										<c:choose>
											<c:when test="${result.safetyMngManager eq '0'}">
											없음
											</c:when>
											<c:otherwise>
											<c:out value="${result.safetyMngManager}"/>명
											</c:otherwise>
										</c:choose>
										</div>
									</div>
								</div>
								</c:if>
								<c:if test="${result.title ne '안전관리조직 정보 변경 요청'}">
								<div class="section">
									<div class="input-field input-other">
										<strong class="title"><span class="ico-require">*</span>문의사항</strong>
										<div class="txt"><c:out value="${result.contents}"/></div>
									</div>
								</div>
								</c:if>
							</div><!--// board-write-->

							<div class="board-bottom">
								<div class="btn-box">
									<a href="#none;"  onclick="fn_list()" class="btn bg-blue">목록</a>
								</div><!--// btn-box-->
							</div><!--// board-bottom-->
						</div><!--// board-wrap-->
       				</div><!--// my-apply-->
                 </div><!--// content-->
                </c:if>	    	
       			</form>  
<script>
/* 목록으로 돌아가기 fucntion */
function fn_list(){
	var f = document.listForm;
	f.action = "inquery_list.do";
	f.submit();
}

</script>                
</body>
</html>