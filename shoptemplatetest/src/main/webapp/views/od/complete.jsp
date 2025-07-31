<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class ="col-sm-12">
    <h2>주문이 완료되었습니다!</h2>
    <p>총 결제금액: ${totalPrice}원</p>
    <a href="/">홈으로 </a>
    <a href="/cust_get/myinfo?id=${sessionScope.logincust.custId}"> 마이페이지</a>
</div>
