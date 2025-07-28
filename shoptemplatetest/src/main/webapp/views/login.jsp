<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>

<%--&lt;%&ndash; Login Page &ndash;%&gt;--%>
<%--<div class="col-sm-12" style="margin-bottom: 320px">--%>
<%--    <h2>Login Page</h2>--%>
<%--    <h5 style="padding-bottom: 60px">Input Id, Password</h5>--%>
<%--    <div class="row">--%>
<%--        <div class="col-sm-8">--%>
<%--            <form action="/loginimpl" method="post">--%>
<%--                <div class="form-group">--%>
<%--                    <label for="id">Id:</label>--%>
<%--                    <input type="text" value="admin" class="form-control" placeholder="Enter id" id="id" name="id">--%>
<%--                </div>--%>
<%--                <div class="form-group">--%>
<%--                    <label for="pwd">Password:</label>--%>
<%--                    <input type="password" value="1234" class="form-control" placeholder="Enter password" id="pwd" name="pwd">--%>
<%--                </div>--%>
<%--                <button type="submit" class="btn btn-primary">LOGIN</button>--%>
<%--            </form>--%>
<%--        </div>--%>
<%--        <div class="col-sm-4">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${loginstate == 'fail'}">--%>
<%--                    <h3>로그인 실패!</h3>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <h3>ID와 PWD를 입력 하세요</h3>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 70vh;">
    <div class="card p-5 shadow" style="width: 500px;">
        <h2 class="text-center mb-4">로그인</h2>
        <form action="/loginimpl" method="post">
            <div class="form-group mb-3">
                <label for="id">아이디</label>
                <input type="text" value="admin" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요">
            </div>
            <div class="form-group mb-4">
                <label for="pwd">비밀번호</label>
                <input type="password" value="1234" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
            </div>
            <button type="submit" class="btn btn-primary w-100">로그인</button>
        </form>

        <div class="mt-4 text-center">
            <c:choose>
                <c:when test="${loginstate == 'fail'}">
                    <div class="alert alert-danger" role="alert">
                        로그인 실패! 아이디 또는 비밀번호를 확인하세요.
                    </div>
                </c:when>
                <c:otherwise>
                    <small class="text-muted">아이디와 비밀번호를 입력해 주세요</small>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
