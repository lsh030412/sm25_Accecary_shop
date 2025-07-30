<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class ="col-sm-12">
  <h2>주문서 작성</h2>
  <c:if test="${not empty msg}">
    <div class="alert alert-danger">${msg}</div>
  </c:if>
  <p>상품: ${productName}</p>
  <p>현재 잔액: ${custMoney}원</p>
  <p>총 주문금액: ${totalPrice}원</p>
  <form action="/od/place" method="post">
    <input type="hidden" name="custId" value="${sessionScope.logincust.custId}" />
    <input type="hidden" name="odDetails[0].productId" value="${order.odDetails[0].productId}" />
    <input type="hidden" name="odDetails[0].odDetailQt" value="${order.odDetails[0].odDetailQt}" />
    <input type="hidden" name="odDetails[0].odDetailTotalPrice" value="${order.odDetails[0].odDetailTotalPrice}" />

    <div class="form-group">
      <label>수령인</label>
      <input type="text" name="name" class="form-control" required>
    </div>
    <div class="form-group">
      <label>주소</label>
      <input type="text" name="addr" class="form-control" required>
    </div>
    <div class="form-group">
      <label>전화번호</label>
      <input type="text" name="tel" class="form-control" required>
    </div>
    <div class="form-group">
      <label>결제수단</label>
      <select name="odMethod" class="form-control">
        <option value="카드">카드</option>
        <option value="무통장입금">무통장입금</option>
        <option value="계좌이체">계좌이체</option>
      </select>
    </div>

    <button type="submit" class="btn btn-success">결제하기</button>
  </form>
</div>
