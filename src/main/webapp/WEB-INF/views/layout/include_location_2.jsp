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
								<a href="javascript:;" class="title drop-btn">안전현황</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contents/10100.do">안내</a></li>
									<li><a href="/web/sub/ctheater/theater_list.do">안전현황</a></li>
									<li><a href="/web/sub/contect/contect_list.do">기관·법령</a></li>
									<li><a href="/web/sub/board/notice_list.do">커뮤니티</a></li>
								</ul>
							</div><!--// depth1-->							
							<div class="depth2 drop">
								<a href="javascript:;" class="title drop-btn">
								<% if ("1".equals(depth2)) { %>
								공연장 정보 및 안전현황
								<% } else if ("2".equals(depth2)) { %>
								안전진단기관 결과 평가
								<% } else if ("3".equals(depth2)) { %>
								공연장 통계
								<% } %>
								</a>
								<ul class="drop-list">
									<li><a href="/web/sub/theater/theater_list.do">공연장 정보 및 안전현황</a></li>
									<li><a href="/web/sub/board/safety_list.do">안전진단기관 결과 평가</a></li>
									<li><a href="/web/sub/statics/statics1_list.do">공연장 통계</a></li>
								</ul>
							</div><!--// depth2-->
							<% if ("3".equals(depth2)) { %>
							<div class="depth3 drop">
								<% if ("1".equals(depth3)) { %>
								<a href="javascript:;" class="title drop-btn">전국 공연장 등록 현황</a>
								<ul class="drop-list">
									<li><a href="/web/sub/statics/statics1_list.do">전국 공연장 등록 현황</a></li>
									<li><a href="/web/sub/statics/statics2_list.do">지역별 공연장 등록 현황</a></li>
								</ul>
								<% } %>
								<% else if ("2".equals(depth3)) { %>
								<a href="javascript:;" class="title drop-btn">지역별 공연장 등록 현황</a>
								<ul class="drop-list">
									<li><a href="/web/sub/statics/statics1_list.do">전국 공연장 등록 현황</a></li>
									<li><a href="/web/sub/statics/statics2_list.do">지역별 공연장 등록 현황</a></li>
								</ul>
								<% } %>								
							</div><!--// depth3-->
							<% } %>							
						</nav><!--// nav-->
					</div>
				</div><!--// page-location-->
