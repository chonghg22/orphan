<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="mngrSessionVO" value="${mngrSessionVO}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
		<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-177792639-1"></script>
	<script>
	  window.dataLayer = window.dataLayer || [];
	  function gtag(){dataLayer.push(arguments);}
	  gtag('js', new Date());

	  gtag('config', 'UA-177792639-1');
	</script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>도서관리시스템</title>
    <link rel="stylesheet" href="/lib/css/datepicker.css">
    <link rel="stylesheet" href="/lib/css/common.css">
    <link rel="stylesheet" href="/lib/css/layout.css">
    <link rel="stylesheet" href="/lib/css/sub.css">
    <script src="/lib/js/jquery-1.11.0.min.js"></script>
    <script src="/lib/js/jquery-ui.js"></script>
    <script src="/lib/js/common.js"></script>
	<style>
	.tabs a { display:block }
	</style>
</head>
<%--<body>--%>
    <div class="wrap">
        <div class="left-area">
        	<h1><a href="/main/bookInfo/bookInfoList.do">도서관리시스템</a></h1>
        	<!--mobile gnb-->
			<nav class="mobile-gnb-wrap">
				<div class="mobile-gnb">
					<ul>
						<li>
							<a href="/mngr/bookInfo/bookInfoList">도서 목록 관리</a>
						</li>
					</ul>
				</div>
			</nav><!--// mobile gnb-->
        </div><!--// left-area-->

        <div class="right-area">
        	<div class="header-search">
        		<div class="top-title">
					<h2>안녕하세요! <span>관리자</span> 님</h2>
				</div><!--//top-title-->
        	</div>
        	<div class="content">
<%--				<decorator:body />--%>
<%--</body>--%>
</html>