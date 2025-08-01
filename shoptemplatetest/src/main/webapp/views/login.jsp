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
            <button type="submit" class="btn btn-secondary w-100">로그인</button>
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
