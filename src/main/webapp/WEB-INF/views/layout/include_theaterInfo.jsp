<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
 <!-- 공연장 등록번호 안내 팝업-->
	<div id="theaterInfo" class="popup-wrap popup-lg" tabindex="1">
		<div class="popup-inner">
			<div class="popup-top">
				<span class="popup-tit">공연장 등록번호 입력 안내</span>
			</div><!--//popup_top-->
			<div class="popup-con">
				<div class="theater-info">
					<div class="num-info">
						<strong>공연장등록번호 :</strong>
						<span class="txt-color-blue">관할지자체명</span> 
						<small>-</small> 
						<span class="txt-color-orange">등록번호</span> 
					</div>
					<p><strong class="txt-color-blue">관할지자체명 :</strong> 공연장등록증 발급 지역 입력 (시도+시군구, 단 구에서 발급한 경우 시까지만 입력 ex. 전라북도 전주시 완산구 => 전주완산)</p>
					<p><strong class="txt-color-orange">등록번호 :</strong> 등록번호에 기입되어있는 숫자만 공백 없이 입력</p>
					<ul>
						<li>
							<span>예시 01</span>
							<img src="/lib/user/img/sub/theater-info1.png" alt="공연장 등록번호 : 경기의정부 - 2020-000002">
						</li>
						<li>
							<span>예시 02</span>
							<img src="/lib/user/img/sub/theater-info2.png" alt="공연장 등록번호 : 서울종로 - 2300020202">
						</li>
						<li>
							<span>예시 03</span>
							<img src="/lib/user/img/sub/theater-info3.png" alt="공연장 등록번호 : 전주완산 - 202">
						</li>
					</ul>
				</div>
				<div class="btn-box txt-right">
					<a href="#" class="btn bg-blue close" onclick="fn_theaterClose()">닫기</a>
				</div>
			</div><!--//popup_con-->
			<button type="button" class="close close-btn" onclick="fn_theaterClose()">팝업닫기</button>
			<span class="focus-return" tabindex="0">포커스 처음으로 이동</span>
		</div><!--//popup_content-->
	</div><!--// popup-wrap-->
	<script>
/*공연장 등록번호 안내 모달 시작*/
function fn_theaterInfo(){
	$('#theaterInfo').show();
}

function fn_theaterClose(){
	$('#theaterInfo').hide();
}

/*공연장 등록번호 안내 모달 끝*/
 </script>
