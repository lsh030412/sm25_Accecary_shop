<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-12">
  <div style="padding-bottom:80px;">
    <div id="demo" class="carousel slide" data-ride="carousel" >
        <ul class="carousel-indicators">
            <li data-target="#demo" data-slide-to="0" class="active"></li>
            <li data-target="#demo" data-slide-to="1"></li>
            <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="/imgs/b1.jpg" class="d-block w-100" style="height: 500px; object-fit: cover; background-color: black;" alt="bracelet">
            </div>
            <div class="carousel-item">
                <img src="/imgs/r5.jpg" class="d-block w-100" style="height: 500px; object-fit: cover; background-color: black;" alt="watch">
            </div>
            <div class="carousel-item">
                <img src="/imgs/r1.jpg" class="d-block w-100" style="height: 500px; object-fit: cover; background-color: black;" alt="ring">
            </div>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
            <span class="carousel-control-next-icon"></span>
        </a>
    </div>
  </div>
    <hr style="margin-bottom: 40px">
    <h2 class="text-center" style="margin-bottom: 40px;">ALL</h2>
    <div class="row">
        <c:forEach var="p" items="#{plist}">
            <div class="col-sm-4 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" height="300" src="/imgs/${p.productImg}" alt="Card image">
                    <div class="card-body d-flex flex-column">
                        <div>
                            <h4 class="card-title">${p.cateName}</h4>
                            <h4 class="card-title">${p.productName}</h4>
                            <p class="card-text">
                                <fmt:formatNumber type="number" pattern="###,###원" value="${p.productPrice}" />
                            </p>
                        </div>
                        <a href="/product/see?id=${p.productId}" class="btn btn-primary mt-auto">See</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
<%--senter menue End--%>