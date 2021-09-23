<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.store.model.*,java.util.*"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="storeCss/style.css">
<title>修改店家資料</title>
<%@ include file="/websiteForm/enterpriseWebsiteHead.jsp"%>
</head>
<body>
	<%@ include file="/websiteForm/enterpriseWebsiteBody1.jsp"%>
	<%
		Store st = (Store) session.getAttribute("store");
	%>
	<jsp:useBean id="store" class="tw.store.model.Store" scope="session" />

	<header>
		<h2>修改店家資料</h2>
		<form action="indexStroeEntry.controller" method="post">
			<input type="submit" value="返回首頁">
		</form>
	</header>

	<div id="container">
		<form action="storeUpdateAction.controller" modelAttribute="storeItem"
			method="post" enctype="multipart/form-data">

			<table>
				<tr>
					<td>封面：</td>
					<td><input type="file" name="photo"></td>
					<td rowspan="7">
						<%
							if (st.getPhoto() != null) {
						%> <img src="<%=request.getContextPath()%>/StoreIMG/${store.stuserid}" style="width: 400px">
						<%
							} else {
						%> <img src="storeImages/NoItem.jpg" style="width: 400px"> <%
 							}
						 %>
					</td>
				</tr>
				<tr>
					<td>帳號：</td>
					<td>${store.stuserid}</td>
				</tr>
				<tr>
					<td>店名：</td>
					<td><input type="text" name="title" value="${store.title}"></td>
				</tr>
				<tr>
					<td>負責人：</td>
					<td><input type="text" name="manager" value="${store.manager}"></td>
				</tr>
				<tr>
					<td>地址：</td>
					<td><input type="text" name="stadd" value="${store.stadd}"></td>
				</tr>
				<tr>
					<td>聯絡電話：</td>
					<td><input type="text" name="tel" value="${store.tel}"></td>
				</tr>
				<tr>
					<td>簡介：</td>
					<td><textarea name="intro" rows="10" cols="30"
							style="resize: none">${store.intro}</textarea></td>
				</tr>

			</table>

			<input type="submit" value="確認修改">

		</form>
	</div>
	<%@ include file="/websiteForm/enterpriseWebsiteBody2.jsp"%>
</body>
</html>