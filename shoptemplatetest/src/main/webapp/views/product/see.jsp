<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
  let see = {
    init:function() {
      $('#down_btn').click(()=>{
        let cnt = Number($('#cnt').val());
        if(cnt > 0) {
          cnt = cnt - 1;
          let total = cnt * ${p.productPrice};

          $('#total').text(total.toLocaleString('ko-KR') + '원');
          $('#total').val(total);
          $('#cnt').val(cnt);
        }
      });
      $('#up_btn').click(()=>{
        let cnt = Number($('#cnt').val());
        cnt = cnt + 1;
        let total = cnt * ${p.productPrice};
        $('#total').text(total.toLocaleString('ko-KR') + '원');
        $('#total').val(total);
        $('#cnt').val(cnt);
      });
      $('#add_btn').click(()=>{
        let productId = ${p.productId};
        let custId = '${sessionScope.logincust.custId}';
        let cnt = $('#cnt').val();

        $('#myModal').modal('hide');

        $.ajax({
          url:'/addcart',

          data:{custId:custId, productId:productId, productQt:cnt},
          success:(result) => {
            result ? alert('OK') : alert('FAIL') ;
          }
        });

      });
      $('#go_btn').click(()=>{
        let productId = ${p.productId};
        let custId = '${sessionScope.logincust.custId}';
        let cnt = $('#cnt').val();
        location.href = '/cart/add?custId=' + custId
                + '&productId=' + productId
                + '&productQt=' + cnt;
      });
    },


  }



  $().ready(()=>{
    see.init();
  });

</script>
<div class="col-sm-12">


  <h2>ProductItem See Page</h2>

  <div class="row">
    <div class="col-sm-6">
      <img src="/imgs/${p.productImg}" width="500px" height="500px">
      <h3>${p.productId}</h3>
      <h3>${p.cateName}</h3>
      <h3>${p.productName}</h3>
      <h3><fmt:formatNumber type="number" pattern="###,###원" value="${p.productPrice}" /></h3>
      <h3>${p.discountRate}</h3>
      <h3><fmt:parseDate value="${ p.productRegdate }"
                         pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
        <fmt:formatDate pattern="yyyy-MM-dd" value="${ parsedDateTime }" />
      </h3>
    </div>
    <div class="col-sm-6">
      <h2>Total: <span id="total">0</span></h2>
      <div class="row" style="margin-bottom : 30px;">
        <div class="col-sm-2"><button type="button" class="btn btn-secondary" id="down_btn">down</button></div>
        <div class="col-sm-2"><input type="number" value="0" class="form-control" id="cnt"></div>
        <div class="col-sm-2"><button type="button" class="btn btn-secondary" id="up_btn">up</button></div>
      </div>
      <button type="button" class="btn btn-secondary"  data-toggle="modal" data-target="#myModal">Cart</button>
    </div>
  </div>
</div>






<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">장바구니에 넣으시겠습니까?</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div style="margin-bottom: 10px;">Add Cart : 계속 쇼핑합니다.</div>
        Go Cart : 장바구니로 이동합니다.
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="add_btn">Add Cart</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" id="go_btn">Go Cart</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" >Close</button>
      </div>

    </div>
  </div>
</div>