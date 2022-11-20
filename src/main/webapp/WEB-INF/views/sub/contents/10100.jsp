<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>공연장안전정보시스템 소개 - 공연장안전지원센터</title>
</head>
<body>
        		<div class="sub-title sub1">
					<h2>안내</h2>
				</div><!--// sub-title-->

				<jsp:include page="/WEB-INF/jsp/layout/include_location_1.jsp">
					<jsp:param name="depth2" value="1" />
					<jsp:param name="depth3" value="" />
				</jsp:include>

      			<div class="content-title">
      				<h3>공연장안전정보시스템 소개</h3>
      				<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
                    <div class="introduce">
                        <div class="section">
                            <div class="box-left">
                                <img src="/lib/user/img/sub/introduce-img1.jpg" alt="">
                            </div>
                            <div class="box-right">
                                <img src="/lib/user/img/sub/introduce-img2.jpg" alt="">
                                <p><span>KTL 공연장안전지원센터가 제공하는 공연장안전정보시스템은 </span>공연장 안전 지원을 위한 통계 현황 및 정보관리 통합시스템입니다.<br>전국 공연장 등록현황과 통계정보, 공연장 안전정보 및 안전현황 정보,<br>관련기관과 법령정보, 그리고 안전진단기관 결과 평가 등 공연장의 안전과 관련된 제반 정보를 제공합니다.</p>
                            </div>
                        </div>
						<div class="goalVisual">
							<h3>목표 및 미션</h3>
							<div class="box">
								<div class="goal">
									<p>공연장 안전정보<br>데이터베이스 구축·관리</p>
								</div>
								<div class="mission">
									<p>안전한 공연장 환경 조성으로<br>공연장 안전 선진화 구현</p>
								</div>
							</div>
						</div>
                        <div class="section">
                            <div class="business">
                                <h3>주요업무</h3>
                                <ul>
                                    <li>
                                        <span>01</span>
                                        공연장 등록현황 <br>관리
                                    </li>
                                    <li>
                                        <span>02</span>
                                        무대시설 안전진단 <br>정보 관리
                                    </li>
                                    <li>
                                        <span>03</span>
                                        공연장 재해대처계획 및 <br>안전관리조직 관리
                                    </li>
                                    <li>
                                        <span>04</span>
                                        공연장 외 공연 <br>정보 관리
                                    </li>
                                    <li>
                                        <span>05</span>
                                        공연장 안전관련 기준 및 <br>안내서 관리
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div><!--//introduce-->
                </div><!--// content-->
</body>
</html>