<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let cart = {
    init: function () {},

    del: function (productId) {
      let custId = '${sessionScope.logincust.custId}';
      location.href = '${pageContext.request.contextPath}/cart/del'
              + '?custId=' + custId
              + '&productId=' + productId;
    },

    mod: function (productId) {
      let custId = '${sessionScope.logincust.custId}';
      let cnt    = document.getElementById(productId).value;
      location.href = '${pageContext.request.contextPath}/cart/mod'
              + '?custId=' + custId
              + '&productId=' + productId
              + '&productQt=' + cnt;
    }
  };

  $(function() {
    cart.init();
  });
</script>

<div class="container my-5">
  <div class="card p-4 shadow">
    <h2 class="text-center mb-4">장바구니</h2>
    <table class="table table-hover align-middle text-center">
      <thead class="table-light">
      <tr>
        <th>이미지</th>
        <th>상품명</th>
        <th>가격</th>
        <th>수량</th>
        <th>등록일</th>
        <th>수정</th>
        <th>삭제</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="c" items="${carts}">
        <tr>
          <td>
            <a href="${pageContext.request.contextPath}/product/see?id=${c.productId}">
              <img src="${pageContext.request.contextPath}/imgs/${c.productImg}"
                   width="60" class="rounded shadow-sm" />
            </a>
          </td>
          <td>${c.productName}</td>
          <td><fmt:formatNumber value="${c.productPrice}" pattern="#,###원" /></td>
          <td style="width:120px;">
            <input type="number"
                   id="${c.productId}"
                   class="form-control text-center"
                   value="${c.productQt}"
                   min="1" />
          </td>
          <td><fmt:formatDate value="${c.cartRegdate}" pattern="yyyy-MM-dd HH:mm" /></td>
          <td>
            <button type="button" class="btn btn-outline-primary btn-sm"
                    onclick="cart.mod(${c.productId})">수정</button>
          </td>
          <td>
            <button type="button" class="btn btn-outline-danger btn-sm"
                    onclick="cart.del(${c.productId})">삭제</button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>

    <!-- 전체 주문하기 버튼 -->
    <div class="text-center mt-4">
      <button type="button"
              class="btn btn-success btn-lg"
              onclick="location.href='${pageContext.request.contextPath}/cart/checkout'">
        전체 주문하기
      </button>
    </div>
  </div>
</div>
