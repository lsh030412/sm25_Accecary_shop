<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<script>--%>
<%--  let cart = {--%>
<%--    init:function(){},--%>
<%--    // for문으로 돌아가기에 버튼에 아이디를 부여시 누구의 아이디인지 구별x--%>
<%--    // onclick이벤트 발생--%>
<%--    del:function(productId){--%>
<%--      // 삭제요청--%>
<%--      let custId = '${sessionScope.logincust.custId}';--%>
<%--    location.href='/cart/del?custId=' +custId + '&productId=' + productId;--%>
<%--    },--%>
<%--    mod:function(productId){--%>
<%--    //   수정요청--%>
<%--      let custId = '${sessionScope.logincust.custId}';--%>
<%--      let cnt = $('#' + productId).val();--%>
<%--      location.href='/cart/mod?custId=' +custId + '&productId=' + productId + '&productQt=' + cnt;--%>
<%--    }--%>

<%--  }--%>


<%--  $().ready(()=> {--%>
<%--    cart.init();--%>
<%--  });--%>

<%--</script>--%>
<%--&lt;%&ndash; Center Page &ndash;%&gt;--%>
<%--<div class="col-sm-12" style="margin-bottom: 500px;">--%>
<%--  <h2>Cart Page</h2>--%>
<%--  <table class="table table-bordered">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--      <th>Img</th>--%>
<%--      <th>Name</th>--%>
<%--      <th>price</th>--%>
<%--      <th>Quantity</th>--%>
<%--      <th>Date</th>--%>
<%--      <th>Update</th>--%>
<%--      <th>Delete</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="c" items="${carts}">--%>
<%--      <tr>--%>
<%--        <td>--%>
<%--          <a href="/product/see?id=${c.productId}">--%>
<%--            <img src="/imgs/${c.productImg}" width="50px;">--%>
<%--          </a>--%>
<%--        </td>--%>
<%--        <td>${c.productName}</td>--%>
<%--        <td>${c.productPrice}</td>--%>
<%--        <td>--%>
<%--          <input type="number" value="${c.productQt}" class="form-control" id="${c.productId}">--%>
<%--        </td>--%>
<%--        <td>${c.cartRegdate}</td>--%>
<%--        <td><button type="button" class="btn btn-secondary" onclick="cart.mod(${c.productId})">Update</button></td>--%>
<%--        <td><button type="button" class="btn btn-secondary" onclick="cart.del(${c.productId})">Delete</button></td>--%>
<%--      </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--  </table>--%>
<%--</div>--%>

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

<div class="container" style="min-height: 80vh;">
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
            <a href="/product/see?id=${c.productId}">
              <img src="/imgs/${c.productImg}" width="60" class="rounded shadow-sm">
            </a>
          </td>
          <td>${c.productName}</td>
          <td><fmt:formatNumber value="${c.productPrice}" pattern="#,###원"/></td>
          <td style="width: 120px;">
            <input type="number" value="${c.productQt}" class="form-control text-center" id="${c.productId}">
          </td>
          <td><fmt:formatDate value="${c.cartRegdate}" pattern="yyyy-MM-dd HH:mm"/></td>
          <td>
            <button type="button" class="btn btn-outline-primary btn-sm" onclick="cart.mod(${c.productId})">수정</button>
          </td>
          <td>
            <button type="button" class="btn btn-outline-danger btn-sm" onclick="cart.del(${c.productId})">삭제</button>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
