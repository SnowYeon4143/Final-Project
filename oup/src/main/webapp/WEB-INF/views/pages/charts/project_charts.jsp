<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<!-- Google Font: Source Sans Pro -->
 <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!--   Font Awesome -->
 <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
<!--   Theme style -->
 <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">

<!-- ssh CSS -->
<link rel="stylesheet" href="${path}/resources/dist/css/chart2.css">

<style>
body{
	background-color: #443b53;
}
.card-body{
	background-color: rgba(255,255,255,0.19);
	border-radius: 10px;
   	padding: 20px;
}
.card{
	background-color: rgba(255,255,255,0.19);
	backdrop-filter: blur(7px);
	border-radius: 10px;
	box-shadow: 0 10px 25px rgba(51, 51, 51,0.5);
 
}
.content-wrapper{
background-image: url("${path}/resources/dist/img/univ3.png");
height:1200px;
}
</style>


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
            <span> &nbsp; Year</span>
            <form action="/oup/charts/project_charts">
            <select style="width:100px; height:40px; text-align:center; border:0;" name="year" id="year" onchange="this.form.submit()">
		   		 <option selected="selected" style="background-color:#8977ad;">${selectYear}</option>
		   		 <option value="2022">2022</option>
		   		 <option value="2021">2021</option>
		   		 <option value="2020">2020</option>
			</select>
            </form>
            
            
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">ChartJS</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-8">
            

            <!-- DONUT CHART -->
            <div class="card card-danger">
              <div id="card-title" class="card-header">
                <h3 class="card-title">${selectYear}년 프로젝트 매출규모 상위 10 </h3>
              </div>
              <div class="card-body">
                <canvas id="donutChart" style="min-height: 650px; height: 650px; max-height: 650px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col (LEFT) -->
          




		<div class="col-md-4">
            <div class="card card-danger">
              <div id="card-title" class="card-header">
                <h3 class="card-title">${selectYear}년 프로젝트 판매액</h3>
              </div>
              <div class="card-body" id="chartTb">
                <table id="sales">
                	<tr>
                		<td>프로젝트 번호</td>
                		<td>매출액</td>
                	</tr>
                	<c:forEach items="${plist}" var="p">
                	<tr>
                		<td>${p.projectNo}</td>
                		<td><fmt:formatNumber type="number" maxFractionDigits="0" value="${p.saleSum}"/></td>
                	</tr>
                	</c:forEach>
                </table>
              </div>
              <!-- /.card-body -->
            </div><!-- /.card -->
          </div>
          <!-- /.col (RIGHT) -->
       
</div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <%@ include file="/WEB-INF/views/common/footer.jsp" %>


  <aside class="control-sidebar control-sidebar-dark">
    <!-- Add Content Here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="${path}/resources/plugins/chart.js/Chart.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>


<!-- Page specific script -->
<script>
  $(function () {


	  var jsonData = ${json}
	  var jsonObject = JSON.stringify(jsonData);
	  var jData = JSON.parse(jsonObject);
	  
	  
	  var projectNoList = new Array(); //프로젝트 번호
	  var salesList = new Array(); //판매액


	  for(var i = 0; i<jData.length; i++) {
	  	var d = jData[i];
	  	projectNoList.push(d.projectNo);
	  	salesList.push(d.saleSum);
	  }

	  


    //-------------
    //- DONUT CHART -
    //-------------
    // Get context with jQuery - using jQuery's .get() method.
    var donutChartCanvas = $('#donutChart').get(0).getContext('2d')
    var donutData        = {
      labels: projectNoList,
      datasets: [
        {
          data: salesList,
          backgroundColor : ['#ebe7f1', '#d7d0e3', '#c3b9d6', '#b0a2c8', '#9c8cba', '#8977ad'],
          borderColor:'9900ff'
        }
      ]
    }
    var donutOptions     = {
      maintainAspectRatio : false,
      responsive : true,
      cutoutPercentage :35
  
    }

    new Chart(donutChartCanvas, {
      type: 'doughnut',
      data: donutData,
      options: donutOptions
    })





    

  })
</script>





</body>
</html>