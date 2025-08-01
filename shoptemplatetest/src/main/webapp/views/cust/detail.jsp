<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let custDetail = {
    init:function() {
      $('#cust_update_form > #update_btn').click(()=>{
        if(confirm("수정 하시겠습니까 ?")) {
          $('#cust_update_form').attr("method", "post");
          $('#cust_update_form').attr("action", "/cust_get/updateimpl");
          $('#cust_update_form').submit();
        }
      });
      $('#cust_update_form > #delete_btn').click(()=>{
        if(confirm("삭제하시겠습니까?")) {
          let id = $('#id').val();
          location.href='/cust_get/delete?id='+id;
        }
      });
    }
  }
  $().ready(()=> {
    custDetail.init();
  })
</script>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 85vh;">
  <div class="card p-5 shadow" style="width: 550px;">
    <h2 class="text-center mb-4">고객 정보 수정</h2>
    <form id="cust_update_form">
      <div class="form-group mb-3">
        <label for="id">아이디</label>
        <input type="text" readonly value="${cust.custId}" class="form-control" id="id" name="custId">
      </div>
      <div class="form-group mb-3">
        <label for="pwd">비밀번호</label>
        <input type="password" value="${cust.custPwd}" class="form-control" id="pwd" name="custPwd">
      </div>
      <div class="form-group mb-3">
        <label for="name">이름</label>
        <input type="text" value="${cust.custName}" class="form-control" id="name" name="custName">
      </div>
      <div class="form-group mb-3">
        <label for="nick">닉네임</label>
        <input type="text" value="${cust.custNick}" class="form-control" id="nick" name="custNick">
      </div>
      <div class="form-group mb-3">
        <label for="pnum">전화번호</label>
        <input type="text" value="${cust.custPnum}" class="form-control" id="pnum" name="custPnum">
      </div>
      <div class="form-group mb-4">
        <label for="money">보유 금액</label>
        <input type="text" value="${cust.custMoney}" class="form-control" id="money" name="custMoney">
      </div>
      <div class="d-flex justify-content-between">
        <button type="button" class="btn btn-primary w-45" id="update_btn">수정</button>
        <button type="button" class="btn btn-danger w-45" id="delete_btn">삭제</button>
      </div>
    </form>
  </div>
</div>