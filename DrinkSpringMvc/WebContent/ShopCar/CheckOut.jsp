
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
<title>checkout</title>
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
.container>h5 {
	text-align: center;
}

.checkoutProuct {
	border: 1px solid blue;
	border-collapse: collapse;
	margin: 10px auto;
	width: 300px
}

th, td {
	border: 1px solid blue;
	line-height: 30px;
}

tbody {
	text-align: center;
}

tbody tr:nth-child(2n) {
	background-color: cornflowerblue;
}

tbody tr:nth-child(2n+1) {
	background-color: cornsilk;
}

#confirm {
	margin-left: 48%;
	display: inline;
}

#cancel {
	display: inline;
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
		<h1>訂單</h1>
		<hr>
			<h5>您消費的項目</h5>
		<table class="checkoutProuct">

			<tbody>
				<tr>
					<th>品項</th>
					<th>數量</th>
					<th>單品總價</th>
				</tr>
				<%
					List<ShopCarBean> cars = (List<ShopCarBean>) request.getAttribute("car");
						for (ShopCarBean item : cars) {
							double oneProuctTotal = item.getPrice() * item.getQty();
				%>

				<tr>
					<td><%=item.getProuctName()%><em><%=item.getIce() + " " + item.getSugar()%></em></td>
					<td><%=item.getQty()%></td>
					<td>NT$<%=oneProuctTotal%></td>
				</tr>
				<%
					}
				
				%>

				<tr>
					<td colspan="2" style="border-right: none;">總數量:<%=request.getAttribute("allQty")%></td>

					<td colspan="2">total: <%=request.getAttribute("allProuctTotal")%></td>
				</tr>
			</tbody>
		</table>
		

		<form name="confimForm" action="ShopCar.controller" method="get" id="confirm">
		   <input type="hidden" name="todo" value="confim">

			<input type="submit" value="確認">
		</form>

		<form name="cancalForm" action="ShopCar.controller" method="get" id="cancel">
            <input type="hidden" name="todo" value="cancal">
			<input type="submit" value="取消">
		</form>

	</div>
	<div class="footer">
		<div class="copyRight">&copy 2021/07/09，第三組</div>
	</div>
  <%@ include file="/websiteForm/homeWebsiteBody2.jsp" %>

</body>

</html>