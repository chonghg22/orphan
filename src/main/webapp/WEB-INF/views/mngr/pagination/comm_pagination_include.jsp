<%@ page language="java" contentType="text/html; charset=utf-8"
		 pageEncoding="utf-8"%>

<!-- paging -->
<div class="paging">
	<div class="page-num" id="page-num">
	</div>
</div>>

<script>
	function setPagingView(totalSize, nowPage, rowCnt) {
		//현재 페이지
		let limitPage = 10;
		//페이지 10단위 ex)1-10 페이지 -> 0 , 11-20 -> 1
		let sCnt = Math.floor(((nowPage-1)/limitPage));
		//총 페이지 수
		let totalPage = calTotalPage(totalSize, rowCnt);
		//시작페이지 ex)1,11,21,31
		let startPage = parseInt(sCnt * limitPage+1);
		//마지막 페이지 ex)10,20,30
		var endPage = parseInt(startPage + limitPage);
		//이전페이지
		let beforePage = parseInt(nowPage) -1;
		//다음페이지
		let nextPage = parseInt(nowPage) +1;
		var addHtml = "";
		//마지막 페이지가 실제 페이지보다 클 경우 실제 마지막 페이지 셋팅 ex) endPage = 801, totalPage = 794일 경우, endPage를 795로 셋팅
		if (endPage > totalPage) endPage = totalPage+1;
		//현재 페이지가 1페이지일 경우 이전 페이지 버튼 비노출
		if(nowPage != 1){
			addHtml = addHtml + "<a class=\"next\" onclick=\"goPage('"+beforePage+"')\"><span>이전</span></a>";
		}
		//현재페이지 기준 +9
		for (var i=startPage; i<endPage; i++) {
			if (nowPage == i) {
				addHtml = addHtml + "<a class=\"on\" aria-current=\"page\">"+i+"</a>";
			} else {
				addHtml = addHtml + "<a onclick=\"goPage('"+i+"')\">"+i+"</a></a>";
			}
		}
		//다음 페이지 이동 버튼
		addHtml = addHtml + "<a class=\"next\" onclick=\"goPage('"+nextPage+"')\"><span>다음</span></a>";

		$("#page-num").html(addHtml);
	}

	//총 페이지 수 구하는 함수
	function calTotalPage(totalSize, pageSize) {
		var resultPage = 0;

		if (totalSize != 0) {
			resultPage = totalSize / pageSize;
			resultPage = parseInt(resultPage);
			if ((totalSize % pageSize) > 0) {
				resultPage = resultPage + 1;
			}
		}

		return resultPage;
	}
	if( "${resultMap.totalCnt}" != "" &&  parseInt("${resultMap.totalCnt}") >  parseInt("${resultMap.limit}") ){
		setPagingView("${resultMap.totalCnt}","${resultMap.nowPage}","${resultMap.limit}");
	}

</script>