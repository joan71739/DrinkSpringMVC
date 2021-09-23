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
<title>店家系統登入成功</title>
<%@ include file="/websiteForm/enterpriseWebsiteHead.jsp" %>
</head>
<body>
<%@ include file="/websiteForm/enterpriseWebsiteBody1.jsp" %>
	
	<header>
	<h2>登入成功，歡迎使用店家系統</h2>
	</header>
	
	<div id="container">	
	<form action="indexStroeEntry.controller" method="post">
		<input type="submit" value="使用店家系統">
	</form>
	</div>
	<%@ include file="/websiteForm/enterpriseWebsiteBody2.jsp" %>
</body>
</html>