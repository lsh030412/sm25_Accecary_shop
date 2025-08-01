<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
  .alert-danger {
    padding: 10px;
    margin-bottom: 15px;
  }
</style>

<script>
  $().ready(function () {
    $('#registerForm').submit(function (e) {
      let valid = true;
      let errorMsg = '';
      let id = $('#id').val().trim();
      let pwd = $('#pwd').val().trim();
      let cpwd = $('#cpwd').val().trim();
      let name = $('#name').val().trim();
      let pnum = $('#pnum').val().trim();
      let nick = $('#nickname').val().trim();

      if (id === '') {
        errorMsg = '회원가입 실패: 아이디는 필수 항목입니다.';
        valid = false;
      } else if (pwd === '') {
        errorMsg = '회원가입 실패: 비밀번호는 필수 항목입니다.';
        valid = false;
      } else if (cpwd === '') {
        errorMsg = '회원가입 실패: 비밀번호 확인은 필수 항목입니다.';
        valid = false;
      } else if (pwd !== cpwd) {
        errorMsg = '회원가입 실패: 비밀번호가 일치하지 않습니다.';
        valid = false;
      } else if (name === '') {
        errorMsg = '회원가입 실패: 이름은 필수 항목입니다.';
        valid = false;
      } else if (pnum === '') {
        errorMsg = '회원가입 실패: 전화번호는 필수 항목입니다.';
        valid = false;
      } else if (nick === '') {
        errorMsg = '회원가입 실패: 닉네임은 필수 항목입니다.';
        valid = false;
      }

      if (!valid) {
        e.preventDefault();
        $('#alertBox').html('<div class="alert alert-danger" role="alert">' + errorMsg + '</div>');
      }
    });
  });
</script>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 85vh;">
  <div class="card p-5 shadow" style="width: 550px;">
    <h2 class="text-center mb-4">회원가입</h2>
    <form id="registerForm" action="/mainregisterimpl" method="post">
      <div class="form-group mb-3">
        <label for="id">아이디</label>
        <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="id" name="custId">
      </div>
      <div class="form-group mb-3">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="pwd" name="custPwd">
      </div>
      <div class="form-group mb-3">
        <label for="cpwd">비밀번호 확인</label>
        <input type="password" class="form-control" placeholder="비밀번호를 다시 입력하세요" id="cpwd">
      </div>
      <div class="form-group mb-3">
        <label for="name">이름</label>
        <input type="text" class="form-control" placeholder="이름을 입력하세요" id="name" name="custName">
      </div>
      <div class="form-group mb-3">
        <label for="pnum">전화번호</label>
        <input type="text" class="form-control" placeholder="010-0000-0000" id="pnum" name="custPnum">
      </div>
      <div class="form-group mb-4">
        <label for="nickname">닉네임</label>
        <input type="text" class="form-control" placeholder="닉네임을 입력하세요" id="nickname" name="custNick">
      </div>
      <div id="alertBox"></div>
      <button type="submit" class="btn btn-secondary w-100">회원가입</button>
    </form>
  </div>
</div>