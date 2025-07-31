<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    (function(){
        var total = ${totalPrice};
        var money = ${custMoney};
        var msgElem = document.getElementById('balanceError');
        var submitBtn = document.getElementById('submitBtn');
        // 잔액 부족 체크
        if (total > money) {
            msgElem.innerText = '결제금액이 잔액보다 큽니다.';
            msgElem.style.display = 'block';
            submitBtn.disabled = true;
        }
        // 폼 제출 차단
        document.getElementById('orderForm').addEventListener('submit', function(e){
            if (total > money) e.preventDefault();
        });
    })();
</script>

<div class="container my-5">
    <h2 class="text-center mb-4">장바구니 주문서</h2>
    <c:if test="${not empty msg}">
        <div class="alert alert-danger">${msg}</div>
    </c:if>
    <div class="mb-3">
        <p>현재 잔액: <strong><fmt:formatNumber value="${custMoney}" pattern="#,###원"/></strong></p>
        <p>총 결제금액: <strong><fmt:formatNumber value="${totalPrice}" pattern="#,###원"/></strong></p>
        <!-- 잔액 부족 알림 -->
        <p id="balanceError" class="text-danger" style="display:none; margin-top:8px;"></p>
    </div>

    <form id="orderForm" action="${pageContext.request.contextPath}/cart/order" method="post">
        <c:forEach var="d" items="${order.odDetails}">
            <input type="hidden" name="productId" value="${d.productId}" />
            <input type="hidden" name="odDetailQt" value="${d.odDetailQt}" />
            <input type="hidden" name="odDetailTotalPrice" value="${d.odDetailTotalPrice}" />
        </c:forEach>

        <div class="mb-3">
            <label for="name">수령인</label>
            <input type="text" id="name" name="name" class="form-control" required />
        </div>
        <div class="mb-3">
            <label for="addr">주소</label>
            <input type="text" id="addr" name="addr" class="form-control" required />
        </div>
        <div class="mb-3">
            <label for="tel">전화번호</label>
            <input type="text" id="tel" name="tel" class="form-control" required />
        </div>
        <div class="mb-3">
            <label for="odMethod">결제수단</label>
            <select id="odMethod" name="odMethod" class="form-control" required>
                <option value="CARD">카드</option>
                <option value="BANK">무통장입금</option>
                <option value="PHONE">휴대폰결제</option>
            </select>
        </div>

        <button type="submit" id="submitBtn" class="btn btn-success btn-block btn-lg">결제하기</button>
    </form>
</div>