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
                <img src="/imgs/p8.jpg" class="d-block w-100" style="height: 500px; object-fit: contain; background-color: black;" alt="Los Angeles">
            </div>
            <div class="carousel-item">
                <img src="/imgs/p9.jpg" class="d-block w-100" style="height: 500px; object-fit: contain; background-color: black;" alt="cicago">
            </div>
            <div class="carousel-item">
                <img src="/imgs/p7.jpg" class="d-block w-100" style="height: 500px; object-fit: contain; background-color: black;" alt="toronto">
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
    <hr>
  <div class="col-sm-12">
    <h2 style="margin-bottom: 20px; margin-top: 20px; text-align: center;">모든 상품</h2>
    <div class="card-columns">
        <c:forEach var="p" items="#{plist}">
            <div class="card bg-light">
                <img class="card-img-top" height="400" src="/imgs/${p.productImg}" alt="Card image">
                <div class="card-body">
                    <h4 class="card-title">${p.cateName}</h4>
                    <h4 class="card-title">${p.productName}</h4>
                    <p class="card-text"><fmt:formatNumber type="number" pattern="###,###원" value="${p.productPrice}" /></p>
                    <a href="/product/see?id=${p.productId}" class="btn btn-primary">See</a>
                </div>
            </div>
        </c:forEach>
    </div>
   </div>
</div>

<%--senter menue End--%>