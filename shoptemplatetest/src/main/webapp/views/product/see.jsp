<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<script>--%>
<%--  let see = {--%>
<%--    init:function() {--%>
<%--      $('#down_btn').click(()=>{--%>
<%--        let cnt = Number($('#cnt').val());--%>
<%--        if(cnt > 0) {--%>
<%--          cnt = cnt - 1;--%>
<%--          let total = cnt * ${p.productPrice};--%>

<%--          $('#total').text(total.toLocaleString('ko-KR') + '원');--%>
<%--          $('#total').val(total);--%>
<%--          $('#cnt').val(cnt);--%>
<%--        }--%>
<%--      });--%>
<%--      $('#up_btn').click(()=>{--%>
<%--        let cnt = Number($('#cnt').val());--%>
<%--        cnt = cnt + 1;--%>
<%--        let total = cnt * ${p.productPrice};--%>
<%--        $('#total').text(total.toLocaleString('ko-KR') + '원');--%>
<%--        $('#total').val(total);--%>
<%--        $('#cnt').val(cnt);--%>
<%--      });--%>
<%--      $('#add_btn').click(()=>{--%>
<%--        let productId = ${p.productId};--%>
<%--        let custId = '${sessionScope.logincust.custId}';--%>
<%--        let cnt = $('#cnt').val();--%>

<%--        $('#myModal').modal('hide');--%>

<%--        $.ajax({--%>
<%--          url:'/cart/addcart',--%>

<%--          data:{custId:custId, productId:productId, productQt:cnt},--%>
<%--          success:(result) => {--%>
<%--            result ? alert('OK') : alert('FAIL') ;--%>
<%--          }--%>
<%--        });--%>

<%--      });--%>
<%--      $('#go_btn').click(()=>{--%>
<%--        let productId = ${p.productId};--%>
<%--        let custId = '${sessionScope.logincust.custId}';--%>
<%--        let cnt = $('#cnt').val();--%>
<%--        location.href = '/cart/add?custId=' + custId--%>
<%--                + '&productId=' + productId--%>
<%--                + '&productQt=' + cnt;--%>
<%--      });--%>
<%--    },--%>


<%--  }--%>



<%--  $().ready(()=>{--%>
<%--    see.init();--%>
<%--  });--%>

<%--</script>--%>
<%--<div class="col-sm-12">--%>


<%--  <h2>ProductItem See Page</h2>--%>

<%--  <div class="row">--%>
<%--    <div class="col-sm-6">--%>
<%--      <img src="/imgs/${p.productImg}" width="500px" height="500px">--%>
<%--      <h3>${p.productId}</h3>--%>
<%--      <h3>${p.cateName}</h3>--%>
<%--      <h3>${p.productName}</h3>--%>
<%--      <h3><fmt:formatNumber type="number" pattern="###,###원" value="${p.productPrice}" /></h3>--%>
<%--      <h3>${p.discountRate}</h3>--%>
<%--      <h3>${p.productExp}</h3>--%>
<%--      <h3><fmt:parseDate value="${ p.productRegdate }"--%>
<%--                         pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />--%>
<%--        <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />--%>
<%--      </h3>--%>
<%--    </div>--%>
<%--    <div class="col-sm-6">--%>
<%--      <h2>Total: <span id="total">0</span></h2>--%>
<%--      <div class="row" style="margin-bottom : 30px;">--%>
<%--        <div class="col-sm-2"><button type="button" class="btn btn-secondary" id="down_btn">down</button></div>--%>
<%--        <div class="col-sm-2"><input type="number" value="0" class="form-control" id="cnt"></div>--%>
<%--        <div class="col-sm-2"><button type="button" class="btn btn-secondary" id="up_btn">up</button></div>--%>
<%--      </div>--%>
<%--      <button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#myModal">Cart</button>--%>

<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>






<%--<!-- The Modal -->--%>
<%--<div class="modal fade" id="myModal">--%>
<%--  <div class="modal-dialog modal-dialog-centered">--%>
<%--    <div class="modal-content">--%>

<%--      <!-- Modal Header -->--%>
<%--      <div class="modal-header">--%>
<%--        <h4 class="modal-title">장바구니에 넣으시겠습니까?</h4>--%>
<%--        <button type="button" class="close" data-dismiss="modal">&times;</button>--%>
<%--      </div>--%>

<%--      <!-- Modal body -->--%>
<%--      <div class="modal-body">--%>
<%--        <div style="margin-bottom: 10px;">Add Cart : 계속 쇼핑합니다.</div>--%>
<%--        Go Cart : 장바구니로 이동합니다.--%>
<%--      </div>--%>

<%--      <!-- Modal footer -->--%>
<%--      <div class="modal-footer">--%>
<%--        <button type="button" class="btn btn-danger" data-dismiss="modal" id="add_btn">Add Cart</button>--%>
<%--        <button type="button" class="btn btn-danger" data-dismiss="modal" id="go_btn">Go Cart</button>--%>
<%--        <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>--%>
<%--      </div>--%>

<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
  .product-info h4, .product-info p {
    margin-bottom: 12px;
  }
  .quantity-control input {
    text-align: center;
  }
  .action-buttons .btn {
    margin: 5px;
    width: 120px;
  }
  .original-price {
    text-decoration: line-through;
    color: gray;
  }
</style>

<script>
  let see = {
    init: function () {
      const originPrice = ${p.productPrice};
      const discountRate = ${p.discountRate};
      const unitPrice = Math.round(originPrice * (1 - discountRate / 100));

      // 초기 할인가 표시
      $('#salePrice').text(unitPrice.toLocaleString('ko-KR') + '원');

      $('#down_btn').click(() => {
        let cnt = Number($('#cnt').val());
        if (cnt > 0) {
          cnt--;
          let total = cnt * unitPrice;
          $('#total').text(total.toLocaleString('ko-KR') + '원');
          $('#cnt').val(cnt);
        }
      });

      $('#up_btn').click(() => {
        let cnt = Number($('#cnt').val());
        cnt++;
        let total = cnt * unitPrice;
        $('#total').text(total.toLocaleString('ko-KR') + '원');
        $('#cnt').val(cnt);
      });

      $('#add_btn').click(() => {
        let productId = ${p.productId};
        let custId = '${sessionScope.logincust.custId}';
        let cnt = $('#cnt').val();
        $('#myModal').modal('hide');

        $.ajax({
          url: '/cart/addcart',
          data: { custId: custId, productId: productId, productQt: cnt },
          success: (result) => {
            result ? alert('장바구니에 추가되었습니다!') : alert('실패했습니다');
          }
        });
      });

      $('#go_btn').click(() => {
        let productId = ${p.productId};
        let custId = '${sessionScope.logincust.custId}';
        let cnt = $('#cnt').val();
        location.href = '/cart/add?custId=' + custId + '&productId=' + productId + '&productQt=' + cnt;
      });

      $('#order_btn').click(() => {
        alert("주문 기능은 곧 추가됩니다!");
      });
    }
  }

  $().ready(() => {
    see.init();
  });
</script>

<div class="container mt-5" style="min-height: 80vh;">
  <div class="card p-4 shadow">
    <h2 class="text-center mb-4">상품 상세</h2>
    <div class="row">
      <!-- 상품 이미지 -->
      <div class="col-md-6 text-center mb-4">
        <img src="/imgs/${p.productImg}" class="img-fluid rounded shadow-sm" style="max-height: 400px;">
      </div>

      <!-- 텍스트 정보 -->
      <div class="col-md-6 product-info">
        <h3><b>${p.productName}</b></h3>
        <h5 class="text-muted">카테고리: ${p.cateName}</h5>

        <!-- 가격 영역 -->
        <h4 class="original-price">정가: <fmt:formatNumber value="${p.productPrice}" pattern="#,###원"/></h4>
        <h4 class="text-success">할인가: <span id="salePrice"></span></h4>
        <p class="text-secondary">할인율: ${p.discountRate}%</p>

        <p><strong>설명:</strong><br>${p.productExp}</p>
        <p class="text-muted">
          <fmt:parseDate value="${p.productRegdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
          등록일: <fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDateTime}" />
        </p>

        <!-- 수량 및 총 가격 -->
        <div class="mt-4 text-center">
          <h5>총 가격: <span id="total" class="text-primary font-weight-bold">0원</span></h5>
          <div class="d-flex justify-content-center align-items-center quantity-control mt-2 mb-3">
            <button class="btn btn-outline-secondary" id="down_btn">-</button>
            <input type="number" class="form-control mx-2" value="0" id="cnt" style="width: 80px;">
            <button class="btn btn-outline-secondary" id="up_btn">+</button>
          </div>

          <!-- 장바구니/주문 버튼 -->
          <div class="action-buttons">
            <button class="btn btn-warning" data-toggle="modal" data-target="#myModal">Cart</button>
            <button class="btn btn-info" id="order_btn">주문하기</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- 장바구니 모달 -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <div class="modal-header">
        <h5 class="modal-title">장바구니 담기</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <div class="modal-body text-center">
        <p>계속 쇼핑하시겠습니까?</p>
        <p class="text-muted">※ Add Cart : 쇼핑 계속<br>※ Go Cart : 장바구니로 이동</p>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="add_btn">Add Cart</button>
        <button type="button" class="btn btn-primary" id="go_btn">Go Cart</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>