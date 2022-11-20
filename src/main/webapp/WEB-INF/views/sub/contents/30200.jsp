<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ufn" uri="/WEB-INF/tlds/egovfn.tld"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>무대시설 안전진단기관 정보 - 공연장안전지원센터</title>
</head>
<body>
        			<div class="sub-title sub3">
					<h2>기관·법령</h2>
				</div><!--// sub-title-->  
				<jsp:include page="/WEB-INF/jsp/layout/include_location_3.jsp">
					<jsp:param name="depth2" value="2" />
				</jsp:include>   	    			
      			<div class="content-title">
      				<h3>무대시설 안전진단기관 정보</h3>
					<a href="/web/main/index.do" class="prev-btn" title="뒤로가기"></a>
      			</div><!--// content-title-->
      			
       			<div class="content">				
					<div class="board-wrap">
						<div class="board-common">
							<table class="table board-list">
								<caption>관할지자체 담당자 정보에 대한 표로써 안전진단 전문기관, 주소, 전화번호, 담당자 이메일, 업무 절차서 항목으로 구성됩니다.</caption>
								<colgroup>
									<col style="width:20%" span="5">
								</colgroup>
									<thead>
										<tr>
											<th scope="col">안전진단 전문기관</th>
											<th scope="col">주소</th>
											<th scope="col">전화번호</th>
											<th scope="col">담당자 이메일</th>
											<th scope="col">업무 절차서</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>한국산업기술시험원</td>
											<td class="mo-inline">경상남도 진주시 충의로 10</td>
											<td class="mo-inline">031-500-0314</td>
											<td class="mo-inline">kkw5064@safety.or.kr</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-01.pdf','공연장 무대시설 안전진단 업무절차서_한국산업기술시험원.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>(사)대한산업안전협회</td>
											<td class="mo-inline">서울특별시 구로구 구로5동 23-1</td>
											<td class="mo-inline">02-860-7000</td>
											<td class="mo-inline">kkw5064@safety.or.k</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-02.pdf','공연장 무대시설 안전진단 업무절차서_(사)대한산업안전협회.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>㈜케이알엔지니어링</td>
											<td class="mo-inline">서울 구로구 디지털로34길 55 코오롱싸이언스밸리 2차 1212</td>
											<td class="mo-inline">02-3281-4060</td>
											<td class="mo-inline">ybh8937@kreng.co.kr</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-03.pdf','공연장 무대시설 안전진단 업무절차서_(주)케이알엔지니어링.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>㈜코스텍</td>
											<td class="mo-inline">경기도 광명시 하안로228 광명시범공단 2동7층3호</td>
											<td class="mo-inline">02-2632-2114</td>
											<td class="mo-inline">kostech@korea.com</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-04.pdf','공연장 무대시설 안전진단 업무절차서_(주)코스텍.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>한국검정(주)</td>
											<td class="mo-inline">서울특별시 강남구 역삼1동 836-15</td>
											<td class="mo-inline">02-2188-0013</td>
											<td class="mo-inline">cyeh5211@naver.com</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-05.pdf','공연장 무대시설 안전진단 업무절차서_한국검정(주).pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>코리아테크인스펙션(주)</td>
											<td class="mo-inline">서울특별시 서초구 강남대로 53길 7</td>
											<td class="mo-inline">02-2635-4752</td>
											<td class="mo-inline">kotec@kotecst.com</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-06.pdf','공연장 무대시설 안전진단 업무절차서_코리아테크인스펙션(주).pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>㈜인스펙트</td>
											<td class="mo-inline">서울특별시 서초구 양재동 7-42 용진빌딩</td>
											<td class="mo-inline">02-2058-1112</td>
											<td class="mo-inline">parkhg70@hanmail.net</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-07.pdf','공연장 무대시설 안전진단 업무절차서_㈜인스펙트.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>㈜에스이테크컨설팅</td>
											<td class="mo-inline">서울특별시 송파구 백제고분로50길 31 신일빌딩 4층</td>
											<td class="mo-inline">02-501-9620</td>
											<td class="mo-inline">setech08@hotmail.com</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-08.pdf','공연장 무대시설 안전진단 업무절차서_㈜에스이테크컨설팅.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>㈜티디에이</td>
											<td class="mo-inline">서울특별시 영등포구 선유로3길 10 702호</td>
											<td class="mo-inline">02-2284-3700</td>
											<td class="mo-inline">muhngoon@gmail.com</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-09.pdf','공연장 무대시설 안전진단 업무절차서_㈜티디에이.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
										<tr>
											<td>(사)한국안전기술협회</td>
											<td class="mo-inline">경기도 안산시 단원구 동산로 76, 9층</td>
											<td class="mo-inline">031-484-8504</td>
											<td class="mo-inline">safety@korsta.or.kr</td>
											<td class="mo-inline file"><a href="<c:url value="/comm/download.do?f=${ufn:getDownloadLink('','file','30200-10.pdf','공연장 무대시설 안전진단 업무절차서_(사)한국안전기술협회.pdf') }" />" class="ico-file" title="첨부파일다운로드"><span class="hidden">첨부파일다운로드</span></a></td>
										</tr>
									</tbody>
								</table>
							</div><!--// board-common-->
						</div><!--// board-wrap-->
                 </div><!--// content-->
</body>
</html>