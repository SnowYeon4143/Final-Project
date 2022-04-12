<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="data:,">
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Font: Source Sans Pro -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!--   Font Awesome -->
 <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
<!--   Theme style -->
 <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">

<!-- ssh CSS -->
 <link rel="stylesheet" href="${path}/resources/dist/css/project_list.css">

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
            <h1>Projects List</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Projects</li>
            </ol>
          </div>
        </div>
        
        <form action="${path}/project/project_list/1" method="get" id="searchform">
	            <div class="input-group mb-3">
		               <input type="text" name="search" class="form-control col-sm-4" placeholder="프로젝트명 검색">
	    	           <button class="btn btn-success" onclick="submit()" style="background-color:#443b53"><i class="fa fa-search"></i></button>
	            </div>
         </form>
  
      </div><!-- /.container-fluid -->
    </section>
 
		
    
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Projects</h3>
 			

          
        </div>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          #
                      </th>
                      <th style="width: 20%">
                          Project Name
                      </th>
                      <th style="width: 30%">
                          Project Group Members
                      </th>
                      <th>
                          Payment Status
                      </th>
                      <th style="width: 8%" class="text-center">
                          Approval Status
                      </th>
                      <th style="width: 20%">
                      </th>
                  </tr>
              </thead>
              <tbody>
              <c:forEach items="${plist}" var="p">
                  <tr>
                      <td>
                          ${p.projectNo}
                      </td>
                      <td>
                          <a href="${path}/project/project_detail/${p.projectNo}">
                            ${p.projectName}
                          </a>
                          <br/>
                          <small>
                          	시작일 <fmt:formatDate value ="${p.projectStart}" type="date"/>
                          </small>
                      </td>
                      <td>
                         	${p.groupMembers}
                      </td>
                      <td class="project_progress">
                      <c:set var="payment" value="${(1-(p.sumu/p.sums))*100}"></c:set>
                          <div class="progress progress-sm">
                              <div class="progress-bar" role="progressbar" aria-valuenow="" aria-valuemin="0" aria-valuemax="100" style="width: payment%">
                              </div>
                          </div>
                          <small>
                            <c:out value="${payment}"></c:out> % Complete
                          </small>
                      </td>
                      <td class="project-state">
                    	<c:if test="${p.AStatement eq '승인'}">
                          <span class="badge badge-secondary" id="approvalBadge">${p.AStatement}</span>
                      	</c:if>
                      	<c:if test="${p.AStatement ne '승인'}">
                          <span class="badge badge-secondary">${p.AStatement}</span>
                      	</c:if>
                      </td>
                      <td class="project-actions text-right">
                          <a class="btn btn-info btn-sm" href="${path}/project/project_edit/${p.projectNo}">
                              <i class="fas fa-pencil-alt">
                              </i>
                              수정
                          </a>
                          <a class="btn btn-danger btn-sm" id="delbtn" onclick="delprj(${p.projectNo});">
                              <i class="fas fa-trash">
                              </i>
                              삭제
                          </a>
                      </td>
                  </tr>
              
              </c:forEach>
                 
            
              </tbody>
          </table>
        </div><!-- /.card-body -->
		
      </div><!-- /.card -->


	<br>
		<div class="row">

          <div class="btn-group me-2" role="group" aria-label="First group" style="margin-left: 40%;">
            	
            		<c:if test="${empty search}">
            			<c:if test="${page.startPage == 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/1'">Prev</button>
            			</c:if>
            			<c:if test="${page.startPage gt 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.startPage - 1}'">Prev</button>
            			</c:if>   
            		
            		
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					        <c:if test="${page.currentPage != i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${i}'">${i}</button>
					      	</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary active" onclick="location.href='${path}/project/project_list/${i}'">${i}</button>
					        </c:if>
						</c:forEach>
			            <c:if test="${page.endPage < page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.endPage + 1}'">Next</button>
						</c:if>
						<c:if test="${page.endPage >= page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.lastPage}'">Next</button>
						</c:if>
            		</c:if>
            		
            		<c:if test="${not empty search}">
	                	<c:if test="${page.startPage == 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/1?search=${search}'">Prev</button>
            			</c:if>
            			<c:if test="${page.startPage gt 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.startPage - 1}?search=${search}'">Prev</button>
            			</c:if>  
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					        <c:if test="${page.currentPage != i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${i}?search=${search}'">${i}</button>
					      	</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary active" onclick="location.href='${path}/project/project_list/${i}?search=${search}'">${i}</button>
					        </c:if>
						</c:forEach>
			            <c:if test="${page.endPage < page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.endPage + 1}?search=${search}'">Next</button>
						</c:if>
						<c:if test="${page.endPage >= page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.lastPage}?search=${search}'">Next</button>
						</c:if>
            		</c:if>
                </div><!--pager  -->
		</div><!-- /row -->
		<br><br>


    </section>
    <!-- /.content -->
    
    	
    
  </div>
  <!-- /.content-wrapper -->
  

<script type="text/javascript">
function delprj(param) {
 var chk = confirm(param+"번 프로젝트를 삭제하시겠습니까?");
 if(chk){
	 $.ajax({
		 url:"/oup/project/project_del",
		 type:"post",
		 data:{projectNo:param},
		 success: function (data) {
             location.reload();
        }
	 });//ajax
 }else{
	 alert("삭제가 취소되었습니다.")
 }
 
 
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