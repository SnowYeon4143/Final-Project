<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- Preloader -->
<div
	class="preloader flex-column justify-content-center align-items-center">
	<img class="animation__shake"
		src="${path}/resources/dist/img/AdminLTELogo.png" alt="AdminLTELogo"
		height="60" width="60">
</div>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light"
	style="background-color: #8977ad">
	<!-- Left navbar links -->
	<ul class="navbar-nav">
		<li class="nav-item"><a class="nav-link" data-widget="pushmenu"
			href="#" role="button"><i class="fas fa-bars"></i></a></li>
		<li class="nav-item d-none d-sm-inline-block"><a href="${path}"
			class="nav-link">Home</a></li>
		<li class="nav-item d-none d-sm-inline-block"><a href="#"
			class="nav-link">Contact</a></li>
	</ul>

	<!-- Right navbar links -->
	<ul class="navbar-nav ml-auto">
		<!-- Navbar Search -->
		<li class="nav-item"><a class="nav-link"
			data-widget="navbar-search" href="#" role="button"> <i
				class="fas fa-search"></i>
		</a>
			<div class="navbar-search-block">
				<form class="form-inline">
					<div class="input-group input-group-sm">
						<input class="form-control form-control-navbar" type="search"
							placeholder="Search" aria-label="Search">
						<div class="input-group-append">
							<button class="btn btn-navbar" type="submit">
								<i class="fas fa-search"></i>
							</button>
							<button class="btn btn-navbar" type="button"
								data-widget="navbar-search">
								<i class="fas fa-times"></i>
							</button>
						</div>
					</div>
				</form>
			</div></li>

		<li class="nav-item"><a class="nav-link" data-widget="fullscreen"
			href="#" role="button"> <i class="fas fa-expand-arrows-alt"></i>
		</a></li>
	</ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4"
	style="background-color: #443b53; color: #000000;">
	<!-- Brand Logo -->
	<a href="${path}/" class="brand-link"> <img
		src="${path}/resources/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light" style="color: #ebe7f1">OUP</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar" style="height: 100%;">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">
			<%-- <div class="image">
          <img src="${path}/resources/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div> --%>
			<div class="info" style="width: 100%">
				<a href="#" style="color: #ebe7f1; display: inline-block">${loginEmployee.employeeName}</a>
				<a href="${path}/logout" style="color: #ebe7f1; float: right;">로그아웃</a>
			</div>
		</div>

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search"
					style="background-color: #5a4e70; color: #ebe7f1">
				<div class="input-group-append">
					<button class="btn btn-sidebar" style="background-color: #5a4e70">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
				<li class="nav-item"><a href="${path}/mail/rbox"
					class="nav-link"> <i class="nav-icon far fa-envelope"></i>
						<p style="color: #ffffff">
							메일함 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${path}/mail/rbox"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">받은메일함</p>
						</a></li>
						<li class="nav-item"><a href="${path}/mail/sbox"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">보낸메일함</p>
						</a></li>
						<li class="nav-item"><a href="${path}/mail/trash"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">휴지통</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-calendar-alt"></i>
						<p style="color: #ebe7f1">
							프로젝트 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${path}/project/project_list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">프로젝트 조회</p>
						</a></li>
						<li class="nav-item"><a href="${path}/project/project_add"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">프로젝트 등록</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-edit"></i>
						<p style="color: #ebe7f1">
							결재 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${path}/approval/receivebox"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">결재조회</p>
						</a></li>
						<li class="nav-item"><a href="${path}/approval/send"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">결재등록</p>
						</a></li>
					</ul></li>

				<li class="nav-header" style="color: #ebe7f1">영업 / 판매</li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-building"></i>
						<p style="color: #ebe7f1">
							거래처 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${path}/client/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">거래처조회</p>
						</a></li>
						<li class="nav-item"><a href="javascript:addClientPop();"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">거래처 등록</p>
						</a></li>
					</ul></li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-file"></i>
						<p style="color: #ebe7f1">
							주문서 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${path}/order/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">주문 조회</p>
						</a></li>
						<li class="nav-item"><a href="${path}/order/addOrder"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">주문 입력</p>
						</a></li>
						
					</ul></li>
				
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-dollar-sign"></i>
						<p style="color: #ebe7f1">
							판매 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${path}/sale/list"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">판매 조회</p>
						</a></li>
						<li class="nav-item"><a href="${path}/sale/enter"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">판매 입력</p>
						</a></li>
						
					</ul></li>
				<li class="nav-item">
					<!-- ============================요기 --> <a href="#"
					class="nav-link"> <i class="nav-icon fas fa-file"></i></i>
						<p style="color: #ebe7f1">
							거래명세서 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a
							href="${path}/statement/statement_list" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">명세서 조회</p>
						</a></li>
					</ul>
				</li>
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon fas fa-chart-pie"></i>
						<p style="color: #ebe7f1">
							판매통계 <i class="right fas fa-angle-left"></i>
						</p>
				</a>
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="${path}/charts/monthly_charts"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">월간/주간 판매통계</p>
						</a></li>
						<li class="nav-item"><a href="${path}/charts/project_charts"
							class="nav-link"> <i class="far fa-circle nav-icon"></i>
								<p style="color: #ebe7f1">프로젝트별 통계</p>
						</a></li>
					</ul></li>

			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
<script>
	var addClientPop = function() {
		var addClient = window
				.open(
						"${path}/client/addList",
						"addClient",
						"width=720,height=600, location=yes, menubar=yes, resizable=no, status=no, toolbar=no, scrollbas=no, fullscreen=no");
	}
</script>