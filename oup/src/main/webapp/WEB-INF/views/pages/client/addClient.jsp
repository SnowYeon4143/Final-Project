<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>거래처 등록</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${path}/resources/plugins/fontawesome-free/css/all.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${path}/resources/dist/css/adminlte.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
<body class="hold-transition sidebar-mini">

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md">
          <div class="card card-primary">
            <div class="card-header">
              <h2>거래처 정보 등록</h3>

              <div class="card-tools">
                <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
                  <i class="fas fa-minus"></i>
                </button>
              </div>
            </div>
            
            <div class="card-body">
           
            	<form action="" method="post">
	              <div class="form-group">
	                <label style="font-size: 150%">상호이름</label>
	                <input style="font-size: 150%" type="text" name="cName" class="form-control" placeholder="(주)영업 2팀">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">사업자등록번호</label><br>
	                <select style="font-size: 150%" id="bNoSelect" class="form-control col-md-3" onchange="bNoChange(this)">
	                  <option>사업자등록번호</option>
	                  <option>비사업자</option>	<!-- 비사업자 선택 시 bNo에 999 값을 넣었음 -->
	                </select>
	                <input  style="font-size: 150%"type="text" name="bNo" class="form-control col-md-9" placeholder="사업자 번호 10자리" id="bNoText">
	              </div><br>
	              <div class="form-group">
	                <label style="font-size: 150%">종사업장번호</label>
	                <input style="font-size: 150%" type="number" name="bNo2" class="form-control" placeholder="0001 (없을경우 0001)">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">업태</label>
	                <input style="font-size: 150%" type="text" name="cType" class="form-control" placeholder="서비스 외 (개발공급 외)">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">대표자명</label>
	                <input style="font-size: 150%" type="text" name="cOwner" class="form-control" placeholder="홍길동">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">전화</label>
	                <input style="font-size: 150%" type="text" name="cPhone" class="form-control" placeholder="010-1010-1010">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">Fax</label>
	                <input style="font-size: 150%" type="text" name="cFax" class="form-control" placeholder="010-1010-1010">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">Email</label>
	                <input style="font-size: 150%" type="text" name="cEmail" class="form-control" placeholder="aabbcc@aabbcc.com">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">주소</label>
	                <button class="btn btn-secondary mb-3" type="button" style="margin: 15px; font-size: 150%" onclick="javascript:goPopup();">주소찾기</button>
   	 				<input style="font-size: 150%" type="text" class="form-control col-md" placeholder="기본 주소를 입력해 주세요" id="addr" name="cAddr" readonly>
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">여신한도</label>
	                <input style="font-size: 150%" type="number" name="cCreditLimit" class="form-control" placeholder="300000000">
	              </div>
	              <div class="form-group">
	                <label style="font-size: 150%">여신기한 (월/일)</label><br>
	                <select style="font-size: 150%" name="cCreditMonth" class="form-control col-md-4" >
	                  <option>0</option>
	                  <option>1</option>
	                  <option>2</option>
	                  <option>3</option>
	                  <option>4</option>
	                  <option>5</option>
	                  <option>6</option>
	                  <option>7</option>
	                  <option>8</option>
	                  <option>9</option>
	                  <option>10</option>
	                  <option>11</option>
	                  <option>12</option>
	                </select>
	                <select style="font-size: 150%" name="cCreditDay" class="form-control col-md-4">
	                  <option>0</option>
	                  <option>1</option>
	                  <option>2</option>
	                  <option>3</option>
	                  <option>4</option>
	                  <option>5</option>
	                  <option>6</option>
	                  <option>7</option>
	                  <option>8</option>
	                  <option>9</option>
	                  <option>10</option>
	                  <option>11</option>
	                  <option>12</option>
	                  <option>13</option>
	                  <option>14</option>
	                  <option>15</option>
	                  <option>16</option>
	                  <option>17</option>
	                  <option>18</option>
	                  <option>19</option>
	                  <option>20</option>
	                  <option>21</option>
	                  <option>22</option>
	                  <option>23</option>
	                  <option>24</option>
	                  <option>25</option>
	                  <option>26</option>
	                  <option>27</option>
	                  <option>28</option>
	                  <option>29</option>
	                  <option>30</option>
	                </select>
	              </div>
	              <br><br>
	              <div class="form-group" style="float: right; margin-right: 20px;">
	                <button style="font-size: 150%" type="submit" class="btn btn-outline-primary btn-lg">등록</button>
	                <button style="font-size: 150%" type="button" class="btn btn-outline-primary btn-lg" onclick="window.close()">취소</button>
	              </div>
              </form>
            </div>
          </div>
        </div>
        </div>
        </section>

<!-- jQuery -->
<script src="${path}/resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="${path}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="${path}/resources/dist/js/adminlte.min.js"></script>

<script> 
	function bNoChange(e) {
		var selectText = document.getElementById("bNoText");
		if(e.value == "사업자등록번호") {
			selectText.style.visibility="visible";
		}
		else if(e.value == "비사업자") {
			selectText.style.visibility="hidden";
			selectText.value="999";
		}
	}
	
	var goPopup = function(){ 
		var pop = window.open("${path}/resources/pages/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		} 
	var jusoCallBack = function(
			roadFullAddr,roadAddrPart1,addrDetail,
			roadAddrPart2,engAddr, jibunAddr, zipNo
			){ 
				document.getElementById("addr").value = roadFullAddr; 
				if(addrDetail.length>30){ 
					alert('상세주소가 너무 길어 다시 입력해야 합니다.'); 
					return; 
		} 
	} 


</script>
</body>
</html>
