<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
<%--    left menu를 상단에 고정--%>
    .fixed-left {
        position: fixed;
        top: 70px;
        left: 50px;
        width: 200px;
        height: calc(100vh - 70px);
        overflow-y: auto;
        background-color: white;
        border-right: 1px solid #ddd;
        padding: 10px;
        z-index: 1000;
    }
    /*화면이 줄어들었을 때 숨김처리*/
    @media (max-width: 768px) {
        .fixed-left {
            display: none;
        }
    }
</style>
<div class="col-sm-1">
<div class="fixed-left">
    <nav class="navbar bg-light mb-2">
        <strong>Category</strong>
    </nav>
    <nav class="navbar navbar-light">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/product/all_product">모든 상품</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/watch">시계</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/bracelet">팔찌</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/necklace">목걸이</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/product/ring">반지</a>
            </li>
        </ul>
    </nav>
</div>
</div>