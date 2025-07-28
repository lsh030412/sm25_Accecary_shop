<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--&lt;%&ndash; Register Page &ndash;%&gt;--%>
<%--<div class="col-sm-12" style="margin-bottom: 200px">--%>
<%--  <h2>Register Page</h2>--%>
<%--  <form action="/mainregisterimpl" method="post">--%>
<%--    <div class="form-group">--%>
<%--      <label for="id">Id:</label>--%>
<%--      <input type="text" class="form-control" placeholder="Enter id" id="id" name="custId">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--      <label for="pwd">Password:</label>--%>
<%--      <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="custPwd">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--      <label for="name">Name:</label>--%>
<%--      <input type="text" class="form-control" placeholder="Enter name" id="name" name="custName">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--      <label for="pnum">Phone number:</label>--%>
<%--      <input type="text" class="form-control" placeholder="Enter Pnum" id="pnum" name="custPnum">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--      <label for="nickname">Nickname:</label>--%>
<%--      <input type="text" class="form-control" placeholder="Enter Nickname" id="nickname" name="custNick">--%>
<%--    </div>--%>
<%--    <button type="submit" class="btn btn-primary">Register</button>--%>
<%--  </form>--%>
<%--</div>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 85vh;">
  <div class="card p-5 shadow" style="width: 550px;">
    <h2 class="text-center mb-4">회원가입</h2>
    <form action="/mainregisterimpl" method="post">
      <div class="form-group mb-3">
        <label for="id">아이디</label>
        <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="id" name="custId">
      </div>
      <div class="form-group mb-3">
        <label for="pwd">비밀번호</label>
        <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="pwd" name="custPwd">
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
      <button type="submit" class="btn btn-primary w-100">회원가입</button>
    </form>
  </div>
</div>
