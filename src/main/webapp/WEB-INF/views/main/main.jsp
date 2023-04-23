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
                            <h5 class="card-title"><i class="bi bi-wash-total mr-3"></i>총 세차장(600)<a href="#" class="btn btn-primary" style="float: right;">보러가기</a>
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-start">
                            <h5 class="card-title">
                                <i class="bi bi-self-wash mr-3"></i>셀프세차(70)<a href="#" class="btn btn-primary" style="float: right;">보러가기</a>
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card shadow">
                        <div class="card-body text-start">
                            <h5 class="card-title">
                                <i class="bi bi-no-self mr-3"></i>손세차(100)<a href="#" class="btn btn-primary" style="float: right;">보러가기</a>
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
            <div class="row">
                <div class="col">
                    <select class="form-select" aria-label="Default select example" >
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" aria-label="Default select example" >
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" aria-label="Default select example" >
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
                <div class="col">
                    <select class="form-select" aria-label="Default select example" >
                        <option selected>Open this select menu</option>
                        <option value="1">One</option>
                        <option value="2">Two</option>
                        <option value="3">Three</option>
                    </select>
                </div>
            </div>

            <div class="mt-5">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">First</th>
                        <th scope="col">Last</th>
                        <th scope="col">Handle</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td colspan="2">Larry the Bird</td>
                        <td>@twitter</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

</body>

</html>