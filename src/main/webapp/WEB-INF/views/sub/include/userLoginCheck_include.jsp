<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="egovframework.manpa.common.ManpaMap" %>
<%
	ManpaMap userInfo = (ManpaMap) session.getAttribute("userInfo");
	if (userInfo == null) {
%>
<script>
window.location = "/web/sub/theater/inquery_ph_check.do";
</script>
<%
		return;
	}
%>