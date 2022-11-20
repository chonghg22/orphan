<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>공연장 안전진단 절차 - 공연장안전지원센터</title>
</head>
<body>
				<div class="sub-title sub1">
					<h2>안내</h2>
				</div><!--// sub-title-->

				<jsp:include page="/WEB-INF/jsp/layout/include_location_1.jsp">
					<jsp:param name="depth2" value="2" />
					<jsp:param name="depth3" value="2" />
				</jsp:include>

      			<div class="content-title">
      				<h3>공연장 안전진단 절차</h3>
      				<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

      			<div class="sub-step-tab tabInpage">
      				<ul>
      					<li class="on"><a href="#tab1"><span>안전진단 구분<small>안전진단 대상, 주기, 세부내용</small></span></a></li>
      					<li><a href="#tab2"><span>안전진단 업무흐름<small>공연장 운영자, 안전진단 전문기관,<br>관할 지자체의 업무 흐름</small></span></a></li>
      					<li><a href="#tab3"><span>안전진단기관 정보<small>무대시설 안전진단 전문기관 정보</small></span></a></li>
      				</ul>
      			</div>

       			<div class="content">
					<div class="tabInpage-con">
						<!-- Tab1 -->
						<div id="tab1" class="on">
							<div class="section">
								<h4 class="title bo-0">무대시설 안전진단 제도 구조</h4>
								<img src="/lib/user/img/sub/t-in-4.jpg" alt="무대시설 안전진단 제도 구조" class="pc-view">
                                <img src="/lib/user/img/sub/t-in-4-mo.jpg" alt="무대시설 안전진단 제도 구조" class="mo-view">
                            </div>

                            <div class="section">
                                <h4 class="title bo-0">무대시설 안전진단 종류별 구분</h4>
								<div class="table-set">
									<table class="table">
										<caption>무대시설 안전진단 종류별 구분에 대한 표로써 구분, 대상, 시기, 내용 항목으로 구성됩니다.</caption>
										<colgroup>
											<col style="width:15%" span="2">
											<col style="width:20%" span="1">
											<col style="width:50%" span="1">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">대상</th>
												<th scope="col">시기</th>
												<th scope="col">내용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">설계검토</th>
												<td>구동 무대기계·기구 수<br> 40개 이상</td>
												<td>공연장 설치공사 시작 전</td>
												<td class="txt-left">공연장을 설치·운영하고자 하는 자가 공연장 설치 공사 시작 전에 안전진단 전문기관에 의뢰하여 설계 단계에서의 이론적 안전성을 검토하는 예방적 안전진단<br>(공연장 무대시설 안전진단 시행세칙 [별표 2] 참고)</td>
											</tr>
											<tr>
												<th scope="row">등록 전 안전검사</th>
												<td>모든 공연장</td>
												<td>공연장 등록 전</td>
												<td class="txt-left">공연장을 설치·운영하고자 하는 자가 공연장 등록 전에 안전진단 전문기관에 의뢰하여 무대기계·기구의 안전을 확인하는 안전진단<br>(공연장 무대시설 안전진단 시행세칙 [별표 3], [별표 3의1] 참고)</td>
											</tr>
											<tr>
												<th scope="row">정기 안전검사</th>
												<td>모든 공연장</td>
												<td>공연장 등록 후 3년째 되는 해,<br> 이후 3년마다 정기 안전검사 실시</td>
												<td class="txt-left">공연장을 설치·운영하는 자가 안전진단 전문기관에 의뢰하여 매 3년마다 정기적으로 받는 안전진단<br>(공연장 무대시설 안전진단 시행세칙 [별표 3], [별표 3의1] 참고)</td>
											</tr>
											<tr>
												<th scope="row">정밀 안전진단</th>
												<td>모든 공연장</td>
												<td>공연장 등록 후 9년째 되는 해,<br> 이후 9년마다 정기 안전검사 대신 실시</td>
												<td class="txt-left">공연장을 설치·운영하는 자가 안전진단 전문기관에 의뢰하여 매 9년마다 정기적으로 받는 정밀안전진단<br>(공연장 무대시설 안전진단 시행세칙 [별표 6], [별표 6의1] 참고)</td>
											</tr>
											<tr>
												<th scope="row">자체 안전검사</th>
												<td>모든 공연장</td>
												<td>매년(주간/월간/반기)</td>
												<td class="txt-left">공연장운영자가 자체검사계획에 따라 매년 실시하는 안전진단<br>(공연장 무대시설 안전진단 시행세칙 [별표 4], [별표 4의1], [서식 1], [서식 1의1] 참고)</td>
											</tr>
										</tbody>
									</table><!--table-->
								</div><!--table-set-->
							</div><!--//section-->
							<div class="section">
                                <h4 class="title bo-0">무대시설 규모(구동 무대기계·기구 수)에 따른 구분</h4>
								<div class="table-set">
									<table class="table">
										<caption>무대시설 규모(구동 무대기계·기구 수)에 따른 구분에 대한 표로써 구동 무대 기계·기구 수, 설계검토, 등록 전 안전검사, 정기 안전검사, 정밀안전진단, 자체 안전검사 항목으로 구성됩니다.</caption>
										<colgroup>
											<col style="width:16.6%" span="6">
								        </colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">구동 무대<br>기계·기구 수</th>
												<th scope="col" colspan="5">안전진단 구분</th>
								            </tr>
											<tr>
												<th scope="col">설계검토</th>
												<th scope="col">등록 전 안전검사</th>
												<th scope="col">정기 안전검사</th>
												<th scope="col">정밀안전진단</th>
												<th scope="col">자체 안전검사</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">0 ~ 40개 미만</th>
												<td class="oxtxt">x</td>
												<td class="oxtxt">o</td>
												<td class="oxtxt">o</td>
												<td class="oxtxt">o</td>
												<td class="oxtxt">o</td>
											</tr>
											<tr>
												<th scope="row">40개 이상</th>
												<td class="oxtxt">o</td>
												<td class="oxtxt">o</td>
												<td class="oxtxt">o</td>
												<td class="oxtxt">o</td>
												<td class="oxtxt">o</td>
											</tr>
										</tbody>
									</table><!--table-->
								</div><!--table-set-->
							</div><!--//section-->
							<div class="section">
                                <h4 class="title bo-0">공연장 무대시설 안전진단 주기 안내</h4>
								<div class="table-set">
									<table class="table">
										<caption>공연장 무대시설 안전진단 주기 안내에 따른 구분에 대한 표로써 안전진단 구분, 안전진단 주기 항목으로 구성됩니다.</caption>
										<colgroup>
											<col style="width:30%" span="1">
                                            <col style="width:70%" span="1">
								        </colgroup>
										<thead>
											<tr>
												<th scope="col">안전진단 구분</th>
												<th scope="col">안전진단 주기</th>
								            </tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">설계검토</th>
												<td class="txt-left">공연장 설치 공사 시작 전</td>
											</tr>
											<tr>
												<th scope="row">등록 전 안전검사</th>
												<td class="txt-left">공연장 등록 전</td>
											</tr>
											<tr>
												<th scope="row">정기 안전검사</th>
												<td class="txt-left">
												    <ul>
												        <li>① 등록한 날부터 3년이 경과한 경우</li>
												        <li>② 정기 안전검사를 받은 날부터 3년이 경과한 경우</li>
												        <li>③ 자체 안전검사 결과 공연장운영자 또는 무대시설 안전진단 전문기관이 특별히 필요하다고 인정하는 경우</li>
												    </ul>
												</td>
											</tr>
											<tr>
												<th scope="row">정밀안전진단</th>
												<td class="txt-left">
												    <ul>
												        <li>① 등록한 날부터 9년이 경과한 경우</li>
												        <li>② 정밀안전진단을 받은 날부터 9년이 경과한 경우</li>
												        <li>③ 정기 안전검사 결과 무대시설 안전진단 전문기관이 특별히 필요하다고 인정하는 경우</li>
												    </ul>
												</td>
											</tr>
											<tr>
												<th scope="row">자체 안전검사</th>
												<td class="txt-left">매년 무대시설에 대한 검사계획을 수립하여 자체 안전검사 실시</td>
											</tr>
										</tbody>
									</table><!--table-->
								</div><!--table-set-->
								<p>※ 무대시설 안전진단제도의 취지에 따라 정기 안전검사 사이의 기간은 3년(+31일)을 초과되지 않아야 함</p>
							</div><!--//section-->
							<div class="section">
                                <h4 class="title bo-0">공연장 무대시설 안전진단 주기 적용 방법</h4>
								<div class="table-set">
									<table class="table">
										<caption>공연장 무대시설 안전진단 주기 적용 방법에 따른 구분에 대한 표로써 실시일, 등록 전 안전검사, 정기 안전검사, 정밀안전진단 항목으로 구성됩니다.</caption>
										<colgroup>
											<col style="width:16%" span="1">
                                            <col style="width:28%" span="3">
								        </colgroup>
										<thead>
											<tr>
												<th scope="col" rowspan="2">실시일</th>
												<th scope="col" colspan="3">무대시설 안전진단 구분</th>
								            </tr>
								            <tr>
												<th scope="col">등록 전 안전검사</th>
												<th scope="col">정기 안전검사</th>
												<th scope="col">정밀안전진단</th>
								            </tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">최초 실시일</th>
												<td>무대시설 설치 완료 후, 공연장 등록 신청 이전</td>
												<td>등록일로부터 3년이 되는 날의 전후 31일 이내</td>
												<td>등록일로부터 9년이 되는 날의 전후 31일 이내</td>
											</tr>
											<tr>
												<th scope="row">차기 실시일<br>(정기적 실시)</th>
												<td>-</td>
												<td>정기 안전검사를 받은 날부터 3년이<br> 경과한 날의 전후 31일 이내</td>
												<td>정밀안전진단을 받은 날부터 9년이 경과한 날의 전후 31일 이내</td>
											</tr>
											<tr>
												<th scope="row">그 외 실시일</th>
												<td>-</td>
												<td>자체 안전검사 결과 공연장운영자 또는<br> 무대시설 안전진단 전문기관이 특별히<br> 필요하다고 인정하는 경우</td>
												<td>정기 안전검사 결과 무대시설 안전진단 전문기관이 특별히 필요하다고 인정하는 경우</td>
											</tr>
										</tbody>
									</table><!--table-->
								</div><!--table-set-->
							</div><!--//section-->
							<div class="section">
								<h4 class="title bo-0">공연장 무대시설 안전진단 주기 적용 예시</h4>
								<img src="/lib/user/img/sub/t-in-5.jpg" alt="공연장 무대시설 안전진단 주기 적용 예시" class="pc-view">
                                <img src="/lib/user/img/sub/t-in-5-mo.jpg" alt="공연장 무대시설 안전진단 주기 적용 예시" class="mo-view">
                                <p class="mt-20">※ 공연법 제12조제3항에 따라 정밀안전진단을 받으면 동시에 정기 안전검사를 받은 것으로 봄</p>
                                <img src="/lib/user/img/sub/t-in-6.jpg" alt="주기가 도래하기 전에 안전진단 실시 (규정 준수)" class="pc-view">
                                <img src="/lib/user/img/sub/t-in-6-mo.jpg" alt="주기가 도래하기 전에 안전진단 실시 (규정 준수)" class="mo-view">
                                <img src="/lib/user/img/sub/t-in-7.jpg" alt="주기를 초과하여 안전진단 실시 (규정 위반)" class="mt-30 pc-view">
                                <img src="/lib/user/img/sub/t-in-7-mo.jpg" alt="주기를 초과하여 안전진단 실시 (규정 위반)" class="mt-30 mo-view">
                            </div>
                            <div class="section">
								<h4 class="title">“정기 안전검사 또는 정밀안전진단을 받은 날”의 기준</h4>
								<ul class="list">
									<li>무대시설 안전진단 주기 산정에서 공연법 제12조제2항제2호와 제12조제3항제2호의 안전진단을 받은 날의 기준은 안전진단 계약이 종료되는 날로 한다. </li>
								</ul>
                            </div>
						</div><!--//tab1-->
						<div id="tab2">
						    <div class="section">
								<h4 class="title bo-0">안전진단 업무 흐름 예시</h4>
								<img src="/lib/user/img/sub/t-in-8.jpg" alt="안전진단 업무 흐름 예시" class="pc-view">
                                <img src="/lib/user/img/sub/t-in-8-mo.jpg" alt="안전진단 업무 흐름 예시" class="mo-view">
                            </div>
							<div class="section">
								<h4 class="title">안전진단 결과에 따른 개·보수 의무 (공연법 제12조 제6항 관련)</h4>
								<ul class="list">
									<li>- 설계검토, 등록 전 안전검사, 정기 안전검사, 정밀안전진단 등의 결과를 제출받은 관할 지자체는 공연장운영자에게 무대시설에 대한 보완이나 개수 또는 보수를 요구할 수 있다.</li>
									<li>- 이 경우 공연장운영자는 정당한 사유가 없는 한 이에 따라야 하며, 보완이나 개수 또는 보수의 결과를 지체 없이 관할 지자체에 제출하여야 한다.</li>
								</ul>
							</div><!--//section-->
						</div><!--//tab2-->
						<div id="tab3">
							<h4 class="title bo-0">안전진단기관 정보</h4>
							<div class="board-wrap">
								<div class="board-common">
									<table class="table board-list">
										<caption>관할지자체 담당자 정보에 대한 표로써 안전진단 전문기관, 주소, 전화번호, 담당자 이메일, 업무 절차서 항목으로 구성됩니다.</caption>
										<colgroup>
											<col style="width:20%" span="5">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">안전진단 전문기관</th>
												<th scope="col">주소</th>
												<th scope="col">전화번호</th>
												<th scope="col">담당자 이메일</th>
												<th scope="col">업무 절차서</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>한국산업기술시험원</td>
												<td class="mo-inline">경상남도 진주시 충의로 10</td>
												<td class="mo-inline">031-500-0314</td>
												<td class="mo-inline">kkw5064@safety.or.kr</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-01.pdf','공연장 무대시설 안전진단 업무절차서_한국산업기술시험원.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>(사)대한산업안전협회</td>
												<td class="mo-inline">서울특별시 구로구 구로5동 23-1</td>
												<td class="mo-inline">02-860-7000</td>
												<td class="mo-inline">kkw5064@safety.or.kr</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-02.pdf','공연장 무대시설 안전진단 업무절차서_(사)대한산업안전협회.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>㈜케이알엔지니어링</td>
												<td class="mo-inline">서울 구로구 디지털로34길 55 코오롱싸이언스밸리 2차 1212</td>
												<td class="mo-inline">02-3281-4060</td>
												<td class="mo-inline">ybh8937@kreng.co.kr</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-03.pdf','공연장 무대시설 안전진단 업무절차서_(주)케이알엔지니어링.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>㈜코스텍</td>
												<td class="mo-inline">경기도 광명시  하안로228 광명시범공단 2동7층3호</td>
												<td class="mo-inline">02-2632-2114</td>
												<td class="mo-inline">kostech@korea.com</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-04.pdf','공연장 무대시설 안전진단 업무절차서_(주)코스텍.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>한국검정(주)</td>
												<td class="mo-inline">서울특별시 강남구 역삼1동 836-15</td>
												<td class="mo-inline">02-2188-0013</td>
												<td class="mo-inline">cyeh5211@naver.com</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-05.pdf','공연장 무대시설 안전진단 업무절차서_한국검정(주).pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>코리아테크인스펙션(주)</td>
												<td class="mo-inline">서울특별시 서초구 강남대로 53길 7</td>
												<td class="mo-inline">02-2635-4752</td>
												<td class="mo-inline">kotec@kotecst.com</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-06.pdf','공연장 무대시설 안전진단 업무절차서_코리아테크인스펙션(주).pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>㈜인스펙트</td>
												<td class="mo-inline">서울특별시 서초구 양재동 7-42 용진빌딩</td>
												<td class="mo-inline">02-2058-1112</td>
												<td class="mo-inline">parkhg70@hanmail.net</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-07.pdf','공연장 무대시설 안전진단 업무절차서_㈜인스펙트.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>㈜에스이테크컨설팅</td>
												<td class="mo-inline">서울특별시 송파구 백제고분로50길 31 신일빌딩 4층</td>
												<td class="mo-inline">02-501-9620</td>
												<td class="mo-inline">setech08@hotmail.com</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-08.pdf','공연장 무대시설 안전진단 업무절차서_㈜에스이테크컨설팅.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>㈜티디에이</td>
												<td class="mo-inline">서울특별시 영등포구 선유로3길 10 702호</td>
												<td class="mo-inline">02-2284-3700</td>
												<td class="mo-inline">muhngoon@gmail.com</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-09.pdf','공연장 무대시설 안전진단 업무절차서_㈜티디에이.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
											<tr>
												<td>(사)한국안전기술협회</td>
												<td class="mo-inline">경기도 안산시 단원구 동산로 76, 9층</td>
												<td class="mo-inline">031-484-8504</td>
												<td class="mo-inline">safety@korsta.or.kr</td>
												<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-10.pdf','공연장 무대시설 안전진단 업무절차서_(사)한국안전기술협회.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
											</tr>
										</tbody>
									</table>
								</div><!--// board-common-->
							</div><!--// board-wrap-->
						</div><!--//tab3-->
					</div><!--//tabInpage-con-->
                </div><!--// content-->
</body>
</html>