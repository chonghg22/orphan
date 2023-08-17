<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>InfoWash</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=31e0942185311b94482c641ed5245ff7&libraries=services"></script>
</head>
<script>
</script>
<body>

<div class="container-fluid">
    <div class="row flex-nowrap">
        <jsp:include page="../layout/include_gmb.jsp" />
        <div class="col ps-md-2 pt-2">
<%--            <a href="#" data-bs-target="#sidebar" data-bs-toggle="collapse" class="border rounded-3 p-1 text-decoration-none"><i class="bi bi-list"></i></a>--%>
            <div class="row">
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-start">
                            <h5 class="card-title"><i class="bi bi-wash-total mr-3"></i>총 세차장(${InfoWashCount})<a href="#" class="btn btn-primary" style="float: right;">보러가기</a>
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-start">
                            <h5 class="card-title">
                                <i class="bi bi-self-wash mr-3"></i>셀프세차(${InfoWashSelfCount})<a href="#" class="btn btn-primary" style="float: right;">보러가기</a>
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-start">
                            <h5 class="card-title">
                                <i class="bi bi-no-self mr-3"></i>손세차(${InfoWashNoSelfCount})<a href="#" class="btn btn-primary" style="float: right;">보러가기</a>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:forEach items="${infoList}" var="list" varStatus="status">
                <div class="col">
                    <div class="card shadow-sm">
                        <img onclick="window.open('https://www.youtube.com/watch?v=${list.videoId}')"; src="https://i.ytimg.com/vi/${list.videoId}/mqdefault.jpg" style="width: 100%;height: 225px"/>
                        <div class="card-body">
                            <p class="card-text" style="white-space: nowrap;overflow: hidden;text-overflow: ellipsis;">${list.title}</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="window.open('https://www.youtube.com/watch?v=${list.videoId}')">보기</button>
<%--                                    <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>--%>
                                </div>
                                <small class="text-muted">${list.channelTitle}</small>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <br>
            <div id="map" style="height:400px;"></div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
            <br>
            <form action="/" name="searchForm" id="searchForm">
                <input type="hidden" name="nowPage" id="nowPage" value="${returnMap.nowPage}"/>
            <div class="row">
                <div class="col">
                    <select class="form-select" name="sido" aria-label="Default select example" onchange="fn_chageGunGu(this)">
                        <option value="">시 또는 도를 선택 해 주세요.</option>
                        <c:forEach items="${selectGroupBySido}" var="list" varStatus="status">
                            <option value="${list.sido}" <c:if test="${list.sido eq resultMap.sido}">selected</c:if>>${list.sido}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" aria-label="Default select example" id="sigungu" name="sigungu">
                        <option value="${resultMap.sigungu}" selected>${resultMap.sigungu}</option>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" aria-label="Default select example" name="washType" id="washType">
                        <option value="" selected>세차 유형을 선택 해 주세요.</option>
                        <option value="셀프세차" <c:if test="${resultMap.washType eq '셀프세차'}">selected</c:if>>셀프세차</option>
                        <option value="손세차" <c:if test="${resultMap.washType eq '손세차'}">selected</c:if>>손세차</option>
                    </select>
                </div>
                <div class="col">
                    <button type="button" class="btn btn-sm btn-outline-secondary" onclick="fn_movePage()">보기</button>
                </div>
            </div>
            </form>
            <div class="mt-5">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">NO</th>
                        <th scope="col">세차장명</th>
                        <th scope="col">주소</th>
                        <th scope="col">전화번호</th>
                        <th scope="col">위치</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${selectInfoWashList}" var="list" varStatus="status">
                    <tr>
                        <th scope="row">${status.index+1}</th>
                        <td>${list.corpName}</td>
                        <td>${list.address}</td>
                        <td>${list.telNo}</td>
                        <td><a href="#" class="btn btn-primary" onclick="searchWash('${list.address}','${list.corpName}')">보러가기</a></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <jsp:include page="../layout/include_paging.jsp" />
        </div>
    </div>
</div>
<script>
    // $(document).ready(function () {
    <%--    fn_chageGunGu('${resultMap.sido}');--%>
    // })
    window.onload = function(){
        fn_chageGunGu('${resultMap.sido}');
    }
    //카카오맵 api
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
    var mapTypeControl = new kakao.maps.MapTypeControl();

    // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
    // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
    map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

    // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
    var zoomControl = new kakao.maps.ZoomControl();
    map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

    //주소로 좌표 찍기
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    searchWash('서울특별시 마포구 성미산로 20','광일세차장');

        //카카오맵 종료
    function searchWash(addr,washName){
        geocoder.addressSearch(addr, function(result, status) {

            // 정상적으로 검색이 완료됐으면
            if (status === kakao.maps.services.Status.OK) {

                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });

                // 인포윈도우로 장소에 대한 설명을 표시합니다
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">'+washName+'</div>'
                });
                infowindow.open(map, marker);

                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);
            }
        })
        $('html, body').animate({
            scrollTop: $("#map").offset().top
        }, 50);
    }

    function fn_movePage(){
        let form = $("#searchForm");
        $("#nowPage").val(${returnMap.nowPage});
        $("#sido").val(${returnMap.sido});
        $("#sigungu").val(${returnMap.sigungu});
        form.attr('action', "/");
        form.submit();
    }

    function goPage( nowPage ){
        let form = $("#searchForm");
        $("#nowPage").val(nowPage);
        form.attr('action', "/");
        form.submit();
    }

    function fn_chageGunGu(obj){
        let sido;
        let status;
        if(obj.value == null){
            sido = obj;
        }else{
            sido = obj.value;
        }
        $.ajax({
            url  : "/selectGungu",
            data : {"sido":sido},
            type : "POST",
            dataType : "JSON",
            success : function(res){
                let tbody = null;
                if (res != null) {
                    res.forEach(function (element,index) {
                        tbody += '<option value="' + element.sigungu +'" id="location' + index +'">' + element.sigungu + '</option>';
                        if(element.sigungu == '${resultMap.sigungu}'){
                            status = index;
                        }
                    });
                    console.log(status)
                    // document.getElementById("test").setAttribute("selected", "selected");
                    $("#sigungu").html(tbody);
                    $("#location"+status).attr("selected","selected");
                }
            },
            error : function(e){
                console.log(e.responseText);
                alert("There are some problems in System. <br />Please Try again.");
            }
        })
    }
</script>
</body>

</html>