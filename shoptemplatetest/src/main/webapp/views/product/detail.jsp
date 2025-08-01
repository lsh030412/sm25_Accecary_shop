<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
    let product_detail = {
        init:function(){
            $('#update_btn').click(()=>{
                if(confirm('수정 하시겠습니까 ?')){
                    $('#product_update_form').attr('method', 'post');
                    $('#product_update_form').attr('action','/product/updateimpl');
                    $('#product_update_form').attr('enctype','multipart/form-data');
                    $('#product_update_form').submit();
                }
            });
            $('#delete_btn').click(()=>{
                if(confirm('삭제 하시겠습니까 ?')){
                    location.href='/product/delete?id=${p.productId}';
                }
            });
        }
    }
    $().ready(()=>{
        product_detail.init();
    });
</script>

<div class="container d-flex justify-content-center align-items-center" style="min-height: 90vh;">
    <div class="card p-5 shadow" style="width: 600px;">
        <h2 class="text-center mb-4">상품 상세 정보</h2>

        <form id="product_update_form">
            <div class="mb-3 text-center">
                <img src="/imgs/${p.productImg}" alt="Product Image" class="img-fluid" style="max-height: 200px;">
            </div>

            <input type="hidden" name="productId" value="${p.productId}">
            <input type="hidden" value="${p.productImg}" name="productImg">

            <div class="form-group mb-3">
                <label for="id">상품 ID</label>
                <input type="text" class="form-control" value="${p.productId}" id="id" readonly>
            </div>

            <div class="form-group mb-3">
                <label for="name">상품명</label>
                <input type="text" class="form-control" value="${p.productName}" id="name" name="productName">
            </div>

            <div class="form-group mb-3">
                <label for="price">가격</label>
                <input type="number" class="form-control" value="${p.productPrice}" id="price" name="productPrice">
            </div>

            <div class="form-group mb-3">
                <label for="rate">할인율 (%)</label>
                <input type="text" class="form-control" value="${p.discountRate}" id="rate" name="discountRate">
            </div>

            <div class="form-group mb-3">
                <label for="newpimg">새 이미지 선택</label>
                <input type="file" class="form-control" id="newpimg" name="productImgFile">
            </div>

            <div class="form-group mb-3">
                <label for="cate">카테고리 ID</label>
                <input type="number" class="form-control" value="${p.cateId}" id="cate" name="cateId">
            </div>

            <div class="form-group mb-3">
                <label for="rdate">등록일</label>
                <p id="rdate" class="form-control-plaintext">
                    <fmt:parseDate value="${p.productRegdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" value="${parsedDateTime}" />
                </p>
            </div>

            <div class="form-group mb-4">
                <label for="udate">수정일</label>
                <p id="udate" class="form-control-plaintext">
                    <fmt:parseDate value="${p.productUpdate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both" />
                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" value="${parsedDateTime}" />
                </p>
            </div>

            <div class="d-flex justify-content-between">
                <button type="button" class="btn btn-primary w-45" id="update_btn">수정</button>
                <button type="button" class="btn btn-danger w-45" id="delete_btn">삭제</button>
            </div>
        </form>
    </div>
</div>
