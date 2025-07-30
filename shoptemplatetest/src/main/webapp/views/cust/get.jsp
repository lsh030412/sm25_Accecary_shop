<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--&lt;%&ndash; Center Page &ndash;%&gt;--%>
<%--<div class="col-sm-12">--%>
<%--  <h2>Cust Get Page</h2>--%>
<%--  <table class="table table-bordered">--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--      <th>Id</th>--%>
<%--      <th>Pwd</th>--%>
<%--      <th>Name</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody>--%>
<%--    <c:forEach var="c" items="${clist}">--%>
<%--      <tr>--%>
<%--        <td><a href="/cust_get/detail?id=${c.custId}">${c.custId}</a></td>--%>
<%--        <td>${c.custPwd}</td>--%>
<%--        <td>${c.custName}</td>--%>
<%--      </tr>--%>
<%--    </c:forEach>--%>
<%--    </tbody>--%>
<%--  </table>--%>
<%--</div>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container" style="min-height: 80vh;">
  <div class="card p-4 shadow">
    <h2 class="text-center mb-4">고객 목록</h2>

    <table class="table table-hover text-center align-middle">
      <thead class="table-light">
      <tr>
        <th>ID</th>
        <th>비밀번호</th>
        <th>이름</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="c" items="${clist}">
        <tr>
          <td>
            <a href="/cust_get/detail?id=${c.custId}" class="text-decoration-none">${c.custId}</a>
          </td>
          <td>${c.custPwd}</td>
          <td>${c.custName}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>