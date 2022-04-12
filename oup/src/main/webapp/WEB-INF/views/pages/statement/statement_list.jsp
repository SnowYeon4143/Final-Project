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
 <link rel="stylesheet" href="${path}/resources/dist/css/statement_list.css">
 


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
            <h1 style="font-size: 40px;">거래 명세서 조회</h1>
          </div>
          <br><br><br>

        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    
      


      <!-- Default box -->
      <div class="card" id="cardss">

		<form action="${path}/statement/statement_list/1" method="get" id="search">
        <table class="atb1">
          <tr>
            <td> 주문 날짜 : </td>
            <td><input type="date" name="date1" id="sdate" value="" onchange="setmin();"></td>
            <td> &nbsp; ~ &nbsp; </td>
            <td><input type="date" name="date2" id="edate" value="" onchange="setmax();"></td>
          </tr>
        </table>
        
        
        <table class="atb2">
          <tr>
            <td>
              <select name="category" id="cate">
                <option value="T.S_NO">명세서번호</option>
                <option value="T.C_NO">거래처코드</option>
                <option value="T.O_NO">주문서번호</option>
                <option value="C.C_NAME">거래처명</option>
              </select>
            </td>
            <td><input type="text" name="search"></td>
            <td><input type="submit" value="검색"></td>
          </tr>
        </table>
        </form>
        <br>



        <div>
          <table class="table" id="btb">
            <thead>
              <tr>
                <th><input type="checkbox"></th>
                <th>주문서번호</th>
                <th>명세서번호</th><!-- 번호/미발급 (발급버튼) -->
                <th>거래처코드</th>
                <th>거래처명</th>
                <th>사업자번호</th>
                <th>SKU</th>
                <th>공급가액</th>
                <th>VAT</th>
                <th>합계금액</th><!--c set 계산  -->
                <th>명세서수정</th>
              </tr>
            </thead>
            <tbody>
            <c:forEach items="${slist}" var="s">
              <tr>
             	<c:if test="${s.SNo eq 0 || s.SNo eq null}">
                <td>■</td>
                </c:if>
                <c:if test="${s.SNo ne 0 && s.SNo ne null}">
                <td><input type="checkbox" class="checkbox-del" value="${s.SNo}"></td>
                </c:if>
                <td>${s.ONo}</td>
                <c:if test="${s.SNo eq 0 || s.SNo eq null}">
                <td>미발급 <button id="btn2" onclick="add(${s.ONo});">발급</button></td>
                </c:if>
                <c:if test="${s.SNo ne 0 && s.SNo ne null}">
                <td><a href="${path}/statement/statement_detail/${s.ONo}">
               		 ${s.SNo}</a>
                </td>
                </c:if>
                <td>${s.CNo}</td>
                <td>${s.CName}</td>
                <td>${s.BNo}</td>
                <td>${s.sku}</td>
                <c:set var="total" value="${s.STotal*(10/11)}"></c:set>
                <c:if test="${s.vatYn eq 'Y'}">
                <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${s.STotal}"/></td> 
                <td>VAT포함</td>
                <td><fmt:formatNumber type="number" maxFractionDigits="0" value="${s.STotal}"/></td>
                </c:if>
                <c:if test="${s.vatYn ne 'Y'}">
                <td><span style="color:blue;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${total}"/></span></td>                 
                <td><span style="color:red;">VAT미포함</span></td>
                <td><span style="color:blue;"><fmt:formatNumber type="number" maxFractionDigits="0" value="${s.STotal}"/></span></td>
                </c:if>
                
              	<c:if test="${s.SNo eq 0 || s.SNo eq null}">
                <td>-</td>
                </c:if>
                <c:if test="${s.SNo ne 0 && s.SNo ne null}">
                <td><button type="button" id="btn1" onclick="goedit(${s.ONo});">수정</button></td>
                </c:if>
              
              </tr>
             </c:forEach>
            </tbody>
          </table>
          <button id="ckdel" type="button" onclick="del();">선택 삭제</button>
        </div><!-- table -->
       
        	<br>
	<div class="row">

          <div class="btn-group me-2" role="group" aria-label="First group" style="margin-left: 40%;">
            	
            		<c:if test="${empty search && empty date1 && empty date2}">
            			<c:if test="${page.startPage == 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/statement/statement_list/1'">Prev</button>
            			</c:if>
            			<c:if test="${page.startPage gt 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/statement/statement_list/${page.startPage - 1}'">Prev</button>
            			</c:if>   
			            
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					        <c:if test="${page.currentPage != i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary" onclick="location.href='${path}/statement/statement_list/${i}'">${i}</button>
					      	</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary active" onclick="location.href='${path}/statement/statement_list/${i}'">${i}</button>
					        </c:if>
						</c:forEach>
			           
			            <c:if test="${page.endPage < page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/statement/statement_list/${page.endPage + 1}'">Next</button>
						</c:if>
						<c:if test="${page.endPage >= page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/statement/statement_list/${page.lastPage}'">Next</button>
						</c:if>
            		</c:if>
            		
            		
            		<!-- 검색 수정 ================ -->
            		
            		<c:if test="${not empty search || not empty date1 || not empty date2}">
	                	<c:if test="${page.startPage == 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/1?date1=${date1}&date2=${date2}&category=C.C_NAME&search=${search}'">Prev</button>
            			</c:if>
            			<c:if test="${page.startPage gt 1}">  
            			<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.startPage - 1}?date1=${date1}&date2=${date2}&category=C.C_NAME&search=${search}'">Prev</button>
            			</c:if>  
			           
			            <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					        <c:if test="${page.currentPage != i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${i}?date1=${date1}&date2=${date2}&category=C.C_NAME&search=${search}'">${i}</button>
					      	</c:if>
							<c:if test="${page.currentPage == i and i <= page.lastPage}">                  
					        	<button type="button" class="btn btn-secondary active" onclick="location.href='${path}/project/project_list/${i}?date1=${date1}&date2=${date2}&category=C.C_NAME&search=${search}'">${i}</button>
					        </c:if>
						</c:forEach>
			            
			            <c:if test="${page.endPage < page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.endPage + 1}?date1=${date1}&date2=${date2}&category=C.C_NAME&search=${search}'">Next</button>
						</c:if>
						<c:if test="${page.endPage >= page.lastPage}">
							<button type="button" class="btn btn-secondary" onclick="location.href='${path}/project/project_list/${page.lastPage}?date1=${date1}&date2=${date2}&category=C.C_NAME&search=${search}'">Next</button>
						</c:if>
            		</c:if>
                </div><!--pager  -->
		</div>
		<!-- /row -->
        
        
      </div>
      <!-- /.card -->
      
    </div>
  <!-- /.content-wrapper -->


 <script>

   function setmin(){
	   console.log($("#sdate").val());
	   $('#edate').attr("min",$("#sdate").val());
   }

</script>
<script type="text/javascript">
	function setmax(){
		console.log($("#edate").val());
		$('#sdate').attr("max",$("#edate").val());
	}
</script>

<script type="text/javascript">
	function add(param){
		window.location = '${path}/statement/statement_enroll/'+param;
	}

</script>

<script type="text/javascript">
 function goedit(param){
	 location.href="${path}/statement/statement_edit/"+param;
 }
</script>

<script type="text/javascript">
	//상단 체크박스 클릭
	let topCheckBox = document.querySelector('thead input[type=checkbox]');
	let delArr = document.getElementsByClassName('checkbox-del');
	
	topCheckBox.onchange = function(e){
		if(this.checked){
			for(let i =0; i < delArr.length; ++i){
				delArr[i].checked= true;
			}
		}else{
			for(let i =0; i<delArr.length; ++i){
				delArr[i].checked= false;
			}
		}
	}
	
	
	//삭제하기 버튼
	function del(){
		let result =""; 
		let delArr = document.getElementsByClassName('checkbox-del');
		
		for(let i =0; i< delArr.length; ++i){
			let t = delArr[i];
			if(t.checked){
				result +=t.value + ',';
				}
			}


		$.ajax({
				url:"${path}/statement/delete_ck",
				data:{"str": result},
				type: 'post',
				success:function(data){
					//alert("통신성공");
					console.log(data);
				},
				erorr:function(){
					//alert("통신실패");
					console.log(e);
				},
				complete:function(){
					//삭제처리 후 새로고침 처리
					window.location.reload();
				}
			});
		
		}//del()
		
	</script>






 <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</div>
<!-- ./wrapper -->

 
 <!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- jquery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>
 


</body>
</html>