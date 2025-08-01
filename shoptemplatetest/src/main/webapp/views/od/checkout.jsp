<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 85vh;">
  <div class="card p-5 shadow" style="width: 600px;">
    <h2 class="text-center mb-4">주문서 작성</h2>

    <c:if test="${not empty msg}">
      <div class="alert alert-danger text-center">${msg}</div>
    </c:if>

    <p><strong>상품:</strong> ${productName}</p>
    <p><strong>현재 잔액:</strong> ${custMoney}원</p>
    <p><strong>총 주문금액:</strong> ${totalPrice}원</p>

    <form action="/od/place" method="post">
      <!-- 히든 필드 -->
      <input type="hidden" name="custId" value="${sessionScope.logincust.custId}" />
      <input type="hidden" name="odDetails[0].productId" value="${order.odDetails[0].productId}" />
      <input type="hidden" name="odDetails[0].odDetailQt" value="${order.odDetails[0].odDetailQt}" />
      <input type="hidden" name="odDetails[0].odDetailTotalPrice" value="${order.odDetails[0].odDetailTotalPrice}" />

      <div class="form-group mb-3">
        <label>수령인</label>
        <input type="text" name="name" class="form-control" required>
      </div>
      <div class="form-group mb-3">
        <label>주소</label>
        <input type="text" name="addr" class="form-control" required>
      </div>
      <div class="form-group mb-3">
        <label>전화번호</label>
        <input type="text" name="tel" class="form-control" required>
      </div>
      <div class="form-group mb-4">
        <label>결제수단</label>
        <select name="odMethod" class="form-control">
          <option value="카드">카드</option>
          <option value="무통장입금">무통장입금</option>
          <option value="계좌이체">계좌이체</option>
        </select>
      </div>

      <button type="submit" class="btn btn-success w-100">결제하기</button>
    </form>
  </div>
</div>
