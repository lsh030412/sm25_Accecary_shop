<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-10">
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
  <div class="card-columns">
    <div class="card bg-light">
      <img class="card-img-top" height="200" src="/imgs/p1.jpg" alt="Card image">
      <div class="card-body">
        <h4 class="card-title">송하영</h4>
        <p class="card-text"><fmt:formatNumber type="number" pattern="###,###원" value="500000" /></p>
        <a href="#" class="btn btn-primary">See</a>
      </div>
    </div>
    <div class="card bg-light">
      <img class="card-img-top" height="200" src="/imgs/p1.jpg" alt="Card image">
      <div class="card-body">
          <h4 class="card-title">송하영</h4>
          <p class="card-text"><fmt:formatNumber type="number" pattern="###,###원" value="500000" /></p>
          <a href="#" class="btn btn-primary">See</a>
      </div>
    </div>
    <div class="card bg-light">
      <img class="card-img-top" height="200" src="/imgs/p9.jpg" alt="Card image">
      <div class="card-body">
          <h4 class="card-title">송하영</h4>
          <p class="card-text"><fmt:formatNumber type="number" pattern="###,###원" value="500000" /></p>
          <a href="#" class="btn btn-primary">See</a>
      </div>
    </div>
    <div class="card bg-light">
      <img class="card-img-top" height="200" src="/imgs/p1.jpg" alt="Card image">
      <div class="card-body">
          <h4 class="card-title">송하영</h4>
          <p class="card-text"><fmt:formatNumber type="number" pattern="###,###원" value="500000" /></p>
          <a href="#" class="btn btn-primary">See</a>
      </div>
    </div>
    <div class="card bg-light">
      <img class="card-img-top" height="200" src="/imgs/p1.jpg" alt="Card image">
      <div class="card-body">
          <h4 class="card-title">송하영</h4>
          <p class="card-text"><fmt:formatNumber type="number" pattern="###,###원" value="500000" /></p>
          <a href="#" class="btn btn-primary">See</a>
      </div>
    </div>
    <div class="card bg-light">
      <img class="card-img-top" height="200" src="/imgs/p1.jpg" alt="Card image">
      <div class="card-body">
          <h4 class="card-title">송하영</h4>
          <p class="card-text"><fmt:formatNumber type="number" pattern="###,###원" value="500000" /></p>
          <a href="#" class="btn btn-primary">See</a>
      </div>
    </div>
  </div>
</div>

<%--senter menue End--%>