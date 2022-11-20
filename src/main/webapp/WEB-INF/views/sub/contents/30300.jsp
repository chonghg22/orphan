<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>관련법령 정보 - 공연장안전지원센터</title>
</head>
<body>
        			<div class="sub-title sub3">
					<h2>기관·법령</h2>
				</div><!--// sub-title-->
				<jsp:include page="/WEB-INF/jsp/layout/include_location_3.jsp">
					<jsp:param name="depth2" value="3" />
				</jsp:include>  
      			
      			<div class="content-title">
      				<h3>관련법령 정보</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->
      			
       			<div class="content">				
       				<section>
       					<p>공연장 무대시설 안전진단은 공연장을 설치하여 운영하고자 하는 자 또는 공연장운영자가 공연에 따라 무대시설에 대하여 실시해야 하는 검토 및 검사이다.<br>공연법에서 공연장 무대시설 안전진단제도는 안전진단 실시, 안전진단기관 지정과 취소, 안전진단 결과 확인과 평가, 기타 안전진단 관련 행정사항으로 구성되어 있으며 주요사항은 표와 같다.</p>
       					
       					<div class="table-set">
							<table class="table">
								<caption>관련법령 정보에 대한 표로써 구분, 주요사항, 법령조항 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:25%">
									<col style="width:45%">
									<col style="width:30%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">주요사항</th>
										<th scope="col">법령조항</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row" rowspan="2">안전진단실시</th>
										<td class="txt-left">
											<p><strong>안전진단 구분</strong></p>
											<ul>
												<li>- 설계 검토와 등록 전 안전검사</li>
												<li>- 정기 안전검사와 정밀 안전진단</li>
												<li>- 자체 안전검사</li>
											</ul>
										</td>
										<td><p>공연법 제12조제1항~4항<br>시행령 제10조제1항~5항</p></td>
									</tr>
									<tr>
										<td class="txt-left">
											<p><strong>결과 제출 및 조치</strong></p>
											<ul>
												<li>- 관할 지자체장에게 안전진단 결과 제출</li>
												<li>- 지자체의 요구에 따른 보완 또는 개수나 보수 실시</li>
											</ul>
										</td>
										<td><p>공연법 제12조제5항~6항</p></td>
									</tr>
									<tr>
										<th scope="row" rowspan="2">안전진단기관 지정</th>
										<td class="txt-left">
											<p><strong>지정 요건</strong></p>
											<ul>
												<li>- 기술 인력과 안전진단 장비</li>
											</ul>
										</td>
										<td><p>공연법 제12조의2제2항<br>시행령 제10조2, 별표 1의3</p></td>
									</tr>
									<tr>
										<td class="txt-left">
											<p><strong>지정 방법과 절차</strong></p>
											<ul>
												<li>- 신청서와 첨부 서류</li>
												<li>- 안전진단기관 지정과 공고</li>
											</ul>
										</td>
										<td><p>시행규칙 제6조의4제1항, 제3항</p></td>
									</tr>
									<tr>
										<th scope="row" rowspan="3">안전진단기관 취소</th>
										<td class="txt-left"><p>지정 취소와 업무 정지 해당 사항</p></td>
										<td><p>공연법 제12조의3제1항</p></td>
									</tr>
									<tr>
										<td class="txt-left"><p>지정 취소와 업무 정지 기준</p></td>
										<td><p>시행규칙 제6조의5제1항, 별표 1의2</p></td>
									</tr>
									<tr>
										<td class="txt-left"><p>지정 취소 절차</p></td>
										<td><p>공연법 제36조제1호<br>시행규칙 제6조의5제2항</p></td>
									</tr>
									<tr>
										<th scope="row" rowspan="4">안전진단 결과 확인 및 평가</th>
										<td class="txt-left"><p>확인 및 평가 사항</p></td>
										<td><p>시행령 제10조의3제2항</p></td>
									</tr>
									<tr>
										<td class="txt-left"><p>자료 제출 및 현장 확인</p></td>
										<td><p>공연법 제12조의4제1항</p></td>
									</tr>
									<tr>
										<td class="txt-left"><p>확인 및 평가 요청</p></td>
										<td><p>시행령 제10조의3제1항</p></td>
									</tr>
									<tr>
										<td class="txt-left"><p>결과 통보</p></td>
										<td><p>시행령 제10조의3제3항</p></td>
									</tr>
								</tbody>
							</table><!--table-->
						</div><!--table-set-->
                    
                    	<p>공연법에 대한 자세한 법령 검색은 ‘국가법령정보센터’ 홈페이지를 이용해 주시기 바랍니다. </p>
                    	<div class="btn-box txt-left">
							<a href="http://www.law.go.kr/" class="btn bg-blue" target="_blank">국가법령정보센터 바로가기</a>
						</div><!--// btn-box-->
       				</section>
       				
                 </div><!--// content-->
</body>
</html>