<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Projects</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css" integrity="sha384-ejwKkLla8gPP8t2u0eQyL0Q/4ItcnyveF505U0NIobD/SMsNyXrLti6CWaD0L52l" crossorigin="anonymous">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap');
  body{font-family: 'Nanum Gothic', sans-serif;}
  </style>

</head>
<body class="hold-transition sidebar-mini layout-fixed">
 
<!-- Site wrapper -->
<div class="wrapper">
  <%@ include file="../../common/menubar-sidebar.jsp" %>

  <!-- Main Sidebar Container -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>주문조회</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card"></div>
        <div class="card-body p-0">
			<form action="${path}/order/list" method="post">
	          <div class="row" style="background-color: rgb(204, 173, 173); margin: 20px; padding: 6px;" class="well well-lg">
	                <div class="col-sm-1 mt-3" style="padding:5px;"><b>여신기간</b></div>
	                <div class="col-sm-1"></div>
	                <div class="col-sm-4">  
	                  <div class="col">
	                    <input type="date" class="form-control mb-3 mt-3" id="orderDate" name="oDateStr">
	                  </div>
	                </div>
	
	               <div class="col-sm-1 mt-3" style="padding:5px;"><b>거래처</b></div>
	                <div class="col-sm-1"></div>
	                <div class="col-sm-4">                  
	                  <div class="input-group col mt-3">
	                    <input type="text" class="form-control" id="clientText" placeholder="거래처">
	                    <button type="button" class="input-group-text" onclick="goPopup()"><i class="bi bi-search"></i></button>
	                    <input type="text" class="form-control" id="client" name="client" readonly>
	                    <input type="hidden" id="clientNo" name="cNo" value="0">
	                  </div>
	                </div>
	                
	               <div class="col-sm-1" style="padding:5px;"><b>담당자</b></div>
	                <div class="col-sm-1"></div>
	                <div class="col-sm-4">
	                  <div class="input-group col mb-3">
	                    <input type="text" class="form-control" id="ownerText"  placeholder="담당자">
	                    <button type="button" class="input-group-text" onclick="employeePopup();"><i class="bi bi-search"></i></button>
	                    <input type="text" class="form-control" id="employeeName" readonly>
	                    <input type="hidden" id="employeeNo" name="employeeNo" value="0">
	                    <input type="hidden" id="teamCode">
	                  </div>
	                </div>
	                
	                <div class="col-sm-1" style="padding:5px;"><b>제품명</b></div>
	                <div class="col-sm-1"></div>
	                <div class="col-sm-4">
	                  <div class="input-group col mb-3">
		                <input type="text" class="form-control" id="productName" placeholder="제품명">
		                <button type="button" class="input-group-text" onclick="productPopup(1);"><i class="bi bi-search"></i></button>
	                    <input type="text" class="form-control" id="productName1" readonly>
	                    <input type="hidden" id="productNo1" name="pNo" value="0">
	                  </div>
	                </div>
	                
	               <div class="col-sm-1" style="padding:5px;"><b>프로젝트</b></div>
		            <div class="col-sm-1"></div>
		            <div class="col-sm-4">
		               <div class="input-group col mb-3">
		                  <input type="text" name="projectSearch" id="projectSearch" class="form-control" placeholder="프로젝트">
		                   <button type="button" onclick="projectPopup()" class="input-group-text"><i class="bi bi-search"></i></button>
		                   <input type="text" id="projectName" class="form-control" readonly>
		                   <input type="hidden" id="projectNo" name="projectNo" class="form-control" value="0">
		               </div>
		            </div>
	
	                 <div class="col-sm-1" style="padding:5px;"><b>출하창고</b>
	                </div><div class="col-sm-1"></div>
	                <div class="col-sm-4">
	                  <div class="input-group col">
	                    <input type="text" class="form-control" placeholder="출하창고" id="wareText">
	                    <button type="button" class="input-group-text" onclick="warehousePopup();"><i class="bi bi-search"></i></button>
	                    <input type="text" class="form-control" id="warehouseName" readonly>
	                    <input type="hidden" id="price1">
	                    <input type="hidden" name="warehouseNo" id="warehouseNo" value="0">
	                  </div>
	                </div>
	
					<button class="btn-secondary input-group-text mb-2 mt-3" onclick="searchOrder();"><i class="bi bi-search" style="margin:auto;"></i></button>
	          </div>
	          
	          <table class="table table-bordered projects">
	              <thead>
	                  <tr>
	                      <th style="width: 2%">
	                      </th>
	                      <th style="width: 10%" class="text-center">
	                          거래처코드
	                      </th>
	                      <th style="width: 10%" class="text-center">
	                          담당자번호
	                      </th>
	                      <th style="width: 13%" class="text-center">
	                          출하창고
	                      </th>
	                      <th style="width: 20%" class="text-center">
	                        프로젝트번호
	                      </th>
	                      <th style="width: 10%" class="text-center">
	                         결재상태
	                      </th>
	                      <th style="width: 35%" class="text-center">
	                        여신기한
	                      </th>
	                  </tr>
	              </thead>
	              <tbody>
	              	<c:forEach items="${list}" var="l">				
						<tr>
							<td><input type="checkbox" class="checkbox-no" value="${l.ONo}"></td>
							<td class="text-center">${l.CNo}</td>
							<td class="text-center">${l.employeeNo}</td>
							<td class="text-center">${l.projectNo}</td>
							<td class="text-center">${l.warehouseNo}</td>
							<td class="text-center">${l.OStatement}</td>
							<td class="text-center">
								<fmt:formatDate value="${l.ODate}" pattern="yyyy-MM-dd"/> ~ <fmt:formatDate value="${l.creditDate}" pattern="yyyy-MM-dd"/>
							</td>
						</tr>
					</c:forEach>
	              </tbody>
          	  </table>
	
	          <div style="margin: 10px;">
	            <button type="button" class="btn btn-secondary btn-sm" onclick="changeOrder()">변경</button>
	            <button type="button" class="btn btn-secondary btn-sm">결재신청</button>
	            <button type="reset" class="btn btn-secondary btn-sm">다시작성</button>
	            <button type="button" class="btn btn-secondary btn-sm">상세보기</button>
	          </div>
	        </form>
	    </div>
        <!-- /.card-body -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0-rc
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
<!-- ./wrapper -->
</div>
<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>

<script>
	var index = 1;
	
	var goPopup = function(){ 
		let oDate = document.getElementById("orderDate").value;
		let clientText = document.getElementById("clientText").value;
		var search = window.open("${path}/client/searchClient?search="+clientText,"search","width=720,height=500, scrollbars=no, resizable=no"); 
	} 
	
	var employeePopup = function() { 
		var url = "${path}/popup";
		var windowTargetName = "employee";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	} 
	
	var warehousePopup = function() {
		var url = "${path}/popup/warehouseList";
		var windowTargetName = "warehouse";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	var projectPopup = function() {
		var url = "${path}/popup/projectList";
		var windowTargetName = "project";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	var productPopup = function(index) {
		var url = "${path}/popup/productList/" + index;
		var windowTargetName = "product";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	function changeOrder(){
		let checkArr = document.getElementsByClassName('checkbox-no');
		let checkNum=0;
		let result="";
		
		for(let i=0; i<checkArr.length; ++i){
			let t = checkArr[i];
			if(t.checked){
				checkNum++;
				result = t.value;
			}
		}
		
		if(checkNum != 1){
			alert("1개 선택이 아니면 변경이 불가능합니다 ");
		}
		
		if(checkNum ==1){
			location.href="${path}/order/change/"+ result; 
			}
		}
	
</script>

</body>
</html>
