<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mngrSessionVO" value="${mngrSessionVO}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
		<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-177792639-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-177792639-1');
	</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title><decorator:title default="한국산업기술시험원 공연장안전지원센터" /></title>
    <link rel="stylesheet" href="/lib/css/datepicker.css">
    <link rel="stylesheet" href="/lib/css/common.css">
    <link rel="stylesheet" href="/lib/css/layout.css">
    <link rel="stylesheet" href="/lib/css/sub.css">
    <script src="/lib/jquery/jquery-1.11.0.min.js"></script>
    <script src="/lib/jquery/jquery-ui.js"></script>
    <script src="/lib/js/common.js"></script>
	<decorator:head />
	<style>
	.tabs a { display:block }
	</style>
</head>
<body>
    <div class="wrap">
        <div class="left-area">
        	<h1><a href="/_mngr_/main/index.do"><img src="../../lib/img/common/logo.png"  alt="공연장안전정보시스템 로고" /> <%-- ${mngrSessionVO.mngType} --%></a></h1>
        	<!--mobile gnb-->
			<nav class="mobile-gnb-wrap">
			<c:choose>
				<c:when test="${mngrSessionVO.mngType eq '1'}">
				<div class="mobile-gnb">
					<ul>
						<li>
							<a href="/_mngr_/performance/performance_list.do">공연장 외 공연 정보</a>
						</li>
						<li>
							<a href="javascript:;">안전현황</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/theater/theater_list.do">공연장 정보 관리</a></li>
								<li><a href="/_mngr_/theater/result_list.do">안전진단 결과 관리</a></li>
								<li><a href="/_mngr_/theater/temporary_list.do">안전진단 결과 관리(임시 등록)</a></li>
								<li><a href="/_mngr_/inquery/inquery1_list.do">공연장 등록/정보변경 요청</a></li>
								<li><a href="/_mngr_/inquery/inquery2_list.do">안전관리조직 정보변경 요청</a></li>
								<li><a href="/_mngr_/inquery/inquery3_list.do">안전진단 주기 문의</a></li>
								<li><a href="/_mngr_/board/safety_list.do">안전진단기관 결과 평가</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="javascript:;">공연장 안전진단 통계</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/statics/statics1_list.do">총괄</a></li>
								<li><a href="/_mngr_/statics/statics2_list.do">안전진단검사</a></li>
								<li><a href="/_mngr_/statics/statics3_list.do">안전진단기관</a></li>
								<li><a href="/_mngr_/statics/statics4_list.do">무대기구 별 안전수준</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="javascript:;">기관·법령</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/contect/contect_list.do">관할지자체 담당자 정보</a></li>
								<li><a href="/_mngr_/board/base_list.do">기준 및 지침</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="javascript:;">커뮤니티</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/board/notice_list.do">공지사항</a></li>
								<li><a href="/_mngr_/board/faq_list.do">FAQ</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="javascript:;">사이트 관리</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/pop/Banner_list.do">메인 배너</a></li>
								<li><a href="/_mngr_/pop/Pop_list.do">팝업</a></li>
								<li><a href="/_mngr_/manager/manager_list.do">관리자 계정</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="javascript:;">로그 관리</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/log/person_list.do">개인정보 조회 로그</a></li>
								<li><a href="/_mngr_/log/job_list.do">관리자 작업 로그</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
					</ul>
				</div>
				</c:when>
				<c:when test="${mngrSessionVO.mngType eq '2'}">
				<div class="mobile-gnb">
					<ul>
						<li>
							<a href="/_mngr_/performance/performance_list.do">공연장 외 공연 정보</a>
						</li>
						<li>
							<a href="javascript:;">안전현황</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/theater/theater_list.do">공연장 정보 관리</a></li>
								<li><a href="/_mngr_/theater/result_list.do">안전진단 결과 관리</a></li>
								<li><a href="/_mngr_/theater/temporary_list.do">안전진단 결과 관리(임시 등록)</a></li>
								<li><a href="/_mngr_/inquery/inquery1_list.do">공연장 등록/정보변경 요청</a></li>
								<li><a href="/_mngr_/inquery/inquery2_list.do">안전관리조직 정보변경 요청</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
						<li>
							<a href="javascript:;">기관·법령</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/contect/contect_list.do">관할지자체 담당자 정보</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
					</ul>
				</div>
				</c:when>
				<c:when test="${mngrSessionVO.mngType eq '3'}">
				<div class="mobile-gnb">
					<ul>
						<li>
							<a href="javascript:;">안전현황</a>
							<ul class="gnb-dep2">
								<li><a href="/_mngr_/theater/result_list.do">안전진단 결과 관리</a></li>
								<li><a href="/_mngr_/theater/temporary_list.do">안전진단 결과 관리(임시 등록)</a></li>
							</ul><!--// gnb-dep2 -->
						</li>
					</ul>
				</div>
				</c:when>
				</c:choose>
				<button type="button" class="gnb-close"><span class="hidden">모바일 메뉴 닫기</span></button>
			</nav><!--// mobile gnb-->
        </div><!--// left-area-->

        <div class="right-area">
        	<div class="header-search">
        		<div class="top-title">
					<h2>안녕하세요! <span>${mngrSessionVO.name}</span> 님</h2>
					<a href="/_mngr_/main/commonMngrPwdChange.do" class="" title="비밀번호 변경">비밀번호 변경</a>
					<a href="/_mngr_/main/logout.do" class="" title="로그아웃">로그아웃</a>
				</div><!--//top-title-->
        	</div>
        	<div class="content">
				<decorator:body />
        	</div><!--// content-->
        </div><!--// right-area-->
    </div><!--//wrap-->
   	<div class="mask"></div><!-- 하나만 -->
<script>
/* 메뉴 활성화 시작 */
var currentUrl = $(location).attr('pathname');
if (currentUrl == "/_mngr_/theater/result_view_safety.do") {
	currentUrl = "/_mngr_/theater/theater_view_safety.do";
}
var menu = "";
var menuLength = 0;
if (currentUrl != "/_mngr_/main/index.do") {
	var menuArr = currentUrl.split("/");
	var tempArr = menuArr[menuArr.length - 1].split("_");
	 if (tempArr[0] == "statics5") tempArr[0] = "statics4"; 
	menu = menuArr[0] + "/" + menuArr[1] + "/" + menuArr[2] + "/" + tempArr[0];

	menuLength = menu.length;

	$(".mobile-gnb a").each(function() {
		var href = $(this).attr("href");
		if (href.length > menuLength) {
			var curl = href.substring(0, menuLength);
			if (curl == menu) {
				if (!$(this).parent().parent().hasClass("gnb-dep2")) {
					$(this).addClass("active");
				} else {
					$(this).addClass("on");
					$(this).parent().parent().css("display","block");
					$(this).parent().parent().parent().children().eq(0).addClass("active");
				}
			}
		}
	});
}
/* 메뉴 활성화 끝 */
</script>
</body>
</html>