<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <footer class="footer-wrap">
           	<div class="footer-link">
           		<ul class="inner">
           			<li><a href="/web/sub/contents/termsOfUse.do">이용약관</a></li>
           			<li><a href="/web/sub/contents/privacy.do" class="txt-color-yellow">개인정보처리방침</a></li>
           			<li><a href="javascript:;" class="pop-open-btn" onclick="fn_ruleEmail()">이메일무단수집거부</a></li>
           		</ul>
           	</div><!--//footer-link-->

            <div class="footer-info">
            	<div class="inner">
            		<span class="footer-logo">한국산업기술시험원 공연장안전지원센터</span>
            		<address>우) 15588  경기도 안산시 상록구 해안로 723(사동)  한국산업기술시험원 공연장안전지원센터<br>
						전화문의 : <span>02-860-1177</span><span>FAX  : 031-500-0368</span><span>담당부서 : 공연장안전지원센터</span>
            		</address>
            		<div class="relate-site">
            			<button type="button" class="title">관련사이트 바로가기</button>
            			<ul>
            				<li><a href="https://www.mcst.go.kr/kor/main.jsp" target="_blank">문화체육관광부</a></li>
            				<li><a href="https://www.stagesafety.or.kr/" target="_blank">공연장안전지원센터</a></li>
            				<li><a href="https://safety.kbrainc.com/" target="_blank">공연장안전지원센터 사이버아카데미</a></li>
            				<li><a href="https://www.staff.or.kr/" target="_blank">무대예술전문인 자격검정위원회</a></li>
            				<li><a href="https://www.arte.or.kr/" target="_blank">한국문화예술교육진흥원</a></li>
            				<li><a href="http://www.kcti.re.kr/" target="_blank">한국문화관광연구원</a></li>
            				<li><a href="http://www.stageart.or.kr/" target="_blank">사단법인 무대예술전문인협회</a></li>            				
            			</ul>
            		</div><!--//relate-site-->
            	</div>
            </div><!--//footer-info-->
            <button type="button" class="btn-gotop" title="상단으로 이동">TOP</button>
        </footer><!--//footer-wrap-->
        <!-- 이메일무단수집거부 팝업-->
	<div id="ruleEmail" class="popup-wrap popup-xs" tabindex="1">
		<div class="popup-inner">
			<div class="popup-top ">
				<span class="popup-tit ">이메일무단수집거부</span>
			</div><!--//popup_top-->
			<div class="popup-con">
				<p>본 웹사이트에 게시된 이메일 주소가 전자우편 수집 프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며, <br>이를 위반시 정보통신망법에 의해 형사처벌됨을 유념하시기 바랍니다.</p>
			</div><!--//popup_con-->
			<button type="button" class="close close-btn" onclick="fn_ruleEmailClose()">팝업닫기</button>
			<span class="focus-return" tabindex="0">포커스 처음으로 이동</span>
		</div><!--//popup_content-->
	</div><!--// popup-wrap-->
	<script>
	function fn_ruleEmail(){
		$('#ruleEmail').show();
	}
	
	function fn_ruleEmailClose(){
		$('#ruleEmail').hide();
	}
	</script>