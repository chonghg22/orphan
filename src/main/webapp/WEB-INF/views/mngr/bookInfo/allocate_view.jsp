<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ufn"    uri="/WEB-INF/tlds/egovfn.tld"%>
<!DOCTYPE html>
<html lang="ko">
<head>
</head>
<body>
<script src="/lib/js/validator.js"></script>
				<div class="tab_wrap">
					<ul class="tabs">
						<li onclick="fn_goMngType(3)" class="tab-link <c:if test="${mngResult.mngType eq '3'}">current</c:if>" data-tab="tab-2">조사자</li>
						<li onclick="fn_goMngType(2)" class="tab-link <c:if test="${mngResult.mngType eq '2'}">current</c:if>" data-tab="tab-2">검증자</li>
					</ul>
				</div>
      			<div class="sub-content">
					<div class="tab_wrap">
				        <form name="form1" id="form1" method="get">
						<input type="hidden" name="schFld" value="<c:out value="${paramMap.schFld }" />" />
						<input type="hidden" name="schStr" value="<c:out value="${paramMap.schStr }" />" />
						<input type="hidden" name="page" value="<c:out value="${paramMap.page }" />" />
						<input type="hidden" name="page3" value="<c:out value="${paramMap.page3 }" />" />
						<input type="hidden" name="ordFld" value="<c:out value="${paramMap.ordFld }" />" />
						<input type="hidden" name="ordBy" value="<c:out value="${paramMap.ordBy }" />" />
						<input type="hidden" name="viewCount" value="<c:out value="${paramMap.viewCount}" />" />
						<input type="hidden" name="schCode" id="schCode" value="<c:out value="${paramMap.schCode }" />"/>
						<input type="hidden" name="mngType" id="mngType" value="<c:out value="${paramMap.mngType}" />"/>
						<input type="hidden" name="mngId" id="mngId" value="<c:out value="${mngResult.mngId}" />"/>
						<input type="hidden" name="mngNo" id="mngNo" value="${mngResult.mngNo}" />
						<input type="hidden" name="bizCode" id="bizCode" value="${mngResult.bizCode}" />
						<input type="hidden" name="searcherYn" id="searcherYn" value="" />
						
						<div id="tab-1" class="tab-content current">
							<div class="table-wrap">
								<div class="table_cont">
									<table class="table detail_tb">
										<colgroup>
											<col style="width:15%"/>
											<col/>
										</colgroup>
										<tbody>
			                              <tr>
			                                 <th><span>사업명</span></th>
			                                 <td><c:out value="${mngResult.bizNm}"/></td>
			                              </tr>
			                              <tr>
			                                 <th><span>이름</span></th>
			                                 <td><c:out value="${mngResult.mngName}"/></td>
			                              </tr>
			                              <tr>
			                                 <th><span>아이디</span></th>
			                                 <td><c:out value="${mngResult.mngId}"/></td>
			                              </tr>
			                              <tr>
			                                 <th>전화번호</th>
			                                 <td><c:out value="${mngResult.mngPhone }"></c:out></td>
			                              </tr>
		                              </tbody>
		                           </table>
								</div><!-- /.col -->
							</div>
							<div id="tab-3" class="tab-content"></div>
							<div class="btn_wrap right">
								<a href="#none" onclick="fn_goList('<c:out value="${paramMap.page3 }" />');" class="btn gray_btn left">목록</a>
								<a href="#" onclick="javascript:fn_chkRollBack()" class="btn">선택항목 롤백</a>
								<a href="#" onclick="javascript:fn_rollBackAll('00');"class="btn">일괄 롤백</a>
								<a href="#none" onclick="fn_allocateOpen()" class="btn">저작물 배분</a>
							</div>
							<div class="shop-list">
							<p class="title">전체 <span>${paginationInfo.totalRecordCount}</span> 건</p>
							</div>
							<div class="table-wrap">
								<div class="table_cont" >
										<table class="table">
											<colgroup>
												<col style="width:5%">
												<col style="width:10%">
												<col style="width:30%">
												<col style="width:25%">
												<col style="width:20%">
												<col style="width:20%">
												<col style="width:20%">
												<col style="width:10%">
												<col style="width:10%">
											</colgroup>
											<thead>
												<tr>
													<th><input type="checkBox" name="chkAll" id="chkAll" value="Y" title="전체선택/해제" onclick="fn_checkAll1(this);" /></th>
													<th>번호</th>
													<th>서명</th>
													<th>저자명</th>
													<th>출판사</th>
													<th>발행년도</th>
													<th>제어번호</th>
													<th>등록일</th>
													<th>배분일</th>
												</tr>
											</thead>
											<c:set var="resultBook" value="0"/>
			                                 <tbody>
			                                    <c:forEach var="result" items="${mngBookResult}" varStatus="status">
			                                    <c:if test="${not empty result.bookName }">
			                                    <tr>
			                                       <c:set var="resultBook" value="${resultBook + result.bookSeq}"/>
			                                       <td><input type="checkbox" name="chkSeq1" id="chkSeq1" value="<c:out value="${result.bookSeq }" />" title="선택" /></td>
			                                       <td><c:out value="${result.bookSeq }" /></td>
			                                       <td><c:out value="${result.bookName }"/></td>
			                                       <td><c:out value="${result.bookAuthor}" /></td>
			                                       <td><c:out value="${result.bookPublisher }" /></td>
			                                       <td><c:out value="${result.bookPubYear}"/></td>
			                                       <td><c:out value="${result.controlNo}"/></td>
			                                       <td><c:out value="${fn:substring(result.regdt , 0 ,10)}"/></td>
			                                       <c:choose>
			                                       		<c:when test="${mngResult.mngNo eq '2'}">
					                                       <td><c:out value="${fn:substring(result.distributedt , 0 ,10)}"/></td>
			                                       		</c:when>
			                                       		<c:otherwise>
			                                       			<td><c:out value="${fn:substring(result.allocatedt , 0 ,10)}"/></td>
			                                       		</c:otherwise>
			                                       </c:choose>
			                                    </tr>
			                                    </c:if>
			                                    </c:forEach>
			                                    <c:if test="${resultBook eq '0'}">
			                                    <tr><td colspan="8">배분 목록이 없습니다.</td></tr>
			                                    </c:if>
			                                 </tbody>
			                              </table>
									</div>
								<%@ include file="/WEB-INF/jsp/egovframework/mngr/pagination/comm_pagination_include.jsp" %>
		                </div><!-- /.box-footer -->
					</form>
				</div>
				<!-- popup start -->
				<div class="layerpop list_layer allocate_layer">
					<div class="layerpop_area">
					
					<div class="title">저작물 배분</div>
						<a href="javascript:popupClose('allocate_layer');"  class="layerpop_close" title="닫기" >&#215;</a>
						<div class="search_list">
						<form name="allocForm" id="allocForm" method="post">
						<input type="hidden" name="viewCount" value="${paramMap.viewCount}" />
						<input type="hidden" name="schCode" value="${paramMap.schCode}" />
						<input type="hidden" name="ordFld" value="${paramMap.ordFld}" />
						<input type="hidden" name="ordBy" value="${paramMap.ordBy}" />
						<input type="hidden" name="page2" value="${paramMap.page2}" />
						<input type="hidden" name="mngType" value="${paramMap.mngType}" />
						<input type="hidden" name="mngNo" id="mngNo" value="${mngResult.mngNo}" />
						<input type="hidden" name="status" value="${paramMap.status}" />
						<input type="hidden" name="bizCode" id="bizCode" value="${mngResult.bizCode}" />
						<input type="hidden" name="chkId" value="" />
						<input type="hidden" name="alloc" id="alloc" value="1"/>
						<div class="search-set">
						<span class="info-tit">사업명</span>
							<span class="info-tit"><c:out value="${mngResult.bizNm}"/></span>
						</div>
						<div class="search-set">
						<span class="info-tit">검색어</span>
 							<select name="schAlc" id="schAlc">
								<option value="0" ${ufn:selected(paramMap.schAlc, '0') }>전체</option>
								<option value="1" ${ufn:selected(paramMap.schAlc, '1') }>서명</option>
								<option value="2" ${ufn:selected(paramMap.schAlc, '2') }>저자명</option>
								<option value="3" ${ufn:selected(paramMap.schAlc, '3') }>출판사</option>
								<option value="4" ${ufn:selected(paramMap.schAlc, '4') }>발행년도</option>
							</select>
							<input type="text" name="schStr" id="schStr" value="<c:out value="${paramMap.schStr }" />" class="" placeholder="검색어 입력">
							<a href="#none" onclick="fn_allocateSearch()" class="btn black_btn" style="margin-left: 50px;">검색</a>
						</div>
						<div class="date-set">
							<span class="info-tit">연번</span>
							<input type="text" id="startNum" name="startNum" value="">
							<span class="date-txt">~</span>
							<input type="text" id="endNum" name="endNum" value="">
							<a href="#none" onclick="fn_allocateInsert('10')" class="btn black_btn" style="margin-left: 211px;">등록</a>
						</div>
						</form>
					</div>
					<div style="text-align: center; margin-top:160px; font-size:20px; font-weight:600;" id="searchInfo" >
						검색버튼을 누르시면 배분 되지 않은 목록을 조회하실 수 있습니다. <br>
						[검색버튼]을 눌러주세요.
					</div>
					<div class="layer_cont" id="allocateList"></div>
				</div>
			</div>
				<!-- popup end -->
		</div>
<script type="text/javascript">
/* 목록으로 이동 */
function fn_goList(pageNo) {
	var f = document.form1;
	f.page.value = pageNo;
	f.action = "allocate_list.do";
	f.submit();
}

/* 배분 팝업 창 오픈 */
function fn_allocateOpen(){
	popupOpen('allocate_layer');
}

/* pagination 페이지 링크 function */
function fn_egov_link_page(pageNo){
	if(pageNo == 1){
		if(${paginationInfo.currentPageNo} <2){
			alert("첫 페이지 입니다.");
			return;
		}
	}
	if(pageNo == ${paginationInfo.totalPageCount}){
		if(${paginationInfo.currentPageNo} == ${paginationInfo.totalPageCount}){
			alert("마지막 페이지 입니다.");
			return;
		}
	}
	var frm = document.form1;
	frm.page.value = pageNo;
	frm.action = "allocate_view.do";
	frm.submit();
}

/* popup pagination 페이지 링크 function */
function fn_egov_link_page2(pageNo){
	var frm = document.allocForm;
	frm.page2.value = pageNo;
	$.ajax({
		url : "/_mngr_/bookInfo/allocate_list.ajax"
		, data : $("#allocForm").serialize()
		, type : "post"
		, dataType : "html"
		, success : function(data){
			$("#allocateList").html(data);
			console.log(data);
		}
		, error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

/* 배분할 목록 검색 */
function fn_allocateSearch(){
	var frm = document.allocForm;
	frm.page2.value = 1;
	console.log($("#schStr").val());
	$("#searchInfo").css("display" , "none");
	$.ajax({
		url : "/_mngr_/bookInfo/allocate_list.ajax"
		, data : $("#allocForm").serialize()
		, type : "post"
		, dataType : "html"
		, success : function(data){
			$("#allocateList").html(data);
			//console.log(data);
		}
		, error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
// 	popupOpen('allocate_layer');
}

/* 저작물 배분 */
function fn_allocateInsert(state){
	var frm = document.allocForm;
	frm.status.value = state;
	if (!isTextValidate(frm.startNum, "number", 0, "검색값"))						return false;
	if (!isTextValidate(frm.endNum, "number", 0, "검색값"))						return false;
	if($("#startNum").val() == null || $("#startNum").val() == "" || $("#endNum").val() == null || $("#endNum").val() == "" ) {
		alert("배분 하실 도서 번호를 입력 해 주세요");
	} else {
	 	$.ajax({
			url : "/_mngr_/bookInfo/allocate_input_proc.ajax"
			, data : $("#allocForm").serialize()
			, type : "post"
			, dataType : "html"
			, success : function(data){
				$("#allocateList").html(data);
			}
			, error:function(request,status,error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
}

/* 전체 체크 */
function fn_checkAll(obj) {
	for(i=1; i<11; i++){
	$("input[name=chkId"+i+"]").each(function() {
		$(this).prop("checked", obj.checked);
	});
	}
}

/* 체크된 항목 배분 */
function fn_chkUpdate(state){
	var frm = document.submitForm;
	var mngNo = $("#mngNo").val();
	var mngType = $("#mngType").val();
	var bizCode = $("#bizCode").val();
	var chkIds = "";
	$('input[type="checkbox"]:checked').each(function (index) {
			console.log("test"+this);
			console.log(this.value);
			chkIds += this.value + "|";
	});

	if(chkIds == ''){
		alert("배분할 목록을 선택 해 주세요");
		return false;
	}
	$.ajax({
		url : "/_mngr_/bookInfo/allocateChkUpdate_proc.ajax"
		, data : {"mngNo":mngNo, "chkIds":chkIds, "status":state, "mngType":mngType, "bizCode":bizCode}
		, type : "post"
		, dataType : "html"
		, success : function(data){
			$("#allocateList").html(data);
			//console.log(data);
		}
		, error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
}

//<[[!CDATA[
function fn_goInitPass(){
	if(confirm("비밀번호를 초기화 하시겠습니까? \n비밀번호는 아이디와 동일하게 초기화되며, 비밀번호 오류 횟수도 초기화 됩니다.\n잠긴계정은 잠금이 해제됩니다.")){
		var frm = document.form1;
		frm.encoding = "application/x-www-form-urlencoded";
		frm.action = "manager_edit_pass.do";
		frm.submit();
	}
}

/* 수정화면으로 이동 */
function fn_goEdit() {
	var f = document.form1;
	f.action = "book_allocate_list.do";
	f.submit();
}

/* 선택한 항목으로 이동 */
function fn_goMngType(type) {
	var f = document.form1;
	f.mngType.value = type;
	f.page.value = 1;
	f.action = "allocate_list.do";
	f.submit();
}

/* 글 삭제 */
function fn_goDel(){
	if(confirm("삭제하시겠습니까?")){
		var frm = document.form1;
		frm.encoding = "application/x-www-form-urlencoded";
		frm.action = "workers_delete_proc.do";
		frm.submit();
	}
}

/*체크항목 일괄 롤백처리 function */
function fn_chkRollBack(status){
	if($("input[name=chkSeq1]:checked").size() == 0){
		alert("롤백 처리 할 서명을 선택 해 주세요.");
		return false;
	}else{
		if(confirm("선택한 서명을 롤백 처리하시겠습니까?")){
			var frm = document.form1;
			frm.action = "rollback_chkProc.do";
		   	frm.submit();
		}
	}
}

/*일괄 승인처리 function */
function fn_rollBackAll(status) {
	var count = " ${paginationInfo.totalRecordCount}";
	if(confirm("전체 건 : " + count +" 건이 일괄 롤백 처리 됩니다. 롤백 처리 하시겠습니까?")) {
	 	var frm = document.form1;
	 	frm.action = "rollback_all.do"
	 	frm.submit();
	}
}

/*체크박스 전체 선택 function*/
function fn_checkAll1(obj) {
	$("input[name=chkSeq1]").each(function() {
		$(this).prop("checked", obj.checked);
	});
}


</script>
</body>
</html>