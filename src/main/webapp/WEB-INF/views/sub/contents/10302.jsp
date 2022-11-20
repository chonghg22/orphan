<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>공연장 외 공연 안전관리의무 - 공연장안전지원센터</title>
</head>
<body>
        			<div class="sub-title sub1">
					<h2>안내</h2>
				</div><!--// sub-title-->
				<jsp:include page="/WEB-INF/jsp/layout/include_location_1.jsp">
					<jsp:param name="depth2" value="3" />
					<jsp:param name="depth3" value="2" />
				</jsp:include>   				
      			
      			<div class="content-title">
      				<h3>공연장 외 공연 안전관리의무</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->
      			
      			<div class="sub-icon-tab tabInpage">
      				<ul class="col-4">
      					<li class="on"><a href="#tab1"><img src="/lib/user/img/sub/tab-ico1.png" alt="">재해대처<br>계획</a></li>
      					<li><a href="#tab2"><img src="/lib/user/img/sub/tab-ico2.png" alt="">안전<br>관리비</a></li>
      					<li><a href="#tab3"><img src="/lib/user/img/sub/tab-ico3.png" alt="">안전관리<br>조직</a></li>
      					<li><a href="#tab4"><img src="/lib/user/img/sub/tab-ico4.png" alt="">안전<br>교육</a></li>
      				</ul>
      			</div>
      			
       			<div class="content">
					<div class="tabInpage-con">
						<!-- Tab1 -->
						<div id="tab1" class="on">	
							<div class="section">
								<h4 class="title">재해대처계획에는 다음의 사항이 모두 포함되어야 한다.(공연법 시행령 제9조 제1항)</h4>
								<ul class="list">
									<li>- 공연장 시설 등을 관리하는 자의 임무 및 관리 조직에 관한 사항</li>
									<li>- 비상시에 하여야 할 조치 및 연락처에 관한 사항</li>
									<li>- 화재예방 및 인명피해 방지조치에 관한 사항</li>
									<li>- 안전관리비, 안전관리조직, 안전교육에 관한 사항 (구분과 규모에 따른 의무 대상은 아래 표 참조)</li>
								</ul>

								<div class="table-set">
									<table class="table">
										<caption>관련법령 정보에 대한 표로써 구분, 주요사항, 법령조항 항목으로 구성됩니다.</caption>
										<colgroup>
											<col style="width:20%" span="5">
										</colgroup>
										<thead>
											<tr>
												<th scope="col">구분</th>
												<th scope="col">규모</th>
												<th scope="col">안전관리비</th>
												<th scope="col">안전관리조직</th>
												<th scope="col">안전교육</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row" rowspan="2">공연장 외 공연</th>
												<td>1,000명 미만의 관람이 예상</td>
												<td>의무 사항 아님</td>
												<td>의무 사항 아님</td>
												<td>의무 사항 아님</td>
											</tr>
											<tr>
												<td>1,000명 이상의 관람이 예상</td>
												<td>의무</td>
												<td>의무</td>
												<td>안전총괄책임자, 안전관리담당자, 공연자 안전교육 실시 의무</td>
											</tr>
										</tbody>
									</table><!--table-->
								</div><!--table-set-->
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title">공연장 외의 장소에서 <strong>1천명 이상의 관람이 예상되는 공연</strong>을 하려는 자는 재해대처계획에 안전관리비, 안전관리조직, 안전교육에 관한 사항과 안전관리인력의 확보ㆍ배치계획 및 공연계획서가 포함된 재해대처계획을 공연 개시 14일 전까지 관할 지자체에 신고하여야 한다.</h4>
								<span>※ 신고사항을 변경하려는 경우에는 해당 공연 7일전까지 변경신고를 하여야 한다.</span>
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title bo-0">관할 지자체장은 재해대처계획의 내용이 미흡하다고 인정되는 때에는 신고한 재해대처계획에 대하여 보완을 요구할 수 있으며, 공연장운영자는 정당한 사유가 없으면 이에 따라야 한다.</h4>
								<img src="/lib/user/img/sub/t-in-1.png" alt="재해대처계획 처리 절차 (공연법 시행규칙 별지 제16호 서식 중)" class="pc-view">
								<img src="/lib/user/img/sub/t-in-1-mo.png" alt="재해대처계획 처리 절차 (공연법 시행규칙 별지 제16호 서식 중)" class="mo-view">
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title">관련법령</h4>
								<div class="rule-list">
									<strong>[공연법 제11조]</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 공연장운영자는 화재나 그 밖의 재해를 예방하기 위하여 그 공연장 종업원의 임무·배치 등 재해대처계획을 수립하여 매년 관할 특별자치시장·특별자치도지사·시장·군수·구청장에게 신고하여야 한다. 이 경우 특별자치시장·특별자치도지사·시장·군수·구청장은 신고받은 재해대처계획을 관할 소방서장에게 통보하여야 한다.  
										</li>
										<li>
											<span class="num">②</span>
											 관할 특별자치시장ㆍ특별자치도지사ㆍ시장ㆍ군수ㆍ구청장은 제1항 전단에 따라 신고를 받은 재해대처계획을 검토하여 적합하다고 인정하는 경우에는 신고를 수리하여야 한다. 이 경우 신고된 재해대처계획의 내용이 미흡하다고 인정할 때에는 보완을 요구할 수 있다.
										</li>
										<li>
											<span class="num">③</span>
											 제2항 후단에 따라 재해대처계획의 보완을 요구받은 공연장운영자는 정당한 사유가 없으면 그 요구에 따라 보완하여 관할 특별자치시장ㆍ특별자치도지사ㆍ시장ㆍ군수ㆍ구청장에게 다시 신고하여야 한다. 
										</li>
										<li>
											<span class="num">④</span>
											 <strong>공연장 외의 장소에서 대통령령으로 정하는 규모의 관람자가 있을 것으로 예상되는 공연을 하려는 자의 재해예방조치에 관하여는 제1항을 준용</strong>한다.
										</li>
										<li>
											<span class="num">⑤</span>
											 제1항 및 제4항에 따른 재해대처계획에는 제11조의2부터 제11조의4까지에 해당하는 <strong>안전관리비, 안전관리조직, 안전교육에 관한 사항이 포함</strong>되어야 한다.
										</li>
										<li>
											<span class="num">⑥</span>
											 그 밖에 공연장의 재해예방조치에 필요한 사항은 대통령령으로 정한다.
										</li>
									</ul>
									<strong>[공연법 시행령 제9조]</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 법 제11조제1항에 따른 재해대처계획에는 다음 각 호의 사항이 모두 포함되어야 한다.  
											 <ul class="depth2">
											 	<li><strong>1. 공연장 시설 등을 관리하는 자의 임무 및 관리 조직에 관한 사항</strong></li>
											 	<li><strong>2. 비상시에 하여야 할 조치 및 연락처에 관한 사항</strong></li>
											 	<li><strong>3. 화재예방 및 인명피해 방지조치에 관한 사항</strong></li>
												<li>4. 법 제11조의2부터 제11조의4까지의 규정에 해당하는 <strong>안전관리비, 안전관리조직 및 안전교육에 관한 사항</strong></li>
											 </ul>
										</li>
										<li>
											<span class="num">②</span>
											 법 제9조제1항에 따른 공연장운영자는 법 제11조제1항에 따라 <strong>다음 연도의 재해대처계획을 수립하여 매년 12월 31일까지 관할 특별자치시장·특별자치도지사·시장·군수·구청장에게 신고하여야 하며, 신고한 재해대처계획을 변경하려는 경우에는 그 계획을 적용하기 전에 변경신고를 하여야 한다. 다만, 공연장운영자가 법 제9조제1항에 따라 공연장을 등록하는 경우에는 공연장 등록 신청과 함께 해당 연도의 재해대처계획을 신고하여야 한다.</strong>
										</li>
										<li>
											<span class="num">③</span>
											 공연장 외의 시설이나 장소에서 <strong>1천명 이상의 관람이 예상되는 공연을 하려는 자</strong>는 법 제11조제3항에 따라 해당 <strong>시설이나 장소 운영자와 공동으로 공연 개시 14일 전</strong>까지 제1항 각 호의 사항과 안전관리인력의 확보ㆍ배치계획 및 공연계획서가 포함된 <strong>재해대처계획을 관할 특별자치시장ㆍ특별자치도지사ㆍ시장ㆍ군수 또는 구청장에게 신고</strong>하여야 하며, 신고한 사항을 <strong>변경하려는 경우에는 해당 공연 7일 전까지 변경신고</strong>를 하여야 한다.
										</li>
									</ul>
								</div>
							</div><!--//section-->
							
						</div><!--//tab1-->
						
						<div id="tab2">		
							<div class="section">
								<h4 class="title">적용대상 및 비율</h4>
								<ul class="list">
									<li>공연장 외의 장소에서 1,000명 이상의 관람이 예상되는 공연을 하려는 자는 공연비용 중 일정금액을 아래의 비율에 따라 안전관리비로 사용하여야 한다.</li>
									<li>- 1천명 이상 3천명 미만의 관람이 예상되는 공연 : 공연비용의 1.15% 이상</li>
									<li>- 3천명 이상의 관람이 예상되는 공연 : 공연비용의 1.21% 이상</li>
									<li>
										<div class="bg-txt">
											※ 안전관리비 계상 요령은 “재해대처계획 작성 안내서 증보판” 참조<br>- 공연장안전지원센터 홈페이지<a href="https://www.stagesafety.or.kr" target="_blank">(www.stagesafety.or.kr)</a> “도서자료”에서 다운로드 가능
										</div>
									</li>
								</ul>
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title">안전관리비 사용용도</h4>
								<ul class="list">
									<li>- 안전관리 인력의 인건비 및 수당</li>
									<li>- 공연장 및 공연의 안전관리를 위한 설비의 설치·유지 및 보수</li>
									<li>- 보호장비의 구입</li>
									<li>- 법 제11조의4에 따른 안전교육과 그 밖의 안전교육 및 훈련</li>
									<li>- 법 제12조에 따른 무대시설의 안전진단과 그 밖의 안전점검</li>
									<li>- 안전 관련 보험</li>
								</ul>
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title">안전관리비 사용내역서 제출</h4>
								<ul class="list">
									<li>- 공연이 종료된 날부터 30일 이내에 안전관리비 사용내역서를 작성하여 제출</li>
								</ul>
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title">관련 법령</h4>
								<div class="rule-list">
									<strong>[공연법 시행령 제9조의2]</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 객석 수가 500석 이상인 공연장의 공연장운영자 및 공연장 외의 장소에서 1천명 이상의 관람이 예상되는 공연을 하려는 자는 법 제11조의2제1항에 따른 안전관리비(이하 "안전관리비"라 한다)를 다음 각 호의 기준에 따라 공연장운영 또는 공연비용에 계상하여야 한다.
											 <ul class="depth2">
											 	<li>1. 객석 수가 500석 이상인 공연장의 공연장운영자: 공연장운영비의 1퍼센트 이상</li>
											 	<li>
											 		2. 공연장 외의 장소에서 공연을 하려는 자
                                                    <ul class="depth3">
                                                        <li>가. <strong>1천명 이상 3천명 미만</strong>의 관람이 예상되는 공연의 경우: <strong>공연비용의 1.15퍼센트 이상</strong></li>
                                                        <li>나. <strong>3천명 이상</strong>의 관람이 예상되는 공연의 경우: <strong>공연비용의 1.21퍼센트 이상</strong></li>
                                                    </ul>
											 	</li>
											 </ul>
										</li>
										<li>
											<span class="num">②</span>
											 법 제11조의2제1항 본문에 따른 공연장운영자등(이하 "공연장운영자등"이라 한다)은 제1항에 따라 계상된 <strong>안전관리비를 다음 각 호의 용도</strong>로만 사용하여야 한다.
											 <ul class="depth2">
											 	<li>1. 안전관리 인력의 인건비 및 수당</li>
											 	<li>2. 공연장 및 공연의 안전관리를 위한 설비의 설치·유지 및 보수</li>
											 	<li>3. 보호장비의 구입</li>
											 	<li>4. 법 제11조의4에 따른 안전교육과 그 밖의 안전교육 및 훈련</li>
											 	<li>5. 법 제12조에 따른 무대시설의 안전진단과 그 밖의 안전점검</li>
											 	<li>6. 안전 관련 보험</li>
											 	<li>7. 그 밖에 공연장 및 공연의 안전관리를 위하여 필요한 사항으로서 문화체육관광부장관이 정하여 고시하는 용도</li>
											 </ul>
										</li>
										<li>
											<span class="num">③</span>
											 공연장운영자등은 제1항에 따라 계상된 안전관리비를 사용한 경우에는 <strong>사용내역서를 작성하여 다음 각 호의 구분에 따른 기한까지 관할 특별자치시장·특별자치도지사·시장·군수·구청장에게 제출</strong>하여야 한다.
											 <ul class="depth2">
											 	<li>1. 공연장운영자: 매년 2월 말일</li>
											 	<li>2. <strong>공연장 외의 장소에서 공연을 한 자: 공연이 종료된 날부터 30일 이내</strong></li>
											 </ul> 
										</li>
									</ul>
								</div>
							</div><!--//section-->
						</div><!--//tab2-->
						
						<div id="tab3">		
							<div class="section">
								<h4 class="title">안전관리조직 구성</h4>
								<ul class="list">
									<li>- 예상관객 수 1,000명 이상 ~ 3,000명 미만 : 안전총괄책임자 1명, 안전관리담당자 1명 이상</li>
									<li>- 예상관객 수 3,000명 이상 : 안전총괄책임자 1명, 안전관리담당자 2명 이상</li>
									<li>
										<div class="bg-txt">
											<span>안전총괄책임자 : 공연장이나 공연의 안전을 위해 공연장운영자등이 지정하는 자로서, 공연장이나 공연의 안전을 총괄할 수 있는 책임 또는 권한을 가진 자를 의미함(예시 : 위급상황 발생 시 공연을 중단할 수 있는 권한을 가진 자)</span>
											<span>안전관리담당자 : 공연장이나 공연의 안전을 위해 공연장운영자등이 지정하는 자로서, 공연장이나 공연의 기술적·운영적 안전사항을 충분히 숙지할 수 있는 자를 의미함</span>
										</div>
									</li>
								</ul>
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title">안전관리조직 구성원 인적사항 및 업무 수행 내용 기록 의무</h4>
								<ul class="list">
									<li>- 안전관리조직을 설치한 공연장운영자등은 안전총괄책임자 및 안전관리담당자의 인적사항 및 업무 수행 내용을 기록하여 보관하여야 함</li>
									<li>
										<div class="bg-txt">
											<span>안전총괄책임자 및 안전관리담당자의 업무 수행에 관한 사항은 재해대처계획 신고 시 포함하는 것을 권장하며, 안전 관련 업무 수행과 관련하여 안전관리비 중 “안전관리 인력의 인건비 및 수당”을 근거하는 자료로 활용가능 함</span>
											<span>예를 들어, 안전총괄책임자로 겸직한 자의 인건비 일부를 “안전관리비”로 계상할 경우, 안전총괄책임자의 전체 업무 중 안전 관련 업무 비율을 적용하여 산정할 수 있음</span>
										</div>
									</li>
								</ul>
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title">관련 법령</h4>
								<div class="rule-list">
									<strong>[공연법 제11조의3]</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 제11조에 따라 재해대처계획을 수립하는 공연장운영자등은 다음 각 호의 사람으로 구성된 안전관리조직을 두어야 한다. 다만, 대통령령으로 정하는 기준에 미달하는 공연장운영자등은 안전관리조직을 설치하지 아니할 수 있다.
											 <ul class="depth2">
											 	<li>1. 공연의 안전에 관한 업무를 총괄하여 관리하는 안전총괄책임자</li>
											 	<li>2. 공연 현장에서 안전관리를 담당하는 안전관리담당자</li>
											 </ul>
										</li>
										<li>
											<span class="num">②</span>
											 제1항 본문에 따른 안전관리조직의 설치기준, 구성, 직무 등에 관한 사항은 대통령령으로 정한다.
										</li>
									</ul>
									
									<strong>[공연법 시행령 제9조의3]</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 객석 수가 500석 이상인 공연장의 공연장운영자 또는 공연장 외의 장소에서 1천명 이상의 관람이 예상되는 공연을 하려는 자는 법 제11조의3제1항에 따른 안전관리조직을 별표 1에 따라 설치하여야 한다.
								        </li>
										<li>
											<span class="num">②</span>
											 법 제11조의3제1항에 따라 안전관리조직을 설치한 공연장운영자등은 안전총괄책임자 및 안전관리담당자의 인적사항 및 업무 수행 내용을 기록하여 보관하여야 한다.
										</li>
									</ul>
									
									<strong>[공연법 시행령 별표 1] 안전관리조직의 설치기준(제9조의3제1항 관련)</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 공연장운영자
                                            <ul class="depth2">
											 	<li>가. 객석 수 500석 이상 1천석 미만인 공연장 : 안전총괄책임자 1명 및 안전관리담당자 1명 이상 </li>
											 	<li>나. 객석 수 1천석 이상인 공연장 : 안전총괄책임자 1명 및 안전관리담당자 2명 이상 </li>
											 </ul>
								        </li>
										<li>
											<span class="num">②</span>
											 공연장 외의 장소에서 공연을 하려는 자
											 <ul class="depth2">
											 	<li><strong>가. 1천명 이상 3천명 미만의 관람이 예상되는 공연 : 안전총괄책임자 1명 및 안전관리담당자 1명 이상 </strong></li>
											 	<li><strong>나. 3천명 이상의 관람이 예상되는 공연 : 안전총괄책임자 1명 및 안전관리담당자 2명 이상 </strong></li>
											 </ul>
										</li>
									</ul>
								</div>
							</div><!--//section-->
							
							<div class="section">
								<h4 class="title bo-0">안전관리조직 구성 예시</h4>
								<img src="/lib/user/img/sub/t-in-3.jpg" alt="안전관리조직 구성 예시" class="pc-view">
								<img src="/lib/user/img/sub/t-in-3-mo.jpg" alt="안전관리조직 구성 예시" class="mo-view">
							</div><!--//section-->
						</div><!--//tab3-->
                        
                        <div id="tab4">		
                            <div class="section">
                                <h4 class="title">안전관리조직 안전교육(안전총괄책임자, 안전관리담당자)</h4>
                                <ul class="list">
                                    <li>- 안전총괄책임자는 지정된 후 6개월 이내 4시간 이상 안전교육 실시 의무</li>
                                    <li>- 안전교육 주기 : 안전교육을 받은 날부터 매 2년이 되는 날을 기준으로 전후 각각 3개월 이내 4시간</li>
                                    <li>- 안전관리담당자는 지정된 후 6개월 이내 8시간 이상 안전교육 실시 의무</li>
                                    <li>- 안전교육 주기 : 안전교육을 받은 날부터 매 2년이 되는 날을 기준으로 전후 각각 3개월 이내 4시간</li>
                                    <li>
                                        <div class="bg-txt">
                                            ※ 참고 사항<br>
                                            <span>재해대처계획 신고 이전에 안전총괄책임자 또는 안전관리담당자로 지정되어 안전교육을 받은 자가 있으면, 그 유효기간을 2년으로 함</span>
                                            <span>즉, 안전교육을 받은 날로부터 2년이 경과하지 않았다면 안전교육을 추가로 받을 필요 없음</span>
                                        </div>
                                    </li>
                                    <li>- 안전총괄책임자와 안전관리담당자 안전교육은 공연 안전 분야에서 실무경력이 10년 이상인 사람 또는 대학의 조교수 이상으로서 공연 안전분야에 관한 학식과 경험이 풍부한 사람이 “공연법 시행령 별표 1의2”에 따른 교육 내용으로 실시해야 인정됨</li>
                                </ul>
                            </div><!--//section-->
                            
                            <div class="section">
                                <h4 class="title">공연자* 안전교육</h4>
                                <ul class="list">
                                    <li>- 공연장운영자는 공연자에게 공연 전 1시간 이상 “공연법 시행령 별표 1의2”에 따른 교육 내용으로 교육을 자체적으로 실시해야 함<br>* 공연자 : 공연을 주재하거나 직접 하는 자(공연법 제2조제3호) </li>
                                    <li>
                                        <div class="bg-txt">
                                            ※ 참고 사항<br>
                                            <span>공연장안전지원센터 사이버아카데미(https://safety.kbrainc.com/)에서 온라인으로 교육 수료가 가능함(단 해당 교육은 55분 과정으로 나머지 5분은 공연장에서 피난경로, 소화기 위치, 비상 시 현장대응 요령 등 환경에 따라 달라질 수 있는 안전수칙을 별도로 교육받아야 함)</span>
                                            <span>사이버아카데미에서 교육을 수료한 경우, 해당 수료증은 교육을 수료한 날로부터 2년동안 유효함</span>
                                            <span>사이버아카데미에서 교육 수료가 불가능하거나 공연장에서 자체 교육을 실시할 경우, 공연장안전지원센터 홈페이지(www.stagesafety.or.kr) “영상자료”에서 해당 교육자료 다운이 가능함</span>
                                        </div>
                                    </li>
                                </ul>
                            </div><!--//section-->
                            
                            <div class="section">
								<h4 class="title">관련 법령</h4>
								<div class="rule-list">
									<strong>[공연법 제11조의4]</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 제11조에 따라 재해대처계획을 수립하는 공연장운영자등은 공연의 안전관리를 위하여 공연에 참여하는 공연자, 안전총괄책임자, 안전관리담당자 등에게 안전교육을 실시하여야 한다.
								        </li>
										<li>
											<span class="num">②</span>
											 제1항에 따른 안전교육의 시기 및 방법 등은 대통령령으로 정한다.
										</li>
									</ul>
									
									<strong>[공연법 시행령 제9조의4]</strong>
									<ul>
										<li>
											<span class="num">①</span>
											 법 제11조에 따라 재해대처계획을 수립하는 공연장운영자등이 법 제11조의4제1항에 따라 실시하여야 하는 안전교육의 대상자별 시기와 교육시간은 다음 각 호와 같다.
                                             <ul class="depth2">
											 	<li>1. <strong>공연자: 공연 전 1시간 이상</strong></li>
											 	<li>2. 안전총괄책임자
											 	    <ul class="depth3">
                                                       <li>가. <strong>안전총괄책임자로 지정된 후 6개월 이내에 4시간 이상</strong></li>
                                                       <li>나. 가목에 따른 <strong>안전교육을 받은 날부터 매 2년이 되는 날을 기준으로 전후 각각 3개월 이내에 4시간 이상</strong></li>
                                                    </ul>
											 	</li>
											 	<li>3. 안전관리담당자
											 	    <ul class="depth3">
                                                       <li>가. <strong>안전관리담당자로 지정된 후 6개월 이내에 8시간 이상</strong></li>
                                                       <li>나. 가목에 따른 <strong>안전교육을 받은 날부터 매 2년이 되는 날을 기준으로 전후 각각 3개월 이내에 8시간 이상</strong></li>
                                                    </ul>
											 	</li>
											 </ul>
								        </li>
										<li>
											<span class="num">②</span>
											 법 제11조에 따라 재해대처계획을 수립하는 공연장운영자등은 제1항제2호 및 제3호에 따른 안전교육을 다음 각 호의 어느 하나에 해당하는 사람으로 하여금 실시하도록 하여야 한다.
                                            <ul class="depth2">
                                                <li>1. 공연 안전 분야에서의 실무경력이 10년 이상인 사람</li>
                                                <li>2. 대학의 조교수 이상으로서 공연 안전 분야에 관한 학식과 경험이 풍부한 사람</li>
                                            </ul>
										</li>
										<li>
											<span class="num">③</span>
											 법 제11조의4제1항에 따른 안전교육의 내용은 별표 1의2와 같다.
								        </li>
									</ul>
									
									<strong>[공연법 시행령 별표 1의2] 안전교육의 내용</strong>
									<ul>
										<li>
											<span class="num">1.</span>
											 공연자
                                            <ul class="depth2">
											 	<li>가. 무대시설의 위험성과 작업의 순서 및 동선<span class="font2">(動線)</span>에 관한 사항</li>
											 	<li>나. 작업 또는 공연 개시 전 점검에 관한 사항</li>
											 	<li>다. 공연 시의 유해 및 위험 요인에 관한 사항</li>
											 	<li>라. 보호장비 및 안전장치의 취급과 사용에 관한 사항</li>
											 	<li>마. 정리, 정돈 및 청소에 관한 사항</li>
											 	<li>바. 사고 발생 시 긴급조치에 관한 사항</li>
											 	<li>사. 그 밖에 공연장 및 공연의 안전관리에 관한 사항</li>
											 </ul>
								        </li>
										<li>
											<span class="num">2.</span>
											 안전총괄책임자
											 <ul class="depth2">
											 	<li>가. 안전총괄책임자의 책임과 직무에 관한 사항</li>
											 	<li>나. 공연장 및 공연의 안전 관련 제도와 정책에 관한 사항</li>
											 	<li>다. 공연장 및 공연의 안전을 위한 환경 개선에 관한 사항</li>
											 	<li>라. 안전관리비의 계상 및 사용방법에 관한 사항</li>
											 	<li>마. 공연장 및 공연에서의 사고 사례와 사고예방 대책에 관한 사항</li>
											 	<li>바. 그 밖에 공연장 및 공연의 안전관리에 관한 사항</li>
											 </ul>
										</li>
										<li>
											<span class="num">3.</span>
											 안전관리담당자
											 <ul class="depth2">
											 	<li>가. 공연장 및 공연의 안전 관련 제도와 정책에 관한 사항</li>
											 	<li>나. 안전관리 계획의 수립 및 시행에 관한 사항</li>
											 	<li>다. 사고 발생 시 대처 요령에 관한 사항</li>
											 	<li>라. 무대, 조명, 음향 등 분야별 안전관리 방법에 관한 사항</li>
											 	<li>마. 안전관리비의 계상 및 사용방법에 관한 사항</li>
											 	<li>바. 공연장 및 공연에서의 사고 사례와 사고예방 대책에 관한 사항</li>
											 	<li>사. 그 밖에 공연장 및 공연의 안전관리에 관한 사항</li>
											 </ul>
										</li>
									</ul>
								</div>
							</div><!--//section-->
                        </div><!--//tab4-->
					</div><!--//tabInpage-con-->
                
                </div><!--// content-->
</body>
</html>