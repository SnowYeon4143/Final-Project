<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><title>0UP | print</title></title>

<!-- Google Font: Source Sans Pro -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!--   Font Awesome -->
 <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
<!--   Theme style -->
 <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">

<!-- ssh CSS -->
 <link rel="stylesheet" href="${path}/resources/dist/css/statement.css">

<style type="text/css">
	@media print {
  	#noprint { 
	display:none;
	}
}
</style>

</head>
<body class="hold-transition">
<div class = "wrapper"> 

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="margin-left: 0px; margin-top: 10px;">
	<table border="1" id="btb" width=100%>
		          <tr>
		            <td class="colName">일련번호</td>
		            <td colspan="9">${sale.saleNo}</td>
		          </tr>
		          <tr>
		            <td class="colName">작성일자</td>
		            <td rowspan="2" colspan="9" style="font-size: 50px; font-family: 궁서체;"> 거 래 명 세 서</td>
		          </tr>
		          <tr>
		            <td><input type="date"></td>
		          </tr>
		          <tr>
		            <td colspan="5" class="colName2" style="width: 50%; color: black"> 공급 받는 자</td>
		            <td colspan="5" class="colName3" style="width: 50%">공급자</td>
		          </tr>
		          <tr>
		            <td class="colName">상호명</td>
		            <td colspan="4">${sale.CName}</td>
		            <td class="colName">상호명</td>
		            <td colspan="2">0UP</td>
		            <td class="colName">성명</td>
		            <td>${sale.employeeName}</td>
		          </tr>
		          <tr>
		            <td class="colName">등록번호</td>
		            <td colspan="4">${sale.CNo}</td>
		            <td class="colName">등록번호</td>
		            <td colspan="4">0000001</td>
		          </tr>
		          <tr>
		            <td class="colName">주소</td>
		            <td colspan="4" style="font-size: 100%">${client.CAddr}</td>
		            <td class="colName">주소</td>
		            <td colspan="4" style="font-size: 100%">서울 어딘가의 주소</td>
		          </tr>
		          <tr>
		            <td class="colName">전화번호</td>
		            <td colspan="2">${client.CPhone}</td>
		            <td class="colName">팩스</td>
		            <td>${client.CFax}</td>
		            <td class="colName">전화번호</td>
		            <td colspan="2">010-0202-0202</td>
		            <td class="colName">팩스</td>
		            <td>010-0202-0202</td>
		          </tr>
		          <tr>
		            <td colspan="5" class="colName"> 거래일자 </td>
		            <td colspan="5"> ${sale.saleDate}</td>
		          </tr>
		          <tr>
		            <td colspan="5" class="colName"> 합계금액(VAT포함)</td>
		            <td colspan="5">${sale.saleSum}</td>
		          </tr>
		        </table>
		        
		        <table border="1" id="ctb" width=100%>
		          <tr>
		            <th>번호</th>
		            <th>상품코드</th>
		            <th>상품명</th>
		            <th>규격</th>
		            <th>수량</th>
		            <th>단가</th>
		            <th>공급가액</th>
		            <th>세액</th>
		            <th>금액</th>
		            <th>비고</th>
		          </tr>
		          <c:forEach items="${saleList}" var="l" varStatus="status">
		          
		          <tr>
		            <td>${status.count}</td>
		            <td>${l.PNo}</td>
		            <td>${l.PName}</td>
		            <td>${l.SQnt}</td> <!-- cbj 규격 수정 -->
		            <td>${l.SQnt}</td>
		            <td>${l.PUnitPrice}</td>
		            <td>${l.SPrice}</td>
		            <td>${l.buga}</td>
		            <td>${l.result}</td>
		            <td style="width: 20%"><input type="text"></td>
		          </tr>
		          </c:forEach>
		          <tr>
		            <td>비고</td>
		            <td colspan="9"><input type="text"></td>
		          </tr>
		        </table>
		        <br>
				<button id="noprint" onclick="printSale();" class="btn btn-default"><i class="fas fa-print"></i> 인쇄</button>
  </div>
  <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->

<script>
	var printSale = function() {
		window.print();
		return false;
	}
</script>

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>

</body>
</html>