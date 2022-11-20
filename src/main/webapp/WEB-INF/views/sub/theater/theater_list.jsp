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
					<jsp:param name="depth3" value="1" />
				</jsp:include>

      			<div class="content-title">
					<h3>공연장 정보 및 안전현황</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       				<form name="listForm" id="listForm" method="get">
	                <input type="hidden" name="viewCount" value="10" />
	                <input type="hidden" name="schFld" value="1" />
	                <input type="hidden" name="page" value="1" />
	                <input type="hidden" name="seq" value="" />
       				<div class="search-wrap">
       					<div class="section">
       						<div class="search-type1">
       							<input title="검색구분" name="schFld" id="schFld" type="hidden" />
       							<input type="text" title="검색입력란" name="schStr" id="schStr" value="<c:out value="${paramMap.schStr }" />" class=""  placeholder="공연장명을 직접 입력 하세요" >
       							<a href="#none" onclick="fn_search()" class="submit-btn" title="검색"><span class="hidden">검색</span></a>
       						</div>
       					</div>
       					<div class="section">
       						<div class="select-list">
       							<select id="sido" name="sido" onchange="fn_selectSido(this)">
								<option value="">시도</option>
								<c:forEach var="sido" items="${sidoListMap}" varStatus="status">
									<option value="<c:out value="${sido.sido}" />"><c:out value="${sido.sido}" /></option>
								</c:forEach>
								</select>
								<select id="sigungu" name="sigungu" onchange="fn_selectSigungu(this)">
									<option value="">시군구</option>
								</select>
       							<select title="검색구분" name="operationBody">
       								<option  value="" ${ufn:selected(paramMap.operationBody, '') }>공공/민간</option>
       								<option  value="P" ${ufn:selected(paramMap.operationBody, 'P') }>공공</option>
       								<option  value="C" ${ufn:selected(paramMap.operationBody, 'C') }>민간</option>
       							</select>
       							<select title="검색구분" name="seatsCount">
       								<option value="" ${ufn:selected(paramMap.seatsCount, '') }>객석수</option>
       								<option value="300" ${ufn:selected(paramMap.seatsCount, '300') }>300석 미만</option>
       								<option value="999" ${ufn:selected(paramMap.seatsCount, '999') }>300~1000석 미만</option>
       								<option value="1000" ${ufn:selected(paramMap.seatsCount, '1000') }>1000석 이상</option>
       								<option value="0" ${ufn:selected(paramMap.seatsCount, '0') }>기타+기타(정보없음)</option>
       							</select>
       							<select title="검색구분" name="operateCount">
       								<option value="" ${ufn:selected(paramMap.operateCount, '') }>구동식 무대기구 수</option>
       								<option value="0" ${ufn:selected(paramMap.operateCount, '0') }>0개</option>
       								<option value="19" ${ufn:selected(paramMap.operateCount, '19') }>1~19개</option>
       								<option value="39" ${ufn:selected(paramMap.operateCount, '39') }>20~39개</option>
       								<option value="40" ${ufn:selected(paramMap.operateCount, '40') }>40개 이상</option>
       							</select>
       						</div>
       						<div class="btn-box">
       							<a href="theater_list.do" class="bg-sky">초기화</a>
       							<a href="#" onclick="fn_search()" class="bg-blue">검색</a>
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
							<div class="sorting">
								<select title="항목선택"  name="status" id="status" onchange="fn_status()">
									<option value="" ${ufn:selected(paramMap.status, '') }>공연장명 순</option>
									<option value="0" ${ufn:selected(paramMap.status, '0') }>지역 순</option>
									<option value="1" ${ufn:selected(paramMap.status, '1') }>운영주체 순</option>
									<option value="2" ${ufn:selected(paramMap.status, '2') }>객석 수순</option>
									<option value="3" ${ufn:selected(paramMap.status, '3') }>구동식 무대기구 수순</option>
								</select>
								<select title="내림차순 선택" name = "orders" id="orders" onchange="fn_order()">
									<option value="1" ${ufn:selected(paramMap.orders, '1') }>내림차순</option>
									<option value="2" ${ufn:selected(paramMap.orders, '2') }>오름차순</option>
								</select>
							</div><!--// sorting-->
						</div><!--// board-top-->

						<div class="board-common">
							<table class="table board-list">
								<caption>공연장 정보 및 안전현황에 대한 표로써 번호, 공연장명, 지역, 운영주체, 객석수, 구동식무대기구수 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:5%">
									<col style="width:45%">
									<col style="width:20%">
									<col style="width:10%">
									<col style="width:10%">
									<col style="width:10%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">공연장명</th>
										<th scope="col">지역</th>
										<th scope="col">운영주체</th>
										<th scope="col">객석 수</th>
										<th scope="col">구동식 무대기구 수</th>
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
										<td class="txt-left">
										<a href="#none" onclick="fn_goView(<c:out value="${result.theaterSeq }" />)" class="title">
											<c:out value="${result.theaterNm}"/>
											<c:if test = "${result.inputDate>=nowday }"><span class="ico-new">NEW</span></c:if>
										</a>
										</td>
										<td class="mo-inline area"><c:out value="${result.sido} "/><c:out value="${result.sigungu} "/><c:out value="${result.gu}"/></td>
										<td class="mo-inline operator">
										<c:choose>
										<c:when test="${result.operationBody eq 'N'}">정보없음</c:when>
										<c:when test="${result.operationBody eq 'P'}">공공</c:when>
										<c:when test="${result.operationBody eq 'C'}">민간</c:when>
										</c:choose>
										</td>
										<td class="mo-inline seat">
<%-- 										<c:out value="${result.seatsCount}"/> --%>
										<c:choose>
											<c:when test="${result.seatsType eq '2'}">기타 - <c:out value="${result.seatsEtc}"/></c:when>
											<c:when test="${result.seatsType eq '3'}">기타(정보없음)</c:when>
											<c:when test="${result.seatsCount eq '99999'}">-</c:when>
											<c:otherwise><c:out value="${result.seatsCount}"/></c:otherwise>
										</c:choose>
										</td>
										<td class="mo-inline stage">
										<c:choose>
											<c:when test="${result.operateCount eq '99999'}">-</c:when>
											<c:otherwise><c:out value="${result.operateCount}"/></c:otherwise>
										</c:choose>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--// board-common-->

						<div class="board-bottom">
							<div class="btn-box txt-right mb-0">
								<a href="/web/sub/theater/inquery1_input.do" class="btn bg-blue"  >공연장 등록 요청</a>
								<div class="help-wrap">
									<button type="button" class="help-btn">도움말</button>
									<div class="help-txt">
										공연장이 목록에 없을 경우, 공연장 담당자는 공연장 등록 요청을 해주시기 바랍니다.
									</div>
								</div>
							</div>
						<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>

						</div><!--// board-bottom-->
       				</div><!--// board-wrap-->
       				</form>
                 </div><!--// content-->
<script>
/*내림차순, 오름차순 순서 변경 function*/
function fn_order(){
	var f = document.listForm;
	f.orders.value = $("#orders").val();
	f.action = "theater_list.do"
	f.submit();
}

/*항목에 따른 순서변경 function*/
function fn_status(){
	var f = document.listForm;
	f.status.value = $("#status").val();
	f.action = "theater_list.do"
	f.submit();
}

/*검색 function*/
function fn_search(){
	var f = document.listForm;
	f.page.value = 1;
	f.action = "theater_list.do"
	f.submit();
}

/*공연장 등록 function*/
function fn_input(){
	var f = document.listForm;
	f.action = "inquery1_ph_ck.do"
	f.submit();
}

/*시도, 시군구 시작*/
function fn_selectSido(obj){
	if (obj.selectedIndex < 1) {
		alert("시도를 선택하세요.");
		obj.focus();
		return;
	}
	/* alert($(obj).val()); */
	$('#sigungu').children('option:not(:first)').remove();
	fn_getSelectList("sido", $(obj).val());

}

var sidoFlag = false;
function fn_getSelectList(type, val) {
	if (!val) return;
	$.ajax({
		url : "sido_list.ajax"
		, data : "type="+type+"&name="+val
		, type : "post"
		, dataType : "html"
		, success : function(data){
			if (data != "") {
				if( type == "sido" ) {
					$("#sigungu").append(data);
					if (!sidoFlag) {
						sidoFlag = true;
						fn_getSelectList("sigungu", "${paramMap.sigungu}");
						$("#sigungu").val("${paramMap.sigungu}");
					} else {
						$("#sigungu option:eq(0)").prop("selected", true);
					}
				}
			}
		}
		, error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

<c:if test="${not empty paramMap.sido}">
$("#sido").val("${paramMap.sido}").prop("selected", true);
fn_getSelectList("sido", "${paramMap.sido}");
</c:if>
/*시도, 시군구 끝*/

function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "theater_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}

function fn_orderby(fld, orderby){
	var f = document.listForm;
	f.action = "theater_list.do";
	f.ordFld.value = fld;
	f.ordBy.value = orderby;
	f.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	var f = document.listForm;
	f.action = "theater_list.do";
	f.page.value = pageNo;
	f.submit();
}

/* 글 수정 화면 function */
function fn_goView(seq) {
	var f = document.listForm;
	f.method = "post";
	f.seq.value = seq;
	f.action = "result_view_safety.do";
	f.submit();
}
</script>
</body>
</html>