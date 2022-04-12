<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${path}/resources/dist/css/chart.css">

<style>
body{
	background-color: #443b53;
}
.card-body{
	background-color: rgba(255,255,255,0.17);
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
            <form action="/oup/charts/monthly_charts">
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
              <li class="breadcrumb-item active">Statistics</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

	
    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-6">
            <!-- AREA CHART -->
            <div class="card card-danger">
              <div id="card-title" class="card-header">
                <h3 class="card-title">월별 판매 통계</h3>

                <div class="card-tools">
				
                </div>
              </div>
              <div class="card-body" style="background-color:#ebe7f15b;">
               <fmt:parseNumber value ="${selectYear}" var="select"/>
              <c:set var="lastYear" value="${select-1}"></c:set>
              <div id="monthHead"> 
              <button id="y1" disabled="disabled"></button> ${selectYear}<br>
               <button id="y2" disabled="disabled"></button> ${lastYear}
              </div>
              <br>
        	    <canvas id="areaChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%;"></canvas>
              </div>
              <!-- /.card-body -->
            </div>

            

			<!-- 월별 판매 데이터 =============================== -->
            <div class="card card-danger">
	             <div id="tbcard" class="card-body" >
	             
          			 <table id="tb">
          			 	<tr>
          			 		<th></th>
          			 		<th>상반기</th>
          			 		<th></th>
          			 		<th>하반기</th>
          			 	</tr>
          			 	<tr>
          			 		<td>
          			 			<div>
			            			 &nbsp;
			             		</div>
			             		<div>
          			 			<c:forEach items="${lastList}" var="last">
				             	<c:if test="${last.month le 6}">
				             		${last.month}월 <hr>
				             	</c:if>
			             		</c:forEach>
			             		</div>
          			 		</td>
          			 <td>
          			 <div class="row">
			             <div id="l1" class="col-6">
			            <div style="width:100%; text-align: center; font-weight:bold;"> ${lastYear} </div>
			             	<c:forEach items="${lastList}" var="last">
				             	<c:if test="${last.month le 6}">
				             	<fmt:formatNumber type="number" maxFractionDigits="0" value="${last.sums}"/> 원
				             	 <hr>
				             	</c:if>
			             	</c:forEach>
			             </div>
			             <div id="l2" class="col-6">
			             <div style="width:100%; text-align : center; font-weight:bold;"> ${selectYear}</div>			            	
			             	<c:forEach items="${thisList}" var="th">
				             	<c:if test="${th.month le 6}">
				             	<fmt:formatNumber type="number" maxFractionDigits="0" value="${th.sums}"/> 원
				             		 <hr>
				             	</c:if>
			             	</c:forEach>
			             </div>
			                    
		             </div><!-- row -->
          			 		</td><!-- 상반기 -->
          			 		<td>
          			 			<div>
			            			 &nbsp;
			             		</div>
			             		<div>
          			 			<c:forEach items="${lastList}" var="last">
				             	<c:if test="${last.month gt 6}">
				             		${last.month}월 <hr>
				             	</c:if>
			             		</c:forEach>
			             		</div>
          			 		</td>
          			 		<td>
          			 			<div class="row">
          			 				<div id="l3" class="col-6">
			            				 <div style="width:100%; text-align : center; font-weight:bold;">${lastYear}</div>
			             			<c:forEach items="${lastList}" var="last">
				             			<c:if test="${last.month gt 6}">
				             			<fmt:formatNumber type="number" maxFractionDigits="0" value="${last.sums}"/> 원
				             				 <hr>
				             			</c:if>
			             			</c:forEach>
			             			</div>   
			             			<div id="l4" class="col-6">
			             				<div style="width:100%; text-align : center; font-weight:bold;">${selectYear}</div>
			             			<c:forEach items="${thisList}" var="th">
				             			<c:if test="${th.month gt 6}">
				             			<fmt:formatNumber type="number" maxFractionDigits="0" value="${th.sums}"/> 원
				             			 <hr>
				             			</c:if>
			             			</c:forEach>
			             			</div> 
          			 			</div>
          			 		</td>
          			 	</tr>
          			 </table>
	             
		             
	            
	            </div><!-- /.card-body -->
            </div><!-- /.card -->
            



          </div>
          <!-- /.col (LEFT) -->
          
          <div class="col-md-6"> <!-- Right  -->
            <!-- BAR CHART -->
            <div class="card card-success">
              <div id="card-title" class="card-header">
                <h3 class="card-title">판매액 / 미수금액 통계</h3>

                <div class="card-tools">
                
                </div>
              </div>
              <div class="card-body">
                <div class="chart">
                  <canvas id="barChart" style="min-height: 375px; height: 375px; max-height: 375px; max-width: 100%;"></canvas>
                </div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            
            
            
			<!-- 미수금 데이터 =============================== -->
            <div class="card card-danger">
             <div class="card-body" style="background-color:#ebe7f181; height:380px;">
             	
            	 <div id="total1">${lastYear}년 총 판매액 : <fmt:formatNumber type="number" maxFractionDigits="0" value="${lastTotal}"/> 원</div> <br>
            	 <div id="total2">${selectYear}년 총 판매액 : <fmt:formatNumber type="number" maxFractionDigits="0" value="${thisTotal}"/> 원 </div> <br>
            	 <hr>
            	 <div id="total3">${selectYear}년 총 미수금액 : <fmt:formatNumber type="number" maxFractionDigits="0" value="${sumuTotal}"/> 원</div> <br>
             
             </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            
            
            
            

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
	  /* 올해 */
	  var jsonData1 = ${json1}
	  var jsonObject1 = JSON.stringify(jsonData1);
	  var jData1 = JSON.parse(jsonObject1);
	  
	  /* 작년 */
	  var jsonData2 = ${json2}
	  var jsonObject2 = JSON.stringify(jsonData2);
	  var jData2 = JSON.parse(jsonObject2);
	  
	  
	  var labelMonth = new Array(); 
	  var valueSums = new Array(); //판매액
	  var valuePaid = new Array(); //수금액
	  
	  var valueLastSums = new Array(); //작년 판매액
	  
	  /* 작년 */
	  for(var i = 0; i<jData1.length; i++) {
	  	var d = jData1[i];
	  	labelMonth.push(d.month);
	  	valueSums.push(d.sums);
	  	valuePaid.push(d.paid);
	  }
	  /* 올해 */
	  for(var i = 0; i<jData2.length; i++) {
		  	var d = jData2[i];
		  	valueLastSums.push(d.sums);
		  }

	  /* =============================================================== */
	  /* =============================================================== */
	  /* =============================================================== */
    
	  
	//--------------
    //- AREA CHART -
    //--------------

    // Get context with jQuery - using jQuery's .get() method.
    var areaChartCanvas = $('#areaChart').get(0).getContext('2d');

    var areaChartData = {
      labels  : labelMonth,
      datasets: [
        {
          label               : '당해',
          backgroundColor     : 'rgba(137,119,173,0.9)',
          borderColor         : 'rgba(137,119,173,0.9)',
          pointRadius          : false,
          pointColor          : '#8977ad',
          pointStrokeColor    : 'rgba(50,141,18,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,10,188,1)',
          data                : valueSums
        },
        {
          label               : '전년도',
          backgroundColor     : 'rgba(235, 231, 241, 0.6)',
          borderColor         : 'rgba(235, 231, 241, 0.6)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : valueLastSums
        },
      ]
    }


    var areaChartOptions = {
      maintainAspectRatio : false,
      responsive : true,
      legend: {
        display: false
      },
      scales: {
        xAxes: [{
          gridLines : {
            display : false,
          }
        }],
        yAxes: [{
          gridLines : {
            display : false,
          }
        }]
      }
    }

    new Chart(areaChartCanvas, {
        type: 'line',
        data: areaChartData,
        options: areaChartOptions
      })


    //-------------
    //- BAR CHART -
    //-------------
    
        var paidChartData = {
      labels  : labelMonth,
      datasets: [
        {
          label               : '수금액',
          backgroundColor     : 'rgba(137,119,173,0.9)',
          borderColor         : 'rgba(137,119,173,0.9)',
          pointRadius          : false,
          pointColor          : '#8977ad',
          pointStrokeColor    : 'rgba(50,141,18,1)',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(60,10,188,1)',
          data                :  valuePaid
        },
        {
          label               : '판매액',
          backgroundColor     : 'rgba(235, 231, 241, 0.6)',
          borderColor         : 'rgba(235, 231, 241, 0.6)',
          pointRadius         : false,
          pointColor          : 'rgba(210, 214, 222, 1)',
          pointStrokeColor    : '#c1c7d1',
          pointHighlightFill  : '#fff',
          pointHighlightStroke: 'rgba(220,220,220,1)',
          data                : valueSums
        },
      ]
    }
    
    
    
    var barChartCanvas = $('#barChart').get(0).getContext('2d')
    var barChartData = $.extend(true, {}, paidChartData)
    var temp0 = paidChartData.datasets[0]
    var temp1 = paidChartData.datasets[1]
    barChartData.datasets[0] = temp1
    barChartData.datasets[1] = temp0

    var barChartOptions = {
      responsive              : true,
      maintainAspectRatio     : false,
      datasetFill             : false
    }

    new Chart(barChartCanvas, {
      type: 'bar',
      data: barChartData,
      options: barChartOptions
    })

  })//전체 
</script>






</body>
</html>