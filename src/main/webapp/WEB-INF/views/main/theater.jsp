<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       							<h3>${paramMap.name}&nbsp;${paramMap.sigungu} 현황</h3>
       							<ul class="status-detail">
       								<li>
       									<span class="category bg-sky">전체</span>
       									<p><strong><c:out value="${pCount + cCount}" /></strong> 개소</p>
       								</li>
       								<li>
       									<span class="category bg-yellow">공공</span>
       									<p><strong><c:out value="${pCount}" /></strong> 개소</p>
       								</li>
       								<li>
       									<span class="category bg-green">민간</span>
       									<p><strong><c:out value="${cCount}" /></strong> 개소</p>
       								</li>
       							</ul><!--//status-detail-->
       							<div class="status-list scroll-skin">
       								<ul>
									<c:forEach var="list" items="${theaterList}" varStatus="status">
										<c:choose>
											<c:when test="${list.operationBody eq 'P'}">
												<c:set var="classNm" value="bg-yellow" />
												<c:set var="typeNm" value="공공" />
											</c:when>
											<c:otherwise>
												<c:set var="classNm" value="bg-green" />
												<c:set var="typeNm" value="민간" />
											</c:otherwise>
										</c:choose>
       									<li class="${classNm}">
       										<a href="/web/sub/theater/result_view_safety.do?seq=${list.theaterSeq}">
												<span class="category ${classNm}">${typeNm}</span>
												<strong>${list.theaterNm}</strong>
       										</a>
       									</li>
       								</c:forEach>
       								</ul>
       							</div><!--//status-list-->