<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>0up | readMail</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
  <%@ include file="../../common/menubar-sidebar.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>자세히보기</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">자세히보기</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-2">
            <a href="${path}/mail/send" class="btn btn-primary btn-block mb-3" style="background-color: #7b51c6; border-color: #7b51c6">메일쓰기</a>

            <div class="card card-purple card-outline">
              <div class="card-header">
                <h3 class="card-title">메일함</h3>

                <div class="card-tools">
                  <button type="button" class="btn btn-tool" data-card-widget="collapse">
                    <i class="fas fa-minus"></i>
                  </button>
                </div>
              </div>
              <div class="card-body p-0">
              <ul class="nav nav-pills flex-column">
                <li class="nav-item active">
                  <a href="${path}/mail/rbox" class="nav-link">
                    <i class="fas fa-inbox"></i> 받은메일함
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${path}/mail/sbox" class="nav-link">
                   <i class="far fa-envelope"></i>보낸메일함
                  </a>
                </li>
                <li class="nav-item">
                  <a href="${path}/mail/trash" class="nav-link">
                    <i class="far fa-trash-alt"></i> 휴지통
                  </a>
                </li>
              </ul>
            </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        <div class="col-md-9">
          <div class="card card-purple card-outline">
            <div class="card-header">
              <h3 class="card-title">자세히보기</h3>

              <div class="card-tools">
                <a href="${path}/mail/detail/${mail.mailPreNo}" class="btn btn-tool" title="Previous"><i class="fas fa-chevron-left"></i></a>
                <a href="${path}/mail/detail/${mail.mailNextNo}" class="btn btn-tool" title="Next"><i class="fas fa-chevron-right"></i></a>
              </div>
            </div>
            <!-- /.card-header -->
            <div class="card-body p-0">
              <div class="mailbox-read-info">
              <input type="hidden" id="mailNo" value="${mail.mailNo}">
                <h5>${mail.mailTitle}</h5><br>
                <h6>보낸사람 : ${mail.senderStr} (${mail.senderId})</h6>
                <h6>받는사람 : ${mail.recipientStr} (${mail.recipientId})
                  <span class="mailbox-read-time float-right"><fmt:formatDate value="${mail.mailDate}" pattern="yy-MM-dd (E) HH:mm"/></span></h6>
              </div>
              <!-- /.mailbox-read-info -->
              <!-- /.mailbox-controls -->
              <div class="mailbox-read-message">
                ${mail.mailContent}
              </div>
              <!-- /.mailbox-read-message -->
            </div>
            <!-- /.card-body -->
            <div class="card-footer bg-white" >
              <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                <li style="width: 100%">
                <c:if test="${mail.originName1 ne null}">
                	<div class="mailbox-attachment-info">
                  	<p>
                    <a href="${path}/resources/dist/img/mail/${mail.changeName1}" download="${mail.originName1}" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> ${mail.originName1}</a>
                        <span>
                          <a href="${path}/resources/dist/img/mail/${mail.changeName1}" download="${mail.originName1}" class="btn btn-default btn-sm float-right"><i class="fas fa-file-alt"></i></a>
                        </span>
                    </p>
                    <c:if test="${mail.originName2 ne null}">
                    <p>
                    <a href="${path}/resources/dist/img/mail/${mail.changeName2}" download="${mail.originName2}" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i>${mail.originName2}</a>
                        <span>
                          <a href="${path}/resources/dist/img/mail/${mail.changeName2}" download="${mail.originName2}" class="btn btn-default btn-sm float-right"><i class="fas fa-file-alt"></i></a>
                        </span><br>
                    </p>
                    </c:if>
                    <c:if test="${mail.originName3 ne null}">
                    <a href="${path}/resources/dist/img/mail/${mail.changeName3}" download="${mail.originName3}" class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> ${mail.originName3}</a>
                        <span>
                          <a href="${path}/resources/dist/img/mail/${mail.changeName3}" download="${mail.originName3}" class="btn btn-default btn-sm float-right"><i class="fas fa-file-alt"></i></a>
                        </span>
                    </c:if>
                  </div>
                </c:if>
                </li>
              </ul>
            </div>
            <!-- /.card-footer -->
            <div class="card-footer">
              <div class="float-right">
                <button type="button" class="btn btn-default"><i class="fas fa-reply"></i> Reply</button>
                <button type="button" class="btn btn-default"><i class="fas fa-share"></i> Forward</button>
              </div>
              <c:if test="${loginEmployee.employeeNo eq mail.sender}">
              <button type="button" class="btn btn-default" onclick="sdel();"><i class="far fa-trash-alt"></i> 삭제</button>
              </c:if>
              <c:if test="${loginEmployee.employeeNo eq mail.recipient}">
              <button type="button" class="btn btn-default" onclick="rdel();"><i class="far fa-trash-alt"></i> 삭제</button>
              </c:if>
              
              <button type="button" class="btn btn-default"><i class="fas fa-print"></i> Print</button>
            </div>
            <!-- /.card-footer -->
          </div>
          <!-- /.card -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
      </div><!-- /.container-fluid -->
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
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>

<script type="text/javascript">
	//삭제 버튼 클릭
	function sdel() {
		//삭제할 번호 가져오기
		let delNo = document.getElementById('mailNo').value;
		
		//삭제 요청 보내기 (삭제할 번호 전달해주면서)
		$.ajax({
			url : "${path}/mail/sdelete",
			data : {"str" : delNo},
			type : 'post',
			success : function(data) {
				console.log(data);
			},
			error : function(e) {
				console.log(e);
			},
			complete : function() {
				//새로고침
				location.href='http://127.0.0.1:8888/oup/mail/sbox';
			}
		});
	}
	
	function rdel() {
		//삭제할 번호 가져오기
		let delNo = document.getElementById('mailNo').value;
		
		//삭제 요청 보내기 (삭제할 번호 전달해주면서)
		$.ajax({
			url : "${path}/mail/rdelete",
			data : {"str" : delNo},
			type : 'post',
			success : function(data) {
				console.log(data);
			},
			error : function(e) {
				console.log(e);
			},
			complete : function() {
				//페이지 이동
				location.href="${path}/mail/rbox";
			}
		});
	}
</script>

</body>
</html>
