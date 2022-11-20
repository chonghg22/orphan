<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
	<title>InfoWash</title>
<%--	<link rel="shortcut icon" href="favicon/favicon.ico">--%>
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

		function fn_inputExcel(){
			var file = $("#washFile").val();
			if(file == "" || file == null){
				alert("파일을 선택해주세요.");
				return false;
			}

			var form = document.excelUpForm;
			console.log("form::",form);
			var formData = new FormData(form);

			if(confirm("업로드 하시겠습니까?")) {
				$.ajax({
					type:"POST"
					,url:"/hdExcelUpload"
					,enctype: 'multipart/form-data'
					,processData: false
					,contentType: false
					,cache:false
					,data: formData
					,success:function(res){
						alert('엑셀 파일 업로드에 성공하였습니다.');
						location.href ='/_mngr_/bookInfo/bookInfo_list.do';
					},
					error:function(){
						alert('엑셀 파일 업로드에 실패하였습니다. 관리자에게 문의해주세요');
					}
				});
			}
		}

	</script>
</head>
<body>
<!-- skipToContent -->
<div id="skipToContent">
	<a href="#goContent">본문 바로가기</a>
</div><!-- // skipToContent -->

<div class="wrap">
	<jsp:include page="../layout/include_gmb.jsp" />
	<div class="container">
		<div id="goContent" class="hidden"><h1>메인콘텐츠</h1></div>
		<div class="content-wrap">
			<div class="main-visual slide">
				<div class="main-visual-slide" style="width: 50%">
					<div class="slide-img">
							<a href="https://www.naver.com" target="_blank">
								<img src="https://i.ytimg.com/vi/_SDfIc6UO7c/maxresdefault.jpg" class="pc-view" style="width:100%"/>
<%--								<img class="img" src="/lib/user/img/main/map-Jeju-on.png" alt="제주">--%>
							</a>
					</div>
					<div class="slide-img">
						<a href="https://www.naver.com" target="_blank">
							<img src="https://images.squarespace-cdn.com/content/v1/603f9fc6a2120f0be59de63c/20a1ded8-774a-4d2f-91e9-c2dabc293ec2/BW21_Jeep+Wrangler_Mobile.jpg?format=2500w" class="pc-view" style="width:100%"/>

							<%--								<img class="img" src="/lib/user/img/main/map-Jeju-on.png" alt="제주">--%>
						</a>
					</div>


<%--					<c:set var="bannerCnt" value="${fn:length(banner)}"/>--%>
<%--					<c:forEach var="banner" items="${banner}" varStatus="status">--%>
<%--						<div class="slide-img">--%>
<%--							<c:choose>--%>
<%--							<c:when test="${banner.linkType eq '_top'}">--%>
<%--							<a href="#none">--%>
<%--								</c:when>--%>
<%--								<c:otherwise>--%>
<%--								<a href="${banner.linkContents}" target="${banner.linkType}">--%>
<%--									</c:otherwise>--%>
<%--									</c:choose>--%>
<%--									<img src="/popup/${banner.file1Name }" class="pc-view" alt="공연장안전지원센터가 제공하는 전국 공연장 정보·안전진단현황 통합정보시스템">--%>
<%--									<img src="/popup/${banner.file2Name }" class="mo-view" alt="공연장안전지원센터가 제공하는 전국 공연장 정보·안전진단현황 통합정보시스템">--%>
<%--								</a>--%>
<%--						</div>--%>
<%--					</c:forEach>--%>
				</div>
				<div class="slick-control type-lg">
					<button type="button" class="slick-prev">이전</button>
					<button type="button" class="slick-next">다음</button>
					<button type="button" class="slick-play" <c:if test="${bannerCnt <= 1}">style="display:none;"</c:if>>재생</button>
					<button type="button" class="slick-stop" <c:if test="${bannerCnt <= 1}">style="display:none;"</c:if>>정지</button>
				</div><!--//slick-control-->
				<br>
				<div class="main-cs" style="float: right;width: 50%;margin-top:-38.2%;">
					<div class="section notice" style="margin-left: 2%;width: 95%;margin-top:2%;">
						<h2>자유게시판</h2>
						<ul class="notice-list">
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
						</ul>
						<a href="/web/sub/board/notice_list.do" class="more-btn">MORE +</a>
					</div><!--notice-->
					<br>
					<div class="section notice" style="margin-left: 2%;width: 95%;margin-top:2%;">
						<h2>공지사항</h2>
						<ul class="notice-list">
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
						</ul>
						<a href="/web/sub/board/notice_list.do" class="more-btn">MORE +</a>
					</div><!--notice-->

					<%--					<div class="section cs-banner mypage">--%>
					<%--						<a href="/web/sub/inquery/inquery_list.do">--%>
					<%--							<p>나의 요청/문의 내역</p>--%>
					<%--						</a>--%>
					<%--					</div><!--guide-->--%>
					<%--					<div class="section cs-banner faq">--%>
					<%--						<a href="/web/sub/board/faq_list.do">--%>
					<%--							<p>자주 묻는 질문</p>--%>
					<%--						</a>--%>
					<%--					</div><!--faq-->--%>
					<div class="section notice" style="margin-left: 2%;width: 95%;margin-top:2%;">
						<h2>FAQ</h2>
						<ul class="notice-list">
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>
							<li><a class="climp"  href="/web/sub/board/notice_view.do?seq=${notice.seq}"><strong>공지1</strong><span class="date">2022-02-02${fn:substring(notice.inputDate,0,10) }</span></a></li>

						</ul>
						<a href="/web/sub/board/notice_list.do" class="more-btn">MORE +</a>
					</div><!--notice-->
				</div><!--main-cs-->

	<%--				<ul class="side-nav">--%>
	<%--					<li><a href="/web/sub/contents/10201.do">공연장 등록절차</a></li>--%>
	<%--					<li><a href="/web/sub/contents/10202.do">공연장 안전진단 절차</a></li>--%>
	<%--					<li><a href="/web/sub/contents/30200.do">무대시설 안전진단 기관</a></li>--%>
	<%--				</ul>--%>
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
				</form>
					<div class="main-search">
						<h2>전국 세차장 찾기</h2>
						<div class="search-wrap" style="margin-bottom: -4%;">
							<div class="section">
								<div class="search-type1">
									<input type="text" title="검색입력란" name="schStr" id="schStr" value="" class=""  placeholder="세차장명을 입력 하세요." >
									<form name="excelUpForm" id="excelForm" method="post" ecntype="multipart/form-data">
									<input type="file" name="washFile" id="washFile"/>
<%--									<button onclick="fn_search()" class="submit-btn" title="검색"><span class="hidden">검색</span></button>--%>
										<button onclick="fn_inputExcel()" class="submit-btn" title="검색"><span class="hidden">검색</span></button>
									</form>
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
										<option  value="">세차유형</option>
										<option  value="P">공공</option>
										<option  value="C">민간</option>
										<option  value="N">정보없음</option>
									</select>
<%--									<select title="검색구분" name="seatsCount">--%>
<%--										<option value="">객석수</option>--%>
<%--										<option value="300">300석 미만</option>--%>
<%--										<option value="999">300~1000석 미만</option>--%>
<%--										<option value="1000">1000석 이상</option>--%>
<%--										<option value="0">기타+기타(정보없음)</option>--%>
<%--									</select>--%>
<%--									<select title="검색구분" name="operateCount">--%>
<%--										<option value="">구동식 무대기구 수</option>--%>
<%--										<option value="0">0개</option>--%>
<%--										<option value="19">1~19개</option>--%>
<%--										<option value="39">20~39개</option>--%>
<%--										<option value="40">40개 이상</option>--%>
<%--									</select>--%>
								</div>
								<div class="btn-box">
									<a href="index.do" class="bg-sky">초기화</a>
									<a href="#" onclick="fn_search()" class="bg-blue">검색</a>
								</div>
							</div>
						</div><!--//search-wrap-->
					</div><!--main-search-->
<%--				</form>--%>

				<div id="map" style="width:100%;height:350px;"></div>

				<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e0942185311b94482c641ed5245ff7"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div
							mapOption = {
								center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								level: 3 // 지도의 확대 레벨
							};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					// 마커를 표시할 위치와 title 객체 배열입니다
					var positions = [
						{
							title: '카카오',
							latlng: new kakao.maps.LatLng(33.450705, 126.570677)
						},
						{
							title: '생태연못',
							latlng: new kakao.maps.LatLng(33.450936, 126.569477)
						},
						{
							title: '텃밭',
							latlng: new kakao.maps.LatLng(33.450879, 126.569940)
						},
						{
							title: '근린공원',
							latlng: new kakao.maps.LatLng(33.451393, 126.570738)
						}
					];

					// 마커 이미지의 이미지 주소입니다
					var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

					for (var i = 0; i < positions.length; i ++) {

						// 마커 이미지의 이미지 크기 입니다
						var imageSize = new kakao.maps.Size(24, 35);

						// 마커 이미지를 생성합니다
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map: map, // 마커를 표시할 지도
							position: positions[i].latlng, // 마커를 표시할 위치
							title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							image : markerImage // 마커 이미지
						});
					}
				</script>


				<div class="main-status">
<%--					<h2>세차장 정보</h2>--%>
					<br>
					<div class="status-wrap">

						<div class="section status-right" id="theaterListDiv" style="width: 100%;">
							<h3>${paramMap.name}&nbsp;${paramMap.sigungu} 전국 세차장 현황</h3>
							<ul class="status-detail" style="width:100%">
                                <li>
                                    <span class="category bg-sky">전체</span>
                                    <p><strong></strong>13,753</p>
                                </li>
                                <c:forEach var="localInfo" items="${selectLocalInfoWashCount}" varStatus="status">
                                    <li>
                                        <span class="category bg-yellow">${localInfo.sido}</span>
                                        <p><strong></strong><fmt:formatNumber value="${localInfo.cnt }" pattern="#,###" /></p>
                                    </li>
                                </c:forEach>
							</ul><!--//status-detail-->
<%--							<div class="status-list scroll-skin">--%>
<%--								<ul>--%>
<%--&lt;%&ndash;									<c:forEach var="list" items="${theaterList}" varStatus="status">&ndash;%&gt;--%>
<%--&lt;%&ndash;										<c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;											<c:when test="${list.operationBody eq 'P'}">&ndash;%&gt;--%>
<%--&lt;%&ndash;												<c:set var="classNm" value="bg-yellow" />&ndash;%&gt;--%>
<%--&lt;%&ndash;												<c:set var="typeNm" value="공공" />&ndash;%&gt;--%>
<%--&lt;%&ndash;											</c:when>&ndash;%&gt;--%>
<%--&lt;%&ndash;											<c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;												<c:set var="classNm" value="bg-green" />&ndash;%&gt;--%>
<%--&lt;%&ndash;												<c:set var="typeNm" value="민간" />&ndash;%&gt;--%>
<%--&lt;%&ndash;											</c:otherwise>&ndash;%&gt;--%>
<%--&lt;%&ndash;										</c:choose>&ndash;%&gt;--%>
<%--&lt;%&ndash;										<li class="${classNm}">&ndash;%&gt;--%>
<%--&lt;%&ndash;											<a href="/web/sub/theater/result_view_safety.do?seq=${list.theaterSeq}">&ndash;%&gt;--%>
<%--&lt;%&ndash;												<span class="category ${classNm}">123123${typeNm}</span>&ndash;%&gt;--%>
<%--&lt;%&ndash;												<strong>${list.theaterNm}123123123</strong>&ndash;%&gt;--%>
<%--&lt;%&ndash;											</a>&ndash;%&gt;--%>
<%--&lt;%&ndash;										</li>&ndash;%&gt;--%>
<%--&lt;%&ndash;									</c:forEach>&ndash;%&gt;--%>
<%--								</ul>--%>
<%--							</div><!--//status-list-->--%>
						</div><!--//section-->
					</div><!--//status-wrap-->
				</div><!--//main-status-->
				<script>
					/*scillbar skin*/
					$(".scroll-skin").mCustomScrollbar({
						theme:"dark"
					});
				</script>



<%--				<ul class="main-quick">--%>
<%--					<li><a href="/web/sub/theater/theater_list.do">공연장정보<br>및 안전현황</a></li>--%>
<%--					<li><a href="/web/sub/contents/10203.do">공연장<br>안전관리의무</a></li>--%>
<%--					<li><a href="/web/sub/contents/10302.do">공연장 외 공연<br>안전관리의무</a></li>--%>
<%--					<li><a href="/web/sub/contect/contect_list.do">관할지자체<br>담당자정보</a></li>--%>
<%--					<li><a href="/web/sub/contents/30300.do">법령정보</a></li>--%>
<%--					<li><a href="/web/sub/board/base_list.do">기준 및 지침</a></li>--%>
<%--				</ul><!--main-quick-->--%>


			</div><!--main-content-->
		</div><!--// content-wrap-->
	</div><!--// container-->
	<jsp:include page="../layout/include_footer.jsp" />
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