<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <header class="header-wrap">
            <div class="header">
				<h1><a href="/web/main/index.do"><span class="hidden">infoWash</span></a></h1>
				<!--gnb-->
				<nav class="gnb-wrap">
					<ul class="gnb">
						<li>
							<a href="/web/sub/contents/10100.do">전국 세차장 안내</a>
							<div class="gnb-dep2">
								<ul>
									<li>
										<a href="/web/sub/contents/10100.do">공연장안전정보시스템 소개</a>
									</li>
									<li>
										<a href="/web/sub/contents/10201.do">공연장 안전정보</a>
										<ul class="gnb-dep3">
											<li><a href="/web/sub/contents/10201.do">공연장 등록 절차</a></li>
											<li><a href="/web/sub/contents/10202.do">공연장 안전진단 절차</a></li>
											<li><a href="/web/sub/contents/10203.do">공연장 안전관리의무</a></li>
										</ul>
									</li>
									<li>
										<a href="/web/sub/performance/performance_list.do">공연장 외 공연 안전정보</a>
										<ul class="gnb-dep3">
											<li><a href="/web/sub/performance/performance_list.do">공연장 외 공연 정보</a></li>
											<li><a href="/web/sub/contents/10302.do">공연장 외 공연 안전관리의무</a></li>
										</ul>
									</li>
								</ul>
							</div><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="/web/sub/theater/theater_list.do">브랜드별 세차용품</a>
							<div class="gnb-dep2">
								<ul>
									<li>
										<a href="/web/sub/theater/theater_list.do">공연장 정보 및 안전현황</a>
									</li>
									<li>
										<a href="/web/sub/board/safety_list.do">안전진단기관 결과 평가</a>
									</li>
									<li>
										<a href="/web/sub/statics/statics1_list.do">공연장 통계</a>
										<ul class="gnb-dep3">
											<li><a href="/web/sub/statics/statics1_list.do">전국 공연장 등록 현황</a></li>
											<li><a href="/web/sub/statics/statics2_list.do">지역별 공연장 등록 현황</a></li>
										</ul>
									</li>
								</ul>
							</div><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="/web/sub/contect/contect_list.do">튜닝샾</a>
							<div class="gnb-dep2">
								<ul>
									<li><a href="/web/sub/contect/contect_list.do">관할지자체 담당자 정보</a></li>
									<li><a href="/web/sub/contents/30200.do">무대시설 안전진단기관 정보</a></li>
									<li><a href="/web/sub/contents/30300.do">관련법령 정보</a></li>
									<li><a href="/web/sub/board/base_list.do">기준 및 지침</a></li>
								</ul>
							</div><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="/web/sub/board/notice_list.do">커뮤니티</a>
							<div class="gnb-dep2">
								<ul>
									<li><a href="/web/sub/board/notice_list.do">공지사항</a></li>
									<li><a href="/web/sub/board/faq_list.do">FAQ</a></li>
									<li><a href="/web/sub/inquery/inquery_list.do">나의 요청/문의 내역</a></li>
								</ul>
							</div><!--// gnb-dep2 -->
						</li>
					</ul>
				</nav>
				<!--// gnb-->
<%--				<div class="top-search-open">--%>
<%--					<button type="button" class="top-search-btn">검색열기</button>--%>
<%--				</div><!--// top-search-open-->--%>

				<div class="top-search-open">
					<button type="button" class="top-search-btn">LOGIN</button>
				</div><!--// top-search-open-->

<%--				<div class="top-search">--%>
<%--					<form name="topSearchFrm" method="get" action="/web/sub/search/search_list.do" onsubmit="return fn_goSearchPageReturn()">--%>
<%--					<div class="search-box">--%>
<%--						<input type="text" name="schStr" placeholder="검색어를 입력해주세요." title="검색입력란">--%>
<%--						<button class="btn-search" onclick="fn_goSearchPage();">검색</button>--%>
<%--					</div>--%>
<%--					</form>--%>
<%--				</div>--%>
				<!--// top-search-->
				<script>
				function fn_goSearchPageReturn() {
					fn_goSearchPage();
					return false;
				}
				function fn_goSearchPage() {
					var f = document.topSearchFrm;
					if (!f.schStr.value) {
						alert("검색어를 입력하세요.");
						return;
					}
					f.schType.value = "united";
					f.page.value = 1;
					f.submit();
				}
				</script>

				<!--mobile gnb-->
				<nav class="mobile-gnb-wrap">
					<button type="button" class="pc-btn gnb-open"><span class="hidden">모바일 메뉴</span></button>
					<div class="gnb-drop mobile-gnb">
						<ul>
							<li>
								<a href="#none">안내</a>
								<ul class="gnb-dep2">
									<li>
										<a href="/web/sub/contents/10100.do">공연장안전정보시스템 소개</a>
									</li>
									<li>
										<a href="#none">공연장 안전정보</a>
										<ul class="gnb-dep3">
											<li><a href="/web/sub/contents/10201.do">공연장 등록 절차</a></li>
											<li><a href="/web/sub/contents/10202.do">공연장 안전진단 절차</a></li>
											<li><a href="/web/sub/contents/10203.do">공연장 안전관리의무</a></li>
										</ul>
									</li>
									<li>
										<a href="#none">공연장 외 공연 안전정보</a>
										<ul class="gnb-dep3">
											<li><a href="/web/sub/performance/performance_list.do">공연장 외 공연 정보</a></li>
											<li><a href="/web/sub/contents/10302.do">공연장 외 공연 안전관리의무</a></li>
										</ul>
									</li>
								</ul><!--// gnb-dep2 -->
							</li>
							<li>
								<a href="#none">안전현황</a>
								<ul class="gnb-dep2">
									<li>
										<a href="/web/sub/theater/theater_list.do">공연장 정보 및 안전현황</a>
									</li>
									<li>
										<a href="/web/sub/board/safety_list.do">안전진단기관 결과 평가</a>
									</li>
									<li>
										<a href="#none">공연장 통계</a>
										<ul class="gnb-dep3">
											<li><a href="/web/sub/statics/statics1_list.do">전국 공연장 등록 현황</a></li>
											<li><a href="/web/sub/statics/statics2_list.do">지역별 공연장 등록 현황</a></li>
										</ul>
									</li>
								</ul><!--// gnb-dep2 -->
							</li>
							<li>
								<a href="#none">기관·법령</a>
								<ul class="gnb-dep2">
									<li><a href="/web/sub/contect/contect_list.do">관할지자체 담당자 정보</a></li>
									<li><a href="/web/sub/contents/30200.do">무대시설 안전진단기관 정보</a></li>
									<li><a href="/web/sub/contents/30300.do">관련법령 정보</a></li>
									<li><a href="/web/sub/board/base_list.do">기준 및 지침</a></li>
								</ul><!--// gnb-dep2 -->
							</li>
							<li>
								<a href="#none">커뮤니티</a>
								<ul class="gnb-dep2">
									<li><a href="/web/sub/board/notice_list.do">공지사항</a></li>
									<li><a href="/web/sub/board/faq_list.do">FAQ</a></li>
									<li><a href="/web/sub/inquery/inquery_list.do">나의 요청/문의 내역</a></li>
								</ul><!--// gnb-dep2 -->
							</li>
						</ul>
					</div>
					<button type="button" class="gnb-close"><span class="hidden">모바일 메뉴 닫기</span></button>
				</nav><!--// mobile gnb-->
            </div><!--//header-->
        </header><!--//header_wrap-->
