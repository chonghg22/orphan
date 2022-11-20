<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>공연장 등록 절차 - 공연장안전지원센터</title>
</head>
<body>
        		<div class="sub-title sub1">
					<h2>안내</h2>
				</div><!--// sub-title-->

				<jsp:include page="/WEB-INF/jsp/layout/include_location_1.jsp">
					<jsp:param name="depth2" value="2" />
					<jsp:param name="depth3" value="1" />
				</jsp:include>

      			<div class="content-title">
      				<h3>공연장 등록 절차</h3>
      				<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       				<div class="section mb-50">
       					<h4 class="title">공연장 등록 절차</h4>
       					<p>공연장 등록을 하고자 하거나 등록증의 기재사항의 변경을 사유로 변경등록을 하고자 하는 자는 공연법 시행규칙 별치 제10호서식의 공연장등록(변경등록)신청서와 첨부서류를 함께 관할지자체에게 제출<br>(정보통신망에 의한 제출을 포함한다)하여야 함(단, 변경등록을 하고자 하는 경우에는 변경사항과 관련된 서류에 한하여 제출)</p>
       				</div>

       				<div class="section mb-50">
       					<h4 class="title bo-0">공연장 등록관련 법률</h4>
       					<div class="table-set">
							<table class="table">
								<caption>공연장 등록관련 법률에 대한 표로써 구분, 설계검토, 세부규정, 관련법령 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:20%">
									<col style="width:60%">
									<col style="width:20%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">세부규정</th>
										<th scope="col">관련법령</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">공연장 등록대상</th>
										<td class="txt-left">- 년 90일 이상 또는 계속하여 30일 이상 공연에 제공할 목적으로 설치하여 운영하는 시설은 공연장으로 등록을 해야함</td>
										<td>
											<ul>
												<li>공연법 제2조</li>
												<li>공연법 제9조</li>
												<li>공연법 시행령 제1조의2</li>
												<li>공연법 시행령 제8조</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">공연장 등록반려</th>
										<td class="txt-left">
											<ul>
												<li>- 무대시설(조명, 음향시설 포함). 방음시설(객석의 천장이 없는 공연장은 제외)을 갖추지 못한 경우</li>
												<li>- 설계검토 및 등록 전 안전검사 결과 각 기준에 미달하는 경우(설계검토의 경우 무대시설이 40개 이상인 공연장에만 해당)</li>
												<li>- 그 밖에 법 또는 다른 법령에 따른 제한에 위반되는 경우</li>
											</ul>
										</td>
										<td>
											<ul>
												<li>공연법 시행령 제8조</li>
												<li>공연법 시행규칙 제5조</li>
											</ul>
										</td>
									</tr>
									<tr>
										<th scope="row">공연장 폐업신고</th>
										<td class="txt-left">
											<ul>
												<li>- 공연장의 등록을 한 자가 영업을 폐지한 경우에는 폐지한 날부터 30일 이내에 관할 지자체장에 폐업을 신고해야함</li>
												<li>- 관할 지자체장은 폐업한 사실이 확인된 공연장이 폐업신고를 하지 않을 경우 해당 공연장의 직권 말소가 가능함</li>
											</ul>
										</td>
										<td>
											<ul>
												<li>공연법 제9조</li>
												<li>공연법 시행규칙 제6조의2</li>
											</ul>
										</td>
									</tr>
								</tbody>
							</table><!--table-->
						</div><!--table-set-->
       				</div>

       				<div class="section">
       					<h4 class="title">공연장 등록 전 준비사항 (공연법 관련)</h4>
       					<div class="grid-2">
       						<div class="section">
       							<h5>공연장 등록을 위한 첨부서류(공연법 시행규칙 제6조)</h5>
       							<ul class="depth1">
       								<li><span class="num">①</span> 시설설치내역서</li>
       								<li><span class="num">②</span> 시설의 평면도 및 배치도</li>
       								<li><span class="num">③</span> 부동산의 소유권 또는 사용권을 증명할 수 있는 서류</li>
       								<li><span class="num">④</span> 무대시설 안전진단 잔문기관이 발급하는 다음 서류 1부
       									<ul class="depth2">
       										<li>가. 신규등록
												<ul class="depth3">
													<li>- 설계검토 결과(무대기계·기구 수 40개 이상인 공연장에 해당)</li>
													<li>- 등록 전 안전검사 결과(등록하려는 모든 공연장에 해당)</li>
												</ul>
       										</li>
       										<li>나. 변경등록
       											<ul class="depth3">
													<li>- 정기검사 결과 또는 정밀안전진단 결과</li>
												</ul>
       										</li>
       									</ul>
       								</li>
       								<li><span class="num">⑤</span>전기안전점검확인서 : 전기사업법 제66조의2제1항에 따른 전기안전점검<br>전기안전공사 사이버사업소(https://cyber.kesco.or.kr) : 사용전점검 신청</li>
       							</ul>
       						</div>
       						<div class="section">
       							<h5>등록 전 안전검사</h5>
       							<p>공연장을 설치하여 운영하려는 자는 무대시설 안전진단 전문기관으로부터 등록 전 무대시설에 대한 안전검사를 받아야 한다.</p>
       							<p>등록 전 안전검사 등의 결과를 제출받은 특별자치도지사ㆍ시장ㆍ군수ㆍ구청장은 공연장운영자에게 무대시설에 대한 보완이나 개수 또는 보수를 요구할 수 있다. 이 경우 공연장운영자는 정당한 사유가 없는 한 이에 따라야 한다.</p>
       						</div>
       					</div>
					</div>
                </div><!--// content-->
</body>
</html>