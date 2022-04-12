<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 <link rel="stylesheet" href="${path}/resources/dist/css/project_add.css">

<!-- jquery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
            <h1>프로젝트 추가</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <form action="project_add" method="post" onsubmit="return check();">
        <div class="col-md-12" id="miandiv">
          <div class="card card-primary">
            <div class="card-header">
              <h3 class="card-title">Project</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="card-body">
            
              <div class="group">
                <label for="inputName">- 프로젝트 이름</label>
                <input type="text" id="inputName" name="projectName" class="form-control">
              </div>
              <hr>
              <div class="group">
                <label for="inputDescription">1. 프로젝트 시행 목적</label>
                <textarea id="projectContents1" name="projectContents1" class="form-control" rows="4" style="width:100%;height:60px;overflow-y:hidden"></textarea>
				<textarea id="xt" style="width:90%;height:1px;overflow-y:hidden;position:absolute;top:-9px" disabled></textarea>
                
               <!--  <textarea id="projectContents1" name="projectContents1" class="form-control" rows="4"></textarea> -->
              </div>
              <div class="group">
                <label for="inputDescription">2. 프로젝트 개요 및 추친방향</label>
                 <textarea id="projectContents2" name="projectContents2" class="form-control" rows="4" style="width:100%;height:60px;overflow-y:hidden"></textarea>
				<textarea id="xt" style="width:90%;height:1px;overflow-y:hidden;position:absolute;top:-9px" disabled></textarea>
              </div>
              <div class="group">
                <label for="inputDescription">3. 프로젝트 시행 효과</label>
                 <textarea id="projectContents3" name="projectContents3" class="form-control" rows="4" style="width:100%;height:60px;overflow-y:hidden"></textarea>
				<textarea id="xt" style="width:90% !important;height:1px;overflow-y:hidden;position:absolute;top:-9px" disabled></textarea>
              </div>
              <div class="group">
                <label for="inputDescription">4. 제안 및 요구사항</label>
                 <textarea id="projectContents4" name="projectContents4" class="form-control" rows="4" style="width:100%;height:60px;overflow-y:hidden"></textarea>
				<textarea id="xt" style="width:90%;height:1px;overflow-y:hidden;position:absolute;top:-9px" disabled></textarea>
              </div>
              <br><hr>
              <div class="group">
              <table>
		          <tr>
		            <td style='width: 30%;'>- 프로젝트 기간 : </td>
		            <td style='width: 30%;'><input type="date" name="projectStart" id="sdate" value="" onchange="setmin();"></td>
		            <td style='width: 5%;'> &nbsp;&nbsp; ~ &nbsp; </td>
		            <td style='width: 30%;'><input type="date" name="projectEnd" id="edate" value="" onchange="setmax();"></td>
		          </tr>
		        </table>
              </div>
              <hr>
              
                <div class="group">

                  <span style='font-size:30px;'> 프로젝트 그룹 </span> 
                  <input id="searchEmp" type="button" value="검색" onclick="popup2();" style="width:50px !important;">
                  <span id='overlapchk' style='font-size:20px; color:red'></span>
                  <br><br>
                  <span style='font-size:20px;'>- 프로젝트 그룹장 (책임자)</span> 
                  <div>
                      <input type="text" name="employeeNo" id="empNo" readonly style='width:30px !important; border:0px; background-color: transparent;'>
                      <input type="text" name="employeeName" id="empName" readonly style='width:100px !important; border:0px; background-color: transparent;'>
                  </div>
					<br>          
                  
                 <span style='font-size:20px;'>- 프로젝트 그룹원</span> 
                  <div id="box">
    			  </div>
    			  <br><br>
                </div><!-- /group -->
              </div><!-- /.card-body -->
            </div>



            <div class="row">
              <div class="col-12">
                <input id="submitbtn" type="submit" value="프로젝트 생성" class="btn btn-secondary float-left">
                <a href="${path}/project/project_list" class="btn btn-secondary float-right">취소</a>
              </div>
            </div>
              
            <br><br>
          <!-- /.card -->
        </div>
        </div>
      </form>
    </section>
    <!-- /.content -->
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
  
 <script>
        const remove = (obj) => {
            document.getElementById('box').removeChild(obj.parentNode);
        }
 </script>
  
 <script type="text/javascript">
function popup(){
	var settings="width=560,height=420, scrollbars=yes, resizable=no, left=700, top=200";
	popupWindow=window.open("${path}/project/search_member","search",settings);
}

function popup2(){
	var settings="width=560,height=420, scrollbars=yes, resizable=no, left=700, top=200";
	popupWindow=window.open("${path}/project/search_members","search",settings);
}
</script>
 <script type="text/javascript">
 window.addEmpNo = function(no,name){
	 const box = document.getElementById("box");
     const newP = document.createElement('p');
     newP.innerHTML = "<input readonly type='text' name='employeeNo' style='width:30px !important; border:0px; background-color:#ebe7f1;' value='"+no+"'><input readonly type='text' name='employeeName' style='width:100px !important; border:0px; background-color:#ebe7f1;' value='"+name+"'> <input type='button' value='삭제' onclick='remove(this)' style='width:50px !important;'>";
     box.appendChild(newP);
 }
 </script>
  
<script type="text/javascript">
function check(){
	let result="";
	let empArr = document.getElementsByName('employeeNo');


	for(let i =0; i < empArr.length; ++i){
		for(let j = empArr.length - 1; j > i; j--){
			 if(empArr[i].value == empArr[j].value){
				 result='overlap';
			 }
		}
	}
	
	if(result == 'overlap'){
		$('#overlapchk').append("그룹에 중복되는 사원이 있습니다.");
		console.log(result);
		return false;
	}else{
		$('#projectContents1').val().replace(/\r\n|\n/ , "<br>"); 
		$('#projectContents2').val().replace(/\r\n|\n/ , "<br>"); 
		$('#projectContents3').val().replace(/\r\n|\n/ , "<br>"); 
		$('#projectContents4').val().replace(/\r\n|\n/ , "<br>"); 
		return true;
	}
	
};
</script>


<script>
    function xSize(e)
    { var xe = document.getElementById('xt'),t;
        e.onfocus = function(){ t = setInterval(function(){ xe.value = e.value; e.style.height = (xe.scrollHeight + 12) + 'px'; }, 100);}
        e.onblur = function(){clearInterval(t);}
    } xSize(document.getElementById('projectContents1'));
</script>
<script>
    function xSize(e)
    { var xe = document.getElementById('xt'),t;
        e.onfocus = function(){ t = setInterval(function(){ xe.value = e.value; e.style.height = (xe.scrollHeight + 12) + 'px'; }, 100);}
        e.onblur = function(){clearInterval(t);}
    } xSize(document.getElementById('projectContents2'));
</script>
<script>
    function xSize(e)
    { var xe = document.getElementById('xt'),t;
        e.onfocus = function(){ t = setInterval(function(){ xe.value = e.value; e.style.height = (xe.scrollHeight + 12) + 'px'; }, 100);}
        e.onblur = function(){clearInterval(t);}
    } xSize(document.getElementById('projectContents3'));
</script>
<script>
    function xSize(e)
    { var xe = document.getElementById('xt'),t;
        e.onfocus = function(){ t = setInterval(function(){ xe.value = e.value; e.style.height = (xe.scrollHeight + 12) + 'px'; }, 100);}
        e.onblur = function(){clearInterval(t);}
    } xSize(document.getElementById('projectContents4'));
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
<!-- AdminLTE for demo purposes -->
<%-- <script src="${path}/resources/dist/js/demo.js"></script> --%>


</body>

</html>                 