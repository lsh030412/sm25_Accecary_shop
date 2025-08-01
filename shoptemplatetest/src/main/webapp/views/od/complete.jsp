<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
    <div class="card p-5 shadow text-center" style="width: 500px;">
        <h2 class="mb-4 text-success">주문이 완료되었습니다!</h2>
        <p class="mb-4">
            <strong>총 결제금액:</strong>
            <span class="text-primary">
        <fmt:formatNumber value="${totalPrice}" type="number" pattern="###,###"/>원
      </span>
        </p>

        <div class="d-flex justify-content-around">
            <a href="/" class="btn btn-outline-secondary">홈으로</a>
            <a href="/cust_get/myinfo?id=${sessionScope.logincust.custId}" class="btn btn-primary">마이페이지</a>
        </div>
    </div>
</div>
