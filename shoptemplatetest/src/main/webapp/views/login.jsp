<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Login Page --%>
<div class="col-sm-9">
    <h2>Login Page</h2>
    <h5 style="padding-bottom: 60px">Input Id, Password</h5>
    <div class="row">
        <div class="col-sm-8">
            <form action="/loginimpl" method="post">
                <div class="form-group">
                    <label for="id">Id:</label>
                    <input type="text" value="admin" class="form-control" placeholder="Enter id" id="id" name="id">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" value="1234" class="form-control" placeholder="Enter password" id="pwd" name="pwd">
                </div>
                <button type="submit" class="btn btn-primary">LOGIN</button>
            </form>
        </div>
        <div class="col-sm-4">
            <c:choose>
                <c:when test="${loginstate == 'fail'}">
                    <h3>로그인 실패!</h3>
                </c:when>
                <c:otherwise>
                    <h3>ID와 PWD를 입력 하세요</h3>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>

