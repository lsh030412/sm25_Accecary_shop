<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-12 text-center my-5">
  <h2>주문이 완료되었습니다!</h2>
  <p>총 결제금액: <strong>${totalPrice}원</strong></p>
  <a href="${pageContext.request.contextPath}/" class="btn btn-primary m-2">홈으로</a>
  <a href="${pageContext.request.contextPath}/cust_get/myinfo?id=${sessionScope.logincust.custId}"
     class="btn btn-secondary m-2">마이페이지</a>
</div>
