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
								<a href="javascript:;" class="title drop-btn">기관·법령</a>
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
								관할지자체 담당자 정보
								<% } else if ("2".equals(depth2)) { %>
								무대시설 안전진단기관 정보
								<% } else if ("3".equals(depth2)) { %>
								관련법령 정보
								<% } else if ("4".equals(depth2)) { %>
								기준 및 지침
								<% } %>
								</a>
								<ul class="drop-list">
									<li><a href="/web/sub/contect/contect_list.do">관할지자체 담당자 정보</a></li>
									<li><a href="/web/sub/contents/30200.do">무대시설 안전진단기관 정보</a></li>
									<li><a href="/web/sub/contents/30300.do">관련법령 정보</a></li>
									<li><a href="/web/sub/board/base_list.do">기준 및 지침</a></li>
								</ul>
							</div><!--// depth2-->
						</nav><!--// nav-->
					</div>
				</div><!--// page-location-->
