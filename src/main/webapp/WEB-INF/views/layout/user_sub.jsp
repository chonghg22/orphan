<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
	<meta name="format-detection" content="telephone=no">
    <meta name="keywords" content="공연장안전정보시스템,공연장안전지원센터,한국산업기술시험원,공연장안전">
    <meta name="title" content="공연장안전지원센터 공연장안전정보시스템">
    <meta name="description" content="공연장안전지원센터가 제공하는 전국 공연장 정보, 안전진단현황 통합정보시스템입니다.">
    <meta property="og:title" content="공연장안전정보시스템">
    <meta property="og:description" content="공연장안전지원센터가 제공하는 전국 공연장 정보, 안전진단현황 통합정보시스템입니다.">
    <meta property="og:type" content="website">
    <meta property="og:image" content="/lib/user/img/common/logo.png">
    <title>공연장안전정보시스템</title>
	<link rel="canonical" href="/web/main/index.do">
    <link href="/lib/user/img/common/favico.png" rel="shortcut icon">
    <link rel="apple-touch-icon" href="/lib/user/img/common/favico.png">
	<link rel="stylesheet" href="/lib/slick/slick.css">
    <link rel="stylesheet" href="/lib/scroll/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/lib/jquery/jquery-ui.css">
    <link rel="stylesheet" href="/lib/user/css/common.css">
    <link rel="stylesheet" href="/lib/user/css/style.css">
    <link rel="stylesheet" href="/lib/user/css/board.css">
    <link rel="stylesheet" href="/lib/user/css/main.css">
    <script src="/lib/jquery/jquery-1.11.0.min.js"></script>
    <script src="/lib/jquery/jquery-ui.js"></script>
    <script src="/lib/slick/slick.js"></script>
    <script src="/lib/scroll/jquery.mCustomScrollbar.min.js"></script>
    <script src="/lib/user/js/common.js"></script>
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-177792639-1"></script>
    <script>


  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-177792639-1');
</script>

	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-177792639-1');
	</script>
</head>
<body>
   	<!-- skipToContent -->
    <div id="skipToContent">
        <a href="#goContent">본문 바로가기</a>
    </div><!-- // skipToContent -->

    <div class="wrap">
		<jsp:include page="./include_gmb.jsp" />

        <div class="container">
        	<div id="goContent" class="hidden"><h1>메인콘텐츠</h1></div>
        	<div class="content-wrap">
				<decorator:body />
        	</div>
		</div><!--// container-->
		<jsp:include page="./include_footer.jsp" />
    </div><!--//wrap-->

    <!-- 상세 팝업-->
	<div id="viewDetail" class="popup-wrap popup-sm" tabindex="1">
		<div class="popup-inner">
			<div class="popup-top">
				<span class="popup-tit">2020년 6월 온쉼표_ `두들팝`</span>
			</div><!--//popup_top-->
			<div class="popup-con">
				<table class="list">
					<caption>공연장 외 공연 정보에 대한 표로써 관할지자체, 관할지자체, 기간, 장소, 전화번호, 주소 항목으로 구성됩니다.</caption>
					<tbody>
						<tr>
							<th scope="row">관할지자체</th>
							<td>서울특별시 종로구</td>
						</tr>
						<tr>
							<th scope="row">관할지자체</th>
							<td>3,000명</td>
						</tr>
						<tr>
							<th scope="row">기간</th>
							<td>2020-06-01(월) ~ 2020-07-01(수)</td>
						</tr>
						<tr>
							<th scope="row">장소</th>
							<td>세종S씨어터</td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td>02-1234-5678</td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td>서울특별시 종로구 세종대로 175 (세종로) (우)03172</td>
						</tr>
					</tbody>
				</table>
				<div class="btn-box txt-right">
					<a href="#" class="btn bg-blue close">닫기</a>
				</div>
			</div><!--//popup_con-->
			<button type="button" class="close close-btn">팝업닫기</button>
			<span class="focus-return" tabindex="0">포커스 처음으로 이동</span>
		</div><!--//popup_content-->
	</div><!--// popup-wrap-->

</body>
</html>