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
          		
				<div id ="Progress_Loading" style="margin-left:46%;"><!-- 로딩바 -->
					<img src="/lib/img/loadingBar.gif" style="width:50px;"/>
				</div>
				<h3 class="result-title">EXCEL 업로드</h3>
				<div class="table-wrap">
					
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
								<a href="#none" onclick="fn_inputExcel();" class="btn">Excel업로드</a>
							</div>
			                </div><!-- /.box-footer -->
        				</form>
					</div>
				</div>
			</div>

<script type="text/javascript">
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

</script>
 </body>
</html>