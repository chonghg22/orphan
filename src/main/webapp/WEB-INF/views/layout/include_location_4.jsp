<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String depth2 = request.getParameter("depth2");
	String depth3 = request.getParameter("depth3");
%>
			<div class="page-location">
					<div class="inner">
						<nav>
							<a href="/web/main/index.do" class="home"><span class="hidden">Home</span></a>
							<div class="depth1 drop">
								<a href="javascript:;" class="title drop-btn">커뮤니티</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contents/10100.do">안내</a></li>
									<li><a href="/web/theater/theater_list.do">안전현황</a></li>
									<li><a href="/web/sub/contect/contect_list.do">기관·법령</a></li>
									<li><a href="/web/sub/board/notice_list.do">커뮤니티</a></li>
								</ul>
							</div><!--// depth1-->							
							<div class="depth2 drop">
								<a href="javascript:;" class="title drop-btn">
								<% if ("1".equals(depth2)) { %>
								공지사항
								<% } else if ("2".equals(depth2)) { %>
								FAQ
								<% } else if ("3".equals(depth2)) { %>
								나의 요청/문의 내역								
								<% } %>
								</a>
								<ul class="drop-list">
									<li><a href="/web/sub/board/notice_list.do">공지사항</a></li>
									<li><a href="/web/sub/board/faq_list.do">FAQ</a></li>
									<li><a href=/web/sub/inquery/inquery_list.do>나의 요청/문의 내역</a></li>
								</ul>
							</div><!--// depth2-->
						</nav><!--// nav-->
					</div>
				</div><!--// page-location-->
