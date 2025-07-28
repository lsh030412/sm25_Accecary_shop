<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-sm-10">
  <h2 style="margin-bottom: 40px;">모든 상품</h2>
  <div class="card-columns">
    <c:forEach var="p" items="#{plist}">
      <div class="card bg-light">
        <img class="card-img-top" style="height:400px;" src="/imgs/${p.productImg}" alt="Card image">
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