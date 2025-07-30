<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
  let cart = {
    init: function () {},
    del: function (productId) {
      let custId = '${sessionScope.logincust.custId}';
      location.href = '/cart/del?custId=' + custId + '&productId=' + productId;
    },
    mod: function (productId) {
      let custId = '${sessionScope.logincust.custId}';
      let cnt = $('#' + productId).val();
      location.href = '/cart/mod?custId=' + custId + '&productId=' + productId + '&productQt=' + cnt;
    }
  }

  $().ready(() => {
    cart.init();
  });
</script>

<!-- ① form 태그로 테이블 전체와 숨은 필드를 감싼다 -->
<form method="post" action="${pageContext.request.contextPath}/cart/order">
  <div class="container" style="margin-bottom: 50px;">
    <div class="card p-4 shadow">
      <h2 class="text-center mb-4">장바구니</h2>
      <table class="table table-hover align-middle text-center">
        <thead class="table-light">
        <tr>
          <th>이미지</th><th>상품명</th><th>가격</th><th>수량</th>
          <th>등록일</th><th>수정</th><th>삭제</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${carts}">
          <tr>
            <td>
              <a href="/product/see?id=${c.productId}">
                <img src="/imgs/${c.productImg}" width="60" class="rounded shadow-sm">
              </a>
            </td>
            <td>${c.productName}</td>
            <td><fmt:formatNumber value="${c.productPrice}" pattern="#,###원"/></td>
            <td style="width: 120px;">
              <input type="number" value="${c.productQt}"
                     class="form-control text-center" id="${c.productId}">
            </td>
            <td><fmt:formatDate value="${c.cartRegdate}" pattern="yyyy-MM-dd HH:mm"/></td>
            <td>
              <button type="button" class="btn btn-outline-primary btn-sm"
                      onclick="cart.mod(${c.productId})">수정</button>
            </td>
            <td>
              <button type="button" class="btn btn-outline-danger btn-sm"
                      onclick="cart.del(${c.productId})">삭제</button>
            </td>
          </tr>
          <!-- ② 각 상품마다 숨은 필드 (폼 내부) -->
          <input type="hidden" name="productId"    value="${c.productId}" />
          <input type="hidden" name="odDetailQt"    value="${c.productQt}" />
          <input type="hidden" name="odDetailTotalPrice"
                 value="${c.productQt * c.productPrice}" />
        </c:forEach>
        </tbody>
      </table>
    </div>
  </div>

  <!-- ③ 주문자/결제 정보 폼 필드 -->
  <div class="form-group">
    <label for="odMethod">결제 수단</label>
    <select id="odMethod" name="odMethod" class="form-control" required>
      <option value="CARD">신용카드</option>
      <option value="BANK">무통장입금</option>
      <option value="PHONE">휴대폰결제</option>
    </select>
  </div>
  <div class="form-group">
    <label for="name">수령인</label>
    <input type="text" id="name" name="name" class="form-control" required>
  </div>
  <div class="form-group">
    <label for="addr">주소</label>
    <input type="text" id="addr" name="addr" class="form-control" required>
  </div>
  <div class="form-group">
    <label for="tel">전화번호</label>
    <input type="tel" id="tel" name="tel" class="form-control" required>
  </div>

  <!-- ④ 최종 주문하기 버튼 -->
  <button type="submit" class="btn btn-success btn-block">주문하기</button>
</form>
