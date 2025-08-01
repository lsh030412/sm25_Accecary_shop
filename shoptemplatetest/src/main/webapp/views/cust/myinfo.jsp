<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let custDetail = {
    init: function () {
      $('#cust_update_form > #update_btn').click(() => {
        if (confirm("수정 하시겠습니까?")) {
          $('#cust_update_form').attr("method", "post");
          $('#cust_update_form').attr("action", "/cust_get/updateimpl");
          $('#cust_update_form').submit();
        }
      });

      $('#cust_update_form > #delete_btn').click(() => {
        if (confirm("삭제하시겠습니까?")) {
          let id = $('#id').val();
          location.href = '/cust_get/delete?id=' + id;
        }
      });
    }
  };
  $().ready(() => {
    custDetail.init();
  });
</script>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 85vh;">
  <div class="card p-5 shadow" style="width: 550px;">
    <h2 class="text-center mb-4">내 정보 수정</h2>
    <form id="cust_update_form">
      <div class="form-group mb-3">
        <label for="id">아이디</label>
        <input type="text" readonly class="form-control" id="id" name="custId" value="${cust.custId}">
      </div>
      <div class="form-group mb-3">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" id="pwd" name="custPwd" value="${cust.custPwd}">
      </div>
      <div class="form-group mb-3">
        <label for="name">이름</label>
        <input type="text" class="form-control" id="name" name="custName" value="${cust.custName}">
      </div>
      <div class="form-group mb-3">
        <label for="nick">닉네임</label>
        <input type="text" class="form-control" id="nick" name="custNick" value="${cust.custNick}">
      </div>
      <div class="form-group mb-3">
        <label for="pnum">전화번호</label>
        <input type="text" class="form-control" id="pnum" name="custPnum" value="${cust.custPnum}">
      </div>

      <div class="d-grid gap-2">
        <button type="button" class="btn btn-secondary" id="update_btn">정보 수정</button>
        <button type="button" class="btn btn-danger" id="delete_btn">회원 탈퇴</button>
        <button type="button"
                class="btn btn-info text-white"
                onclick="location.href='${pageContext.request.contextPath}/cust_get/charge?id=${sessionScope.logincust.custId}'">
          포인트 충전
        </button>
      </div>
    </form>
  </div>
</div>
