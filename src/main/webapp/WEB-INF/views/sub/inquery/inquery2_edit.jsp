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
<!-- 로그인 체크 include  -->
<%@ include file="/WEB-INF/jsp/egovframework/user/sub/include/userLoginChk_include.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>공연장 정보 및 안전현황 - 공연장안전지원센터</title>
</head>
<body>
        			<div class="sub-title sub2">
					<h2>안전현황</h2>
				</div><!--// sub-title-->

				<jsp:include page="/WEB-INF/jsp/layout/include_location_2.jsp">
					<jsp:param name="depth2" value="1" />
					<jsp:param name="depth3" value="1" />
				</jsp:include>

      			<div class="content-title">
      				<h3>안전관리조직 정보 변경 요청</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       				<form name="form1" id="form1"  encType="multipart/form-data" method="post">
					<input type="hidden" name="ci" value="${userInfo.ci}"/>
					<input type="hidden" name="di" value="${userInfo.di}"/>
					<input type="hidden" name="type" value="2"/>
					<input type="hidden" name="type_etc" value=""/>
					<input type="hidden" name="theater_seq" value="${paramMap.seq }" />
					<input type="hidden" name="email" value=""/>
					<input type="hidden" name="title" value="안전관리조직 정보 변경 요청"/>
					<input type="hidden" name="contents" value=""/>
					<input type="hidden" name="message" value="" />
					<input type="hidden" name="sido" value="${theater.sido }" >
					<input type="hidden" name="sigungu" value="${theater.sigungu }" >
					<input type="hidden" name="gu" value="${theater.gu}" >
       			    <p class="top-txt">책임자 및 담당자 정보를 정확하게 작성해주세요.</p>
       				<div class="board-wrap">
						<div class="board-write">
							<div class="section">
								<div class="input-field">
									<label for="name"><span class="ico-require">*</span>이름 (담당자명)</label>
									<input type="text" id="name" name="name" value="${userInfo.name}" readonly="readonly">
								</div>
                                <div class="input-field">
									<label for="hp"><span class="ico-require">*</span>휴대폰번호</label>
									<input type="text" id="hp" name="hp" value="${userInfo.hp}" readonly="readonly">
								</div>
							</div>
                            <div class="section">
								<div class="input-field input-email">
									<label for="email1"><span class="ico-require">*</span>이메일 주소</label>
									<input type="email" id="email1" title="이메일첫째자리">
									<small>@</small>
									<input type="email" id="email2" title="이메일중간자리">
									<select title="메일선택" id="email3" name="email3" onchange="fn_setDomain(this)">
										<option value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="chol.com">chol.com</option>
									</select>
								</div>
							</div>
							<div class="section">
								<div class="input-field">
									<label for="theaterName"><span class="ico-require">*</span>공연장명</label>
									<input type="text" id="theaterNm" name="theaterNm" value="${theater.theaterNm }" readonly="readonly">
								</div>
								<div class="input-field input-number">
									<label for="theaterNumber1">
										<span class="ico-require">*</span>공연장 등록번호
										<button type="button" class="theater-info pop-open-btn" onclick="fn_theaterInfo()">도움말</button>
									</label>
									<input type="text" id="theaterRegNm" name="theaterRegNm" title="공연장 등록번호1" alt=""placeholder="관할지자체명 입력">
									<small>-</small>
									<input type="text" id="theaterRegNo" name="theaterRegNo" title="공연장 등록번호2" placeholder="등록번호 숫자 입력">
									<a href="#" class="btn-m bg-lt-blue" onclick="fn_check()">확인</a>
								</div>
							</div>
							<div class="section">
								<div class="input-field input-file">
									<strong class="title"><span class="ico-require">*</span>수료증 등록</strong>
									<div class="upload_set">
										<input type="text" title="파일입력란" class="upload_text" readonly="readonly">
										<div class="upload_btn_wrap">
											<label for="uploadFile">파일찾기</label>
											<input type="file" class="input_file" onchange="checkSize(this)" title="파일찾기" name="file_name" id="fileName" >
										</div>
									</div>
									<script>
										//첨부파일
										$('.upload_text').val('파일찾기');
										$('.input_file').change(function () {
											var i = $(this).val();
											var name = $(this).attr('name');
											$('input[name='+name+'_text]').val(i);
											$('.upload_text').val(i);
										});
									</script>
									<p class="s-txt">※ 안전관리 조직 책임자/담당자 전체 수료증 첨부<br>※ 파일이 여러 개일 경우 압축하여 1개의 파일로 첨부</p>
								</div>
							</div>
							<div class="section">
                                <div class="input-field">
                                    <strong class="title"><span class="ico-require">*</span>안전관리조직</strong>
                                    <div class="input-group">
                                        <div class="group">
                                            <span>- 안전총괄책임자</span>
                                            <select title="구분선택" name="safetyOverallChief" id="safetyOverallChief">
                                                <option value="">선택</option>
                                                <option value="1">있음</option>
                                                <option value="2">없음</option>
                                            </select>
                                        </div>
                                        <div class="group">
                                            <span>- 안전관리담당자</span>
                                            <select title="구분선택" name="safetyMngManager" id="safetyMngManager">
                                                <option value="">선택</option>
                                                <option value="0">0</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                            </select>
                                            <span>명</span>
                                        </div>
                                    </div>
                                </div>
							</div>
							<div class="privacy-wrap">
								<strong class="title"><span class="ico-require">*</span>개인정보 수집 및 이용안내</strong>
								<div class="privacy-txt">
									1. 수집·이용 목적 : 공연장 정보 등록요청, 변경요청 및 주기문의에 대한 안내를 위한 신청자 정보확인<br>
									2. 수집·이용 항목 : 이름, 휴대폰번호, E-mail, 공연장명<br>
									3. 보유기간 : 신청일로부터 5년(보유기간 경과 시 파기)<br>
									4. 동의하지 않을 권리 및 미동의시 불이익<br>
									- 신청자는 개인정보 수집 및 이용에 대해 동의를 거부할 권리가 있으나, 최소한의 개인정보 수집 및 이용 동의 거부시에는 신청 및 안내가 제한될 수 있습니다.<br>
									5. 공연장안전정보시스템 
									<button type="button" class="pop-open-btn privacy-btn" onclick="fn_privacyPopup()">개인정보처리방침 보기</button>
								</div>
								<div class="check-set">
									<input type="checkbox" id="agree">
									<label for="agree">개인정보 수집 및 이용에 동의합니다.</label>
								</div>
						</div><!--// board-write-->

						<div class="board-bottom">
							<div class="btn-box">
								<a href="#" onclick="fn_cancel()" class="btn bg-grey">취소</a>
								<a href="#" onclick="fn_egov_save()" class="btn bg-blue">등록</a>
							</div><!--// btn-box-->
						</div><!--// board-bottom-->
       				</div><!--// board-wrap-->
       				</form>
                 </div><!--// content-->
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
	
	 <!-- 개인정보처리방침 팝업-->
	<jsp:include page="/WEB-INF/jsp/layout/include_theaterInfo.jsp"/>
	<jsp:include page="/WEB-INF/jsp/layout/include_privacyPopup.jsp"/>
<script>
var flag = false;

/* 공연장 등록번호 체크 function*/
function fn_check(){
	var theaterRegNm = document.getElementById("theaterRegNm");
	var theaterRegNo = document.getElementById("theaterRegNo");
	if(theaterRegNm.value != "${theater.theaterRegNm}" || theaterRegNo.value != "${theater.theaterRegNo}"){
		alert("공연장 등록번호가 유효하지 않습니다. 정상적인 등록번호일 경우 고객센터로 연락주시면 도움드릴 수 있도록 하겠습니다. \n - 고객센터 : 031-500-0314")
		theaterRegNm.value = "";
		theaterRegNo.value = "";
		return false;
	}
	if(theaterRegNm.value == "${theater.theaterRegNm}" || theaterRegNo.value == "${theater.theaterRegNo}"){
		alert("공연장 등록번호가 확인되었습니다.");
		document.getElementById('theaterRegNm').readOnly = true;
		document.getElementById('theaterRegNo').readOnly = true;
		flag = true;
	}	
}
/* 파일 용량 체크*/ 
function checkSize(input) {
    if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
        alert("첨부파일의 크기는 10MB 이상 업로드 할 수 없습니다.");
        input.value = null;
    }
}

/*취소 function*/
function fn_cancel() {
	if (confirm("안전관리조직 정보 변경 요청을 취소하시겠습니까?")) {
		var frm = document.forms["form1"];
		frm.method = "post";
		frm.action = "result_view_safety.do?seq=<c:out value="${paramMap.seq }" />";
		frm.submit();
	}
}

/*  공연장 정보 변경 function*/
function fn_egov_save() {
	if(!flag){		
		alert("공연장 등록번호를 확인 해 주세요.");
		return false;
	}else{
	var frm = document.form1;
	var email1 = frm.email1;
	var email2 = frm.email2;
	var fileName = document.getElementById("fileName");
	var safetyOverallChief = document.getElementById("safetyOverallChief");
	var safetyMngManager = document.getElementById("safetyMngManager");

	if(email1.value==""){
		alert("이메일을 입력해주세요.");
		email1.focus();
		return false;
	}
	if(email2.value==""){
		alert("이메일을 입력해주세요.");
		email2.focus();
		return false;
	}
	if(fileName.value==""){
		alert("수료증을 첨부해주세요.");
		fileName.focus();
		return false;
	}
	if(safetyOverallChief.value==""){
		alert("안전총괄책임자 유무를 선택해주세요.");
		safetyOverallChief.focus();
		return false;
	}
	if(safetyMngManager.value==""){
		alert("안전관리담당자 명 수를 선택해주세요.");
		safetyMngManager.focus();
		return false;
	}

	if($("input:checkbox[id=agree]").is(":checked") == true) {
		if (confirm("등록된 요청사항은 수정/삭제가 불가합니다. 공연장 등록 요청을 진행하시겠습니까?")) {
			frm.email.value = $("#email1").val() + "@" + $("#email2").val();
			frm.action = "inquery2_input_proc.do";
			frm.method = "post";
			frm.submit();
		}
		alert("안전관리조직 정보 변경 요청이 완료되었습니다. 요청서 검토 후 문제가 없을 시 10일 내 정상 반영되며, 승인/반려 사항은 '나의 요청/문의 내역'에서 확인이 가능합니다.");
	}else{
		alert("개인정보 수집 및 이용안내에 동의해주세요.");
		return false;
	}
	}
}

function fn_setDomain(obj) {
	var str = $(obj).val();
	$("#email2").val(str);
	if (obj.selectedIndex < 1)
		$("#email2").focus();
}
</script>
</body>
</html>