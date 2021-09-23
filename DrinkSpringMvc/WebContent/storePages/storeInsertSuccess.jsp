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
<title>資料新增成功</title>
<%@ include file="/websiteForm/enterpriseWebsiteHead.jsp" %>
</head>
<body>

	<%@ include file="/websiteForm/enterpriseWebsiteBody1.jsp" %>
	<%
		String fileName = (String) session.getAttribute("fileName");
	%>
	<jsp:useBean id="store" class="tw.store.model.Store" scope="session" />



	<header>
		<h2>資料新增成功</h2>
		<form action="indexStroeEntry.controller" method="post">
			<input type="submit" value="返回首頁">
		</form>
	</header>


<div id="container">	
	<table>
		<tr>
			<td>ID：</td>
			<td>${store.storeid}</td>
			<td>封面：</td>
		</tr>
		<tr>
			<td>建立日期：</td>
			<td>${store.startdate}</td>
			<td rowspan="7">
				<%
					if (fileName != null) {
				%> <img src="<%=request.getContextPath()%>/StoreIMG/<%=fileName%>" style="width: 400px">
				<%
					} else {
				%> <img src="storeImages/NoItem.jpg" style="width: 400px"> <%
 				}
				session.removeAttribute("fileName");
				 %>
			</td>
		</tr>
		<tr>
			<td>帳號：</td>
			<td>${store.stuserid}</td>
		</tr>
		<tr>
			<td>店名：</td>
			<td>${store.title}</td>
		</tr>
		<tr>
			<td>負責人：</td>
			<td>${store.manager}</td>
		</tr>
		<tr>
			<td>地址：</td>
			<td>${store.stadd}</td>
		</tr>
		<tr>
			<td>聯絡電話：</td>
			<td>${store.tel}</td>
		</tr>
		<tr>
			<td>簡介：</td>
			<td>${store.intro}</td>
		</tr>
	</table>
</div>
	<%@ include file="/websiteForm/enterpriseWebsiteBody2.jsp" %>
</body>
</html>