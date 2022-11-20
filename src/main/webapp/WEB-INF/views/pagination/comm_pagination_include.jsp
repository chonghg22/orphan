<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					<c:if test="${ not empty paginationInfo.totalRecordCount and paginationInfo.totalRecordCount ne 0 }">
					<script>
					function fn_page_prev(page) {
						if (page > 1) fn_egov_link_page(page - 1);
						else {
							return;
						}
					}
					function fn_page_next(page) {
						if (page < ${ paginationInfo.totalPageCount}){
							fn_egov_link_page(page + 1);
						}else {
							return;
						}
					}
					function fn_page_move() {
						var page = $(".paginate_input").val();
						if (isNaN(page)) {
							$(".paginate_input").val('');
							alert("숫자만 입력하세요.");
							$(".paginate_input").focus();
							return;
						}
						if (page == "" || page < 1) {
							$(".paginate_input").val('1');
							alert("1페이지 부터 입력할 수 있습니다.");
							$(".paginate_input").focus();
							return;
						}
						if (page > ${ paginationInfo.totalPageCount}) {
							$(".paginate_input").val('${ paginationInfo.totalPageCount}');
							alert("총 페이지수 초과할 수 없습니다.");
							$(".paginate_input").focus();
							return;
						}
						fn_egov_link_page(page);
					}
					</script>
      				<div class="paging">
								<a href="#none" onclick="fn_egov_link_page(1);" class="first"><span class="hidden">처음</span></a>
								<c:choose>
									<c:when test="${paginationInfo.currentPageNo lt '11'  }">
										<a href="#none" onclick="fn_egov_link_page(1);" class="prev"><span class="hidden">처음</span></a>
									</c:when>
									<c:otherwise>
										<a href="#none" onclick="fn_page_prev(${ paginationInfo.firstPageNoOnPageList});" class="prev"><span class="hidden">이전</span></a>
									</c:otherwise>
								</c:choose>
								<c:forEach var="p" begin="${paginationInfo.firstPageNoOnPageList}" step="1" end="${paginationInfo.lastPageNoOnPageList}">
								<c:choose>
								  	<c:when test="${paginationInfo.currentPageNo eq p }"><a href="#none" class="on" onClick="fn_egov_link_page('${p }')">${p }</a></c:when>
								   	<c:otherwise><a href="#none" onClick="fn_egov_link_page('${p}')">${p}</a></c:otherwise>
								</c:choose>
								</c:forEach>
								<a href="#" onclick="fn_page_next(${ paginationInfo.lastPageNoOnPageList});" class="next"><span class="hidden">다음</span></a>
								<a href="#" onclick="fn_egov_link_page(${paginationInfo.totalPageCount});" class="last"><span class="hidden">마지막</span></a>
							</div><!--// paging-->
					</c:if>
