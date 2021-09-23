<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="tw.billhu.model.Orderss"%>
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
	height: auto;
	padding: 50px 0;
	width: 100%;
	background-color:rgb(248, 255, 182);
}

.container>h1 {
	font-size: 3em;
	text-align: center;
}

.selectdate {
	margin: 0 28%;
	margin-top: 10px;
	margin-bottom: 10px;
}

.order {
	border: 2px solid blue;
	border-radius: 20px;
	width: 800px;
	margin: 1% 20%;
}

.order>li {
	border: 1px solid black;
	border-radius: 20px;
	margin: 10px;
	width: 250px;
	padding: 5px;
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
		<h1>訂單查詢</h1>
		<hr>
		<form name="selectdate" action="selectOrderss.controller"
			class="selectdate">
			<input type="hidden" name="todo" value="add"> <input
				type="hidden" name="begin" id="begin" value=""> <input
				type="hidden" name="end" id="end" value=""> 起始日<input
				type="date" id="begindata"> 結束日<input type="date"
				id="enddata"> <input type="submit" value="查詢">
		</form>

		<%
			List<Orderss> ord =(List<Orderss>)  request.getAttribute("order");
			for(Orderss item:ord){
		%>

		<ul class="order">
			<li>訂單編號:<%=item.getOrderssID()%></li>
			<li>商店編號:<%=item.getStoreID() %></li>
			<li>日期:<%=item.getShopDate()%></li>
			<li>訂單總金額:<%=item.getTotal()%></li>
		</ul>

		<%
			
		}
		%>

	</div>
	<div class="footer">
		<div class="copyRight">&copy 2021/07/09，第三組</div>
	</div>
    <%@ include file="/websiteForm/homeWebsiteBody2.jsp" %>
 
	<script>


		document.getElementById("begindata").addEventListener('change',
				function() {
					console.log(document.getElementById("begin").value);
					let a = document.getElementById("begindata").value
					document.getElementById("begin").value = a;
					console.log(document.getElementById("begin").value);
				})
		document.getElementById("enddata").addEventListener('change',
				function() {
					console.log(document.getElementById("end").value);
					let a = document.getElementById("enddata").value
					document.getElementById("end").value = a;
					console.log(document.getElementById("end").value);
				})
	</script>
</body>

</html>