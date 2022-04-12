<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
table{
border-collapse: collapse; 
}
table th{
 border: 1px solid black;
 background-color: #c3b9d6;
}
table td{
 border: 1px solid black;
 padding : 4px;
 
}

</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.js"></script>



<form action="/oup/project/search_m">
      부서명: 
      <select name="deptCode" id="dept_code" onchange="getTeam(this.value);">
      	<option value="">선택</option>
        <c:forEach items="${dlist}" var="d"> 
       	 <option value="${d.departCode}">${d.departName}</option>
        </c:forEach>
      </select>
      팀명: 
      <select name="teamCode" id="team_code">
      <option value="">선택</option>
      </select>
      
      <input type="submit" value="검색">
</form>

<br>


    <table border="1px" id="member">
      <tr>
        <th>선택</th>
        <th>사원번호</th>
        <th>이름</th>
        <th>팀명</th>
        <th>부서명</th>
        <th>직급</th>
      </tr>
      <c:forEach items="${elist}" var="e"> 
      <tr>
     	<td><input type="radio" name="employeeNo" value="${e.employeeNo}"></td>
     	<td id="empNo">${e.employeeNo}</td>
        <td id="empName">${e.employeeName}</td>
        <td id="teamName">${e.teamName}</td>
        <td id="departName">${e.departName}</td>
        <td>${e.jobTitleName}</td>
        <input id="teamCode" type="hidden" value="${e.teamCode}">
	  </tr>
      </c:forEach>
    </table>
    <br>
<button id="btn" onclick="toAdd();">선택</button>

<script type="text/javascript">

function getTeam(param){
	$("#team_code").empty();
	
		$.ajax({
			url:"/oup/project/search_member.do",
			type:"POST",
			data:{departCode : param},
			success: function(data){
					
					console.log(data);
					console.log(data[0].teamName);
					
					$(data).each(function(i){
						$("#team_code").append("<option value=\""+data[i].teamCode+"\">"+data[i].teamName+"</option>")
					});//each

					},
			error: function(){
					alert("에러");
			}
		});//ajax
	
	
};

</script>
<script type="text/javascript">
function toAdd(){
	 
	var employeeNo = $("input[name=employeeNo]:checked");
	var empNo = employeeNo.parent().parent().children().eq(1).text();
	var empName = employeeNo.parent().parent().children().eq(2).text();
	var teamName = employeeNo.parent().parent().children().eq(3).text();
	var deptName = employeeNo.parent().parent().children().eq(4).text();
	var teamCode = employeeNo.parent().parent().children().val();

	//opener.document.getElementById("search").value= deptName +" "+ teamName +" "+empName;
	//opener.document.getElementById("empNo").value= empNo;
	
	//statement
	opener.document.getElementById("emp").value= empName;
	opener.document.getElementById("tcode").value= teamCode;
	
	self.close();
	
}
</script>





</body>
</html>