<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="쇼핑몰 소개글" />
    <meta name="author" content="작성자" />

    <title>Accessory Store</title>


    <%-- Bootstrap icons (사용자용 아이콘 예: bi bi-cart 등) --%>
    <link rel="icon" type="image/x-icon" href="imgs/ct.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

    <%-- Bootstrap 4 + jQuery + Popper.js --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


    <%-- 사용자 정의 스타일 --%>
</head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">category</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/product/all_product">모든 제품</a></li>
                                <li><hr class="dropdown-divider" /></li>
                                <li><a class="dropdown-item" href="/product/watch">시계</a></li>
                                <li><a class="dropdown-item" href="/product/bracelet">팔찌</a></li>
                                <li><a class="dropdown-item" href="/product/necklace">목걸이</a></li>
                                <li><a class="dropdown-item" href="/product/ring">반지</a></li>
                            </ul>
                        </li>
                    </ul>
                    <a class="navbar-brand mx-auto" href="/">Accessory Store</a>
<%--                    <form class="d-flex">--%>
<%--                        <button class="btn btn-outline-dark" type="submit">--%>
<%--                            <i class="bi-cart-fill me-1"></i>--%>
<%--                            Cart--%>
<%--                            <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>--%>
<%--                        </button>--%>
<%--                    </form>--%>
                    <c:choose>
                        <%--    로그인 안한상태 로그인 하라는거--%>
                        <c:when test="${sessionScope.logincust == null}">
                            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                <li class="nav-item">
                                    <a class="nav-link" href="/login">login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/register">Register</a>
                                </li>
                            </ul>
                        </c:when>
                        <c:otherwise>
<%--                            로그인 o -> 관리자 | 일반 고객--%>
                            <c:choose>
<%--                                관리자 메뉴--%>
                                <c:when test="${sessionScope.logincust.custId == 'admin'}">
                                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/info">${sessionScope.logincust.custName}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/logout">Logout</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/cart">Cart</a>
                                        </li>
                                        <li class="nav-item dropdown">
                                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">관리자 메뉴</a>
                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                                <li><a class="dropdown-item" href="/cust_get">cust get</a></li>
                                                <li><hr class="dropdown-divider" /></li>
                                                <li><a class="dropdown-item" href="/product/add">product add</a></li>
                                                <li><a class="dropdown-item" href="/product/get">product get</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </c:when>
                                <c:otherwise>
<%--                                    일반고객 메뉴--%>
                                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                                        <li class="nav-item">
                                            <a class="nav-link" href="/info">${sessionScope.logincust.custName}</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/logout">Logout</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="/cart">Cart</a>
                                        </li>
                                    </ul>
                                </c:otherwise>
                            </c:choose>
                        </c:otherwise>
                    </c:choose>


                </div>
            </div>
        </nav>
        <div class="container" style="margin-top:30px; margin-bottom: 30px;">
            <%--  하나의 로우--%>
            <%--  여러개의 컬럼으로 분할--%>
            <div class="row">
                <%--    한로우안에 col3, col9로 되어있다--%>
                <%--    left menue start--%>
                <%--  cneter.jsp가 이 안으로 들어와서 생성됨--%>
                <c:choose>
                    <c:when test="${left == null}">
                        <jsp:include page="left.jsp" />
                    </c:when>
                    <c:otherwise>
                        <jsp:include page="${left}.jsp"/>
                    </c:otherwise>
                </c:choose>

                <%--    left menue End--%>

                <%--  center menue start--%>
                <c:choose>
                    <c:when test="${center == null}">
                        <jsp:include page="center.jsp" />
                    </c:when>
                    <%--   그렇지 않으면--%>
                    <c:otherwise>
                        <c:import url="${center}.jsp" />
                    </c:otherwise>
                </c:choose>
                <%--  senter menue End--%>
            </div>
        </div>


        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
