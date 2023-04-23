<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap 5 Icon CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<link href="/lib/css/gnb.css" rel="stylesheet" type="text/css">
<div class="col-auto px-0">
    <div id="sidebar" class="collapse collapse-horizontal show border-end vh-100 shadow-sm">
        <div id="sidebar-nav" class="list-group border-0 rounded-0">
            <div class="p-2">
                <h4>InfoWash</h4>
            </div>
            <form class="d-flex p-2">
                <input class="form-control me-2" type="search" placeholder="세차장명" aria-label="Search">
                <button class="btn btn-primary" type="submit" style="width: 30%;">검색</button>
            </form>
            <div class="offcanvas-body px-0">
                <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-start" id="menu">
                    <li class="nav-item">
                        <a href="/" class="nav-link text-truncate">
                            <i class="fs-5 bi-home"></i><span class="ms-1 d-none d-sm-inline">Home</span>
                        </a>
                    </li>
                    <li>
                        <a href="#submenu1" data-bs-toggle="collapse" class="nav-link text-truncate">
                            <i class="fs-5 bi-car"></i><span class="ms-1 d-none d-sm-inline">전국 세차장 현황</span> </a>
                    </li>
<%--                    <li>--%>
<%--                        <a href="#" class="nav-link text-truncate">--%>
<%--                            <i class="fs-5 bi-table"></i><span class="ms-1 d-none d-sm-inline">Orders</span></a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#" class="nav-link text-truncate">--%>
<%--                            <i class="fs-5 bi-grid"></i><span class="ms-1 d-none d-sm-inline">Products</span></a>--%>
<%--                    </li>--%>
<%--                    <li>--%>
<%--                        <a href="#" class="nav-link text-truncate">--%>
<%--                            <i class="fs-5 bi-people"></i><span class="ms-1 d-none d-sm-inline">Customers</span> </a>--%>
<%--                    </li>--%>
                    <li class="dropdown">
                        <a href="#submenu2" data-bs-toggle="collapse" class="nav-link dropdown-toggle  text-truncate" id="dropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fs-5 bi-board"></i><span class="ms-1 d-none d-sm-inline">커뮤니티</span>
                        </a>
                        <ul class="collapse nav flex-column ms-1" id="submenu2" data-bs-parent="#menu">
                            <li>
                                <a href="#" class="nav-link text-truncate">
                                    <i class="fs-5 bi-board"></i></i><span class="ms-1 d-none d-sm-inline">공지사항</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link text-truncate">
                                    <i class="fs-5 bi-board"></i></i><span class="ms-1 d-none d-sm-inline">QNA</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link text-truncate">
                                    <i class="fs-5 bi-board"></i></i><span class="ms-1 d-none d-sm-inline">나의 요청/문의 내역</span>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>