<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>0UP | saleEnter</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">
  
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
            <h1>판매입력</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card"></div>
        <div class="card-body p-0">
		<form action="" method="post"> <!-- cbj -->
          <div class="row" style="background-color: rgb(196, 194, 194); margin: 20px; padding: 6px;">
                <div class="col-sm-1 mt-3" style="padding:5px;"><b>일자</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">  
                  <div class="col">
                    <input type="date" id="saleDate" name="saleDate" class="form-control mb-3 mt-3" placeholder="기한">
                  </div>
                </div>

                <div class="col-sm-1 mt-3" style="padding:5px;"><b>거래처</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">                  
                  <div class="input-group col mt-3">
                    <input id="cNo" type="text" name="cNo" class="form-control" placeholder="거래처">
                    <!-- 모달창 -->
                    <button type="button" class="input-group-text" data-toggle="modal" data-target="#modal-client">
	                  <i class="bi bi-search"></i>
	                </button>
	                <!-- 팝업창 -->
                    <!-- <button type="button" class="input-group-text" onclick="goPopup()"><i class="bi bi-search"></i></button> -->
                    <input id="cName" type="text" class="form-control" readonly>
                  </div>
                </div>
				
				<!-- modal -->
				<div class="modal fade" id="modal-client">
			        <div class="modal-dialog">
			          <div class="modal-content" style="width: 600px">
			            <div class="modal-header">
			              <h4 class="modal-title">거래처 조회</h4>
			              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                <span aria-hidden="true">&times;</span>
			              </button>
			            </div>
			            <div class="modal-body">
							<!-- 거래처 검색 -->
								<table class="table table-bordered projects">
					     		  <thead>
				                      <tr>
				                          <th  class="text-center">
				                              거래처코드
				                          </th>
				                          <th  class="text-center">
				                              거래처명
				                          </th>
				                          <th class="text-center">
				                              대표자
				                          </th>
				                          <th  class="text-center">
				                            사업자등록번호
				                          </th>
				                          <th  class="text-center">
				                              미수금
				                          </th>
				                      </tr>
				                  </thead>
				                  <tbody>
				                  <c:forEach items="${list}" var="l">				
				                    <tr>
				                      <td><span style="color:blue;"><span style="text-decoration: underline; cursor: pointer;" data-dismiss="modal" onclick="returnCNo('${l.CNo}','${l.CName}', '${l.CUmony}');">${l.CNo}</span></span></td>
				                      <td>${l.CName}</td>
				                      <td>${l.COwner}</td>
				                      <td>${l.BNo}</td>
				                      <td>${l.CUmony}</td>
				                    </tr>
				                  </c:forEach>
				                  </tbody>
				                </table>
							<!-- 거래처 검색 -->
			            </div>
			            <script>
							function returnCNo(cNo,cName,cUmony) {
									document.getElementById("cNo").value = cNo;
									document.getElementById("cName").value = cName;
									document.getElementById("aUmoney").value = cUmony;
									document.getElementById("sUmoney").value = cUmony;
							}
						
						</script>
			            <div class="modal-footer justify-content-between">
			              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			            </div>
			          </div>
			          <!-- /.modal-content -->
			        </div>
			        <!-- /.modal-dialog -->
			      </div>
			      <!-- /.modal -->
				
                <div class="col-sm-1" style="padding:5px;"><b>담당자</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="input-group col mb-3">
                    <input type="text" id="employeeNo" name="employeeNo" class="form-control" placeholder="담당자">
                    <!-- 모달창 -->
                    <button type="button" class="input-group-text" data-toggle="modal" data-target="#modal-employee">
	                  <i class="bi bi-search"></i>
	                </button>
	                <!-- 팝업창 -->
                    <!-- <button type="button" class="input-group-text" onclick="employeePopup()"><i class="bi bi-search"></i></button> -->
                    <input type="text" id="employeeName" class="form-control" readonly id="id">
                    <input type="hidden" id="teamCode" class="form-control">
                  </div>
                </div>
                
                <!-- modal -->
				<div class="modal fade" id="modal-employee">
			        <div class="modal-dialog">
			          <div class="modal-content" style="width: 600px">
			            <div class="modal-header">
			              <h4 class="modal-title">사원 조회</h4>
			              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                <span aria-hidden="true">&times;</span>
			              </button>
			            </div>
			            <div class="modal-body">
							<!-- 직원 검색 -->
								<table class="table table-bordered projects">
				                  <thead>
				                      <tr>
				                          <th class="text-center">
				                              사원코드
				                          </th>
				                          <th class="text-center">
				                              사원명
				                          </th>
				                      </tr>
				                  </thead>
				                  <tbody>
					                  <c:forEach items="${elist}" var="l">				
					                    <tr>
					                      <td style="color:blue;"><span style="text-decoration: underline; cursor: pointer;" id="confirm_id" data-dismiss="modal" onclick="employeeList('${l.employeeNo}','${l.employeeName}', '${l.teamCode}')">${l.employeeNo}</span></td>
					                      <td>${l.employeeName}</td>
					                    </tr>
					                  </c:forEach>
				                  </tbody>
				              	</table>
							<!-- 직원 검색 -->
			            </div>
			            <script>
							function employeeList(employeeNo,employeeName,teamCode) { 
									document.getElementById("employeeNo").value = employeeNo;
									document.getElementById("employeeName").value = employeeName;
									document.getElementById("teamCode").value= teamCode;
							}
						</script>
			            <div class="modal-footer justify-content-between">
			              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			            </div>
			          </div>
			          <!-- /.modal-content -->
			        </div>
			        <!-- /.modal-dialog -->
			      </div>
			      <!-- /.modal -->

                <div class="col-sm-1" style="padding:5px;"><b>출하창고</b>
                </div><div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="input-group col">
                    <input type="text" name="wareHouseNo" id="warehouseNo" class="form-control" placeholder="출하창고">
                    <button onclick="warehousePopup()" type="button" class="input-group-text"><i class="bi bi-search"></i></button>
                    <input id="warehouseName" type="text" class="form-control" readonly>
                  </div>
                </div>

                <div class="col-sm-1" style="padding:5px;"><b>거래유형</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="col">
                    <select id="bugaYN" name="vatYN" class="form-control mb-3">
                      <option value="Y">부가세적용</option>
                      <option value="N">부가세미적용</option>
                    </select>
                  </div>
                </div>

				<div class="col-sm-1" style="padding:5px;"><b>프로젝트</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="input-group col mb-3">
                    <input type="text" name="projectNo" id="projectNo" class="form-control" placeholder="프로젝트">
                    <button type="button" onclick="projectPopup()" class="input-group-text"><i class="bi bi-search"></i></button>
                    <input type="text" id="projectName" class="form-control" readonly>
                  </div>
                </div>
                
                <div class="col-sm-1" style="padding:5px;"><b>미수금액(전 잔액)</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="col">
                    <input type="text" id="aUmoney" class="form-control mb-3" placeholder="미수금액" readonly>
                  </div>
                </div>
                
                <div class="col-sm-1" style="padding:5px;"><b>미수금액(후잔액)</b></div>
                <div class="col-sm-1"></div>
                <div class="col-sm-4">
                  <div class="col">
                    <input type="text" id="sUmoney" name="sUmoney" class="form-control mb-3" placeholder="미수금액" readonly>
                  </div>
                </div>
          </div>
		
          <div style="margin: 10px;">
            <button class="btn btn-secondary btn-sm" type="button" onclick="productPopup()">My품목</button>
            <button class="btn btn-secondary btn-sm" type="button" onclick="orderPopup()">주문</button>
            <button class="btn btn-secondary btn-sm" onclick="addProduct()" type="button">+</button>
            <button class="btn btn-secondary btn-sm" onclick="orderMinus()" type="button">-</button>
	       </div>
			<input id="index" type="hidden" value="2">
			<input id="index2" type="hidden" value="1">
			<table id="saleTable" class="table table-bordered projects">
				<thead>
					<tr>
						<th style="width: 10%" class="text-center">품목코드</th>
						<th style="width: 15%" class="text-center">품목명</th>
						<th style="width: 9%" class="text-center">수량</th>
						<th style="width: 13%" class="text-center">단가</th>
						<th style="width: 14%" class="text-center">공급가액</th>
						<th style="width: 13%" class="text-center">부가세</th>
						<th style="width: 20%" class="text-center">납기일자</th>
					</tr>
				</thead>
				<tbody id="product">
					<tr>
						<td>
							<div class="input-group" style="margin: 0px">
							<input id="productNo1" name="voList[0].pNo" type="number" class="form-control"
							placeholder="100">
							<button type="button" class="input-group-text" onclick="productPopup('1')"><i class="bi bi-search"></i></button>
							</div>
						</td>
						<td class="project_progress">
							<input id="productName1" type="text"
							class="form-control" placeholder="단단한돌">
						</td>
						<td>
							<input onchange="calcResult()" id="count1" name="voList[0].sQnt" type="number" class="form-control"
							placeholder="1000">
						</td>
						<td>
						<input onchange="calcResult()" id="price1" type="number" class="form-control"
							placeholder="3000원">
						</td>
						<td>
						<input id="result1" name="voList[0].sPrice" class="form-control"
							readonly="readonly" value="0">
						</td>
						<td>
						<input id="buga1" type="number" class="form-control"
							value="0">
						</td>
						<td>
						<input name="voList[0].sDeliberyDate" type="date" class="form-control"
							placeholder="2022-04-18">
						</td>
					
				</tbody>
			</table>
			<div style="margin: 10px;">
            <button type="submit" class="btn btn-secondary btn-sm">저장</button>
            <button type="button" class="btn btn-secondary btn-sm">저장/전표</button>
            <button type="button" class="btn btn-secondary btn-sm">다시작성</button>
            <button type="button" class="btn btn-secondary btn-sm">리스트</button>
          </div>
		</form> <!-- cbj -->
        </div>
        <!-- /.card-body -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <%@ include file="../../common/footer.jsp" %>

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
<script type="text/javascript">
	var employeePopup = function() { 
		var url = "${path}/popup";
		var windowTargetName = "employee";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	} 
	var goPopup = function() {
        var search = window.open("${path}/popup/searchClient?search=","search","width=800,height=420, scrollbars=yes, resizable=no"); 
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
	
	//추가
	var addProduct = function() {
		var indexdoc = document.getElementById('index')
		var index =  parseInt(indexdoc.value);
		var indexdoc2 = document.getElementById('index2')
		var index2 = parseInt(indexdoc2.value);
		var tag = "<tr><td><div class='input-group' style='margin: 0px'><input id='productNo" + index + "' name='voList[" + index2 + "].pNo' type='number' class='form-control'placeholder='100'><button type='button' class='input-group-text' onclick=\"productPopup('" + index + "')\"><i class='bi bi-search'></i></button></div></td><td class='project_progress'><input id='productName" + index + "' type='text'class='form-control' placeholder='단단한돌'></td><td><input onchange='calcResult()' id='count" + index + "' name='voList[" + index2 + "].sQnt' type='number' class='form-control'placeholder='1000'></td><td><input onchange='calcResult()' id='price" + index + "' type='number' class='form-control'placeholder='3000'></td><td><input id='result" + index + "' name='voList[" + index2 + "].sPrice' class='form-control'readonly='readonly' value='0'></td><td><input id='buga" + index + "' type='number' class='form-control' value='0'></td><td><input name='voList[" + index2 + "].sDeliberyDate' type='date' class='form-control'placeholder='2022-04-18'></td></tr>";
		indexdoc.value = index + 1;
		indexdoc2.value = index2 + 1;
		$('#product').append(tag);
	}
	
	//제거
	function orderMinus(){
		let table = document.getElementById('saleTable');
		var indexdoc = document.getElementById('index')
		var index =  parseInt(indexdoc.value);
		var indexdoc2 = document.getElementById('index2')
		var index2 = parseInt(indexdoc2.value);
		
		if(!(index <=1))
			table.deleteRow(-1);
		
		indexdoc.value = index - 1;
		indexdoc2.value = index2 - 1;
		if(index <= 1){
			index=1;
		}
	}
	
	var productPopup = function(index) {
		var url = "${path}/popup/productList/" + index;
		var windowTargetName = "product";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	var orderPopup = function() {
		var url = "${path}/popup/orderList/";
		var windowTargetName = "order";
		var features = "width=720,height=500, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
	
	var calcResult = function() {
		var indexdoc = document.getElementById('index')
		var index =  parseInt(indexdoc.value);
		var bugaYN = document.getElementById('bugaYN');
		var bugaValue = bugaYN.options[bugaYN.selectedIndex].text;
		var sUmoney = document.getElementById('sUmoney');
		var aUmoney = document.getElementById('aUmoney');
		var sumPrice = parseInt(aUmoney.value);
		
		for(let i = 1; i < index; i++) {
			var count = document.getElementById('count' + i).value;
			var price = document.getElementById('price' + i).value;
			var result = document.getElementById('result' + i);
			var buga = document.getElementById('buga' + i);
			
			var result1 = count * price;
			result.value = result1;
			
			if(bugaValue == '부가세적용'){
				var result2 = result1 * 0.1;
				buga.value = result2;
				sumPrice += result2;
			}else {
				buga.value = 0;
			}
			
			if(i == index) {
				break;
			}
			sumPrice += result1;
					
		}
		
		sUmoney.value = sumPrice;
	}
</script>
</body>
</html>
