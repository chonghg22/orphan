<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt"    uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>공연장 정보 및 안전현황 - 공연장안전지원센터</title>
</head>
<body>
        		<div class="sub-title sub2">
					<h2>휴대폰 본인인증</h2>
				</div><!--// sub-title-->
	
				<div class="page-location">
					<div class="inner">
						<nav>
							<a href="/web/main/index.do" class="home"><span class="hidden">Home</span></a>
							<div class="depth1 drop">
								<a href="javascript:;" class="title">휴대폰 본인인증</a>
							</div><!--// depth1-->													
						</nav><!--// nav-->
					</div>
				</div><!--// page-location-->
      			<div class="content-title">
      				<h3>휴대폰 본인인증</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->

       			<div class="content">
       				<form name="certForm" id="certForm">
       				<input type="hidden" name="di" value="" />
					<input type="hidden" name="ci" value="" />
					<input type="hidden" name="name" value="" />
					<input type="hidden" name="gender" value="" />
					<input type="hidden" name="jumin" value="" />
					<input type="hidden" name="hp" value="" />
					<input type="hidden" name="test" value="${newInsert }">
					<input type="hidden" name="seq" value="${paramMap.seq }"/>
       				</form>
       				<div class="certification">
       					<p>신규 등록 또는 정보 변경 요청을 할 경우<br>담당자의 본인 인증 절차가 진행됩니다.</p>
       					<p>휴대폰 인증 시 신용평가 기관을 통하여 실명확인을 진행하며,<br>실명확인 용도 외 별도 저장 되지 않습니다.</p>
       					<a href="#"  onclick="openKMCISWindow()" class="btn bg-blue">휴대폰 본인인증</a>
       				</div><!--// certification-->
                 </div><!--// content-->

	<script>
	// 휴대폰인증 팝업창 호출
	var KMCIS_window;
	function openKMCISWindow() {
		var userAgent = navigator.userAgent;

		var KMCIS_url = "/kmcert/kmcert_request_action.jsp";
		var KMCIS_window = window.open(KMCIS_url, "KMCISWindow", "width=425, height=550, resizable=0, scrollbars=no, status=0, titlebar=0, toolbar=0, left=435, top=250");
	}

	// 휴대푠 결과값 셋팅
	function postKMCISAuth(resultArray) {
		if (resultArray==null || resultArray[0]!="0") {
			alert("휴대폰 본인 인증에 실패하였습니다.");
			document.certForm.di.value = "";
			document.certForm.ci.value = "";
			document.certForm.name.value = "";
			document.certForm.gender.value = "";
			document.certForm.jumin.value = "";
			document.certForm.hp.value = "";
		} else {
			document.certForm.di.value = resultArray[1]; // DI
			document.certForm.ci.value = resultArray[2]; // CI
			document.certForm.name.value = resultArray[3];
			document.certForm.gender.value = resultArray[4];
			document.certForm.jumin.value = resultArray[5];
			document.certForm.hp.value =  resultArray[6];
			fn_open();
		}
	}

	function fn_open() {
		var f = document.certForm;
		f.action = document.referrer;
		f.submit();
	}
	</script>
</body>
</html>