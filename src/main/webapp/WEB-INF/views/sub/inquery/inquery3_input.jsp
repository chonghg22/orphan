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
        <div class="container">
        	<div id="goContent" class="hidden"><h1>메인콘텐츠</h1></div>
        	<div class="content-wrap">
        		<div class="sub-title sub2">
					<h2>안전현황</h2>
				</div><!--// sub-title-->

				<jsp:include page="/WEB-INF/jsp/layout/include_location_2.jsp">
					<jsp:param name="depth2" value="1" />
					<jsp:param name="depth3" value="1" />
				</jsp:include>

      			<div class="content-title">
      				<h3>안전진단 주기 문의하기</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       			<form name="form1" id="form1"  encType="multipart/form-data" method="post">
					<input type="hidden" name="ci" value="${userInfo.ci}">
					<input type="hidden" name="di" value="${userInfo.di}">
					<input type="hidden" name="type" value="3"/>
					<input type="hidden" name="type_etc" value=""/>
					<input type="hidden" name="theaterRegNm" value=""/>
					<input type="hidden" name="theaterRegNo" value=""/>
					<input type="hidden" name="safety_overall_chief" value=""/>
					<input type="hidden" name="safety_mng_manager" value=""/>
					<input type="hidden" name="title" value="안전진단 주기 문의"/>
					<input type="hidden" name="message" value="" />
					<input type="hidden" name="theater_seq" value="${paramMap.seq }" />
					<input type="hidden" name="sido" value="${theater.sido }" >
					<input type="hidden" name="sigungu" value="${theater.sigungu }" >
					<input type="hidden" name="gu" value="${theater.gu}" >
       			    <p class="top-txt">안전진단 주기 문의내용을 작성해주세요.</p>
       				<div class="board-wrap">
						<div class="board-write">
							<div class="section">
								<div class="input-field">
									<label for="name"><span class="ico-require">*</span>이름 (담당자명)</label>
									<input type="text" id="name" name="name" value="${userInfo.name}"  readonly="readonly" />
								</div>
                                <div class="input-field">
									<label for="hp"><span class="ico-require">*</span>휴대폰번호</label>
									<input type="text" id="hp" name="hp" value="${userInfo.hp}" readonly="readonly" >
								</div>
							</div>
                            <div class="section">
								<div class="input-field input-email">
									<input type="hidden" name="email">
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
								<div class="input-field input-file">
									<strong class="title"><span class="ico-require">*</span>첨부파일 (공연장등록증, 최근 안전진단 결과 보고서 등)</strong>
									<div class="upload_set">
										<input type="text" title="파일입력란" class="upload_text" readonly="readonly" >
										<div class="upload_btn_wrap">
											<label for="uploadFile">파일찾기</label>
											<input type="file" class="input_file" onchange="checkSize(this)" title="파일찾기" name="file_name" id="file_name">
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
									<p class="s-txt">※ 파일이 여러 개일 경우 압축하여 1개의 파일로 첨부</p>
								</div>
							</div>

							<div class="section">
								<div class="input-field wid-full">
									<label for="contents"><span class="ico-require">*</span>문의사항<span class="s-txt">※ 해당 문의에 대한 답변은 이메일로 전달됩니다.</span></label>
									<textarea title="요청사항입력란" maxlength="1500" class="content" placeholder="안전진단 주기 문의내용을 작성해주세요." name="contents" id="contents"></textarea>
									<div class="txt-right txt-color-gray mt-10" ><span id="counter">(<span class="bytes">0</span>/ 3000)byte</span></div>
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
                  <!-- 개인정보처리방침 팝업-->
				 <jsp:include page="/WEB-INF/jsp/layout/include_privacyPopup.jsp"/>
<script>
$(function(){
	$('textarea.content').keyup(function(){
	bytesHandler(this);
		});
	});
	function getTextLength(str) {
		var len = 0;
		for (var i = 0; i < str.length; i++) {
		if (escape(str.charAt(i)).length == 6) {
			len++;
		}
		len++;
	}
	return len;
}

function bytesHandler(obj){
var text = $(obj).val();
$('span.bytes').text(getTextLength(text));
}

function getBytes(str){
    var cnt = 0;
    for(var i =0; i<str.length;i++) {
        cnt += (str.charCodeAt(i) >128) ? 2 : 1;
    }
    return cnt;
}
/* 파일 용량 체크*/ 
function checkSize(input) {
    if (input.files && input.files[0].size > (10 * 1024 * 1024)) {
        alert("첨부파일의 크기는 10MB 이상 업로드 할 수 없습니다.");
        input.value = null;
    }
}

/*취소처리 function*/
function fn_cancel() {
	if (confirm("안전진단 주기문의를 취소하시겠습니까?")) {
		var frm = document.forms["form1"];
		frm.method = "post";
		frm.action = "result_view_safety.do?seq=<c:out value="${paramMap.seq }" />";
		frm.submit();
	}
}

/*등록 function*/
function fn_egov_save() {
	var frm = document.form1;
	var email1 = document.getElementById("email1");
	var email2 = document.getElementById("email2");
	var fileName = document.getElementById("file_name");
	var contents = document.getElementById("contents");

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
		alert("공연장등록증을 입력해주세요.");
		fileName.focus();
		return false;
	}
	if(contents.value==""){
		alert(" 문의사항을 작성해주세요.");
		contents.focus();
		return false;
	}
	if($("input:checkbox[id=agree]").is(":checked") == true) {
		if (confirm("등록된 문의사항은 수정/삭제가 불가합니다. 안전진단 주기 문의를 등록하시겠습니까?")) {
		frm.email.value = $("#email1").val() + "@" + $("#email2").val();
		frm.action = "inquery3_input_proc.do";
		frm.method = "post";
		frm.submit();
		}
		alert("안전진단 주기 문의 등록이 완료되었습니다. 답변 내용은 '나의 요청/문의 내역'에서 확인이 가능합니다.");
	}else{
		alert("개인정보 수집 및 이용안내에 동의해주세요..");
		return false;
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