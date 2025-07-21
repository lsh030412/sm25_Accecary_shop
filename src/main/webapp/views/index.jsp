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

    <title>My JSP 쇼핑몰 - Bootstrap 4 기반</title>

    <%-- Bootstrap icons (사용자용 아이콘 예: bi bi-cart 등) --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

    <%-- Bootstrap 4 + jQuery + Popper.js --%>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <%-- 사용자 정의 스타일 --%>
    <style>
        .main-banner {
            margin-bottom: 3rem;
        }
        .product-grid-section {
            margin-bottom: 5rem; /* 각 섹션 간 간격 */
        }
        .section-title {
            text-align: center;
            margin-bottom: 2rem;
            font-weight: bolder;
        }
        /* 우주마켓 로고 및 텍스트 스타일 */
        .universe-market {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 2rem;
        }
        .universe-market img {
            width: 50px; /* 로고 크기 조정 */
            height: auto;
            margin-right: 10px;
        }
        .universe-market h1 {
            font-size: 2.5rem;
            font-weight: bold;
        }
        /* 이미지와 유사한 레이아웃을 위한 추가 스타일 (필요시 세부 조정) */
        .product-card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center; /* 상품들을 중앙으로 정렬 */
        }
        .product-card-container .col {
            flex: 0 0 23%; /* 4개씩 표시 (Bootstrap col-3과 유사) */
            max-width: 23%;
            margin: 1%; /* 카드 간 간격 */
        }
        @media (max-width: 992px) { /* Medium devices (md) */
            .product-card-container .col {
                flex: 0 0 31%; /* 3개씩 표시 */
                max-width: 31%;
            }
        }
        @media (max-width: 768px) { /* Small devices (sm) */
            .product-card-container .col {
                flex: 0 0 48%; /* 2개씩 표시 */
                max-width: 48%;
            }
        }
        @media (max-width: 576px) { /* Extra small devices (xs) */
            .product-card-container .col {
                flex: 0 0 98%; /* 1개씩 표시 */
                max-width: 98%;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#!">Start Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#!">About</a></li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
            </ul>
            <form class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
        </div>
    </div>
</nav>
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">쇼핑몰 테스트</h1>
            <p class="lead fw-normal text-white-50 mb-0">쇼핑몰을 테스트합니다</p>
        </div>
    </div>
</header>

<section class="py-5 main-banner">
    <div class="container text-center">
        <img src="YOUR_TOP_CENTER_BANNER_IMAGE_URL.jpg" alt="메인 배너" class="img-fluid" style="max-height: 400px; width: 100%; object-fit: contain;">
    </div>
</section>

<section class="py-5 product-grid-section">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="universe-market">
            <img src="YOUR_UNIVERS_MARKET_LOGO_URL.png" alt="우주마켓 로고">
            <h1>우주마켓</h1>
        </div>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center product-card-container">
            <c:forEach var="product" items="${products}">
                <c:if test="${product.brand == '우주마켓'}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <c:if test="${product.onSale}">
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            </c:if>
                            <img class="card-img-top" src="${product.imageUrl}" alt="${product.name}" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">${product.name}</h5>
                                    <p class="text-muted mb-1">${product.brand}</p>
                                    <c:if test="${product.reviewStars > 0}">
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <c:forEach begin="1" end="${product.reviewStars}">
                                                <div class="bi-star-fill"></div>
                                            </c:forEach>
                                            <c:forEach begin="${product.reviewStars + 1}" end="5">
                                                <div class="bi-star"></div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                    <c:if test="${product.onSale}">
                                        <span class="text-muted text-decoration-line-through">$<fmt:formatNumber value="${product.originalPrice}" pattern="#0.00"/></span>
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                    <c:if test="${!product.onSale}">
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <c:choose>
                                        <c:when test="${product.originalPrice > 0 and product.price != product.originalPrice}">
                                            <a class="btn btn-outline-dark mt-auto" href="#">View options</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>

<section class="py-5 product-grid-section">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="section-title">GUCCI</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center product-card-container">
            <c:forEach var="product" items="${products}">
                <c:if test="${product.brand == 'GUCCI'}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <c:if test="${product.onSale}">
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            </c:if>
                            <img class="card-img-top" src="${product.imageUrl}" alt="${product.name}" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">${product.name}</h5>
                                    <p class="text-muted mb-1">${product.brand}</p>
                                    <c:if test="${product.reviewStars > 0}">
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <c:forEach begin="1" end="${product.reviewStars}">
                                                <div class="bi-star-fill"></div>
                                            </c:forEach>
                                            <c:forEach begin="${product.reviewStars + 1}" end="5">
                                                <div class="bi-star"></div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                    <c:if test="${product.onSale}">
                                        <span class="text-muted text-decoration-line-through">$<fmt:formatNumber value="${product.originalPrice}" pattern="#0.00"/></span>
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                    <c:if test="${!product.onSale}">
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <c:choose>
                                        <c:when test="${product.originalPrice > 0 and product.price != product.originalPrice}">
                                            <a class="btn btn-outline-dark mt-auto" href="#">View options</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>

<section class="py-5 product-grid-section">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="section-title">LOUIS VUITTON</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center product-card-container">
            <c:forEach var="product" items="${products}">
                <c:if test="${product.brand == 'LOUIS VUITTON'}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <c:if test="${product.onSale}">
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            </c:if>
                            <img class="card-img-top" src="${product.imageUrl}" alt="${product.name}" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">${product.name}</h5>
                                    <p class="text-muted mb-1">${product.brand}</p>
                                    <c:if test="${product.reviewStars > 0}">
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <c:forEach begin="1" end="${product.reviewStars}">
                                                <div class="bi-star-fill"></div>
                                            </c:forEach>
                                            <c:forEach begin="${product.reviewStars + 1}" end="5">
                                                <div class="bi-star"></div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                    <c:if test="${product.onSale}">
                                        <span class="text-muted text-decoration-line-through">$<fmt:formatNumber value="${product.originalPrice}" pattern="#0.00"/></span>
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                    <c:if test="${!product.onSale}">
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <c:choose>
                                        <c:when test="${product.originalPrice > 0 and product.price != product.originalPrice}">
                                            <a class="btn btn-outline-dark mt-auto" href="#">View options</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>

<section class="py-5 product-grid-section">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="section-title">기타 상품</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center product-card-container">
            <c:forEach var="product" items="${products}">
                <c:if test="${product.brand != '우주마켓' and product.brand != 'GUCCI' and product.brand != 'LOUIS VUITTON'}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <c:if test="${product.onSale}">
                                <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                            </c:if>
                            <img class="card-img-top" src="${product.imageUrl}" alt="${product.name}" />
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h5 class="fw-bolder">${product.name}</h5>
                                    <p class="text-muted mb-1">${product.brand}</p>
                                    <c:if test="${product.reviewStars > 0}">
                                        <div class="d-flex justify-content-center small text-warning mb-2">
                                            <c:forEach begin="1" end="${product.reviewStars}">
                                                <div class="bi-star-fill"></div>
                                            </c:forEach>
                                            <c:forEach begin="${product.reviewStars + 1}" end="5">
                                                <div class="bi-star"></div>
                                            </c:forEach>
                                        </div>
                                    </c:if>
                                    <c:if test="${product.onSale}">
                                        <span class="text-muted text-decoration-line-through">$<fmt:formatNumber value="${product.originalPrice}" pattern="#0.00"/></span>
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                    <c:if test="${!product.onSale}">
                                        $<fmt:formatNumber value="${product.price}" pattern="#0.00"/>
                                    </c:if>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <c:choose>
                                        <c:when test="${product.originalPrice > 0 and product.price != product.originalPrice}">
                                            <a class="btn btn-outline-dark mt-auto" href="#">View options</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>
</section>


<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>