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
                        <li class="on"><a href="/web/sub/statics/statics2_list.do">조건별</a></li>
                        <li><a href="/web/sub/statics/statics3_list.do">항목별</a></li>
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
       							<a href="statics2_list.do" class="bg-sky">초기화</a>
       							<a href="#" onclick="fn_search()" class="bg-blue"  title="검색">검색</a>
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
                                <script>
                                /*구동식 무대기구 수별 차트*/
                                Highcharts.chart('circleTwo', {
                                	colors: ['#434348', '#058DC7'],
                                	credits: {enabled: false },
                                	chart: {type: 'bar'},
                                	xAxis: {
                                        categories: [
                                        	<c:choose>
                                      		<c:when test="${not empty paramMap.sido}">
                                        	'${paramMap.sido }${paramMap.sigungu }',
                                        	</c:when>
                                        	<c:otherwise>
                                        	'전국',
                                        	</c:otherwise>
                                        	</c:choose>
                                        	 '해당공연장']
                                    },
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
                                  	 style: {
                                           textShadow: "none",
                                         },
                                    enabled: true,
                                    format: '{point.y}개'
                                      }
                                    }
                                  },
                                  series: [
                                    {
                                      name: "",
                                      colorByPoint: true,
                                      data: [
                                    	  {
                                    		<c:choose>
	                                      		<c:when test="${empty paramMap.sido}">
	                              					name: "전국",
	                              				</c:when>
	                              				<c:otherwise>
	                              					name: "${paramMap.sido }${paramMap.sigungu }",
	                                			</c:otherwise>
                              				</c:choose>
                              				y: ${totalCnt},
                              				<c:choose>
	                                      		<c:when test="${empty paramMap.sido}">
	                              					drilldown: "전국"
	                              				</c:when>
	                                      		<c:otherwise>
	                                      		drilldown:"${paramMap.sido }${paramMap.sigungu }",
	                                      		</c:otherwise>
                                      		</c:choose>
                                   		},
                                   		{
                            				name: "해당공연장수",
                            				y: ${paginationInfo.totalRecordCount},
                            				drilldown: "해당공연장수"
                                 		},
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
                            </div>
                        </div>
                        <div class="section">
                            <div class="graph-result-txt">
                                <div class="txt">
                                    <p>
                                    	<c:choose>
                                    		<c:when test="${not empty paramMap.sido}">
		                                    	<strong><c:out value="${paramMap.sido } " /><c:out value="${paramMap.sigungu }" /></strong>
                                    		</c:when>
                                    		<c:otherwise><strong>전국</strong></c:otherwise></c:choose>
                                    		<span>의 공연장 수는 전체 </span> <strong>${totalCnt }</strong><span> 개소이며, </span><span class="br"></span><span>그 중 해당 조건의 공연장 수는 총 </span> <strong>${paginationInfo.totalRecordCount}</strong><span>개소 입니다.</span> 
                                   	</p>
                                </div>
                            </div>
                        </div>
                    </div><!--// grid-2-->
                    </form>
                 </div><!--// content-->
<script>
/*시도, 시군구 시작*/
function fn_selectSido(obj){
	if (obj.selectedIndex < 1) {
		alert("시도를 선택하세요.");
		obj.focus();
		return;
	}
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
	$('#gu').children('option:not(:first)').remove();
	$("#gu").css("display", "none");
	fn_getSelectList("sigungu", obj.value);
}

var sidoFlag = false;
function fn_getSelectList(type, val) {
	if (!val) return;
	$.ajax({
		 url : "/_mngr_/common/sido_list.ajax" 
		  /* url : "sido_list.ajax" */
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
  
/*검색 function*/
function fn_search(){
	var f = document.listForm;
	f.action = "statics${paramMap.type}_list.do";
	f.submit();
}

function fn_listCount(obj) {
	var f = document.listForm;
	f.action = "statics${paramMap.type}_list.do";
	f.viewCount.value = $("#listCount").val();
	f.submit();
}
</script>
</body>
</html>