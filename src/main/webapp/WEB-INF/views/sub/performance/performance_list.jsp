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
	<title>공연장 외 공연 정보 - 공연장안전지원센터</title>
	<script src="/lib/js/validator.js"></script>
</head>
<body>
        		<div class="sub-title sub1">
					<h2>안내</h2>
				</div><!--// sub-title-->
				<jsp:include page="/WEB-INF/jsp/layout/include_location_1.jsp">
					<jsp:param name="depth2" value="3" />
					<jsp:param name="depth3" value="1" />
				</jsp:include>
				<form name="listForm" id="listForm" method="get">
                <input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
                <input type="hidden" name="schCode" value="${paramMap.schCode}" />
                <input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
                <input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
                <input type="hidden" name="page" value="${paramMap.page}" />
                <input type="hidden" name="seq" value=""/>
                <input type="hidden" name="reason" value="" />
                <input type="hidden" name="openType" value="1"/>
                <input type="hidden" name="performName" value="${resultView.performName }"/>
      			<div class="content-title">
      				<h3>공연장 외 공연 정보</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       				<div class="search-wrap">
       					<div class="section">
       						<div class="search-type2">
       							<select title="검색구분" name="schFld" id="schFld">
       								<option value="0" ${ufn:selected(paramMap.schFld, '0') }>전체</option>
									<option value="1" ${ufn:selected(paramMap.schFld, '1') }>공연장</option>
									<option value="2" ${ufn:selected(paramMap.schFld, '2') }>관할지자체</option>
									<option value="3" ${ufn:selected(paramMap.schFld, '3') }>장소</option>
       							</select>
       							<div class="input-box">
       							<input type="text" name="schStr" id="schStr" value="<c:out value="${paramMap.schStr }" />" class="" placeholder="검색어 입력">
       								<a href="#none" onclick="fn_search()" class="submit-btn" title="검색"><span class="hidden">검색</span></a>
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
							<div class="sorting">
								<select title="연도 선택" name="year" id="year" onchange="fn_year(this);">
									<option value="" ${ufn:selected(paramMap.year, '') }>연도전체</option>
									<option value="${fn:substring(nowday,0,4)}" ${ufn:selected(paramMap.year, fn:substring(nowday,0,4)) }><c:out value="${fn:substring(nowday,0,4)}"/>년</option>
									<option value="${fn:substring(nowday,0,4)-1}" ${ufn:selected(paramMap.year, fn:substring(nowday,0,4)-1) }><c:out value="${fn:substring(nowday,0,4)-1}"/>년</option>
									<option value="${fn:substring(nowday,0,4)-2}" ${ufn:selected(paramMap.year, fn:substring(nowday,0,4)-2) }><c:out value="${fn:substring(nowday,0,4)-2}"/>년</option>
									<option value="${fn:substring(nowday,0,4)-3}" ${ufn:selected(paramMap.year, fn:substring(nowday,0,4)-3) }><c:out value="${fn:substring(nowday,0,4)-3}"/>년</option>
									<option value="${fn:substring(nowday,0,4)-4}" ${ufn:selected(paramMap.year, fn:substring(nowday,0,4)-4) }><c:out value="${fn:substring(nowday,0,4)-4}"/>년</option>
								</select>
								<select title="공연명순 선택" name="status" id="status" onchange="fn_status(this)">
									<option value="1" ${ufn:selected(paramMap.status, '1') }>등록일순</option>
									<option value="2" ${ufn:selected(paramMap.status, '2') }>공연명순</option>
									<option value="3" ${ufn:selected(paramMap.status, '3') }>기간순</option>
									<option value="4" ${ufn:selected(paramMap.status, '4') }>장소순</option>
								</select>
								<select title="내림차순 선택" name = "orders" id="orders" onchange="fn_order(this)">
									<option value="1" ${ufn:selected(paramMap.orders, '1') }>내림차순</option>
									<option value="2" ${ufn:selected(paramMap.orders, '2') }>오름차순</option>
								</select>
							</div><!--// sorting-->
						</div><!--// board-top-->

						<div class="board-common">
							<table class="table board-list">
								<caption>공연장 외 공연 정보에 대한 표로써 번호, 공연명, 기간, 장소, 등록일, 조회수 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:5%">
									<col style="width:40%">
									<col style="width:15%">
									<col style="width:10%" span="3">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">공연명</th>
										<th scope="col">기간</th>
										<th scope="col">장소</th>
										<th scope="col">등록일</th>
										<th scope="col">조회수</th>
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
											<a href="javascript:void(0);"  name="seq" onclick="fn_performanceModal('${result.seq}');" class="title" ><c:out value="${result.performName}"/>
											<c:if test = "${result.inputDate>=nowday }">
											<span class="ico-new">NEW</span>
											</c:if>
										</a>
										</td>
										<td class="mo-inline period"><c:out value="${result.startDate}"/>~<c:out value="${result.endDate}"/></td>
										<td class="mo-inline location"><c:out value="${result.place}"/></td>
										<td class="mo-inline date"><c:out value="${fn:substring(result.inputDate,0,10)}"/></td>
										<td class="mo-inline hits"><c:out value="${result.hit}"/></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--// board-common-->
						<div class="board-bottom">
							<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>
						 </div><!--// board-bottom-->
       				</div><!--// board-wrap-->
					</div>
					</form>
   <!-- 상세 팝업-->
	<div id="viewDetailPerformance" class="popup-wrap popup-sm" tabindex="1">
	</div><!--// popup-wrap-->

<script>
/*연도검색 function*/
function fn_year(obj){
	var f = document.listForm
	f.year.value = $("#year").val();
	f.action = "performance_list.do";
	f.submit();
}

/*공연명순 검색 function*/
function fn_status(obj){
	var f = document.listForm
	f.status.value = $("#status").val();
	f.action = "performance_list.do";
	f.submit();
}

/*공연명순 검색 function*/
function fn_order(obj){
	var f = document.listForm
	f.orders.value = $("#orders").val();
	f.action = "performance_list.do";
	f.submit();
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	var f = document.listForm;
	f.action = "performance_list.do";
	f.page.value = pageNo;
	f.submit();
}

function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "performance_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}

function fn_orderby(fld, orderby){
	var f = document.listForm;
	f.action = "performance_list.do";
	f.ordFld.value = fld;
	f.ordBy.value = orderby;
	f.submit();
}

function fn_search(){
	var f = document.listForm;
	f.page.value = 1;
	f.action = "performance_list.do";
	f.submit();
}

function fn_performanceModal(seq){
	$.ajax({
		url : "performance_view.ajax"
		, data : "seq="+seq
		, type : "post"
		, dataType : "html"
		, success : function(data){
			$("#viewDetailPerformance").html(data);
			$("#viewDetailPerformance").show();
			layerPopup();
		}
		, error:function(request,status,error){
		}
	});
}


</script>
</body>
</html>