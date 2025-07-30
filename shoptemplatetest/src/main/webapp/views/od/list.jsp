<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container mt-5">
  <h2 class="mb-4">주문 내역</h2>
  <table class="table table-striped">
    <thead>
    <tr>
      <th>주문번호</th>
      <th>결제수단</th>
      <th>상태</th>
      <th>총수량</th>
      <th>수령인</th>
      <th>주소</th>
      <th>전화번호</th>
      <th>주문일시</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="o" items="${odList}">
      <tr>
        <td>${o.odId}</td>
        <td>${o.odMethod}</td>
        <td>${o.odStatus}</td>
        <td>${o.odQt}</td>
        <td>${o.name}</td>
        <td>${o.addr}</td>
        <td>${o.tel}</td>
        <td><fmt:formatDate value="${o.odDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>