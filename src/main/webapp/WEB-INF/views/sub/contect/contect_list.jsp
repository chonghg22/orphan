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
	<title>관할지자체 담당자 정보 - 공연장안전지원센터</title>
</head>
<body>
       			<div class="sub-title sub3">
					<h2>기관·법령</h2>
				</div><!--// sub-title-->

				<jsp:include page="/WEB-INF/jsp/layout/include_location_3.jsp">
					<jsp:param name="depth2" value="1" />
				</jsp:include>

      			<div class="content-title">
      				<h3>관할지자체 담당자 정보</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       				<form name="listForm" id="listForm" method="get">
	                <input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
	                <input type="hidden" name="schCode" value="${paramMap.schCode}" />
	                <input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
	                <input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
	                <input type="hidden" name="page" value="${paramMap.page}" />
           		    <input type="hidden" name="seq" value="" />
             	    <input type="hidden" name="reason" value="" />
       					<div class="search-wrap">
							<div class="section">
								<div class="search-type2">
									<select name="schFld" id="schFld">
										<option value="0" ${ufn:selected(paramMap.schFld, '0') }>전체</option>
										<option value="1" ${ufn:selected(paramMap.schFld, '1') }>시도</option>
										<option value="2" ${ufn:selected(paramMap.schFld, '2') }>시군구</option>
										<option value="3" ${ufn:selected(paramMap.schFld, '3') }>담당과</option>
									</select>
									<div class="input-box">
										<input type="text" name="schStr" id="schStr" title="검색입력란" placeholder="검색어를 입력 하세요" value="<c:out value="${paramMap.schStr }" />">
										<a href="#" class="submit-btn" onclick="fn_search()" title="검색"><span class="hidden">검색</span></a>
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
									<select id="sido" name="sido" onchange="fn_selectSido(this)">
									<option value="">시도</option>
									<c:forEach var="sido" items="${sidoListMap}" varStatus="status">
										<option value="<c:out value="${sido.sido}" />"><c:out value="${sido.sido}" /></option>
									</c:forEach>
									</select>
									<select id="sigungu" name="sigungu" onchange="fn_selectSigungu(this)" >
										<option value="">시군구</option>
									</select>
								</div><!--// sorting-->
							</div><!--// board-top-->

							<div class="board-common">
								<table class="table board-list">
									<caption>관할지자체 담당자 정보에 대한 표로써 번호, 시도, 시군구, 담당과, 연락처 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:7%">
										<col style="width:18%" span="4">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">번호</th>
											<th scope="col">시도</th>
											<th scope="col">시군구</th>
											<th scope="col">담당과</th>
											<th scope="col">연락처</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="result" items="${resultList}" varStatus="status">
										<c:if test="${result.openYn eq 'Y' }">
										<tr>
											<td class="num"><c:out value="${listNo - status.index}"/></td>
											<td class="mo-inline"><c:out value="${result.sido}"/></td>
											<td class="mo-inline"><c:out value="${result.sigungu}"/></td>
											<td class="mo-inline"><c:out value="${result.part} "/></td>
											<td class="mo-inline"><c:out value="${result.tel1}"/>-<c:out value="${result.tel2}"/>-<c:out value="${result.tel3}"/></td>
										</tr>
										</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div><!--// board-common-->

							<div class="board-bottom">
								<%@ include file="/WEB-INF/jsp/egovframework/user/pagination/comm_pagination_include.jsp" %>
							</div><!--// board-bottom-->
						</div><!--// board-wrap-->
       				</form>
                 </div><!--// content-->

<script>
function fn_selectSido(obj){
	var f = document.listForm;
	f.sido.value = $("#sido").val();
	f.action = "contect_list.do";
	f.submit();
	/* alert($(obj).val()); */
	$('#sigungu').children('option:not(:first)').remove();
	/* $("#sigungu").css("display", "none"); */
	$('#gu').children('option:not(:first)').remove();
	$("#gu").css("display", "none");
	fn_getSelectList("sido", $(obj).val());
}

function fn_selectSigungu(obj) {
	if (obj.selectedIndex < 1) {
		alert("시군구를 선택하세요.");
		obj.focus();
		return;
	}
	var f = document.listForm;
	f.sigungu.value = $("#sigungu").val();
	f.action = "contect_list.do";
	f.submit();
	$('#gu').children('option:not(:first)').remove();
	$("#gu").css("display", "none");
	fn_getSelectList("sigungu", obj.value);
}

var sidoFlag = false;
function fn_getSelectList(type, val) {
	if (!val) return;
	$.ajax({
		 url : "/_mngr_/common/sido_list.ajax"
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
		, error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

<c:if test="${not empty paramMap.sido}">
$("#sido").val("${paramMap.sido}").prop("selected", true);
fn_getSelectList("sido", "${paramMap.sido}");
</c:if>
function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "contect_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}
function fn_orderby(fld, orderby){
	var f = document.listForm;
	f.action = "contect_list.do";
	f.ordFld.value = fld;
	f.ordBy.value = orderby;
	f.submit();
}
/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	var f = document.listForm;
	f.action = "contect_list.do";
	f.page.value = pageNo;
	f.submit();
}

function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "contect_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}

/*검색 function*/
function fn_search(){
	var f = document.listForm;
	f.page.value = 1;
	f.action = "contect_list.do";
	f.submit();
}
</script>
</body>
</html>