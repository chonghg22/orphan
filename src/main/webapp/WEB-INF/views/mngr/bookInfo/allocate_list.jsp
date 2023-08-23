<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>저작물 배분 관리 목록</title>
    <script src="/lib/js/validator.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/layout/admin_all.jsp"/>
        		<h3 class="result-title">저작물 배분 관리</h3>
      			<div class="sub-content">
	                <form name="listForm" id="listForm" method="get">
		                <input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
		                <input type="hidden" name="schCode" value="${paramMap.schCode}" />
		                <input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
		                <input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
		                <input type="hidden" name="page" value="${paramMap.page}" />
		                <input type="hidden" name="page3" value="${paramMap.page3}" />
		                <input type="hidden" name="type_etc" value="${paramMap.typeEtc}" />
		                <input type="hidden" name="mngNo" value="${paramMap.mngNo}" />
		                <input type="hidden" name="mngType" value="${paramMap.mngType}" />
		                <input type="hidden" name="reason" value="" />
						<div class="search_list">
							<c:if test="${mngType eq '1'}">
							<div>
								<span class="info-tit">사업명</span>
			        			<select name="schBiz" id="schBiz" onchange="fn_selectSearch(this);">
			        				<option value="">전체</option>
									<c:forEach var="biz" items="${businessList}" varStatus="status">
<%--										<option value="${biz.bizCode}" ${ufn:selected(paramMap.schBiz, biz.bizCode) }>${biz.bizNm}</option>--%>
									</c:forEach>
								</select>
							</div>
							</c:if>
							<div class="search-set">
								<span class="info-tit">검색어</span>
								<select name="schMng" id="schMng">
<%--									<option value="0" ${ufn:selected(paramMap.schMng, '0') }>전체</option>--%>
<%--									<option value="1" ${ufn:selected(paramMap.schMng, '1') }>아이디</option>--%>
<%--									<option value="2" ${ufn:selected(paramMap.schMng, '2') }>이름</option>--%>
<%--									<option value="3" ${ufn:selected(paramMap.schMng, '3') }>전화번호</option>--%>
								</select>
								<input type="text" name="schStr" id="schStr" value="<c:out value="${paramMap.schStr }" />" class="" placeholder="검색어 입력">
							</div><!-- search-set -->
							<div class="btn_wrap">
								<a href="allocate_list.do" class="btn">초기화</a>
								<a href="#none" onclick="fn_search()" class="btn black_btn">검색</a>
							</div><!-- btn_wrap -->
						</div><!--// search_list-->
						<div class="shop-list">
							<div class="detail-con">
								<div class="tab_wrap">
									<ul class="tabs">
										<li onclick="fn_goTabChange(3)" class="tab-link <c:if test="${paramMap.mngType eq '3'}">current</c:if>" data-tab="tab-2">조사자</li>
										<li onclick="fn_goTabChange(2)" class="tab-link <c:if test="${paramMap.mngType eq '2'}">current</c:if>" data-tab="tab-2">검증자</li>
									</ul>
								</div>
								<p class="title">전체 <span>${paginationInfo.totalRecordCount}</span> 건</p>
								<div class="table-wrap">
									<div class="table_top_btn">
										<a href="#none" class="btn excel_btn" onclick="popupOpen('excel_down_layer')">엑셀다운로드</a>
										<select id="listCount" onchange="fn_listCount()">
<%--											<option value="10" ${ufn:selected(paramMap.viewCount, '10') }>10개씩 보기</option>--%>
<%--											<option value="30" ${ufn:selected(paramMap.viewCount, '30') }>30개씩 보기</option>--%>
<%--											<option value="50" ${ufn:selected(paramMap.viewCount, '50') }>50개씩 보기</option>--%>
										</select>
									</div>
									<div class="table_cont">
										<table class="table">
											<colgroup>
												<col style="width:5%">
												<col style="width:20%">
												<col style="width:10%">
												<col style="width:15%">
												<col style="width:10%">
												<col style="width:20%">
												<col style="width:10%">
												<col style="width:10%">
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>사업명</th>
													<th>구분</th>
<%--													<th><orderby:setOrderBy schOrderFld="${paramMap.ordFld }" schOrderBy="${paramMap.ordBy }" fieldText="아이디" fieldValue="id" /></th>--%>
<%--													<th><orderby:setOrderBy schOrderFld="${paramMap.ordFld }" schOrderBy="${paramMap.ordBy }" fieldText="이름" fieldValue="name" /></th>--%>
													<th>전화번호</th>
													<th>배분여부</th>
													<th>배분일자</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="result" items="${resultList}" varStatus="status">
													<tr>
														<td><c:out value="${listNo -(status.count-1) }" /></td>
														<td><c:out value="${result.bizNm }" /></td>
														<c:if test="${result.mngType eq '3' }">
															<td>조사자</td>
														</c:if>
														<c:if test="${result.mngType eq '2' }">
															<td>검증자</td>
														</c:if>
														<td><a href="#none" onclick="fn_goView('<c:out value="${result.mngNo}" />','<c:out value="${paramMap.page}" />'); return false;"><c:out value="${result.mngId}" /></a></td>
														<td><c:out value="${result.mngName}" /></td>
														<td><c:out value="${result.mngPhone}"/></td>
														<c:if test="${result.mngType eq '3' }">
															<td>
																<c:choose>
																	<c:when test="${result.allocatedt ne null and result.serStatus eq '10'}">
																		<c:out value="O"/>
																	</c:when>
																	<c:otherwise>
																		<c:out value="-"/>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${not empty result.allocatedt and result.serStatus eq '10'}">
																		<c:out value="${fn:substring(result.allocatedt,0,10)}"/>
																	</c:when>
																	<c:otherwise>
																		<c:out value="-"/>
																	</c:otherwise>
																</c:choose>
															</td>
														</c:if>
														<c:if test="${result.mngType eq '2' }">
															<td>
																<c:choose>
																	<c:when test="${not empty result.distributedt and result.verStatus eq '10'}">
																		<c:out value="O"/>
																	</c:when>
																	<c:otherwise>
																		<c:out value="-"/>
																	</c:otherwise>
																</c:choose>
															</td>
															<td>
																<c:choose>
																	<c:when test="${not empty result.distributedt and result.verStatus eq '10'}">
																		<c:out value="${fn:substring(result.distributedt,0,10)}"/>
																	</c:when>
																	<c:otherwise>
																		<c:out value=""/>
																	</c:otherwise>
																</c:choose>
															</td>
														</c:if>
													</tr>
												</c:forEach>
												<c:if test="${paginationInfo.totalRecordCount eq 0}">
													<tr>
														<td colspan="8">검색 결과가 없습니다.</td>
													</tr>
												</c:if>
											</tbody>
										</table>
									</div><!-- table_cont -->
								</div><!-- table-wrap-->
							</div><!-- detail-con-->
						</div><!-- shop-list -->
					</form>
				</div><!-- sub-content-->

       			<!-- excel_down_layer start -->
				<div class="layerpop excel_down_layer">
					<div class="layerpop_area">
						<form name="certForm" id="certForm">
							<input type="hidden" name="reason" value="${paramMap.reason }" />
							<input type="hidden" name="schStr" value="${paramMap.schStr }" />
							<input type="hidden" name="schBiz" value="${paramMap.schBiz }" />
							<input type="hidden" name="schFld" value="${paramMap.schFld }" />
							<div class="title">엑셀다운로드</div>
							<a href="javascript:popupClose('excel_down_layer');" class="layerpop_close" title="닫기" >&#215;</a>
							<div class="layer_cont">
								<p>개인정보가 포함된 엑셀 다운로드 시, 비밀번호 입력을 통한 사용자 인증 절차와 해당 사유를 저장하고 있습니다.</p>
								<h5 class="tit">비밀번호</h5>
								<input  type="password" name="chkPw" id="chkPw" title="비밀번호 입력" class="" />
								<h5 class="tit">사유</h5>
								<textarea  name="viewReason" id="viewReason"></textarea>
								<div class="btn_wrap">
									<a href="javascript:popupClose('excel_down_layer');" class="btn gray_btn">취소</a>
									<a href="#none" class="btn" onclick="accessCheck();">등록</a>
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- excel_down_layer end -->
<jsp:include page="/WEB-INF/views/layout/admin_close.jsp"/>
<script type="text/javascript">
function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "allocate_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}

function fn_selectSearch(obj) {
	var f = document.listForm;
	f.action = "allocate_list.do";
	f.submit();
}

function fn_goTabChange(type) {
	var f = document.listForm;
	f.mngType.value = type;
	f.page.value = 1;
	f.action = "allocate_list.do";
	f.submit();
}

/* 글 상세보기 화면 function */
function fn_goView(mngNo, pageNo) {
	var f = document.listForm;
	f.mngNo.value = mngNo;
	f.page.value = 1;
	f.page3.value = pageNo;
	f.action = "allocate_view.do";
	f.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	if(pageNo == 1){
		if(${paginationInfo.currentPageNo} <2){
			alert("첫 페이지 입니다.");
			return;
		}
	}
	if(pageNo == ${paginationInfo.totalPageCount}){
		if(${paginationInfo.currentPageNo} == ${paginationInfo.totalPageCount}){
			alert("마지막 페이지 입니다.");
			return;
		}
	}
	var f = document.listForm;
	f.action = "allocate_list.do";
	f.page.value = pageNo;
	f.submit();
}


function fn_orderby(fld, orderby){
	var f = document.listForm;
	f.action = "allocate_list.do";
	f.ordFld.value = fld;
	f.ordBy.value = orderby;
	f.submit();
}

/*게시글 검색 function*/
function fn_search(){
	var f = document.listForm;
	f.page.value = 1;
	f.action = "allocate_list.do";
	f.submit();
}

function fn_excelDown() {
	var f = document.certForm;
	f.reason.value = $("#viewReason").val();


	popupClose('excel_down_layer');

	<c:if test="${paramMap.mngType eq '2' }">
		f.action = "alloVerify_list_excel.do";
	</c:if>
	<c:if test="${paramMap.mngType eq '3' }">
		f.action = "alloResearch_list_excel.do";
	</c:if>

	f.submit();
}

/* 관리자 비밀번호 검증 */
function accessCheck(){
	var frm = document.certForm;
	if (!isTextValidate(frm.chkPw, "string", 0, "비밀번호"))			return false;
	if (!isTextValidate(frm.viewReason, "string", 0, "사유"))		return false;

	$.ajax({
		url:"/_mngr_/manager/manager/comm_chk_pass.ajax"
		, data : $("#certForm").serialize()
		, type : "post"
		, dataType : "json"
		, async : "false"
		, success : function(data){
			if (data) {
				fn_excelDown();
			} else {
				alert("비밀번호가 일치하지 않습니다.");
			}
		}
		, error:function(request,status,error){

		}
	});
}
</script>
</body>
</html>