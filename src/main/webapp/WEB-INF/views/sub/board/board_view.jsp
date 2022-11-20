<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title><c:out value="${bbsMap.bbsName}" /> 상세</title>
</head>
<body>
        	
        		<div class="sub-title sub2">
					<c:if test="${bbsMap.seq eq '1'}"><h2>안전현황</h2></c:if>
					<c:if test="${bbsMap.seq eq '2'}"><h2>기관.법령</h2></c:if>
					<c:if test="${bbsMap.seq eq '3'}"><h2>커뮤니티</h2></c:if>
					<c:if test="${bbsMap.seq eq '4'}"><h2>커뮤니티</h2></c:if>
				</div><!--// sub-title-->
				
				<c:choose>
					<c:when test="${bbsMap.seq eq '1'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_2.jsp">
							<jsp:param name="depth2" value="2" />
							<jsp:param name="depth3" value="2" />
						</jsp:include>  					
					</c:when>
					<c:when test="${bbsMap.seq eq '2'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_3.jsp">
							<jsp:param name="depth2" value="4" />
						</jsp:include> 				
					</c:when>
					<c:when test="${bbsMap.seq eq '3'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_4.jsp">
							<jsp:param name="depth2" value="1" />
						</jsp:include>   			
					</c:when>
					<c:when test="${bbsMap.seq eq '4'}">
						<jsp:include page="/WEB-INF/jsp/layout/include_location_4.jsp">
							<jsp:param name="depth2" value="2" />
						</jsp:include>  			
					</c:when>
				</c:choose>
     			
      			<div class="content-title">
      				<h3><c:out value="${bbsMap.bbsName}" /></h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->
      			
       			<div class="content">
       				 <form name="form1" id="form1" method="post">
						<input type="hidden" name="page" value="<c:out value="${paramMap.page }" />" />
						<input type="hidden" name="ordFld" value="<c:out value="${paramMap.ordFld }" />" />
						<input type="hidden" name="ordBy" value="<c:out value="${paramMap.ordBy }" />" />
						<input type="hidden" name="viewCount" value="<c:out value="${paramMap.viewCount}" />" />						
						<input type="hidden" name="fileYn" value="<c:out value="${paramMap.fileYn }" />" />	
						<input type="hidden" name="seq" value="<c:out value="${result.seq}" />" />
	                	<input type="hidden" name="fileId" value=""/>	
       				<div class="board-wrap">
						<div class="board-view">
							<div class="view-info">
								<strong class="title">
									<c:out value="${result.title}"/> 
								</strong>
							</div><!--// view-info-->

							<div class="detail">
								<div class="other-info">
									<strong class="title">등록일</strong>
									<span><c:out value="${fn:substring(result.inputDate,0,10)}"/></span>
									<strong class="title">조회수</strong>
									<span><c:out value="${result.hit }"/></span>
								</div><!--// other-info-->
								<c:if test="${not empty bdFile}">	
								<div class="attach-file">
									<ul class="file-list">
										<li>
											<c:choose>
												<c:when test="${not empty result.fileId}">	
													<c:forEach var="bdFile" items="${bdFile }" varStatus="status">																										
														<a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('',bbsMap.bbsId,bdFile.fileName,bdFile.fileOrgName) }" />"><c:out value="${bdFile.fileOrgName}" /></a>
													</c:forEach>												
												</c:when>														
												<c:otherwise>-</c:otherwise>
											</c:choose>
										</li>										
									</ul>
								</div><!--// attach-file-->
								</c:if>
							</div><!--// detail-->

							<div class="view-content"><c:out value="${result.contents}" escapeXml="false"/> </div><!--// view-content-->
						</div><!--// board-view-->
						
						<div class="board-bottom">
							<div class="btn-box"><a href="#none" onclick="fn_list();" class="btn bg-blue list">목록</a></div><!--// btn-box-->
							<ul class="prev-next-wrap">
								<li>
									<strong>이전글</strong>
									<c:choose>
										<c:when test="${not empty prevResult }"><a href="/web/sub/board/${bbsId }_view.do?seq=${prevResult.seq }"><c:out value="${prevResult.title }"/> </a></c:when>
										<c:otherwise><a href="#none">이전글이 없습니다.</a></c:otherwise>
									</c:choose>
								</li>
								<li>
									<strong>다음글</strong>
									<c:choose>
										<c:when test="${not empty nextResult }"><a href="/web/sub/board/${bbsId }_view.do?seq=${nextResult.seq }"><c:out value="${nextResult.title }"/> </a></c:when>
										<c:otherwise><a href="#none">다음글이 없습니다.</a></c:otherwise>
									</c:choose>
								</li>
							</ul><!--// prev-next-wrap-->
						</div><!--// board-bottom-->
       				</div><!--// board-wrap-->
       				</form>
                 </div><!--// content-->
<script>
/* 목록으로 돌아가기*/
function fn_list(){
	var f = document.form1;
	f.action = "<c:out value="${bbsMap.bbsId}" />_list.do";
	f.submit();
}
function test(obj){
	alert(obj);
}
</script>
</body>
</html>