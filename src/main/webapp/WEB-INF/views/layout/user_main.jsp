<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="orderby" uri="/WEB-INF/tlds/orderby.tld" %>
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
    <title>공연장안전정보시스템</title>
    <link rel="shortcut icon" href="favicon/favicon.ico">
    <link rel="stylesheet" href="/lib/slick/slick.css">
    <link rel="stylesheet" href="/lib/scroll/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="/lib/jquery/jquery-ui.css">
    <link rel="stylesheet" href="/lib/user/css/common.css">
    <link rel="stylesheet" href="/lib/user/css/style.css">
    <link rel="stylesheet" href="/lib/user/css/board.css">
    <link rel="stylesheet" href="/lib/user/css/main.css">
    <link rel="canonical" href="/web/main/index.do">
    <link href="/lib/user/img/common/favico.png" rel="shortcut icon">
    <link rel="apple-touch-icon" href="/lib/user/img/common/favico.png">
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
        		<div class="main-visual slide">
					<div class="main-visual-slide">
					<c:set var="bannerCnt" value="${fn:length(banner)}"/>
					<c:forEach var="banner" items="${banner}" varStatus="status">
						<div class="slide-img">
							<c:choose>
								<c:when test="${banner.linkType eq '_top'}">
							<a href="#none">
								</c:when>
								<c:otherwise>
							<a href="${banner.linkContents}" target="${banner.linkType}">
								</c:otherwise>
							</c:choose>
								<img src="/popup/${banner.file1Name }" class="pc-view" alt="공연장안전지원센터가 제공하는 전국 공연장 정보·안전진단현황 통합정보시스템">
								<img src="/popup/${banner.file2Name }" class="mo-view" alt="공연장안전지원센터가 제공하는 전국 공연장 정보·안전진단현황 통합정보시스템">
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="slick-control type-lg">
					<button type="button" class="slick-prev">이전</button>
					<button type="button" class="slick-next">다음</button>
					<button type="button" class="slick-play" <c:if test="${bannerCnt <= 1}">style="display:none;"</c:if>>재생</button>
					<button type="button" class="slick-stop" <c:if test="${bannerCnt <= 1}">style="display:none;"</c:if>>정지</button>
				</div><!--//slick-control-->
				<ul class="side-nav">
					<li><a href="/web/sub/contents/10201.do">공연장 등록절차</a></li>
					<li><a href="/web/sub/contents/10202.do">공연장 안전진단 절차</a></li>
					<li><a href="/web/sub/contents/30200.do">무대시설 안전진단 기관</a></li>
				</ul>
				</div><!--main-visual-->
				<script>
				/* 메인비주얼 슬라이드*/
				function mainSlider(item) {
					var slideWrap = $(item).closest('.slide');
					var prevBtn = slideWrap.find('.slick-prev');
					var nextBtn = slideWrap.find('.slick-next');
					var stopBtn = slideWrap.find('.slick-stop');
					var playBtn = slideWrap.find('.slick-play');
					$(item).slick({
						slidesToShow:1,
						autoplaySpeed:5000,
						dots:true,
						//speed:2000,
						pauseOnHover: false,
						prevArrow: prevBtn,
						nextArrow: nextBtn,
						fade: true,
						autoplay:true,
						/* adaptiveHeight: true */
						});
					/*control*/
					$(stopBtn).on('click', function() {
						$(item).slick('slickPause');
						$(this).hide();
						$(playBtn).show();
					});
					$(playBtn).on('click', function() {
						$(item).slick('slickPlay');
						$(this).hide();
						$(stopBtn).show();
					});
				};
				mainSlider('.main-visual-slide') //메인비주얼
				</script>

        		<div class="main-content">
        		<form name="listForm" id="listForm" method="get">
                <input type="hidden" name="viewCount" value="10" />
                <input type="hidden" name="schFld" value="1" />
                <input type="hidden" name="page" value="1" />
					<div class="main-search">
						<h2>전국 공연장 찾기</h2>
						<div class="search-wrap">
							<div class="section">
								<div class="search-type1">
									<input type="text" title="검색입력란" name="schStr" id="schStr" value="" class=""  placeholder="공연장명을 입력 하세요." >
									<button onclick="fn_search()" class="submit-btn" title="검색"><span class="hidden">검색</span></button>
								</div>
							</div>
							<div class="section">
       						<div class="select-list">
       							<select  id="mainSido" name="sido" onchange="fn_selectSido(this)">
								<option value="">시도</option>
								<c:forEach var="sido" items="${sidoListMap}" varStatus="status">
									<option value="<c:out value="${sido.sido}" />"><c:out value="${sido.sido}" /></option>
								</c:forEach>
								</select>
								<select id="sigungu" name="sigungu" onchange="fn_selectSigungu(this)">
									<option value="">시군구</option>
								</select>
       							<select title="검색구분" name="operationBody">
       								<option  value="">공공/민간</option>
       								<option  value="P">공공</option>
       								<option  value="C">민간</option>
       								<option  value="N">정보없음</option>
       							</select>
       							<select title="검색구분" name="seatsCount">
       								<option value="">객석수</option>
       								<option value="300">300석 미만</option>
       								<option value="999">300~1000석 미만</option>
       								<option value="1000">1000석 이상</option>
       								<option value="0">기타+기타(정보없음)</option>
       							</select>
       							<select title="검색구분" name="operateCount">
       								<option value="">구동식 무대기구 수</option>
       								<option value="0">0개</option>
       								<option value="19">1~19개</option>
       								<option value="39">20~39개</option>
       								<option value="40">40개 이상</option>
       							</select>
       						</div>
       						<div class="btn-box">
       							<a href="index.do" class="bg-sky">초기화</a>
       							<a href="#" onclick="fn_search()" class="bg-blue">검색</a>
       						</div>
       					</div>
       				</div><!--//search-wrap-->
					</div><!--main-search-->
					</form>


       				<div class="main-status">
       					<h2>한 눈에 보는 지역별 공연장 정보</h2>
       					<div class="status-wrap">
       						<div class="section status-left">
       							<div class="area-map">
       								<div class="map">
										<a href="#" class="btnSeoul on" id="btnSeoul">
											<span class="bubble">서울특별시</span>
											<img class="img" src="/lib/user/img/main/map-Seoul-on.png" alt="서울">
										</a>
										<a href="#" class="btnGyeonggi" id="btnGyeonggi">
											<span class="bubble">경기도</span>
											<img class="img" src="/lib/user/img/main/map-Gyeonggi-on.png" alt="경기">
										</a>
										<a href="#" class="btnIncheon" id="btnIncheon">
											<span class="bubble">인천광역시</span>
											<img class="img" src="/lib/user/img/main/map-Incheon-on.png" alt="인천">
										</a>
										<a href="#" class="btnGangwon" id="btnGangwon">
											<span class="bubble">강원도</span>
											<img class="img" src="/lib/user/img/main/map-Gangwon-on.png" alt="강원">
										</a>
										<a href="#" class="btnChungbuk" id="btnChungbuk">
											<span class="bubble">충청북도</span>
											<img class="img" src="/lib/user/img/main/map-Chungbuk-on.png" alt="충북">
										</a>
										<a href="#" class="btnChungnam" id="btnChungnam">
											<span class="bubble">충청남도</span>
											<img class="img" src="/lib/user/img/main/map-Chungnam-on.png" alt="충남">
										</a>
										<a href="#" class="btnSejong" id="btnSejong">
											<span class="bubble">세종특별자치시</span>
											<img class="img" src="/lib/user/img/main/map-Sejong-on.png" alt="세종특별자치시">
										</a>
										<a href="#" class="btnDaejeon" id="btnDaejeon">
											<span class="bubble">대전광역시</span>
											<img class="img" src="/lib/user/img/main/map-Daejeon-on.png" alt="대전">
										</a>
										<a href="#" class="btnGyeongbuk" id="btnGyeongbuk">
											<span class="bubble">경상북도</span>
											<img class="img" src="/lib/user/img/main/map-Gyeongbuk-on.png" alt="경북">
										</a>
										<a href="#" class="btnGyeongnam" id="btnGyeongnam">
											<span class="bubble">경상남도</span>
											<img class="img" src="/lib/user/img/main/map-Gyeongnam-on.png" alt="경남">
										</a>
										<a href="#" class="btnDaegu" id="btnDaegu">
											<span class="bubble">대구광역시</span>
											<img class="img" src="/lib/user/img/main/map-Daegu-on.png" alt="대구">
										</a>
										<a href="#" class="btnUlsan" id="btnUlsan">
											<span class="bubble">울산광역시</span>
											<img class="img" src="/lib/user/img/main/map-Ulsan-on.png" alt="울산">
										</a>
										<a href="#" class="btnBusan" id="btnBusan">
											<span class="bubble">부산광역시</span>
											<img class="img" src="/lib/user/img/main/map-Busan-on.png" alt="부산">
										</a>
										<a href="#" class="btnJeonbuk" id="btnJeonbuk">
											<span class="bubble">전라북도</span>
											<img class="img" src="/lib/user/img/main/map-Jeonbuk-on.png" alt="전북">
										</a>
										<a href="#" class="btnJeonnam" id="btnJeonnam">
											<span class="bubble">전라남도</span>
											<img class="img" src="/lib/user/img/main/map-Jeonnam-on.png" alt="전남">
										</a>
										<a href="#" class="btnGwangju" id="btnGwangju">
											<span class="bubble">광주광역시</span>
											<img class="img" src="/lib/user/img/main/map-Gwangju-on.png" alt="광주">
										</a>
										<a href="#" class="btnJeju" id="btnJeju">
     										<span class="bubble">제주도</span>
      										<img class="img" src="/lib/user/img/main/map-Jeju-on.png" alt="제주">
      									</a>
      									<div class="map-guide">
											<img src="/lib/user/img/main/map-guide.png" alt="맵가이드" usemap="#Map">
											<map name="Map">
												<area shape="poly" coords="87,114,105,107,116,104,124,118,119,132,98,133,85,121" href="#" data-map="btnSeoul" alt="서울" onclick="fn_selectSigunguAjax('서울특별시');">
												<area shape="poly" coords="93,46,99,60,81,85,79,101,65,90,50,88,51,106,61,115,73,105,89,110,105,100,116,100,126,106,127,118,126,129,119,136,102,138,87,130,78,140,82,145,62,156,93,192,119,186,129,197,146,180,159,177,173,164,184,124,167,111,164,74,154,60,135,54,121,33,93,45" href="#" data-map="btnGyeonggi" alt="경기" onclick="fn_selectSigunguAjax('경기도');">
												<area shape="poly" coords="75,109,63,118,70,125,75,136,82,127,83,112,76,108" href="#" data-map="btnIncheon" alt="인천" onclick="fn_selectSigunguAjax('인천광역시');">
												<area shape="poly" coords="250,3,237,24,129,32,139,46,163,61,172,83,174,109,192,125,179,162,237,173,263,187,331,182,250,4" href="#" data-map="btnGangwon" alt="강원" onclick="fn_selectSigunguAjax('강원도');">
												<area shape="poly" coords="56,175,13,207,59,299,95,285,123,288,142,307,150,299,143,283,123,284,117,272,116,255,108,244,93,220,109,201,111,194,92,197,56,176" href="#" data-map="btnChungbuk" alt="충북" onclick="fn_selectSigunguAjax('충청북도');">
												<area shape="poly" coords="150,186,134,201,144,218,130,226,134,246,152,259,147,278,156,301,176,305,191,284,178,276,174,238,186,236,200,214,222,209,237,213,256,191,231,177,177,171,150,186" href="#" data-map="btnChungnam" alt="충남" onclick="fn_selectSigunguAjax('충청남도');">
												<area shape="poly" coords="111,202,95,221,119,255,130,248,127,223,133,219,126,202,118,195,113,200" href="#" data-map="btnSejong" alt="세종특별자치시" onclick="fn_selectSigunguAjax('세종특별자치시');">
												<area shape="poly" coords="134,254,147,259,141,280,128,282,121,272,121,262,130,250,134,253" href="#" data-map="btnDaejeon" alt="대" onclick="fn_selectSigunguAjax('대전광역시');">
												<area shape="poly" coords="175,329,154,340,148,362,152,380,144,394,144,410,160,430,153,445,175,438,198,449,215,444,220,467,225,470,221,441,241,434,257,432,270,410,303,394,288,383,282,380,283,366,259,372,242,368,239,363,224,365,203,360,198,344,178,329" href="#" data-map="btnGyeongnam" alt="경남" onclick="fn_selectSigunguAjax('경상남도');">
												<area shape="poly" coords="226,333,227,360,245,352,255,348,259,334,261,329,259,321,252,321,238,326,227,332" href="#" data-map="btnDaegu" alt="대구" onclick="fn_selectSigunguAjax('대구광역시');">
												<area shape="poly" coords="297,359,289,366,288,376,297,380,315,402,330,370,322,364,312,366,307,359,297,358" href="#" data-map="btnUlsan" alt="울산" onclick="fn_selectSigunguAjax('울산광역시');">
												<area shape="poly" coords="271,417,266,432,288,437,310,410,304,400,271,416" href="#" data-map="btnBusan" alt="부산" onclick="fn_selectSigunguAjax('부산광역시');">
												<area shape="poly" coords="63,305,56,329,35,347,54,357,35,375,46,380,68,362,80,373,91,370,106,387,123,386,129,384,141,392,145,378,140,360,149,338,173,322,177,311,151,306,141,314,120,295,94,290,63,305" href="#" data-map="btnJeonbuk" alt="전북" onclick="fn_selectSigunguAjax('전라북도');">
												<area shape="poly" coords="33,378,17,392,27,412,13,424,19,428,18,458,10,452,8,467,19,479,27,505,37,503,52,478,57,490,71,491,81,469,103,462,109,466,94,482,110,494,126,480,118,464,120,454,127,452,136,456,142,471,142,475,160,471,154,453,138,445,146,442,154,427,141,410,137,393,123,390,105,390,87,404,82,414,70,417,55,415,47,412,48,399,53,393,61,392,75,394,82,399,93,401,100,394,98,386,87,375,78,381,68,367,46,387,33,378" href="#" data-map="btnJeonnam" alt="전남" onclick="fn_selectSigunguAjax('전라남도');">
												<area shape="poly" coords="52,397,49,411,58,415,70,418,83,416,80,412,86,405,75,398,60,396,53,396" href="#" data-map="btnGwangju" alt="광주" onclick="fn_selectSigunguAjax('광주광역시');">
												<area shape="poly" coords="-2,560,9,582,47,579,68,567,74,554,74,544,59,538,28,543,20,545" href="#" data-map="btnJeju" alt="제주" onclick="fn_selectSigunguAjax('제주특별자치도');">
												<area shape="poly" coords="331,190,264,193,239,225,222,214,203,219,192,241,180,244,183,274,197,281,182,311,182,326,196,333,204,351,223,359,219,332,234,321,245,317,258,316,264,324,266,335,258,349,258,357,247,355,243,360,248,364,257,365,269,365,282,363,290,355,301,350,310,357,326,361,332,365,344,328,344,316,332,325,326,320,331,227,332,203,366,178,377,178,389,176,403,173,413,172,411,158,386,156,372,160" href="#" data-map="btnGyeongbuk" alt="경북" onclick="fn_selectSigunguAjax('경상북도');">
											</map>
										</div>
   								  </div>
       							</div><!--//area-map-->
       							<script>
									/*지도*/
									$(document).on('mouseenter', '.map-guide area', function(e){
										e.preventDefault()
										var mapBtn = $(this).attr('data-map');
										var mapDetail = $('#' + mapBtn);
										$(mapDetail).addClass('hover');
										$(mapDetail).siblings().removeClass('hover');
                                    });
                                    $(document).on('mouseleave', '.map-guide area', function(e){
										e.preventDefault()
										var mapBtn = $(this).attr('data-map');
										var mapDetail = $('#' + mapBtn);
										$(mapDetail).removeClass('hover');
										$(mapDetail).siblings().removeClass('hover');
                                    });
                                    $(document).on('click', '.map-guide area', function(e){
										e.preventDefault()
										var mapBtn = $(this).attr('data-map');
										var mapDetail = $('#' + mapBtn);
										$(mapDetail).addClass('on');
										$(mapDetail).siblings().removeClass('on');
									});
								</script>
								<div class="mobile-select">
									<select id="sido" name="sido" onchange="fn_selectSigunguAjax(this.options[this.selectedIndex].text);" >
										<option>시/도선택</option>
										<c:forEach var="sido" items="${sidoListMap}" varStatus="status">
											<option value="<c:out value="${sido.sido}" />" ><c:out value="${sido.sido}" /></option>
										</c:forEach>
									</select>
								</div>
       							<div class="area-list">
       								<ul class="list" id="sigunguList">
									<c:forEach var="sigungu" items="${sigunguListMap}" varStatus="status">
										<li><a href="#none" <c:if test="${status.index eq 0}">class="on"</c:if>>${sigungu.sigungu}</a></li>
									</c:forEach>
       								</ul><!--//list-->
       							</div><!--//area-list-->
       						</div><!--//section-->
       						<div class="section status-right" id="theaterListDiv">
       							<h3>${paramMap.name}&nbsp;${paramMap.sigungu} 현황</h3>
       							<ul class="status-detail">
       								<li>
       									<span class="category bg-sky">전체</span>
       									<p><strong><c:out value="${pCount + cCount}" /></strong> 개소</p>
       								</li>
       								<li>
       									<span class="category bg-yellow">공공</span>
       									<p><strong><c:out value="${pCount}" /></strong> 개소</p>
       								</li>
       								<li>
       									<span class="category bg-green">민간</span>
       									<p><strong><c:out value="${cCount}" /></strong> 개소</p>
       								</li>
       							</ul><!--//status-detail-->
       							<div class="status-list scroll-skin">
       								<ul>
									<c:forEach var="list" items="${theaterList}" varStatus="status">
										<c:choose>
											<c:when test="${list.operationBody eq 'P'}">
												<c:set var="classNm" value="bg-yellow" />
												<c:set var="typeNm" value="공공" />
											</c:when>
											<c:otherwise>
												<c:set var="classNm" value="bg-green" />
												<c:set var="typeNm" value="민간" />
											</c:otherwise>
										</c:choose>
       									<li class="${classNm}">
       										<a href="/web/sub/theater/result_view_safety.do?seq=${list.theaterSeq}">
												<span class="category ${classNm}">${typeNm}</span>
												<strong>${list.theaterNm}</strong>
       										</a>
       									</li>
       								</c:forEach>
       								</ul>
       							</div><!--//status-list-->
       						</div><!--//section-->
       					</div><!--//status-wrap-->
       				</div><!--//main-status-->
       				<script>
						/*scillbar skin*/
						$(".scroll-skin").mCustomScrollbar({
							theme:"dark"
						});
					</script>

       				<ul class="main-quick">
       					<li><a href="/web/sub/theater/theater_list.do">공연장정보<br>및 안전현황</a></li>
       					<li><a href="/web/sub/contents/10203.do">공연장<br>안전관리의무</a></li>
       					<li><a href="/web/sub/contents/10302.do">공연장 외 공연<br>안전관리의무</a></li>
       					<li><a href="/web/sub/contect/contect_list.do">관할지자체<br>담당자정보</a></li>
       					<li><a href="/web/sub/contents/30300.do">법령정보</a></li>
       					<li><a href="/web/sub/board/base_list.do">기준 및 지침</a></li>
       				</ul><!--main-quick-->

       				<div class="main-cs">
       					<div class="section cs-banner mypage">
       						<a href="/web/sub/inquery/inquery_list.do">
       							<p>나의 요청/문의 내역</p>
       						</a>
       					</div><!--guide-->
       					<div class="section cs-banner faq">
       						<a href="/web/sub/board/faq_list.do">
       							<p>자주 묻는 질문</p>
       						</a>
       					</div><!--faq-->
       					<div class="section notice">
       						<h2>공지사항</h2>
       						<ul class="notice-list">
       						<c:forEach var="notice" items="${notice}" varStatus="status">
       							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>${notice.title}</strong><span class="date">${fn:substring(notice.inputDate,0,10) }</span></a></li>
       						</c:forEach>
       						</ul>
       						<a href="/web/sub/board/notice_list.do" class="more-btn">MORE +</a>
       					</div><!--notice-->
       				</div><!--main-cs-->
        		</div><!--main-content-->
        	</div><!--// content-wrap-->
        </div><!--// container-->
		<jsp:include page="./include_footer.jsp" />
    </div><!--//wrap-->

    <!-- 레이어팝업 -->
	<script>
		function setCookie(name, value, expirehours) {
			var todayDate = new Date();
			todayDate.setHours(todayDate.getHours() + expirehours);
			document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
		}
		function closeWin(id,checkbox) {
			if (document.getElementById(checkbox).checked) {
				setCookie(id, "done", 24);
			}
			document.getElementById(id).style.display = "none";
		}
	</script>
	<c:forEach var="popup" items="${popup}" varStatus="status">
	  <div class="layerpopup_con" id="layer_pop${popup.seq}">
        <div class="title">${popup.title}</div>
		<c:choose>
			<c:when test="${popup.linkType eq '_top'}">
		<a href="#none">
			</c:when>
			<c:otherwise>
		<a href="${popup.linkContents}" target="${popup.linkType}">
			</c:otherwise>
		</c:choose>
        <img src="/popup/${popup.file1Name }" alt="샘플이미지" />
        </a>
        <div class="footer">
            <span class="check-set">
                <input type="checkbox" name="Notice"  id="pop_today${popup.seq}"/>
                <label for="pop_today${popup.seq}"><span></span>오늘 하루 보지 않기</label>
            </span>
            <a href="javascript:closeWin('layer_pop${popup.seq}', 'pop_today${popup.seq}');">닫기</a>
        </div>
    </div>
    </c:forEach>
<script language="Javascript" >

	var sido = "${paramMap.name}";
	var selectSigungu = null;
	function init() {
		if (selectSigungu == null) {
			selectSigungu = $("#sigunguList li").eq(0).children();
			sigungu = $(selectSigungu).text();
		}

		$("#sigunguList li a").click(function() {
			$(this).addClass("on");
			$(selectSigungu).removeClass("on");
			selectSigungu = $(this);
			fn_selectTheaterListAjax($(this).text());
		});
	}
	init();

	function fn_selectSigunguAjax(sido) {
		this.sido = sido;
		$.ajax({
			url : "/web/common/sigungu.ajax"
			, data : "name="+sido
			, type : "post"
			, dataType : "html"
			, success : function(data){
				$("#sigunguList").html(data);
				init();
			}
		});
	}

	function fn_selectTheaterListAjax(sigungu) {
		$.ajax({
			url : "/web/common/theater.ajax"
			, data : "name="+sido+"&sigungu="+sigungu
			, type : "post"
			, dataType : "html"
			, success : function(data){
				$("#theaterListDiv").html(data);
				$(".scroll-skin").mCustomScrollbar({
					theme:"dark"
				});
			}
		});
	}

	/*검색 function*/
	function fn_search(){
		var f = document.listForm;
		f.action = "/web/sub/theater/theater_list.do"
		f.submit();
	}
 	/*시군구 function*/
	function fn_selectSido(obj){
		if (obj.selectedIndex < 1) {
			alert("시도를 선택하세요.");
			obj.focus();
			return;
		}
		/* alert($(obj).val()); */
		$('#sigungu').children('option:not(:first)').remove();
		fn_getSelectList("sido", $(obj).val());
	}

		function fn_getSelectList(type, val) {
		if (!val) return;
		$.ajax({
			url : "/_mngr_/common/sido_list.ajax"
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

	cookiedata = document.cookie;
	<c:forEach var="popup" items="${popup}" varStatus="status">
	if (cookiedata.indexOf("layer_pop${popup.seq}=done") < 0) {
			document.getElementById('layer_pop${popup.seq}').style.display = "inline";
	} else {
		document.getElementById('layer_pop${popup.seq}').style.display = "none";
	}
    </c:forEach>
</script>
	<!-- 레이어팝업 끝 -->
</body>
</html>