<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="tw.store.*,java.util.*"%>
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
<title>店家登入系統</title>
<%@ include file="/websiteForm/enterpriseWebsiteHead.jsp" %>
</head>
<body>
<%@ include file="/websiteForm/enterpriseWebsiteBody1.jsp" %>
	
	<header>
	<h2>店家登入系統</h2>
	</header>
	
	<div id="container">	
	<form action="checkLoginAction.controller" method="post">
		<table>
			<tr>
				<td>帳號：</td>
				<td><input type="text" name="userid""></td>
			</tr>
			<tr>
				<td>密碼：</td>
				<td><input type="password" name="pwd"></td>
			</tr>
		</table>
		<input type="submit" value="確認送出">
		<p>${errors}</p>
	</form>
	</div>
	<%@ include file="/websiteForm/enterpriseWebsiteBody2.jsp" %>
</body>
</html>