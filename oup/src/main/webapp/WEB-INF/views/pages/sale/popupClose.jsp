<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 id="msg" style="display: none;">${msg}</h2>
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script type="text/javascript">
		Swal.fire({
		  text: document.getElementById('msg').innerText,
		  showCancelButton: false,
		  confirmButtonColor: '#8977ad',
		  confirmButtonText: '확인',
		}).then((result) => {
		  if (result.value) {
			  window.close();
		  }
		})
	</script>
</body>
</html>