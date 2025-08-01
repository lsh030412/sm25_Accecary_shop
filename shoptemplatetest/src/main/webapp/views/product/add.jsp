<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 85vh;">
  <div class="card p-5 shadow" style="width: 550px;">
    <h2 class="text-center mb-4">상품 등록</h2>

    <form action="/product/addimpl" method="post" enctype="multipart/form-data">
      <div class="form-group mb-3">
        <label for="cate">카테고리 ID</label>
        <input type="number" class="form-control" id="cate" name="cateId">
      </div>
      <div class="form-group mb-3">
        <label for="name">상품명</label>
        <input type="text" class="form-control" id="name" name="productName">
      </div>
      <div class="form-group mb-3">
        <label for="price">가격</label>
        <input type="number" class="form-control" id="price" name="productPrice">
      </div>
      <div class="form-group mb-3">
        <label for="rate">할인율 (%)</label>
        <input type="number" min="0" step="0.1" class="form-control" id="rate" name="discountRate">
      </div>
      <div class="form-group mb-3">
        <label for="Qt">수량</label>
        <input type="number" class="form-control" id="Qt" name="productQt">
      </div>
      <div class="form-group mb-4">
        <label for="pimg">상품 이미지</label>
        <input type="file" class="form-control" id="pimg" name="productImgFile">
      </div>
      <button type="submit" class="btn btn-secondary w-100">상품 등록</button>
    </form>
  </div>
</div>
