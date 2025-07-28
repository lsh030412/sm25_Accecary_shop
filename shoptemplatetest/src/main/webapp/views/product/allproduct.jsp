<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="col-sm-10">
  <h2 style="margin-bottom: 40px;">모든 상품</h2>
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