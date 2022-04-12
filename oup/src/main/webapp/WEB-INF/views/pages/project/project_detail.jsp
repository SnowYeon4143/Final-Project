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
 <link rel="stylesheet" href="${path}/resources/dist/css/project_detail.css">

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
            <h1>Project</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Project Detail</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div id='card' class="card">
        <div class="card-header">
          <h3 class="card-title">${prjVo.projectName}</h3>
        </div>
        
        <div class="card-body">
          <div class="row">
            <div class="col-12 col-md-12 col-lg-8 order-2 order-md-1">
              <div class="row">
                <div class="col-12 col-sm-4">
                  <div class="info-box ">
                    <div class="info-box-content">
                      <span id="box1" class="info-box-text text-center text-muted">Project Period</span>
                      <span id="box2" class="info-box-number text-center text-muted mb-0">
                      <fmt:formatDate value ="${prjVo.projectStart}" type="date"/> ~ <fmt:formatDate value ="${prjVo.projectEnd}" type="date"/>
                      </span>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-sm-4">
                  <div class="info-box ">
                    <div class="info-box-content">
                      <span id="box1" class="info-box-text text-center text-muted">Unpaied Amount</span>
                      <span id="box2" class="info-box-number text-center text-muted mb-0"><fmt:formatNumber type="number" maxFractionDigits="0" value="${prjVo.sumu}"/></span>
                    </div>
                  </div>
                </div>
                <div class="col-12 col-sm-4">
                  <div class="info-box ">
                    <div class="info-box-content">
                      <span id="box1" class="info-box-text text-center text-muted">Approval Status</span>
                      <span id="box2" class="info-box-number text-center text-muted mb-0">${prjVo.AStatement}</span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-12">
                  <br>
                  <h4>프로젝트 이름</h4>
                  <br>
                    <div class="post">
                      <div id="con-title">1. 프로제트 시행 목적</div><br>
                      <pre>${prjVo.projectContents1}</pre>
                    </div>
                    <div class="post clearfix">
                      <div id="con-title">2. 프로젝트 개요 및 추진 방향</div><br>
                      <pre>${prjVo.projectContents2}</pre>
                    </div>
                    <div class="post clearfix">
                      <div id="con-title">3. 프로젝트 시행 효과</div><br>
                      <pre>${prjVo.projectContents3}</pre>
                    </div>
                    <div class="post">
                      <div id="con-title">4. 제안 및 요구사항 </div><br>
                      <pre>${prjVo.projectContents4}</pre>
                    </div>
                </div>
              </div>
            </div>
            <div class="col-12 col-md-12 col-lg-4 order-1 order-md-2">
              <h3>Project Group</h3>
              <br>
              <div class="text-muted">
                <p>Project Leader
                	<c:forEach items="${glist}" var="g">
	                  <c:if test="${g.groupPosition eq 'L'}">
		                  <b class="d-block">${g.employeeName}</b>
	                  </c:if>
                 	</c:forEach>
                </p>
                <p>members
                	<c:forEach items="${glist}" var="g">
	                  <c:if test="${g.groupPosition ne 'L'}">
		                  <b class="d-block">${g.employeeName}</b>
	                  </c:if>
                 	</c:forEach>
                </p>
              </div>

              <h5 class="mt-5 text-muted">Project documents</h5>
              <ul class="list-unstyled">
              <c:forEach items="${olist}" var="o">
	                <c:if test="${o.ONo eq 0 || o.ONo eq null}">
	                <li>
	                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i>주문서 (진행 건 없음)</a>
	                </li>
	                </c:if>
	                <c:if test="${o.ONo ne 0}">
	                <li>
	                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i>주문서 ${o.ONo} 보기</a>
	                </li>
	                </c:if>
	                <c:if test="${o.SNo eq 0 || o.SNo eq null}">
	                <li>
	                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i>거래명세서 (미발행)</a>
	                </li>
	                </c:if>
	                <c:if test="${o.SNo ne 0}">
	                <li>
	                  <a href="${path}/statement/statement_detail/${o.ONo}" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i>거래명세서 ${o.SNo} 보기</a>
	                </li>
	                </c:if>
	                
                </c:forEach>
                <c:forEach items="${slist}" var="saleNo">
	                <c:if test="${saleNo eq 0 || saleNo eq null}">
	                <li>
	                  <a href="${path}/statement/statement_detail/${saleNo}" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i>주문서 (진행 건 없음)</a>
	                </li>
	                </c:if>
	                <c:if test="${saleNo ne 0}">
	                <li>
	                <span id="sale" style="color:#6F6F6F; cursor: pointer;" id="confirm_id" onclick="salePopup(${saleNo})"><i class="far fa-fw fa-file-word"></i>판매(판매번호_${saleNo}) 보기</span>
	                </li>
	                </c:if> 
                </c:forEach>
                	<li>
	                  <a href="" class="btn-link text-secondary"><i class="far fa-fw fa-file-word"></i>발주서 보기</a>
	                </li>
                
              </ul>
              <div class="text-center mt-5 mb-3">
                <a id="sbBtn" href="${path}/project/project_edit/${prjVo.projectNo}" class="btn btn-sm btn-secondary">수정</a>
                <a href="${path}/project/project_list" class="btn btn-sm btn-secondary">목록으로</a>
                <button class="btn btn-default" id="print" onclick="return printPage();"><i class="fas fa-print"></i> Print</button>
                
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

 <script>
        var initBodyHtml;
        function printPage() {
            window.print();
        }
        function beforePrint() {
            initBodyHtml = document.body.innerHTML;
            document.body.innerHTML = document.getElementById('card').innerHTML;
        }
        function afterPrint() {
            document.body.innerHTML = initBodyHtml;
        }

        window.onbeforeprint = beforePrint;
        window.onafterprint = afterPrint;
 </script>

<script type="text/javascript">
var salePopup = function(saleNo) {
	var url = "${path}/sale/saleDetail/" + saleNo;
	var windowTargetName = "sale";
	var features = "width=1300,height=800, scrollbars=no, resizable=no";
	var search = window.open(url, windowTargetName, features);
	}
</script>



 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
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