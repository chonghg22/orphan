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
								<a href="javascript:;" class="title drop-btn">안내</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contents/10100.do">안내</a></li>
									<li><a href="/web/sub/theater/theater_list.do">안전현황</a></li>
									<li><a href="/web/sub/contect/contect_list.do">기관·법령</a></li>
									<li><a href="/web/sub/board/notice_list.do">커뮤니티</a></li>
								</ul>
							</div><!--// depth1-->
							<div class="depth2 drop">
								<a href="javascript:;" class="title drop-btn">
								<% if ("1".equals(depth2)) { %>
								공연장안전정보시스템 소개
								<% } else if ("2".equals(depth2)) { %>
								공연장 안전정보
								<% } else if ("3".equals(depth2)) { %>
								공연장 외 공연 안전정보
								<% } %>
								</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contents/10100.do">공연장안전정보시스템 소개</a></li>
									<li><a href="/web/sub/contents/10201.do">공연장 안전정보</a></li>
									<li><a href="/web/sub/performance/performance_list.do">공연장 외 공연 안전정보</a></li>
								</ul>
							</div><!--// depth2-->
							<% if ("2".equals(depth2)) { %>
							<div class="depth3 drop">
								<% if ("1".equals(depth3)) { %>
								<a href="javascript:;" class="title drop-btn">공연장 등록 절차</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contents/10201.do">공연장 등록 절차</a></li>
									<li><a href="/web/sub/contents/10202.do">공연장 안전진단 절차</a></li>
									<li><a href="/web/sub/contents/10203.do">공연장 안전관리의무</a></li>
								</ul>
								<% } %>
								<% else if ("2".equals(depth3)) { %>
								<a href="javascript:;" class="title drop-btn">공연장 안전진단 절차</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contents/10201.do">공연장 등록 절차</a></li>
									<li><a href="/web/sub/contents/10202.do">공연장 안전진단 절차</a></li>
									<li><a href="/web/sub/contents/10203.do">공연장 안전관리의무</a></li>
								</ul>
								<% } %>
								<% else if ("3".equals(depth3)) { %>
								<a href="javascript:;" class="title drop-btn">공연장 안전관리의무</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contents/10201.do">공연장 등록 절차</a></li>
									<li><a href="/web/sub/contents/10202.do">공연장 안전진단 절차</a></li>
									<li><a href="/web/sub/contents/10203.do">공연장 안전관리의무</a></li>
								</ul>
								<% } %>
							</div><!--// depth3-->
							<% } %>
							<% if ("3".equals(depth2)) { %>
							<div class="depth3 drop">
								<% if ("1".equals(depth3)) { %>
								<a href="javascript:;" class="title drop-btn">공연장 외 공연 정보</a>
								<ul class="drop-list">
									<li><a href="/web/sub/performance/performance_list.do">공연장 외 공연 정보</a></li>
									<li><a href="/web/sub/contents/10302.do">공연장 외 공연 안전관리의무</a></li>									
								</ul>
								<% } %>
								<%else if ("2".equals(depth3)) { %>
								<a href="javascript:;" class="title drop-btn">공연장 외 공연 안전관리의무</a>
								<ul class="drop-list">
									<li><a href="/web/sub/performance/performance_list.do">공연장 외 공연 정보</a></li>
									<li><a href="/web/sub/contents/10302.do">공연장 외 공연 안전관리의무</a></li>									
								</ul>
								<% } %>								
							</div><!--// depth3-->
							<% } %>
						</nav><!--// nav-->
					</div>
				</div><!--// page-location-->
