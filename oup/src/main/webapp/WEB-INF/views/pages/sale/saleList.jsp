<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>0UP | saleList</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="${path}/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

  <%@ include file="../../common/menubar-sidebar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>판매조회</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">판매조회</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    
        <!-- /.col -->
        <div class="col-md-13">
          <div class="card card-purple card-outline">
            <div class="card-header">
              <h3 class="card-title">판매조회</h3>

              <div class="card-tools">
                <div class="input-group input-group-sm">
                  <div class="input-group-append">
                  </div>
                </div>
              </div>
              <!-- /.card-tools -->
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle"><i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" onclick="del();">
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm">
                  <i class="fas fa-sync-alt"></i>
                </button>
                <div class="float-right">
	                  <div class="btn-group" role="group" aria-label="First group">
	                	<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${page.startPage - 1}'"><i class="fas fa-chevron-left"></i></button>
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					        <c:if test="${page.currentPage != i and i <= page.lastPage}">       
					        	<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${i}'">${i}</button>
					      	</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${i}'">${i}</button>
					        </c:if>
						</c:forEach>
			            <c:if test="${page.endPage < page.lastPage}">
							<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${page.endPage + 1}'"><i class="fas fa-chevron-right"></i></button>
						</c:if>
						<c:if test="${page.endPage >= page.lastPage}">
							<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${page.lastPage}'"><i class="fas fa-chevron-right"></i></button>
						</c:if>
	                </div>
                <!-- /.float-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-bordered table-hover">
                  <thead>
                    <tr>
                      <th style="width: 1%"></th>
                      <th style="width: 7%">판매번호</th>
                      <th>거래처</th>
                      <th>담당자명</th>
                      <th style="width: 25%">품목</th>
                      <th>금액</th>
                      <th style="width: 10%">유형</th>
                      <th>출고창고</th>
                      <th style="width: 5%">인쇄</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:forEach items="${list}" var="l" varStatus="status">
                    <tr data-widget="expandable-table" aria-expanded="false">
                      <td>
                      	<div class="icheck-primary">
	                        <input type="checkbox" class="checkbox-del" value="${l.saleNo}" id="check${status.count}">
	                        <label for="check${status.count}"></label>
	                  	</div>
	                  </td>
                      <td><span style="text-decoration: underline; color:blue; cursor: pointer;" id="confirm_id" onclick="salePopup(${l.saleNo})">${l.saleNo}</span></td>
                      <td>${l.CName}</td>
                      <td>${l.employeeName}</td>
                      <c:if test="${l.productCnt eq 0}">
                      	<td>${l.productName}</td>
                      </c:if>
                      <c:if test="${l.productCnt ne 0}">
	                      <td>${l.productName} 외 ${l.productCnt}건</td>
                      </c:if>
                      <td>${l.saleSum}</td>
                      <c:if test="${l.vatYN eq 'N'.charAt(0)}">
                    	<td>부가세율 미적용</td>	                    
                      </c:if>
                      <c:if test="${l.vatYN eq 'Y'.charAt(0)}">
                    	<td>부가세율 적용</td>	                    
                      </c:if>
                      <td>${l.wareHouseName}</td>
                      <td><span style="text-decoration: underline; color:blue; cursor: pointer;" id="confirm_id" onclick="printPopup(${l.saleNo})">인쇄</span></td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer p-0">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle">
                  <i class="far fa-square"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" onclick="del();">
                    <i class="far fa-trash-alt"></i>
                  </button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm">
                  <i class="fas fa-sync-alt"></i>
                </button>
	                <div class="float-right">
	                  <div class="btn-group" role="group" aria-label="First group">
	                	<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${page.startPage - 1}'"><i class="fas fa-chevron-left"></i></button>
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					        <c:if test="${page.currentPage != i and i <= page.lastPage}">       
					        	<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${i}'">${i}</button>
					      	</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${i}'">${i}</button>
					        </c:if>
						</c:forEach>
			            <c:if test="${page.endPage < page.lastPage}">
							<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${page.endPage + 1}'"><i class="fas fa-chevron-right"></i></button>
						</c:if>
						<c:if test="${page.endPage >= page.lastPage}">
							<button type="button" class="btn btn-default btn-sm" onClick="location.href='${path}/sale/list/${page.lastPage}'"><i class="fas fa-chevron-right"></i></button>
						</c:if>
	                </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.float-right -->
              </div>
            </div>
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
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
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>
<!-- overlayScrollbars -->
<script src="${path}/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    //Enable check and uncheck all functionality
    $('.checkbox-toggle').click(function () {
      var clicks = $(this).data('clicks')
      if (clicks) {
        //Uncheck all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', false)
        $('.checkbox-toggle .far.fa-check-square').removeClass('fa-check-square').addClass('fa-square')
      } else {
        //Check all checkboxes
        $('.mailbox-messages input[type=\'checkbox\']').prop('checked', true)
        $('.checkbox-toggle .far.fa-square').removeClass('fa-square').addClass('fa-check-square')
      }
      $(this).data('clicks', !clicks)
    })

    //Handle starring for font awesome
    $('.mailbox-star').click(function (e) {
      e.preventDefault()
      //detect type
      var $this = $(this).find('a > i')
      var fa    = $this.hasClass('fa')

      //Switch states
      if (fa) {
        $this.toggleClass('fa-star')
        $this.toggleClass('fa-star-o')
      }
    })
  })
  
  	//삭제 버튼 클릭
	function del() {
		//삭제할 번호들 가져오기
		//가져온 번호들을 ,,, 하나의 문자열로 합치기
		let result = "";
		let delArr = document.getElementsByClassName('checkbox-del');
		
		for(let i = 0; i < delArr.length; i++) {
			let t = delArr[i];
			if(t.checked) {
				//console.log(t.parentNode.parentNode.children[1].innerText); //번거로운 방법
				console.log(t.value); //체크박스에 value를 넣어줌
				result += t.value + ',';
			}
		}
		
		//삭제 요청 보내기 (삭제할 번호 전달해주면서)
		$.ajax({
			url : "${path}/mail/rdelete",
			data : {"str" : result},
			type : 'post',
			success : function(data) {
				console.log(data);
			},
			error : function(e) {
				console.log(e);
			},
			complete : function() {
				//새로고침
				window.location.reload();
			}
		});
	}
</script>
<script type="text/javascript">
	var salePopup = function(saleNo) {
	var url = "${path}/sale/saleDetail/" + saleNo;
	var windowTargetName = "sale";
	var features = "width=1300,height=800, scrollbars=no, resizable=no";
	var search = window.open(url, windowTargetName, features);
	}
	
	var printPopup = function(saleNo) {
		var url = "${path}/popup/print/" + saleNo;
		var windowTargetName = "print";
		var features = "width=1160,height=800, scrollbars=no, resizable=no";
		var search = window.open(url, windowTargetName, features);
	}
</script>
</body>
</html>
