<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>품목 검색</title>

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
  
<body class="hold-transition sidebar-mini">
  <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md">
            <div class="card-header">
              <h2>품목 검색</h2>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                </button>
              </div>
            </div>
            
            <div class="card-body">
            	<form action="" method="get" name="searchform">
                <div class="input-group mb-3 " style="left:45%;">
                  <input style="font-size: 150%" type="text" name="search" class="form-control col-sm-6" placeholder="Search" id="searchClient">
                  <button class="btn btn-secondary" onclick="submit(); return false;";><i class="fa fa-search"></i></button>
                </div>
                <table class="table table-bordered projects">
                  <thead>
                      <tr>
                          <th style="width: 20%; font-size: 150%" class="text-center">
                              품목코드
                          </th>
                          <th style="width: 20%; font-size: 150%" class="text-center">
                              품목명
                          </th>
                          <th style="width: 20%; font-size: 150%" class="text-center">
                              단가
                          </th>
                          <th style="width: 20%; font-size: 150%" class="text-center">
                              재고
                          </th>
                          <th style="width: 20%; font-size: 150%" class="text-center">
                              적요
                          </th>
                      </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="l">				
                    <tr>
                      <td><span style="color:blue; font-size: 150%; text-decoration: underline; cursor: pointer;" onclick="returnCNo('${l.PNo}','${l.PName}','${l.PUnitPrice}');">${l.PNo}</span></td>
                      <td style="font-size: 150%">${l.PName}</td>
                      <td style="font-size: 150%">${l.PUnitPrice}</td>
                      <td style="font-size: 150%">${l.PCount}</td>
                      <td style="font-size: 150%">${l.PNote}</td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>

             </form>
             <input type="button" class="btn btn-secondary btn-sm" style="width: 44.33px; height: 31px; font-size: 150%" value="신규" onclick="location.href='${path}/popup/addproduct'">
	        </div>
          </div>
     </div> 
  </section>
 </div>

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>

<script> 
	function submit(){
		let search = document.getElementById("searchClient").value;
		document.searchform.submit(search);
	}	
	
	function returnCNo(pNo,pName, pUnitPrice) {
			opener.document.getElementById("productNo" + ${index}).value = pNo; //품목코드
			opener.document.getElementById("productName" + ${index}).value = pName; //품목명
			opener.document.getElementById("price" + ${index}).value = pUnitPrice; //단가
			self.close();
	}

</script>
</body>
</html>
