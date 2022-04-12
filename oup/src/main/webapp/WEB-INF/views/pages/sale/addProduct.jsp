<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>품목 등록</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	body {
  		font-size: 150%;
  	}
  	.form-control {
  		font-size: 100%;
	}
  </style>
<body class="hold-transition sidebar-mini">

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md">
          <div class="card card-primary">
            <div class="card-header">
              <h3>품목 등록</h3>
            </div>
            
            <div class="card-body">
           
            	<form method="post">
	              <div class="form-group">
	                <label>품목이름</label>
	                <input type="text" name="pName" class="form-control" placeholder="탄산수">
	              </div>
	              <div class="form-group">
	                <label>규격</label>
	                <input type="text" name="pStandard" class="form-control" placeholder="350ml">
	              </div>
	              <div class="form-group">
	                <label>재고수량</label>
	                <input type="number" name="pCount" class="form-control" placeholder="100">
	              </div>
	              <div class="form-group">
	                <label>단가</label>
	                <input type="number" name="pUnitPrice" class="form-control" placeholder="1500">
	              </div>
	              <!-- 공급가액 단가에서 부가세 10%를 뺀 금액 -->
	                <input type="hidden" name="pSupplyPrice" class="form-control" value="0">
	              <div class="form-group">
	                <label>적요</label>
	                <input type="text" name="pNote" class="form-control" placeholder="~~~ 100개 구입">
	              </div>
	              <div class="form-group">
	              <label>창고</label>
                  <select class="form-control select2 select2-purple" name="warehouseNo" data-dropdown-css-class="select2-purple" style="width: 100%;">
                	<c:forEach items="${wList}" var="l">
	                    <option>${l.warehouseNo}</option>
                	</c:forEach>
                  </select>
                </div>
	              <br><br>
	              <div class="form-group" style="float: right; margin-right: 20px;">
	                <button type="submit" class="btn btn-outline-primary btn-lg" >등록</button>
	                <button type="button" class="btn btn-outline-primary btn-lg" onclick="window.close()">취소</button>
	              </div>
              </form>
            </div>
          </div>
        </div>
        </div>
        </section>

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>

</body>
</html>
