<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let charge = {
        init: function () {
            const currentMoney = ${cust.custMoney}; // 현재 잔액

            $('#charge_btn').click(() => {
                let amount = Number($('#amount').val());
                let total = currentMoney + amount;

                if (isNaN(amount) || amount <= 0) {
                    alert("올바른 금액을 입력하세요.");
                    return;
                }

                if (total > 2100000000) {
                    $('#amount_error').show();
                    return;
                } else {
                    $('#amount_error').hide();
                }

                $('#charge_form').submit();
            });
        }
    }

    $().ready(() => {
        charge.init();
    })
</script>



<div class="col-sm-12">
    <h2>잔액 충전 페이지</h2>

    <!-- 에러 메시지 출력 영역 (서버에서 msg 모델로 전달되었을 경우) -->
    <c:if test="${not empty msg}">
        <div class="alert alert-danger">${msg}</div>
    </c:if>

    <form id="charge_form" method="post" action="/cust_get/chargeimpl">
        <div class="form-group">
            <label>현재 잔액: ${cust.custMoney}원</label>
        </div>
        <div class="form-group">
            <label for="amount">충전할 금액<p id="amount_error" style="color: red; display: none;">21억 이하로 충전이 가능합니다.</p></label>
            <input type="number" class="form-control" id="amount" name="amount" placeholder="원 단위로 입력">
        </div>
        <button type="button" class="btn btn-primary" id="charge_btn">충전하기</button>
    </form>
</div>


