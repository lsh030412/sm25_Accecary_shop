<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Register Page --%>
<div class="col-sm-12" style="margin-bottom: 200px">
  <h2>Register Page</h2>
  <form action="/mainregisterimpl" method="post">
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" class="form-control" placeholder="Enter id" id="id" name="custId">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" placeholder="Enter password" id="pwd" name="custPwd">
    </div>
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" placeholder="Enter name" id="name" name="custName">
    </div>
    <div class="form-group">
      <label for="pnum">Phone number:</label>
      <input type="text" class="form-control" placeholder="Enter Pnum" id="pnum" name="custPnum">
    </div>
    <div class="form-group">
      <label for="nickname">Nickname:</label>
      <input type="text" class="form-control" placeholder="Enter Nickname" id="nickname" name="custNick">
    </div>
    <button type="submit" class="btn btn-primary">Register</button>
  </form>
</div>
