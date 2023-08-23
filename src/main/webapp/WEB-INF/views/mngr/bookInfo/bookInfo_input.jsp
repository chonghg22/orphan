`<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>저작물 목록 관리</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/lib/js/validator.js"></script>
</head>
<body>
        		<h3 class="result-title">저작물 목록 관리</h3>
          			<div class="sub-content">
					<div class="tab_wrap">
						<form name="listForm" id="listForm" method="get">
						<input type="hidden" name="schFld" value="<c:out value="${paramMap.schFld }" />" />
						<input type="hidden" name="page" value="<c:out value="${paramMap.page }" />" />
						<input type="hidden" name="ordFld" value="<c:out value="${paramMap.ordFld }" />" />
						<input type="hidden" name="ordBy" value="<c:out value="${paramMap.ordBy }" />" />
						<input type="hidden" name="viewCount" value="<c:out value="${paramMap.viewCount}" />" />
						<input type="hidden" name="schCode" id="schCode" value="${paramMap.schCode}"/>
						<input type="hidden" name="schStr" id="schStr" value="${paramMap.schStr}"/>
						<input type="hidden" name="type" id="type" value="${paramMap.type}"/>
						<input type="hidden" name="seq" id="seq" value="${paramMap.bookSeq}"/>
						<input type="hidden" name="asisBizCode" id="asisBizCode" value="${paramMap.bizCode}"/>
						</form>
						<form name="form1" id="form1" method="post">
						<input type="hidden" name="schBiz" id="schBiz" value="${paramMap.schBiz}"/>
						<input type="hidden" name="schCode" id="schCode" value="${paramMap.schCode}"/>
						<input type="hidden" name="schFld" value="<c:out value="${paramMap.schFld }" />" />
						<input type="hidden" name="schStr" id="schStr" value="${paramMap.schStr}"/>
						<input type="hidden" name="asisBizCode" id="asisBizCode" value="${paramMap.bizCode}"/>
						<input type="hidden" name="bookSeq" id="bookSeq" value="${paramMap.bookSeq}"/>
						<div id="tab-1" class="tab-content current">
							<div class="table-wrap">
								<div class="table_cont">
									<table class="table detail_tb">
										<colgroup>
											<col style="width:15%"/>
										</colgroup>
										<tbody>
										<c:choose>
											<c:when test="${paramMap.type eq 'Input'}">
												<tr>
													<th>사업명*</th>
													<td>
														<c:if test="${mngType eq '1'}">
														<select name="bizCode" id="bizCode" style="width:auto;">
															<c:forEach var="biz" items="${manpaMap}" varStatus="status">
															<option value="${biz.bizCode}">${biz.bizNm}</option>
															</c:forEach>
														</select>
														</c:if>
														<c:if test="${mngType ne '1'}">
														<input type="text" name="bizCode" value="${bizCode}" id="bizCode"  value="" title="저작물명" disabled="disabled"/>
														</c:if>
													</td>
												</tr>
												<tr>
													<th>저작물명*</th>
													<td>
														<input type="text" name="bookName" id="bookName"  value="" title="저작물명" />
													</td>
												</tr>
												<tr>
													<th>저작자명*</th>
													<td><input type="text" name="bookAuthor" id="bookAuthor"  value="" title="저작자명" /></td>
												</tr>
						 						<tr>
													<th><span>출판사명*</span></th>
													<td><input type="text" name="bookPublisher" id="bookPublisher" value="" title="출판사명" /></td>
												</tr>
												<tr>
													<th><span>발행년도*</span></th>
													<td><input type="text" name="bookPubYear" id="bookPubYear"  value="" title="발행년도" /></td>
												</tr>
												<tr>
													<th>제어번호*</th>
													<td><input type="text" name="controlNo" id="controlNo"  value="" title="제어번호" /></td>
												</tr>
											</c:when>
										<c:otherwise>
											<tr>
												<th>사업명*</th>
												<td>
												<c:if test="${mngType eq '1'}">
												<select name="bizCode" id="bizCode" style="width:auto;">
													<c:forEach var="biz" items="${manpaMap}" varStatus="status">
													<option value="${biz.bizCode}" <c:if test="${biz.bizCode eq result.bizCode }">selected</c:if>>${biz.bizNm}</option>
													</c:forEach>
												</select>
												</c:if>
												<c:if test="${mngType ne '1'}">
												<input type="hidden" name="bizCode" value="${result.bizCode}" id="bizCode" title="저작물명"/>
												<input type="text" value="${result.bizNm}" title="저작물명" disabled="disabled"/>
												</c:if>
												</td>
											</tr>
											<tr>
												<th>저작물명*</th>
												<td>
													<input type="text" name="bookName" id="bookName"  value="${result.bookName }" title="저작물명" />
												</td>
											</tr>
											<tr>
												<th>저작자명*</th>
												<td><input type="text" name="bookAuthor" id="bookAuthor"  value="${result.bookAuthor }" title="저작자명" /></td>
											</tr>
					 						<tr>
												<th><span>출판사명*</span></th>
												<td><input type="text" name="bookPublisher" id="bookPublisher" value="${result.bookPublisher }" title="출판사명" /></td>
											</tr>
											<tr>
												<th><span>발행년도*</span></th>
												<td>
													<input type="text" name="bookPubYear" id="bookPubYear"  value="${result.bookPubYear }" title="발행년도" />
												</td>
											</tr>
											<tr>
												<th>제어번호</th>
												<td><c:out value="${result.controlNo }"/></td>
											</tr>
											<tr>
												<th>등록일</th>
												<td><c:out value="${fn:substring(result.regdt,0 ,10 )}"/></td>
											</tr>
										</c:otherwise>
									</c:choose>
										</tbody>
									</table>
								</div><!-- /.col -->
							</div>
							<div id="tab-3" class="tab-content"></div>
							<div class="btn_wrap right">
								<a href="#none" onclick="fn_goList();" class="btn gray_btn left">목록</a>
								<a href="#none" onclick="fn_egov_save();" class="btn">등록</a>
							</div>
			                </div><!-- /.box-footer -->
        				</form>
					</div>
				</div>
				<c:if test="${paramMap.type eq 'Input'}">
				<div id ="Progress_Loading" style="margin-left:46%;"><!-- 로딩바 -->
					<img src="/lib/img/loadingBar.gif" style="width:50px;"/>
				</div>
				<h3 class="result-title">EXCEL 업로드</h3>
				<div class="table-wrap">
					<div class="table_top_btn">
						<a href="/manpa/sample.xls" class="btn excel_btn" download>업로드양식 다운로드</a>
					</div>
				<div class="sub-content">
					<div class="tab_wrap">
						<form name="excelUpForm" id="excelForm" method="post" ecntype="multipart/form-data">
						<div id="tab-1" class="tab-content current">
							<div class="table-wrap">
								<div class="table_cont">
									<table class="table detail_tb">
										<colgroup>
											<col style="width:15%"/>
										</colgroup>
										<tbody>
											<tr>
												<th>Excel*</th>
												<td><input type="file" name="excel" id="excel"  value="" title="excel" multiple data-show-upload="false"data-show-caption="true"/></td>
											</tr>
										</tbody>
									</table>
								</div><!-- /.col -->
							</div>
							<div id="tab-3" class="tab-content"></div>
							<div class="btn_wrap right">
								<a href="#none" onclick="fn_goList();" class="btn gray_btn left">목록</a>
								<a href="#none" onclick="fn_inputExcel();" class="btn">Excel업로드</a>
								<a href="#none" onclick="fn_inputHDExcel();" class="btn">HDExcel업로드</a>
								
							</div>
			                </div><!-- /.box-footer -->
        				</form>
					</div>
				</div>
			</div>
			</c:if>
 				<!-- popup -->

<script type="text/javascript">

function fn_inputHDExcel(){
	var file = $("#excel").val();
	var fileFormat = file.split(".");
	if(file == "" || file == null){
		alert("파일을 선택해주세요.");
		return false;
	}else if(!checkFileType(file)){
		alert("엑셀 파일만 업로드 가능합니다.");
		return false;
	}
	
	var form = document.excelUpForm;
	var formData = new FormData(form);
	
	if(confirm("업로드 하시겠습니까?")) {
		$.ajax({
			type:"POST"
			,url:"/_mngr_/bookInfo/hdExcelUpload.ajax"
			,enctype: 'multipart/form-data'
			,processData: false
			,contentType: false
			,cache:false
			,data: formData
			,success:function(res){
     			alert('엑셀 파일 업로드에 성공하였습니다.');
                location.href ='/_mngr_/bookInfo/bookInfo_list.do';
               },
               error:function(){
                  alert('엑셀 파일 업로드에 실패하였습니다. 관리자에게 문의해주세요');
               }
          });
	}
}


$(document).ready(function(){
   $('#Progress_Loading').hide(); 
})

.ajaxStart(function(){
	$('#Progress_Loading').show();
})
.ajaxStop(function(){
	$('#Progress_Loading').hide();
});

function fn_inputExcel(){
	var file = $("#excel").val();
	var fileFormat = file.split(".");
	if(file == "" || file == null){
		alert("파일을 선택해주세요.");
		return false;
	}else if(!checkFileType(file)){
		alert("엑셀 파일만 업로드 가능합니다.");
		return false;
	}
	
	if(fileFormat.indexOf("xlsx") > -1) {
		alert("xls 확장자만 업로드 가능합니다.");
		return false;
	}
	var form = document.excelUpForm;
	var formData = new FormData(form);
	
	if(confirm("업로드 하시겠습니까?")) {
		$.ajax({
			type:"POST"
			,url:"/_mngr_/bookInfo/excelUpload.ajax"
			,enctype: 'multipart/form-data'
			,processData: false
			,contentType: false
			,cache:false
			,data: formData
			,success:function(res){
     			alert('엑셀 파일 업로드에 성공하였습니다.');
                location.href ='/_mngr_/bookInfo/bookInfo_list.do';
               },
               error:function(){
                  alert('엑셀 파일 업로드에 실패하였습니다. 관리자에게 문의해주세요');
               }
          });
	}
}

function checkFileType(filePath){
	var fileFormat = filePath.split(".");
	if(fileFormat.indexOf("xls") > -1){
		return true;
	}else if(fileFormat.indexOf("xlsx") > -1){
		return true;
	}else{
		return false;
	}
}



function fn_goList() {
	var f = document.listForm;
	f.action = "bookInfo_list.do";
	f.submit();
}


/* 글 등록 function */
function fn_egov_save() {
	var frm = document.form1;
	<c:if test="${paramMap.type eq 'Input'}">
	if (!isTextValidate(frm.bookName, "string", 0, "저작물명"))	return false;
	if (!isTextValidate(frm.bookAuthor, "string", 0, "저작자명"))	return false;
	if (!isTextValidate(frm.bookPublisher, "string", 0, "출판사명"))	return false;
	if (!isTextValidate(frm.bookPubYear, "number", 0, "발행년도"))	return false;
	if (!isTextValidate(frm.controlNo, "string", 0, "제어번호"))	return false;
	</c:if>
	<c:if test="${paramMap.type eq 'edit'}">
	if (!isTextValidate(frm.bookName, "string", 0, "저작물명"))	return false;
	if (!isTextValidate(frm.bookAuthor, "string", 0, "저작자명"))	return false;
	if (!isTextValidate(frm.bookPublisher, "string", 0, "출판사명"))	return false;
// 	if (!isTextValidate(frm.bookPubYear, "number", 0, "발행년도"))	return false;
	</c:if>
	frm.action = "<c:url value="${paramMap.type == 'Input' ? 'bookInfo_input_proc.do' : 'bookInfo_edit_proc.do'}"/>";
	frm.submit();
}

/* 목록으로 돌아가기*/
function fn_list(){
	var f = document.listForm;
	f.action = "<c:out value="${bbsMap.bbsId}" />_list.do";
	f.submit();
}

/* 취소 function */
function fn_back() {
	if (confirm("취소 하시겠습니까?")) {
		var frm = document.listForm;
		frm.action = "<c:out value="${bbsMap.bbsId}" />_list.do";
		frm.submit();
	}
}
</script>
 </body>
</html>