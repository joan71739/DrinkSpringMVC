<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 連結: 放body裡第一行
	<%@ include file="/websiteForm/homeWebsiteBody1.jsp" %>
--%>
<%
	// 編碼設訂
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
%>	
<%
	// 取得帳號資料
	String UserID = (String)session.getAttribute("UserID");
	String ClassMember = (String)session.getAttribute("ClassMember");
	String Vat = (String)session.getAttribute("Vat");
	String Longin = (String)session.getAttribute("Longin");
	// Longin != null 為已登入狀態
	// Longin == null 為未登入狀態
	
	
	// 未登入、已登入側邊欄各項目連結不一樣
	String memberDataLink =null;
	String orderNowLink =null;
	String orderQueryLink =null;
	String commentLink =null;
	
	if(Longin == null){ // 未登入狀態
		
		memberDataLink = "'#'";
		orderNowLink = "'#'";
		orderQueryLink = "'#'";
		commentLink = "'#'";
		
	}else{ // 已登入狀態
		
		memberDataLink = "'" + request.getContextPath()  +"\\member\\ModifyFirstMember.jsp'";
		//memberDataLink = "'" + request.getContextPath()  +"\\modifyMenberController'";
		orderNowLink = "'" + request.getContextPath()  + "\\initShopCar.controller'";
		orderQueryLink = "'" + request.getContextPath()  + "\\selectAllOrderss.controller'";
		commentLink = "'"+ request.getContextPath() +"\\Discuss\\DiscussPage.jsp"+"'";		
	}
	
	
	
	//System.out.println("UserID="+UserID);
	//System.out.println("ClassMember="+ClassMember);
	//System.out.println("Vat="+Vat);
	System.out.println("Longin="+Longin);

%>	
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
	<!-- Navbar Brand-->
	<a class="navbar-brand ps-3 myFontTC myLetterSpace2" href='#'>飲料線上訂</a>
	<!-- Sidebar Toggle-->
	<button class="myNavBtnDisappear btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
		id="sidebarToggle" href="#">
		<i class="fas fa-bars"></i>
	</button>
	<!-- Navbar Search-->
	<form
		class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
		<div class="input-group">
			<!-- 
                搜尋欄
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
             -->
		</div>
	</form>
	<%
	// 登錄成功狀態
	if (Longin != null) {
	%>
	<div class="myFontTC myFontColorWhite myLetterSpace2 ">
		<%=UserID%>
	</div>
	<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
		<li class="nav-item dropdown"><a class="nav-link dropdown-toggle"
			id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
			aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
			<ul class="dropdown-menu dropdown-menu-end"
				aria-labelledby="navbarDropdown">
				<!-- LinkTag-登出 -->
				<li><a class="dropdown-item myFontTC myTextCenter"
					href="<%=request.getContextPath() %>/login/LoginPage.jsp">登出</a></li>
			</ul></li>
	</ul>
	<%
	}
	%>

	<%
	// 未登錄狀態
	if (Longin == null) {
	%>

	<!-- LinkTag-登入 -->
	<a href="<%=request.getContextPath() %>/login/LoginPage.jsp" class="myLoginBtn">登入</a>
	<!-- LinkTag-註冊 -->
	<a href="<%=request.getContextPath() %>/member/NewMemberAll.jsp" class="mySignUpBtn">註冊</a>

	<%
	}
	%>
</nav>

<div id="layoutSidenav">
	<div id="layoutSidenav_nav">
		<nav class="sb-sidenav accordion sb-sidenav-dark"
			id="sidenavAccordion">
			<div class="sb-sidenav-menu">
				<div class="nav">
					<div class="sb-sidenav-menu-heading myLetterSpace2">帳戶資訊</div>
					<!-- LinkTag-會員資料 -->
					<a class="nav-link myFontTC myLetterSpace2"
						href=<%=memberDataLink%>>
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 會員資料
					</a>
					<div class="sb-sidenav-menu-heading myLetterSpace2">訂購</div>
					<!-- LinkTag-立即下訂 -->
					<a class="nav-link myFontTC myLetterSpace2" href=<%=orderNowLink%>>
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 立即下訂
					</a>
					<!-- LinkTag-訂單查詢 -->
					<a class="nav-link myFontTC myLetterSpace2"
						href=<%=orderQueryLink%>>
						<div class="sb-nav-link-icon">
							<i class="fas fa-tachometer-alt"></i>
						</div> 訂單查詢
					</a>
					<div class="sb-sidenav-menu-heading myLetterSpace2">評論</div>
					<!-- LinkTag-我要評論 -->
					<a class="nav-link  myFontTC myLetterSpace2" href=<%=commentLink%>>
						<div class="sb-nav-link-icon">
							<i class="fas fa-table"></i>
						</div> 我要評論
					</a>
				</div>
			</div>
		</nav>
	</div>



	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
