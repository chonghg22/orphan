<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<jsp:include page="/WEB-INF/views/layout/admin_all.jsp"/>
        		<h3 class="result-title">저작물 목록 관리</h3>
      			<div class="sub-content">
					<div class="tab_wrap">
				        <form name="listForm" id="listForm" method="get">
						<input type="hidden" name="nowPage" id="nowPage" value="${resultMap.nowPage}"/>
						<input type="hidden" name="bookSeq"  value="${resultMap.bookSeq}"/>
						<input type="hidden" name="schFld" id="schFld" value="${resultMap.schFld}"/>
						<input type="hidden" name="schStr" id="schStr" value="${resultMap.schStr}"/>
						<input type="hidden" name="limit" id="limit" value="${resultMap.limit}"/>
						</form>
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="bookSeq" id="bookSeq" value="${bookInfoView.bookSeq}"/>
						<div id="tab-1" class="tab-content current">
							<div class="table-wrap">
								<div class="table_cont">
									<table class="table detail_tb">
										<colgroup>
											<col style="width:15%"/>
										</colgroup>
										<tbody>
										<tr>
											<th><span>연번</span></th>
											<td><c:out value="${bookInfoView.bookSeq}" /></td>
										</tr>
										<tr>
											<th><span>도서명</span></th>
											<td>
												<input type="text" name="bookTitle" id="bookTitle" value="${bookInfoView.bookTitle}"/>
											</td>
										</tr>
				 						<tr>
											<th><span>저자명</span></th>
											<td>
												<input type="text" name="bookAuthor" id="bookAuthor" value="${bookInfoView.bookAuthor}"/>
											</td>
										</tr>
										<tr>
											<th>출판사</th>
											<td>
												<input type="text" name="bookPublisher" id="bookPublisher" value="${bookInfoView.bookPublisher}"/>
											</td>
										</tr>
										<tr>
											<th>발행년도</th>
											<td>
												<input type="text" name="publicationYear" id="publicationYear" value="${bookInfoView.publicationYear}"/>
											</td>
										</tr>
										<tr>
											<th><span>제어번호</span></th>
											<td>
												<input type="text" name="controlNo" id="controlNo" value="${bookInfoView.controlNo}"/>
											</td>
										</tr>
										<tr>
											<th><span>등록일</span></th>
											<td><c:out value="${fn:substring(bookInfoView.createdDate,0,10)}" /></td>
										</tr>
										</tbody>
									</table>
								</div><!-- /.col -->
							</div>
							<div id="tab-3" class="tab-content"></div>
							<div class="btn_wrap right">
								<a href="#none" onclick="fn_goList();" class="btn gray_btn left">목록</a>
								<a href="#none" onclick="fn_goDel('${bookInfoView.bookSeq}');" class="btn black_btn">삭제</a>
								<a href="#none" onclick="fn_goEdit();" class="btn">수정</a>
							</div><!-- btn_wrap -->
		                </div><!-- tab-content -->
						</form>
					</div><!-- tab_wrap -->
				</div><!-- sub-content -->
<jsp:include page="/WEB-INF/views/layout/admin_close.jsp"/>
<script type="text/javascript">
function fn_goList() {
	var f = document.listForm;
	f.action = "/mngr/bookInfo/bookInfoList";
	f.submit();
}

function fn_goEdit() {
	let formData = $("#form1").serialize();
	if(confirm("수정하시겠습니까?")){
		$.ajax({
			url  : "/mngr/bookInfo/updateBookInfo",
			data : formData,
			type : "POST",
			dataType : "JSON",
			success : function(res){
				if(res>0){
					alert("수정되었습니다.");
					location.href='/mngr/bookInfo/bookInfoList';
				}
			},
			error : function(e){
				console.log(e.responseText);
				alert("There are some problems in System. <br />Please Try again.");
			}
		})
	}
}

function fn_goDel(seq){
	if(confirm("삭제하시겠습니까?")){
		$.ajax({
			url  : "/mngr/bookInfo/deleteBookInfo",
			data : {"seq" : seq},
			type : "POST",
			dataType : "JSON",
			success : function(res){
				if(res>0){
					alert("삭제되었습니다.");
					location.href='/mngr/bookInfo/bookInfoList';
				}
			},
			error : function(e){
				console.log(e.responseText);
				alert("There are some problems in System. <br />Please Try again.");
			}
		})
	}
}

//]]>
</script>
</body>
</html>