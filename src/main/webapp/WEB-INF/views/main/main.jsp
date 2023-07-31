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
            <form action="/">
            <div class="row">
                <div class="col">
                    <select class="form-select" name="sido" aria-label="Default select example" onchange="fn_chageGunGu(this)">
                        <option value="">시 또는 도를 선택 해 주세요.</option>
                        <c:forEach items="${selectGroupBySido}" var="list" varStatus="status">
                            <option value="${list.sido}">${list.sido}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" aria-label="Default select example" id="sigungu" name="sigungu">
                        <option selected>구 또는 군을 선택 해 주세요.</option>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" aria-label="Default select example" >
                        <option selected>세차 유형을 선택 해 주세요.</option>
                        <option value="1">셀프세차</option>
                        <option value="2">손세차</option>
                    </select>
                </div>
                <div class="col">
                    <button type="submit" class="btn btn-sm btn-outline-secondary">보기</button>
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
                        <td><a href="#" class="btn btn-primary">보러가기</a></td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
<script>
    function fn_chageGunGu(obj){
        $.ajax({
            url  : "/selectGungu",
            data : {"sido":obj.value},
            type : "POST",
            dataType : "JSON",
            success : function(res){
                let tbody = null;
                if (res != null) {
                    res.forEach(function (element) {
                        tbody += '<option value="' + element.sigungu + '">' + element.sigungu + '</option>';
                    });
                    $("#sigungu").html(tbody);
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