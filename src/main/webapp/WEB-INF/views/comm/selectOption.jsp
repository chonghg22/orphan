<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="list" items="${listMap}" varStatus="status">
	<c:if test="${paramMap.type eq 'sido'}">
<option value="${list.sigungu}">${list.sigungu}</option>
	</c:if>
	<c:if test="${paramMap.type eq 'sigungu'}">
		<c:if test="${!empty list.gu}">
<option value="${list.gu}">${list.gu}</option>
		</c:if>
	</c:if>
</c:forEach>