<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		<div class="popup-inner">
			<div class="popup-top">
				<span class="popup-tit"><c:out value="${result.performName}" /></span>
			</div><!--//popup_top-->
			<div class="popup-con">
				<table class="list">
					<caption>공연장 외 공연 정보에 대한 표로써 관할지자체, 관할지자체, 기간, 장소, 전화번호, 주소 항목으로 구성됩니다.</caption>
					<tbody>
						<tr>
							<th scope="row">관할지자체</th>
							<td>
								<c:out value="${result.sido} " />
								<c:out value="${result.sigungu} " />
								<c:out value="${result.gu}" />
							</td>
						</tr>
						<tr>
							<th scope="row">예상최대관객수</th>
							<td><c:out value="${result.spectator}" /></td>
						</tr>
						<tr>
							<th scope="row">기간</th>
							<td>
								<c:out value="${result.startDate}" />
								~
								<c:out value="${result.endDate}" />
							</td>
						</tr>
						<tr>
							<th scope="row">장소</th>
							<td><c:out value="${result.place}" /></td>
						</tr>
						<tr>
							<th scope="row">전화번호</th>
							<td><c:out value="${result.tel1}-" /><c:out value="${result.tel2}-" /><c:out value="${result.tel3}" /></td>
						</tr>
						<tr>
							<th scope="row">주소</th>
							<td><c:out value="[${result.zipcode}] " /><c:out value="${result.address} " /><c:out value="${result.addressDetail}" /></td>
						</tr>
					</tbody>
				</table>
				<div class="btn-box txt-right">
					<a href="javascript:void(0);" onclick="fn_performanceClose()" class="btn bg-blue close">닫기</a>
				</div>
			</div><!--//popup_con-->
			<button type="button" onclick="fn_performanceClose()" class="close close-btn">팝업닫기</button>
			<span class="focus-return" tabindex="0">포커스 처음으로 이동</span>
		</div><!--//popup_content-->
		<script>
		/*개인정보처리방침 Close Function*/
		function fn_performanceClose(){
			$('#viewDetailPerformance').hide();
		}
		</script>
