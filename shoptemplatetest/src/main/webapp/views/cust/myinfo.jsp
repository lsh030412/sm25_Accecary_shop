<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  let custDetail = {
    init:function() {
      // 폼과 폼사이의 데이트 전송
      $('#cust_update_form > #update_btn').click(()=>{
        let c = confirm("수정 하시겠습니까 ?");
        if(c == true){
          $('#cust_update_form').attr("method", "post");
          $('#cust_update_form').attr("action", "/cust_get/updateimpl");
          $('#cust_update_form').submit();
        }
      });
      // 아이디만 전송하면 됨
      $('#cust_update_form > #delete_btn').click(()=>{
        let c = confirm("삭제하시겠습니까?");
        if(c == true) {
          let id = $('#id').val();
          location.href='/cust_get/delete?id='+id;
        }
      });
    }
  }
  $().ready(()=> {
    custDetail.init();
  })
</script>
<%-- detail Page --%>
<div class="col-sm-12">
  <h2>Cust Detail Page</h2>
  <form id="cust_update_form">
    <div class="form-group">
      <label for="id">Id:</label>
      <input type="text" readonly value="${cust.custId}" class="form-control" placeholder="Enter id" id="id" name="custId">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" value="${cust.custPwd}" class="form-control" placeholder="Enter password" id="pwd" name="custPwd">
    </div>
    <div class="form-group">
      <label for="pwd">Name:</label>
      <input type="text" value="${cust.custName}" class="form-control" placeholder="Enter name" id="name" name="custName">
    </div>
    <div class="form-group">
      <label for="nick">Nick:</label>
      <input type="text" value="${cust.custNick}" class="form-control" placeholder="Enter name" id="nick" name="custNick">
    </div>
    <div class="form-group">
      <label for="pnum">Phone number:</label>
      <input type="text" value="${cust.custPnum}" class="form-control" placeholder="Enter name" id="pnum" name="custPnum">
    </div>
    <button type="button" class="btn btn-primary" id="update_btn">Update</button>
    <button type="button" class="btn btn-primary" id="delete_btn">Delete</button>
    <button type="button"
            class="btn btn-primary"
            onclick="location.href='${pageContext.request.contextPath}/cust_get/charge?id=${sessionScope.logincust.custId}'">
      charge
    </button>
  </form>
</div>