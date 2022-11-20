<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="egovframework.manpa.util.CommUtil" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
	//request.setCharacterEncoding("EUC-KR");  //해당시스템의 인코딩타입이 EUC-KR일경우에
	String inputYn = CommUtil.stripXss(request.getParameter("inputYn"));
	String roadFullAddr = CommUtil.stripXss(request.getParameter("roadFullAddr"));
	String roadAddrPart1 = CommUtil.stripXss(request.getParameter("roadAddrPart1"));
	String roadAddrPart2 = CommUtil.stripXss(request.getParameter("roadAddrPart2"));
	String engAddr = CommUtil.stripXss(request.getParameter("engAddr"));
	String jibunAddr = CommUtil.stripXss(request.getParameter("jibunAddr"));
	String zipNo = CommUtil.stripXss(request.getParameter("zipNo"));
	String addrDetail = CommUtil.stripXss(request.getParameter("addrDetail"));
	String admCd    = CommUtil.stripXss(request.getParameter("admCd"));
	String rnMgtSn = CommUtil.stripXss(request.getParameter("rnMgtSn"));
	String bdMgtSn  = CommUtil.stripXss(request.getParameter("bdMgtSn"));
%>
</head>
<script language="javascript">
function init(){
	var url = location.href;

	/* 임시 개발용 인증키 191210*/
	<% String svName = request.getServerName();
	String confmKey = "";
	if(svName == "localhost"){
		confmKey = "U01TX0FVVEgyMDE5MTIxMDE4MDY0NTEwOTMwMTc=";
	}else if(svName == "127.0.0.1"){
		confmKey = "U01TX0FVVEgyMDE5MTIxMDE4MDY0NTEwOTMwMTY=";
	}else if(svName == "172.17.100.233"){
		confmKey = "U01TX0FVVEgyMDE5MTIxMDE4MDY0NTEwOTMwMTg=";
	}else{ //공연장
		confmKey = "U01TX0FVVEgyMDIwMDgwNzE2NTg1OTExMDAzNjQ=";
	}
	%>

	var confmKey = "<%=confmKey%>";
	var inputYn= "<%=inputYn%>";
	if(inputYn != "Y"){
		document.form.confmKey.value = confmKey;
		document.form.returnUrl.value = url;
		document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do"; //인터넷망
		document.form.submit();
	}else{
		<%-- opener.jusoCallBack("<%=roadFullAddr%>","<%=roadAddrPart1%>","<%=addrDetail%>","<%=roadAddrPart2%>","<%=engAddr%>","<%=jibunAddr%>","<%=zipNo%>", "<%=admCd%>", "<%=rnMgtSn%>", "<%=bdMgtSn%>"); --%>
		opener.jusoCallBack("<%=roadAddrPart1%>","<%=addrDetail%>", "<%=zipNo%>");
		window.self.close();
	}
}
</script>
<body onload="init();">
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/> <!-- resultType항목 추가(2016.10.06) -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 START-->
		<!--
		<input type="hidden" id="encodingType" name="encodingType" value="EUC-KR"/>
		 -->
		<!-- 해당시스템의 인코딩타입이 EUC-KR일경우에만 추가 END-->
	</form>
</body>
</html>