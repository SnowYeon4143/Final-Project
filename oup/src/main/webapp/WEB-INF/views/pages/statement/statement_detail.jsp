<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font: Source Sans Pro -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!--   Font Awesome -->
 <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
<!--   Theme style -->
 <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">

<!-- ssh CSS -->
 <link rel="stylesheet" href="${path}/resources/dist/css/statement.css">


</head>

<body class="hold-transition sidebar-mini layout-fixed">
<div class = "wrapper"> 

<%@ include file="/WEB-INF/views/common/menubar-sidebar.jsp" %>

 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 style="font-size: 40px;">거래 명세서 [보기]</h1>
          </div>
          <br><br><br>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <table id="atb">
      <tr>
        <td>프로젝트 번호</td>
        <td>
         <input type="text" name="projectNo" value="${stVo.projectNo}" readonly>
        </td>
      </tr>
      <tr>
        <td>주문서 번호</td>
        <td>
         <input type="text" name="oNo" value="${stVo.ONo}" readonly>
        </td>
      </tr>
    </table>
	<button class="btn btn-default float-right" id="print" onclick="return printPage();"><i class="fas fa-print"></i> Print</button>
	<br><br>

      <!-- Default box -->
      <div class="card">
        <div id="prinarea">
        
          <!-- 명세서 =========================  -->
        <table border="1" id="btb">
         <tr>
            <td class="colName">일련번호</td>
            <td colspan="9" ><input type="text" value="${stVo.SNo}" readonly></td>
          </tr>
          <tr>
            <td class="colName">작성일자</td>
            <td rowspan="2" colspan="9" style="font-size: 50px; font-family: 궁서체;"> 거 래 명 세 서</td>
          </tr>
          <tr>
          	<fmt:formatDate var="wdate" pattern="yyyy-MM-dd" value="${stVo.SWdate}"/>
            <td><input type='date' name="sWdate" value="${wdate}" readonly /></td>
          </tr>
          <tr>
            <td colspan="5" class="colName2" id="wide2"> 곻급 받는 자 </td>
            <td colspan="5" class="colName3">공급자</td>
          </tr>
          <tr>
            <td class="colName">상호명</td>
            <td colspan="2"><input type="text" name="cName" value="${stVo.CName}" readonly></td>
            <td class="colName">대표자명</td>
            <td><input type="text" name="cOwner" value="${stVo.COwner}" readonly></td>
            <td class="colName">상호명</td>
            <td id="wide" colspan="2">OUP</td>
            <td class="colName">담당자명</td>
            <td><input type="text" id="emp" name="" value="${stVo.employeeName}" readonly></td>
          </tr>
          <tr>
            <td class="colName">등록번호</td>
            <td colspan="4"><input type="text" name="bNo" value="${stVo.BNo}" readonly></td>
            <td class="colName">등록번호</td>
            <td colspan="4">1234567890</td>
          </tr>
          <tr>
            <td class="colName">사업장 주소</td>
            <td colspan="4"><input type="text" name="cAddr" value="${stVo.CAddr}" readonly></td>
            <td class="colName">사업장 주소</td>
            <td colspan="4">서울특별시 강남구 테헤란로 1234</td>
          </tr>
          <tr>
            <td class="colName">전화번호</td>
            <td colspan="2"><input type="text" name="cPhone" value="${stVo.CPhone}" readonly></td>
            <td class="colName">팩스</td>
            <td><input type="text" name="cFax" value="${stVo.CFax}" readonly></td>
            <td class="colName">전화번호</td>
            <td colspan="2">02-123-4567</td>
            <td class="colName">팩스</td>
            <td>1588-0203</td>
          </tr>
          <tr>
            <td colspan="5" class="colName"> 거래일자 </td>
			<fmt:formatDate var="dateFmt" pattern="yyyy-MM-dd" value="${stVo.ODate}"/>
            <td colspan="5"><input type="date" name="oDate" value="${dateFmt}" readonly></td>
          </tr>
          <tr>
            <td colspan="5" class="colName"> 합계금액(VAT포함)</td>
            <td colspan="5">
            <input type="hidden" name="sTotal" value="${stVo.STotal}">
            <fmt:formatNumber type="number" maxFractionDigits="0" value="${stVo.STotal}"/> 원
            </td>
          </tr>
        </table>



        <table border="1" id="ctb">
          <tr>
            <th>번호</th>
            <th>상품코드</th>
            <th>상품명</th>
            <th>규격</th>
            <th>수량</th>
            <th>단가</th>
            <th>공급가액</th>
            <th>부가액</th>
            <th>금액</th>
            <th>비고</th>
          </tr>
          <c:forEach items="${plist}" var="p" varStatus="status">
          <tr>
            <td>${status.count}</td>
            <td>${p.PNo}</td>
            <td>${p.PName}</td>
            <td>${p.PStandard}</td>
            <td>${p.ONum}</td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.PUnitPrice}"/></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.PSupplyPrice}"/></td>
            <c:set var="vat" value="${(p.PSupplyPrice)*(0.1)}"></c:set>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${vat}"/></td>
            <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.OPrice}"/></td>
            <td>${p.PNote}</td>
          </tr>
          </c:forEach>
          
            <td>비고</td>
            <td colspan="9"></td>
            
          </tr>
        </table>
        
        </div><!-- printarea -->
        
      </div>
      <!-- /.card -->
      <br>
      <div id="btn2">
        <input class="b2" type="button" value="수정" onclick="goedit(${stVo.ONo});">
        <input class="b3" type="button" value="삭제" onclick="deleteSt(${stVo.SNo});">
        <input class="b4" type="button" value="목록으로" onclick="history.go(-1)">  
      </div>
      <br><br>

      
    </div>
  <!-- /.content-wrapper -->
<script type="text/javascript">
 function goedit(param){
	 location.href="${path}/statement/statement_edit/"+param;
 }
 
 function deleteSt(param){
	 location.href="${path}/statement/delete/"+param;
 }
 
</script>

<script>
        var initBodyHtml;
        function printPage() {
            window.print();
        }
        function beforePrint() {
            initBodyHtml = document.body.innerHTML;
            document.body.innerHTML = document.getElementById('prinarea').innerHTML;
        }
        function afterPrint() {
            document.body.innerHTML = initBodyHtml;
        }

        window.onbeforeprint = beforePrint;
        window.onafterprint = afterPrint;
 </script>





 <%@ include file="/WEB-INF/views/common/footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>



</body>
</html>