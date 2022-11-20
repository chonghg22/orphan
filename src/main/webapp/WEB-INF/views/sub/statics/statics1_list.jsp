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
					<jsp:param name="depth3" value="1" />
				</jsp:include>  
      			<div class="content-title">
      				<h3>전국 공연장 등록 현황</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->
       			<div class="content">
       				<h4 class="title bo-0">지역별</h4>
       				<div class="table-set table-scroll">
						<table class="table">
							<caption>전국 공연장 등록 현황에 대한 표로써 지역별 항목으로 구성됩니다.</caption>
							<thead>
								<tr>
									<th scope="col">서울</th>
									<th scope="col">부산</th>
									<th scope="col">대구</th>
									<th scope="col">인천</th>
									<th scope="col">광주</th>
									<th scope="col">대전</th>
									<th scope="col">울산</th>
									<th scope="col">세종</th>
									<th scope="col">경기</th>
									<th scope="col">강원</th>
									<th scope="col">충북</th>
									<th scope="col">충남</th>
									<th scope="col">전북</th>
									<th scope="col">전남</th>
									<th scope="col">경북</th>
									<th scope="col">경남</th>
									<th scope="col">제주</th>
									<th scope="col">전체</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:set var="regionTotal" value="0" />
									<c:forEach var="region" items="${region}" varStatus="status">
										<td><c:out value="${region.total }"/></td>
										<c:set var="regionTotal" value="${regionTotal + region.total}" />
									</c:forEach>
									<td><c:out value="${regionTotal}"/></td>
								</tr>
							</tbody>
						</table><!--table-->
					</div><!--table-set-->
                    <div class="graph-box mb-50">
						<figure class="highcharts-figure">
						  <div id="barOneChart"></div>
						  <p class="highcharts-description">
						  </p>
						</figure>
					</div>
					<script>
					/*지역별 그래프*/
					Highcharts.chart('barOneChart', {
						credits: {enabled: false},
						chart: {type: 'column'},
						title: {text: ''},
						subtitle: {text: ''},
						xAxis: {
							type: 'category',
						    labels: {
						    rotation: -45,
						    style: {
								fontSize: '13px',
						        fontFamily: 'Verdana, sans-serif'
						      }
						    }
						  },
						  yAxis: {
						    min: 0,
						    title: {text: ''}
						  },
						  legend: {enabled: false},
						  tooltip: {pointFormat: '지역별 공연장 수'},
						  series: [{
						    name: 'Population',
						    data: [
						   <c:forEach var="region" items="${region}" varStatus="status">
						      ["${region.sortNm}", ${region.total}],
						    </c:forEach>
						    ],
						    dataLabels: {
								enabled: true,
								rotation: -90,
								color: '#FFFFFF',
								align: 'right',
								format: '{point.y}', // one decimal
								y: 10, // 10 pixels down from the top
								style: {
								fontSize: '13px',
								fontFamily: 'Verdana, sans-serif'
									}
								}
							}]
						});
					</script>
                    <div class="grid-2">
                        <div class="section">
                           	<h4 class="title bo-0">운영주체</h4>
                            <div class="table-set">
								<table class="table">
									<caption>운영주체에 대한 표로써 공공, 민간, 전체 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:33.3%" span="3">
									</colgroup>
									<thead>
										<tr>
											<c:set var="operationTotal" value="0" />
											<th scope="col">공공</th>
											<th scope="col">민간</th>
											<th scope="col">전체</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach var="operation" items="${operation}" varStatus="status">
												<td><c:out value="${operation.total }"/></td>
												<c:set var="operationTotal" value="${operationTotal + operation.total}" />
											</c:forEach>
											<c:if test="${ empty operation }">
												<td>0</td>
												<td>0</td>
											</c:if>
												<td><c:out value="${operationTotal}"/></td>
										</tr>
									</tbody>
								</table><!--table-->
							</div><!--table-set-->
                       		<div class="graph-box">
                              <figure class="highcharts-figure">
							  <div id="container"></div>
							  <p class="highcharts-description"></p>
							</figure>
							<script>
							/*구동식 무대기구 수별 차트*/
							Highcharts.chart('container', {
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
							    	  <c:forEach var="operation" items="${operation}" varStatus="status">
							        {
							        	name: "${operation.operationBody}",
										y: ${operation.total / operationTotal * 100},
										drilldown: "${operation.operationBody}"
							        },
							        </c:forEach>
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
                           	<h4 class="title bo-0">객석 수</h4>
                            <div class="table-set">
								<table class="table">
									<caption>객석수에 대한 표로써 지역별 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:25%">
										<col style="width:25%">
										<col style="width:20%">
										<col style="width:15%">
										<col style="width:15%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">300석 미만</th>
											<th scope="col">300~1000석 미만</th>
											<th scope="col">1000석 이상</th>
											<th scope="col">기타</th>
											<th scope="col">전체</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<c:forEach var="seats" items="${seats}" varStatus="status">
												<td><c:out value="${ seats.total}"/></td>
											<c:set var = "seatsTotal" value = "${seatsTotal + seats.total }"/>
											</c:forEach>
											<c:if test="${ empty seats }">
												<td>0</td>
												<td>0</td>
												<td>0</td>
												<td>0</td>
											</c:if>
											<td><c:out value="${seatsTotal}"/></td>
										</tr>
									</tbody>
								</table><!--table-->
							</div><!--table-set-->
                      		<div class="graph-box">
                                <figure class="highcharts-figure">
								  <div id="circleOne"></div>
								  <p class="highcharts-description"></p>
								</figure>
								<script>
								/*구동식 무대기구 수별 차트*/
								Highcharts.chart('circleOne', {
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
								    	  <c:forEach var="seats" items="${seats}" varStatus="status">
								        {
								        	name: "${seats.seatsGroup}",
											y: ${seats.total / seatsTotal * 100},
											drilldown: "${seats.seatsGroup}"
								        },
								        </c:forEach>
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
                    </div><!--// grid-2-->
                    <div class="grid-2">
                        <div class="section">
                           	<h4 class="title bo-0">구동식 무대기구 수</h4>
                            <div class="table-set">
								<table class="table">
									<caption>구동식 무대기구 수에 대한 표로써 공공, 민간, 전체 항목으로 구성됩니다.</caption>
									<colgroup>
										<col style="width:20%" span="5">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">0개</th>
											<th scope="col">1~19개</th>
											<th scope="col">20개~39개</th>
											<th scope="col">40개 이상</th>
											<th scope="col">전체</th>
										</tr>
									</thead>
									<tbody>
										<tr>
										<c:forEach var="operate" items="${operate}" varStatus="status">
											<td><c:out value="${ operate.total}"/></td>
											<c:set var="operateTotal" value="${operateTotal + operate.total }" />
										</c:forEach>
											<c:if test="${ empty operate }">
											<td>0</td>
											<td>0</td>
											<td>0</td>
											<td>0</td>
											</c:if>
											<td><c:out value="${operateTotal}"/></td>
										</tr>
									</tbody>
								</table><!--table-->
							</div><!--table-set-->
                       		<div class="graph-box">
							<figure class="highcharts-figure">
								  <div id="circleTwo"></div>
								  <p class="highcharts-description"></p>
								</figure>
								<script>
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
								    	  <c:forEach var="operate" items="${operate}" varStatus="status">
								        {
								        	name: "${operate.operateGroup}",
											y: ${operate.total / operateTotal * 100},
											drilldown: "${operate.operateGroup}"
								        },
								        </c:forEach>
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
                    </div><!--// grid-2-->
                 </div><!--// content-->            
</body>
</html>