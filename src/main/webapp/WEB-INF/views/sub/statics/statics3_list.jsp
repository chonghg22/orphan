<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
	<title>안전진단기관 결과 평가 - 공연장안전지원센터</title>
</head>
	<style>
	#container {
	  height: 400px;
	}

	.highcharts-figure, .highcharts-data-table table {
	  min-width: 310px;
	  max-width: 800px;
	  margin: 1em auto;
	}

	.highcharts-data-table table {
	  font-family: Verdana, sans-serif;
	  border-collapse: collapse;
	  border: 1px solid #EBEBEB;
	  margin: 10px auto;
	  text-align: center;
	  width: 100%;
	  max-width: 500px;
	}
	.highcharts-data-table caption {
	  padding: 1em 0;
	  font-size: 1.2em;
	  color: #555;
	}
	.highcharts-data-table th {
		font-weight: 600;
	  padding: 0.5em;
	}
	.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
	  padding: 0.5em;
	}
	.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
	  background: #f8f8f8;
	}
	.highcharts-data-table tr:hover {
	  background: #f1f7ff;
	}
	</style>
<body>
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/data.js"></script>
	<script src="https://code.highcharts.com/modules/drilldown.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	<script src="https://code.highcharts.com/modules/accessibility.js"></script>
        		<div class="sub-title sub2">
					<h2>안전현황</h2>
				</div><!--// sub-title-->
				<jsp:include page="/WEB-INF/jsp/layout/include_location_2.jsp">
					<jsp:param name="depth2" value="3" />
					<jsp:param name="depth3" value="2" />
				</jsp:include>
      			<div class="content-title">
      				<h3>지역별 공연장 등록 현황</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->
                <div class="sub-tab">
                    <ul>
                        <li><a href="/web/sub/statics/statics2_list.do">조건별</a></li>
                        <li class="on"><a href="/web/sub/statics/statics3_list.do">항목별</a></li>
                    </ul>
                </div><!--// sub-tab-->
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
       						<div class="select-list">
       							<select id="sido" name="sido" onchange="fn_selectSido(this)">
									<option value="">시도</option>
									<c:forEach var="sido" items="${sidoListMap}" varStatus="status">
										<option value="<c:out value="${sido.sido}" />"><c:out value="${sido.sido}" /></option>
									</c:forEach>
									</select>
									<select id="sigungu" name="sigungu" onchange="fn_selectSigungu(this)" >
										<option value="">시군구</option>
									</select>
       							<select title="검색구분" name="typeEtc">
       								<option value="1" ${ufn:selected(paramMap.typeEtc, '1') }>운영주체</option>
       								<option value="2" ${ufn:selected(paramMap.typeEtc, '2') }>객석 수</option>
       								<option value="3" ${ufn:selected(paramMap.typeEtc, '3') }>구동식 무대기구 수</option>
       							</select>
       						</div>
       						<div class="btn-box">
       							<a href="statics3_list.do" class="bg-sky">초기화</a>
       							<a href="#" onclick="fn_search()" class="bg-blue">검색</a>
       						</div>
       					</div>
       				</div><!--//search-wrap-->

                    <div class="grid-2">
                        <div class="section">
                            <div class="graph-box">
								<figure class="highcharts-figure">
								  <div id="circleTwo"></div>
								  <p class="highcharts-description"></p>
								</figure>
                            </div>
                        </div>
                        <div class="section">
                            <div class="graph-result-txt">
                                <div class="txt">
                                    <p>
                                    <c:choose>
	                                    <c:when test="${paramMap.typeEtc eq '1'}">
	                                    	<c:if test="${paramMap.sido eq '' }">
	                                    	<strong>전국</strong><span>의&nbsp;</span> <strong><span>운영주체</span></strong><span>로 검색한</span><br/><span>공연장 등록 현황입니다.</span>
	                                    	</c:if>
	                                    	<c:if test="${paramMap.sido ne '' }">
	                                    	<strong><c:out value="${paramMap.sido } ${paramMap.sigungu }"/> </strong><span>의</span><strong><span>&nbsp;운영주체</span></strong><span>로 검색한</span><br/><span>공연장 등록 현황입니다.</span>
	                                    	</c:if>
	                                    </c:when>
	                                    <c:when test="${paramMap.typeEtc eq '2'}">
	                                    	<c:if test="${paramMap.sido eq '' }">
	                                    	<strong>전국</strong><span>의&nbsp;</span> <strong><span>객석수</span></strong><span>로 검색한</span><br/><span>공연장 등록 현황입니다.</span>
	                                    	</c:if>
	                                    	<c:if test="${paramMap.sido ne '' }">
	                                    	<strong><c:out value="${paramMap.sido } ${paramMap.sigungu }"/> </strong><span>의</span><strong><span>&nbsp;객석수</span></strong><span>로 검색한</span><br/><span>공연장 등록 현황입니다.</span>
	                                    	</c:if>
	                                    </c:when>
	                                    <c:when test="${paramMap.typeEtc eq '3'}">
	                                    	<c:if test="${paramMap.sido eq '' }">
	                                    	<strong>전국</strong><span>의&nbsp;</span> <strong><span>구동식 무대기구 수</span></strong><span>로 검색한</span><br/><span>공연장 등록 현황입니다.</span>
	                                    	</c:if>
	                                    	<c:if test="${paramMap.sido ne '' }">
	                                    	<strong><c:out value="${paramMap.sido } ${paramMap.sigungu }"/> </strong><span>의</span><strong><span>&nbsp;구동식 무대기구 수</span></strong><span>로 검색한</span><br/><span>공연장 등록 현황입니다.</span>
	                                    	</c:if>
	                                    </c:when>
	                                    <c:otherwise>
	                                    <strong>전국</strong><span>의&nbsp;</span> <strong><span>운영주체</span></strong><span>로 검색한</span><br/><span>공연장 등록 현황입니다.</span>
	                                    </c:otherwise>
                                    </c:choose>
                                    </p>
                                </div>
                            </div>
                            	<c:choose>
                            		<c:when test="${paramMap.typeEtc eq '2'}">
                            			<table class="table"  id="datatable">
	                            			<caption>공연장 수 검색결과에 대한 표로써 0개, 1~19개, 20개~39개, 40개 이상, 전체 항목으로 구성됩니다.</caption>
			                            	<colgroup>
			                            		<col style="width:20%" span="5">
			                            	</colgroup>
			                            	<thead>
			                            		<tr>
			                            			<c:set var="seatsTotal" value="0" />
			                            			<th scope="col">300석 미만</th>
			                            			<th scope="col">300~1000석 미만</th>
			                            			<th scope="col">1000석 이상</th>
			                            			<th scope="col">기타</th>
			                            			<th scope="col">합계</th>
			                            		</tr>
			                            	</thead>
			                            	<tbody>
			                            		<tr>
			                            		 <c:set var="seat1" value="0" />
			                            		 <c:set var="seat2" value="0" />
			                            		 <c:set var="seat3" value="0" />
			                            		 <c:set var="seat4" value="0" />
			                            		 
												<c:forEach var="seat" items="${seats}" varStatus="status">
													<c:choose>
														<c:when test="${seat.seatsNo eq '1'}"><c:set var="seat1" value="${seat.total}" /></c:when>
														<c:when test="${seat.seatsNo eq '2'}"><c:set var="seat2" value="${seat.total}" /></c:when>
														<c:when test="${seat.seatsNo eq '3'}"><c:set var="seat3" value="${seat.total}" /></c:when>
														<c:when test="${seat.seatsNo eq '4'}"><c:set var="seat4" value="${seat.total}" /></c:when>
													</c:choose>
												</c:forEach>
													<c:set var="seatTotal" value="${seat1 + seat2 + seat3 + seat4}" />
													<td>${seat1}</td>
													<td>${seat2}</td>
													<td>${seat3}</td>
													<td>${seat4}</td>
													<td><c:out value="${seatTotal}"/></td>
												</tr>
			                            	</tbody>
										</table>
                            		</c:when>
                            		<c:when test="${paramMap.typeEtc eq '3'}">
                            			  <table class="table">
			                            	<caption>공연장 수 검색결과에 대한 표로써 0개, 1~19개, 20개~39개, 40개 이상, 전체 항목으로 구성됩니다.</caption>
			                            	<colgroup>
			                            		<col style="width:20%" span="5">
			                            	</colgroup>
			                            	<thead>
			                            		<tr>
			                            			<c:set var="operateTotal" value="0" />
			                            			<th scope="col">0개</th>
			                            			<th scope="col">1~19개</th>
			                            			<th scope="col">20~39개</th>
			                            			<th scope="col">40개 이상</th>
			                            			<th scope="col">합계</th>
			                            		</tr>
			                            	</thead>
			                            	<tbody>
			                            		<tr>
			                            		 <c:set var="operate1" value="0" />
			                            		 <c:set var="operate2" value="0" />
			                            		 <c:set var="operate3" value="0" />
			                            		 <c:set var="operate4" value="0" />
												<c:forEach var="operate" items="${operate}" varStatus="status">
													<c:choose>
														<c:when test="${operate.operateGroup eq '0개'}"><c:set var="operate1" value="${operate.total}" /></c:when>
														<c:when test="${operate.operateGroup eq '1~19개'}"><c:set var="operate2" value="${operate.total}" /></c:when>
														<c:when test="${operate.operateGroup eq '20~39개'}"><c:set var="operate3" value="${operate.total}" /></c:when>
														<c:when test="${operate.operateGroup eq '40개 이상'}"><c:set var="operate4" value="${operate.total}" /></c:when>
													</c:choose>
												</c:forEach>
													<c:set var="operateTotal" value="${operate1 + operate2 + operate3 + operate4}" />
													<td>${operate1}</td>
													<td>${operate2}</td>
													<td>${operate3}</td>
													<td>${operate4}</td>
													<td><c:out value="${operateTotal}"/></td>
												</tr>
			                            	</tbody>
			                            </table>
                            		</c:when>
                            		<c:otherwise>
                            			<table class="table">
			                            	<caption>공연장 수 검색결과에 대한 표로써 0개, 1~19개, 20개~39개, 40개 이상, 전체 항목으로 구성됩니다.</caption>
			                            	<colgroup>
			                            		<col style="width:20%" span="3">
			                            	</colgroup>
			                            	<thead>
			                            		<tr>
			                            			<c:set var="operationTotal" value="0" />
			                            			<th scope="col">민간</th>
			                            			<th scope="col">공공</th>
			                            			<th scope="col">합계</th>
			                            		</tr>
			                            	</thead>
			                            	<tbody>
			                            		<tr>
			                            		<c:set var="civil" value="0" />
			                            		<c:set var="publics" value="0" />
												<c:forEach var="operation" items="${operation}" varStatus="status">
													<c:choose>
														<c:when test="${operation.operationBody eq '민간'}"><c:set var="civil" value="${operation.total}" /></c:when>
														<c:when test="${operation.operationBody eq '공공'}"><c:set var="publics" value="${operation.total}" /></c:when>
													</c:choose>
												</c:forEach>
													<c:set var="operationTotal" value="${civil + publics }" />
													<td>${civil}</td>
													<td>${publics}</td>
													<td><c:out value="${operationTotal}"/></td>
												</tr>
			                            	</tbody>
			                            </table>
                            		</c:otherwise>
                            	</c:choose>
                        </div>
                    </div><!--// grid-2-->
                    </form>
                 </div><!--// content-->
<script>
/*검색 function*/
function fn_search(){
	var f = document.listForm;
	f.action = "statics${paramMap.type}_list.do";
	f.submit();
}

/*시도군구 function 시작*/
function fn_selectSido(obj){
	var f = document.listForm;
	f.sido.value = $("#sido").val();
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
	$('#gu').children('option:not(:first)').remove();
	$("#gu").css("display", "none");
	fn_getSelectList("sigungu", obj.value);
}

function fn_getSelectList(type, val) {
	$.ajax({
		 url : "/_mngr_/common/sido_list.ajax"
		, data : "type="+type+"&name="+val
		, type : "post"
		, dataType : "html"
		, success : function(data){
/* 			console.log( data ); */
			if (data != "") {
				if( type == "sido" ) {
					$("#sigungu").append(data);
					$("#sigungu").css("display", "");
					<c:if test="${not empty paramMap.sigungu}">
					$("#sigungu").val("${paramMap.sigungu}").prop("selected", true);
					fn_getSelectList("sigungu", "${paramMap.sigungu}");
					</c:if>
				}
				else if (type == "sigungu") {
					$("#gu").append(data);
					$("#gu").css("display", "");
					<c:if test="${not empty paramMap.gu}">
					$("#gu").val("${paramMap.gu}").prop("selected", true);
					</c:if>
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
/*시도군구 function 끝*/

/*구동식 무대기구 수별 차트*/
 Highcharts.chart('circleTwo', {
	credits: {enabled: false },
	chart: {type: 'pie'},
	title: {text: ''},
  	subtitle: {text: ''},
  	accessibility: {
    announceNewData: {
    enabled: true
    },
    point: {valueSuffix: '%'}
	},
	plotOptions: {
    series: {
    dataLabels: {
    enabled: true,
    format: '{point.name}: {point.y:.1f}%'
      }
    }
  },
  series: [
    {
      name: "",
      colorByPoint: true,
      data: [
		<c:choose>
			<c:when test="${paramMap.typeEtc eq '1'}">
			{
				name: "민간",
				y: ${civil / operationTotal * 100},
				drilldown: "민간"
     		},
     		{
	     		name: "공공",
				y: ${publics / operationTotal * 100},
				drilldown: "공공"
     		},
			</c:when>
			<c:when test="${paramMap.typeEtc eq '2'}">
			{
				name: "300석 미만",
				y: ${seat1 / seatTotal * 100},
				drilldown: "300석 미만"
			},
			{
				name: "300~1000석 미만",
				y: ${seat2 / seatTotal * 100},
				drilldown: "300~1000석 미만"
			},
			{
				name: "1000석 이상",
				y: ${seat3 / seatTotal * 100},
				drilldown: "1000석 이상"
			},
			{
				name: "기타",
				y: ${seat4 / seatTotal * 100},
				drilldown: "기타"
			},
			</c:when>
			<c:when test="${paramMap.typeEtc eq '3'}">
			{
				name: "0개",
				y: ${operate1 / operateTotal * 100},
				drilldown: "0개"
			},
			{
				name: "1~19개",
				y: ${operate2  / operateTotal * 100},
				drilldown: "1~19개"
			},
			{
				name: "20~39개",
				y: ${operate3  / operateTotal * 100},
				drilldown: "20~39개"
			},
			{
				name: "40개이상",
				y: ${operate4 / operateTotal * 100},
				drilldown: "40개이상"
			},
			</c:when>
			<c:otherwise>
			{
				name: "민간",
				y: ${civil / operationTotal * 100},
				drilldown: "민간"
			},
			{
				name: "공공",
				y: ${publics / operationTotal * 100},
				drilldown: "공공"
			},
			</c:otherwise>
		</c:choose>
      ],
      dataLabels: {
			style: {
			fontSize: '14px',
				}
			}
    }
  ],
}); 
</script>
</body>
</html>