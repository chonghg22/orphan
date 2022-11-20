<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="orderby" uri="/WEB-INF/tlds/orderby.tld" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate var="todayDate" value="${now}" pattern="yyyy-MM-dd" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>공연장 정보 및 안전현황 - 공연장안전지원센터</title>
</head>
<body>
        		<div class="sub-title sub2">
					<h2>안전현황</h2>
				</div><!--// sub-title-->

				<jsp:include page="/WEB-INF/jsp/layout/include_location_2.jsp">
					<jsp:param name="depth2" value="1" />
				</jsp:include>

      			<div class="content-title">
      				<h3>공연장 정보 및 안전현황</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       				<form name="listForm" id="listForm" method="get">
	                <input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
	                <input type="hidden" name="schCode" value="${paramMap.schCode}" />
	                <input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
	                <input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
	                <input type="hidden" name="page" value="${paramMap.page}" />
	                <input type="hidden" name="status" value="${paramMap.status}" />
	                <input type="hidden" name="orders" value="${paramMap.orders}" />
	                <input type="hidden" name="seatsCount" value="${paramMap.seatsCount}" />
	                <input type="hidden" name="operateCount" value="${paramMap.operateCount}" />
	                <input type="hidden" name="operationBody" value="${paramMap.operationBody}" />
	                <input type="hidden" name="sigungu" value="${paramMap.sigungu}" />
	                <input type="hidden" name="sido" value="${paramMap.sido}" />
	                <input type="hidden" name="seq" value="" />
	                <input type="hidden" name="reason" value="" />
       				<div class="pg-safe-view">
       					<div class="top-info">
       						<div class="title">
       							<h4><c:out value="${theater.theaterNm}"/></h4>
       							<div class="right-btn">
       								<c:if test="${empty userInfo }">
       									<a href="/web/sub/theater/inquery_ph_ck.do?seq=${theater.theaterSeq}" class="btn bg-white" >공연장 정보 변경 요청</a>
       								</c:if>
       								<c:if test="${not empty userInfo }">
										<a href="/web/sub/theater/inquery1_edit.do?seq=${theater.theaterSeq}" class="btn bg-white" >공연장 정보 변경 요청</a>
									</c:if>
									<div class="help-wrap">
										<button type="button" class="help-btn">도움말</button>
										<div class="help-txt">
											공연장 정보가 공연장등록증과 다를 경우, 공연장 담당자는 공연장 정보 변경 요청을 해주시기 바랍니다.
										</div>
									</div>
								</div>
       						</div>
       						<div class="section-inner">
								<table class="list">
									<caption>공연장 정보 및 안전현황에 대한 표로써 운영여부, 운영주체, 관할지자체, 주소 항목으로 구성됩니다.</caption>
									<tbody>
										<tr>
											<th scope="row">운영여부</th>
											<td>
											<c:choose>
													<c:when test="${theater.operationYn eq 'Y'}">
													운영
													</c:when>
													<c:otherwise>
													폐관
													</c:otherwise>
													</c:choose>
											</td>
										</tr>
										<tr>
											<th scope="row">운영주체</th>
											<td>
												<c:choose>
													<c:when test="${theater.operationBody eq 'N'}">정보없음</c:when>
													<c:when test="${theater.operationBody eq 'P'}">공공</c:when>
													<c:when test="${theater.operationBody eq 'C'}">민간</c:when>
												</c:choose>
											</td>
										</tr>
										<tr>
											<th scope="row">관할지자체</th>
											<td><c:out value="${theater.sido} "/><c:out value="${theater.sigungu} "/><c:out value="${theater.gu}"/></td>
										</tr>
										<tr>
											<th scope="row">주소</th>
											<td><c:out value="[${theater.zipcode}] " /><c:out value="${theater.address} " /><c:out value="${theater.addressDetail}" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="section-inner">
								<table class="list">
									<caption>공연장 정보 및 안전현황에 대한 표로써 공연장 등록일, 객석 수, 고정식 무대기구 수, 구동식 무대기구 수 항목으로 구성됩니다.</caption>
									<tbody>
										<tr>
											<th scope="row">공연장 등록일</th>
											<c:if test="${empty theater.theaterRegDate}">
											<td>-</td>
											</c:if>
											<td><c:out value="${theater.theaterRegDate}"/></td>
										</tr>
										<tr>
											<th scope="row">객석 수${result.seatsType}</th>
											<td>
												<c:choose>
													<c:when test="${theater.seatsType eq '2'}">기타 - <c:out value="${theater.seatsEtc}"/></c:when>
													<c:when test="${theater.seatsType eq '3'}">기타(정보없음)</c:when>
													<c:when test="${theater.seatsCount eq '99999'}">-</c:when>
													<c:otherwise><c:out value="${theater.seatsCount}"/></c:otherwise>
												</c:choose>
											</td>
										</tr>
										<tr>
											<th scope="row">고정식 무대기구 수</th>
											<c:if test="${empty theater.fixCount}">
											<td>-</td>
											</c:if>
											<td>
											<c:choose>
												<c:when test="${theater.fixCount eq '99999'}">-</c:when>
												<c:otherwise><c:out value="${theater.fixCount}"/></c:otherwise>
											</c:choose>
											</td>
										</tr>
										<tr>
											<th scope="row">구동식 무대기구 수<small>(공연장등록증 기준)</small></th>
											<c:if test="${empty theater.operateCount}">
											<td>-</td>
											</c:if>
											<td>
											<c:choose>
												<c:when test="${theater.operateCount eq '99999'}">-</c:when>
												<c:otherwise><c:out value="${theater.seatsCount}"/></c:otherwise>
											</c:choose>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
       					</div><!--// top-info-->
       					<div class="section">
       						<div class="section-inner">
       							<div class="title">
									<h5>공연장 안전진단 정보</h5>
									<div class="right-btn">
										<c:if test="${empty userInfo }">
	       									<a href="/web/sub/theater/inquery_ph_ck.do?seq=${theater.theaterSeq}" class="btn bg-blue" >주기 문의하기</a>
	       								</c:if>
	       								<c:if test="${not empty userInfo }">
											<a href="/web/sub/theater/inquery3_input.do?seq=${theater.theaterSeq }" class="btn bg-blue" >주기 문의하기</a>
										</c:if>
										<div class="help-wrap">
											<button type="button" class="help-btn">도움말</button>
											<div class="help-txt">
												안전진단 주기 관련하여 문의사항이 있으실 경우 “주기 문의하기” 버튼을 클릭하여 문의 주시면 빠른 시일 내에 답변을 드립니다.
											</div>
										</div>
									</div>
								</div>
								<table class="list mb-40">
									<caption>안전관리조직 정보가 변경되거나 다른 경우, 공연장 담당자는 정보 변경 요청을 해주시기 바랍니다. </caption>
									<tbody>
										<tr>
											<th scope="row">최근정기안전검사일</th>
											<c:if test="${empty result.diagnosisType2Date}">
											<td>-</td>
											</c:if>
											<td><c:out value="${result.diagnosisType2Date }" /></td>
										</tr>
										<tr>
											<th scope="row">최근정밀안전진단일</th>
											<c:if test="${empty result.diagnosisType3Date}">
											<td>-</td>
											</c:if>
											<td><c:out value="${result.diagnosisType3Date }" /></td>
										</tr>
										<tr>
											<th scope="row">정기안전검사예정일</th>
											<td>
										<c:choose>
											<c:when test="${not empty result}">
												<c:if test="${todayDate > result.testEndDate}">
												즉시
												</c:if>
												<c:if test="${todayDate <= result.testEndDate}">
												<c:out value="${result.testStartDate}"/> ~ <c:out value="${result.testEndDate}"/>
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${todayDate > theater.testEndDate}">
												즉시
												</c:if>
												<c:if test="${todayDate <= theater.testEndDate}">
												<c:out value="${theater.testStartDate}"/> ~ <c:out value="${theater.testEndDate}"/>
												</c:if>
											</c:otherwise>
										</c:choose>
											</td>
										</tr>
										<tr>
											<th scope="row">정밀안전진단예정일</th>
											<td>
										<c:choose>
											<c:when test="${not empty result}">
												<c:if test="${todayDate > result.test2EndDate}">
												즉시
												</c:if>
												<c:if test="${todayDate <= result.test2EndDate}">
												<c:out value="${result.test2StartDate }" /> ~ <c:out value="${result.test2EndDate }" />
												</c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${todayDate > theater.test2EndDate}">
												즉시
												</c:if>
												<c:if test="${todayDate <= theater.test2EndDate}">
												<c:out value="${theater.test2StartDate}"/> ~ <c:out value="${theater.test2EndDate}"/>
												</c:if>
											</c:otherwise>
										</c:choose>
											</td>
										</tr>
									</tbody>
								</table>
       						</div>
       						<div class="section-inner mb-40">
       							<div class="title">
									<h5>안전관리조직 정보</h5>
									<div class="right-btn">
										<c:if test="${empty userInfo }">
	       									<a href="/web/sub/theater/inquery_ph_ck.do?seq=${theater.theaterSeq}"  class="btn bg-blue" >안전관리조직 정보 변경 요청</a>
	       								</c:if>
	       								<c:if test="${not empty userInfo }">
											<a href="/web/sub/theater/inquery2_edit.do?seq=${theater.theaterSeq }" class="btn bg-blue" >안전관리조직 정보 변경 요청</a>
										</c:if>
										<div class="help-wrap">
											<button type="button" class="help-btn">도움말</button>
											<div class="help-txt">
												안전관리조직 정보가 변경되거나 다른 경우, 공연장 담당자는 정보 변경 요청을 해주시기 바랍니다.
											</div>
										</div>
									</div>
								</div>
							<c:choose>
								<c:when test="${theater.seatsCount >= 500}">
								<table class="list">
									<caption>안전관리조직 정보에 대한 표로써 안전총괄책임자, 안전교육수료일, 교육유효기간 항목으로 구성됩니다.</caption>
									<tbody>
										<tr>
											<th scope="row">안전총괄책임자</th>
											<c:if test="${empty safeResult.safetyOverallChief}">
											<td>-</td>
											</c:if>
											<td><c:out value="${safeResult.safetyOverallChief}" /></td>
										</tr>
										<tr>
											<th scope="row">안전교육수료일</th>
											<c:if test="${empty safeResult.chiefCompletionDt}">
											<td>-</td>
											</c:if>
											<td><c:out value="${safeResult.chiefCompletionDt}" /></td>
										</tr>
										<tr>
											<th scope="row">교육유효기간</th>
											<td><c:choose>
													<c:when test="${not empty safeResult.chiefCompletionDt}">
													<span id="date_info1"></span>
													</c:when>
													<c:otherwise>없음</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</tbody>
								</table>
      							<table class="list">
      								<caption>안전관리조직 정보에 대한 표로써 안전관리담당자, 안전교육수료일, 교육유효기간 항목으로 구성됩니다.</caption>
      								<tbody>
										<tr>
											<th scope="row">안전관리담당자</th>
											<c:choose>
												<c:when test="${empty safeResult.safetyMngManager}">
												<td>-</td>
												</c:when>
												<c:otherwise>
												<td><c:out value="${safeResult.safetyMngManager}"/>명</td>	
												</c:otherwise>
											</c:choose>
										</tr>
										<tr>
											<th scope="row">안전교육수료일</th>
											<c:if test="${empty safeResult.managerCompletionDt}">
											<td>-</td>
											</c:if>
											<td><c:out value="${safeResult.managerCompletionDt}"/></td>
										</tr>
										<tr>
											<th scope="row">교육유효기간</th>
											<td>
												<c:choose>
													<c:when test="${not empty safeResult.managerCompletionDt}">
													<span id="date_info2"></span>
													</c:when>
													<c:otherwise>없음</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</tbody>
								</table>
								</c:when>
								<c:otherwise>
								<table class="list">
									<caption>안전관리조직 정보에 대한 표로써 안전총괄책임자, 안전교육수료일, 교육유효기간 항목으로 구성됩니다.</caption>
									<tbody>
										<tr>
											<th scope="row">안전총괄책임자</th>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">안전교육수료일</th>
											<td>해당사항 없음</td>
										</tr>
										<tr>
											<th scope="row">교육유효기간</th>
											<td>해당사항 없음</td>
										</tr>
									</tbody>
								</table>
      							<table class="list">
      								<caption>안전관리조직 정보에 대한 표로써 안전관리담당자, 안전교육수료일, 교육유효기간 항목으로 구성됩니다.</caption>
      								<tbody>
										<tr>
											<th scope="row">안전관리담당자</th>
											<td>-</td>
										</tr>
										<tr>
											<th scope="row">안전교육수료일</th>
											<td>해당사항 없음</td>
										</tr>
										<tr>
											<th scope="row">교육유효기간</th>
											<td>해당사항 없음</td>
										</tr>
									</tbody>
								</table>
								</c:otherwise>
							</c:choose>
       						</div>
							<p class="bg-txt">
								※ 정기 안전검사와 정밀안전진단의 예정일이 근접한 경우, 공연법 제12조제3항에 따라 정밀안전진단이 정기안전검사를 포함하기 때문에 두 예정일 중 먼저 도래하는 날에 정밀안전진단을 수행하시면, 차기 정기 안전검사 주기는 정밀안전진단을 받은 날로부터 3년이 되는 날입니다.
							</p>
       					</div><!--// section-->

       					<div class="section wid-f">
       						<div class="title">
       							<h5>공연장 안전진단 결과</h5>
       						</div>
       						<c:if test="${ empty result }">
       							<div class="no-list"><span>안전진단 결과가 없습니다.</span></div>
       						</c:if>
<c:if test="${ not empty result }">
       						<div class="section-inner">
								<table class="list">
									<caption>공연장 안전진단 결과에 대한 표로써 구동식 무대기구 수, 진단 종류 항목으로 구성됩니다.</caption>
									<tbody>
										<tr>
											<th>구동식 무대기구 수</th>
											<td><c:out value="${theater.operateCount}"/></td>
										</tr>
										<tr>
											<th>진단 종류</th>
											<td>
												<c:choose>
													<c:when test="${result.diagnosisType eq '1'}">등록 전 안전검사</c:when>
													<c:when test="${result.diagnosisType eq '2'}">정기 안전검사</c:when>
													<c:when test="${result.diagnosisType eq '3'}">정밀 안전진단</c:when>
												</c:choose>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<div class="section-inner mb-40">
								<table class="list">
									<caption>공연장 안전진단 결과에 대한 표로써 진단기관, 시작일/종료일 항목으로 구성됩니다.</caption>
									<tbody>
										<tr>
											<th>진단기관</th>
											<td><c:out value="${result.diagnosisName }" /></td>
										</tr>
										<tr>
											<th>시작일/종료일</th>
											<td><c:out value="${result.diagnosisStartDate }" /> ~ <c:out value="${result.diagnosisEndDate }" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<c:if test="${result.operateCount eq '0'}">
							<div class="section-inner wid-f">
								<table class="table">
									<caption>안전진단 결과에 대한 표로써 안전진단 항목, 결과, 주요지적 사항 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:33.3%">
										<col style="width:66.7%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">안전진단 항목</th>
											<th scope="col">안전진단 결과</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row">구조물 및 프레임</th>
											<td>
											<c:if test="${result.result1 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result1 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result1 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result1 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">와이어로프 및 체결도구</th>
											<td>
											<c:if test="${result.result2 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result2 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result2 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result2 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">체인</th>
											<td>
											<c:if test="${result.result3 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result3 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result3 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result3 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">상부 그리드</th>
											<td>
											<c:if test="${result.result4 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result4 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result4 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result4 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">무대바닥</th>
											<td>
											<c:if test="${result.result5 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result5 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result5 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result5 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">배전반</th>
											<td>
											<c:if test="${result.result6 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result6 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result6 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result6 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">조작반</th>
											<td>
											<c:if test="${result.result7 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result7 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result7 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result7 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">배선 및 배관</th>
											<td>
											<c:if test="${result.result8 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result8 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result8 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result8 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
										<tr>
											<th scope="row">기타사항</th>
											<td>
											<c:if test="${result.result9 eq 'A' }"><span class="grade-a">A</span></c:if>
											<c:if test="${result.result9 eq 'B' }"><span class="grade-b">B</span></c:if>
											<c:if test="${result.result9 eq 'C' }"><span class="grade-c">C</span></c:if>
											<c:if test="${result.result9 eq '해당없음' }"><span>해당없음</span></c:if>
											</td>
										</tr>
									</tbody>
								</table>
								<table class="table mt-20">
									<caption>안전진단 결과에 대한 표로써 종합의견 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:33.3%">
										<col style="width:66.7%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="bg-lt-grey">종합의견</th>
											<td>
												<% pageContext.setAttribute("newLineChar", "\n"); %>
												${fn:replace(result.memo, newLineChar, "<br/>")}
											</td>
										</tr>
									</tbody>
								</table>
								<ul class="legend">
									<li><span class="grade-a">A</span>안전상태가 양호한 무대시설</li>
									<li><span class="grade-b">B</span>보수나 요소부품의 교체가 필요한 무대시설</li>
									<li><span class="grade-c">C</span>구동부 전체 또는 시스템 전체에 대한 교체가 필요한 무대시설</li>
								</ul>
							</div>
							</c:if>
							<c:if test="${result.operateCount gt '0' }">
							<div class="section-inner wid-f">
								<div class="btn-box txt-right"></div>
								<table class="table">
									<caption>안전진단 결과에 대한 표로써 안전진단 항목, 결과, 주요지적 사항 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:30%" span="2">
										<col style="width:13.33%" span="3">
									</colgroup>
									<thead>
										<tr>
											<th scope="col" rowspan="2" colspan="2">안전진단 항목</th>
											<th scope="col" colspan="3">안전진단 결과</th>
										</tr>
                                        <tr>
                                            <th scope="col"><span class="grade-a">A</span></th>
                                            <th scope="col"><span class="grade-b">B</span></th>
                                            <th scope="col"><span class="grade-c">C</span></th>
                                        </tr>
									</thead>
									<tbody>
										<tr>
											<th scope="row" rowspan="4">상부 무대시설</th>
											<th scope="row">방화막</th>
                                            <td><c:out value="${result.result1A }" /></td>
											<td><c:out value="${result.result1B }" /></td>
											<td><c:out value="${result.result1C }" /></td>
										</tr>
										<tr>
                                            <th scope="row">막시설</th>
                                            <td><c:out value="${result.result2A }" /></td>
											<td><c:out value="${result.result2B }" /></td>
											<td><c:out value="${result.result2C }" /></td>
										</tr>
										<tr>
											<th scope="row">음향시설</th>
                                            <td><c:out value="${result.result3A }" /></td>
											<td><c:out value="${result.result3B }" /></td>
											<td><c:out value="${result.result3C }" /></td>
										</tr>
                                        <tr>
											<th scope="row">조명시설</th>
                                            <td><c:out value="${result.result4A }" /></td>
											<td><c:out value="${result.result4B }" /></td>
											<td><c:out value="${result.result4C }" /></td>
										</tr>

                                        <tr>
											<th scope="row" rowspan="4">하부 무대시설</th>
											<th scope="row">연주승강무대</th>
                                            <td><c:out value="${result.result5A }" /></td>
											<td><c:out value="${result.result5B }" /></td>
											<td><c:out value="${result.result5C }" /></td>
										</tr>
										<tr>
                                            <th scope="row">회전무대</th>
                                            <td><c:out value="${result.result6A }" /></td>
											<td><c:out value="${result.result6B }" /></td>
											<td><c:out value="${result.result6C }" /></td>
										</tr>
										<tr>
											<th scope="row">승강무대</th>
                                            <td><c:out value="${result.result7A }" /></td>
											<td><c:out value="${result.result7B }" /></td>
											<td><c:out value="${result.result7C }" /></td>
										</tr>
                                        <tr>
											<th scope="row">이동무대</th>
                                            <td><c:out value="${result.result8A }" /></td>
											<td><c:out value="${result.result8B }" /></td>
											<td><c:out value="${result.result8C }" /></td>
										</tr>

                                        <tr>
											<th scope="row">기타 및 공통시설</th>
											<th scope="row">기타 및 공통시설</th>
                                            <td><c:out value="${result.result9A }" /></td>
											<td><c:out value="${result.result9B }" /></td>
											<td><c:out value="${result.result9C }" /></td>
										</tr>
									</tbody>
								</table>
								<table class="table mt-20">
									<caption>안전진단 결과에 대한 표로써 종합의견 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:30%">
										<col style="width:70%">
									</colgroup>
									<tbody>
										<tr>
											<th scope="row" class="bg-lt-grey">종합의견</th>
											<td>
												${fn:replace(result.memo, newLineChar, "<br/>")}
											</td>
										</tr>
									</tbody>
								</table>
								<ul class="legend">
									<li><span class="grade-a">A</span>안전상태가 양호한 무대시설</li>
									<li><span class="grade-b">B</span>보수나 요소부품의 교체가 필요한 무대시설</li>
									<li><span class="grade-c">C</span>구동부 전체 또는 시스템 전체에 대한 교체가 필요한 무대시설</li>
								</ul>
							</div>
							</c:if>
       					</c:if>
       					</div>
       					<c:if test="${not empty theater.file3Name}">
      					<div class="section wid-f">
       						<div class="title bo-0 mb-0 pb-0">
								<h5 >공연장 피난 안내 정보</h5>
      							<div class="left-btn">
									 <button type="button" class="btn bg-blue pop-open-btn" onclick="fn_imgPopup()">이미지 바로보기</button>
								</div>
       						</div>
						</div> 
						</c:if>
      					<div class="btn-box">
      						<a href="#" onclick="fn_list()" class="btn bg-blue">목록</a>
      					</div>
                 </div><!--// content-->
				</form>
			</div>
				<div id="refugeInfo" class="popup-wrap popup-lg" tabindex="1">
				<div class="popup-inner">
					<div class="popup-top">
						<span class="popup-tit">공연장 피난 안내 정보</span>
					</div><!--//popup_top-->
					<div class="popup-con">
						<div class="refuge-img">
							<img src="/theater/${theater.file3Name}" alt="공연장피난안내정보">
						</div>
						<div class="btn-box txt-right">
							<button type="button" class="btn bg-blue close" onclick="fn_imgClose()">닫기</button>
						</div>
					</div><!--//popup_con-->
					<button type="button" class="close close-btn" onclick="fn_imgClose()">팝업닫기</button>
					<span class="focus-return" tabindex="0">포커스 처음으로 이동</span>
				</div><!--//popup_content-->
			</div><!--// popup-wrap-->
<script>

/*이미지 바로보기 Open Function*/
function fn_imgPopup(){
	$('#refugeInfo').show();
}

/*이미지바로보기 Close Function*/
function fn_imgClose(){
	$('#refugeInfo').hide();
}
/* 목록으로 돌아가기 */
function fn_list() {
	var frm = document.listForm;
	frm.action = "theater_list.do";
	frm.submit();
}

/* 공연장 정보 변경 요청 function*/
function fn_edit(seq) {
	var frm = document.listForm;
	frm.seq.value = seq;
	frm.method = "post";
	frm.action = "inquery1_ph_check.do";
	frm.submit();
}

/* 주기 문의하기 function*/
function fn_qna(seq) {
	var frm = document.listForm;
	frm.seq.value = seq;
	frm.method = "post";
	frm.action = "inquery3_ph_ck.do";
	frm.submit();
}

/* 안전관리조직 정보 변경 요청 function*/
function fn_update(seq) {
	var frm = document.listForm;
	frm.seq.value = seq;
	frm.method = "post";
	frm.action = "inquery2_ph_ck.do";
	frm.submit();
}

function setDateInfo(no, date) {
	// 유효기간은 +2년 3개월
	var startDate = "";
	//Month : 0~11 , date : 1~31, month는 +1을 해주어야 한다.
	var startDt = new Date(date);
	startDt.setFullYear(startDt.getFullYear() + 2);
	startDt.setMonth(startDt.getMonth() + 3);

	startDate = startDt.getFullYear() + "-";
	if ((startDt.getMonth()+1) < 10)		startDate += "0" + (startDt.getMonth()+1) + "-";
	else												startDate += (startDt.getMonth()+1) + "-";
	if (startDt.getDate() < 10)		startDate += "0" + startDt.getDate();
	else										startDate += startDt.getDate();

	$("#date_info"+no).html( date + " ~ " + startDate);
}

<c:if test="${not empty safeResult.chiefCompletionDt}">
setDateInfo(1, '${safeResult.chiefCompletionDt}');
</c:if>
<c:if test="${not empty safeResult.managerCompletionDt}">
setDateInfo(2, '${safeResult.managerCompletionDt}');
</c:if>
</script>
</body>
</html>