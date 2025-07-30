<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>

<%--<div class="col-sm-12">--%>
<%--  <h2>Product Get Admin Page</h2>--%>
<%--  <table id="product_table" class="table table-bordered">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--      <th>Img</th>--%>
<%--      <th>Id</th>--%>
<%--      <th>Name</th>--%>
<%--      <th>Price</th>--%>
<%--      <th>Rate</th>--%>
<%--      <th>RegDate</th>--%>
<%--      <th>UpdateDate</th>--%>
<%--      <th>Category</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="p" items="${plist}">--%>
<%--      <tr>--%>
<%--        <td><img src="/imgs/${p.productImg}" height="300" width="300"></td>--%>
<%--&lt;%&ndash;        이전에 prodcut는 파일업로드를 하지 않았던거&ndash;%&gt;--%>
<%--        <td><a href="/product/detail?id=${p.productId}">${p.productId}</a></td>--%>
<%--        <td>${p.productName}</td>--%>
<%--        <td><fmt:formatNumber type="number" pattern="###,###원" value="${p.productPrice}" /></td>--%>
<%--        <td>${p.discountRate}</td>--%>
<%--        <td>--%>
<%--          <fmt:parseDate value="${ p.productRegdate }"--%>
<%--                         pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />--%>
<%--          <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />--%>
<%--        </td>--%>
<%--        <td>--%>
<%--          <fmt:parseDate value="${ p.productUpdate }"--%>
<%--                         pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />--%>
<%--          <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />--%>
<%--        </td>--%>
<%--        <td>${p.cateName}</td>--%>
<%--      </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--  </table>--%>
<%--</div>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container" style="min-height: 80vh;">
  <div class="card p-4 shadow">
    <h2 class="text-center mb-4">상품 관리 목록</h2>

    <div class="table-responsive">
      <table id="product_table" class="table table-hover text-center align-middle">
        <thead class="table-light">
        <tr>
          <th>이미지</th>
          <th>ID</th>
          <th>이름</th>
          <th>가격</th>
          <th>할인율</th>
          <th>등록일</th>
          <th>수정일</th>
          <th>카테고리</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="p" items="${plist}">
          <tr>
            <td>
              <img src="/imgs/${p.productImg}" width="100" height="100" class="rounded shadow-sm">
            </td>
            <td>
              <a href="/product/detail?id=${p.productId}" class="text-decoration-none">${p.productId}</a>
            </td>
            <td>${p.productName}</td>
            <td>
              <fmt:formatNumber type="number" pattern="###,###원" value="${p.productPrice}" />
            </td>
            <td>${p.discountRate}%</td>
            <td>
              <fmt:parseDate value="${p.productRegdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedReg" type="both" />
              <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedReg}" />
            </td>
            <td>
              <fmt:parseDate value="${p.productUpdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedUpd" type="both" />
              <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedUpd}" />
            </td>
            <td>${p.cateName}</td>
          </tr>
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>

