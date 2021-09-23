<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="tw.billhu.model.ShopCarBean"%>
<%@page import="tw.billhu.model.Prouct"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>enterprise page</title>
<style>
* {
	padding: 0;
	margin: 0;
	list-style: none;
}

.container {
	height: 100vh;
	padding: 50px 0;
	width: 100%;
	background-color: rgb(248, 255, 182);
}

.container>h1 {
	font-size: 3em;
	text-align: center;
}

.checkoutProuct {
	border: 1px solid blue;
	border-collapse: collapse;
	margin: 10px auto;
	width: 300px
}

.container>h6 {
	font-size: 3em;
	text-align: center;
}

.footer {
	background-color: rgb(3, 26, 102);
}

.footer .copyRight {
	color: white;
	text-align: center;
	padding: 20px 0;
}

.clearFloat {
	clear: both
}
</style>
<%@ include file="/websiteForm/homeWebsiteHead.jsp" %>
</head>

<body>
<%@ include file="/websiteForm/homeWebsiteBody1.jsp" %>

	<div class="container">
		<h1>您訂單已送至店家</h1>
		<h6>
			<img src="ShopCar/images/thanks.png">
		</h6>

	</div>
<%@ include file="/websiteForm/homeWebsiteBody2.jsp" %>
	</div>
	<div class="footer">
		<div class="copyRight">&copy 2021/07/09，第三組</div>
	</div>


</body>

</html>