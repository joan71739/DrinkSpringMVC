<%@page import="org.springframework.ui.Model"%>
<%@page import="tw.billhu.model.ShopCarBean"%>
<%@page import="java.util.List"%>
<%@page import="tw.billhu.model.Orderss"%>
<%@page import="tw.billhu.model.Prouct"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	background-color:rgb(248, 255, 182);
}

.container>h1 {
	font-size: 3em;
	text-align: center;
}

#add {
	text-align: center;
	font-size: 1.5em;
}

.prouct {
	border: 3px solid blue;
	border-radius: 20px;
	text-align: center;
	width: 400px;
	margin: 10px auto
}

.remove {
	float: right;
	margin: 0px 10px;
}

.prouctword {
	display: block;
	position: relative;
	top: 0;
	left: 0px;
	size: 10px;
}

.iceandsugar {
	display: block;
	position: relative;
	top: 0;
	left: 0px;
	size: 10px;
}

.priceword {
	display: inline;
	color: red;
}

.checkout {
	text-align: center;
	/* width: 400px; */
	margin: 10px auto
}

.totalword {
	display: inline;
	color: red;
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
		<h1>購物車</h1>
		<hr>
		<form name="AddForm" action="ShopCar.controller" method="get" id="add">
			<input type="hidden" name="todo" value="add"> 
			<input type="hidden" name="newqty" value="1" id="newqty">
			 
			<label for="prouct">選擇商品:</label> <select name="prouct" id="prouct">
			  <%    List<Prouct> prouct=(List<Prouct>)  request.getAttribute("prouct");
			        for(Prouct item:prouct){
			  
			  %>
					<option value="<%=item.getProuctID()+"-"+item.getStoreID()+"-"+item.getProuctName()+"-"+item.getProuctPrice() %> ">			    
					<%=item.getProuctName()+"------"+item.getProuctPrice() %>
					</option>
			   <%} %>
			

			</select> <label for="ice">冰塊:</label> <select name="ice" id="ice">
				<option value="全冰">全冰</option>
				<option value="少冰">少冰</option>
				<option value=" 去冰">去冰</option>
			</select> <label for="sugar">甜度:</label><select name="sugar" id="sugar">
				<option value="全糖">全糖</option>
				<option value="少糖">少糖</option>
				<option value="半糖">半糖</option>
				<option value="微糖">微糖</option>
				<option value="無糖r">無糖</option>
			</select> <label for="qty">數量:</label><input type="text" name="qty" id="qty"
				size="10" value="1"> <input type="submit" value="加入購物車"
				id="sumbit">
		</form>
		<%
			List<ShopCarBean> car = (List<ShopCarBean>) request.getAttribute("car");
				if (car != null && car.size() > 0) {
			for (int i = 0; i < car.size(); i++) {
				ShopCarBean caritem = car.get(i);
		%>
		<div class="prouct">
			<form name="removeForm" action="ShopCar.controller" method="get">
				<input type="hidden" name="todo" value="remove"> 
				<input type="hidden" name="cartIndex" value="<%=i%>">
				<!--   <img src="#" alt=""> -->
				<label class="prouctName"><%=caritem.getProuctName()%></label> 
				<label class="iceandsugar"><%=caritem.getSugar()%> <%=caritem.getIce()%></label>
				<label>單價:</label>
				<h6 class="priceword" id="priceword">NT$<%=caritem.getPrice()%></h6>
				<label class="qtyword" >數量: </label> 
				<input type='number' name='qty' value='<%=caritem.getQty()%>' class='qty' min="1" size="2" id='proqty' /> 
				<input type="submit" class="remove" value="X">
			</form>
		</div>

		<%
			}
				int total = 0;
				for (int i = 0; i < car.size(); i++) {
			    ShopCarBean caritem = car.get(i);
				total += caritem.getPrice() * caritem.getQty();
				}
		%>

		<div class="checkout">
			<form name="checkoutForm" action="ShopCar.controller" method="get">
				<input type="hidden" name="todo" value="checkout">
				<h5 class="totalword">
					<em id="total">小計NT$<%=total%></em>
				</h5>
				<input type="submit" value="結帳">
			</form>
		</div>
		<%
			}
		%>
	</div>
	<div class="footer">
		<div class="copyRight">&copy 2021/07/09，第三組</div>
	</div>
    <%@ include file="/websiteForm/homeWebsiteBody2.jsp" %>

</body>

</html>