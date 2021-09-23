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
<title>店家管理系統首頁</title>
<%@ include file="/websiteForm/enterpriseWebsiteHead.jsp"%>
</head>
<body>
	<%@ include file="/websiteForm/enterpriseWebsiteBody1.jsp"%>
	<%
	String userid = (String) session.getAttribute("userid");
	String company = (String) session.getAttribute("company");
	ArrayList<Store> storeList = (ArrayList<Store>) session.getAttribute("storeList");
	Store st = (Store) session.getAttribute("store");
	%>
	<jsp:useBean id="store" class="tw.store.model.Store" scope="session" />

	<header>
		<h2>店家管理系統首頁</h2>
		<h5>
			店家帳號：<%=userid%>      企業統編：<%=company%>
		</h5>
		<form action="LoginOutAction.controller" method="get">
			<input type="submit" name="reLogin" value="店家登出">
		</form>
	</header>


	<div id="container">
<h3>店家資料</h3>
		<p class="msg">${OKmsg}</p>
		<p class="msg">${nulldelete}</p>
		<p class="msg">${nullupdate}</p>

		<table>
			<tr>
				<td>帳號：<%=userid%></td>
				<td rowspan="4">
					<%
						if (st != null) {
						if (st.getPhoto() != null) {
					%> <img src="<%=request.getContextPath()%>/StoreIMG/${store.stuserid}" style="width: 400px">
					<%
						} else {
					%> <img src="storeImages/NoItem.jpg" style="width: 400px"> <%
 						}
						 } else {
					 %> <img src="storeImages/NoItem.jpg" style="width: 400px"> <%
 						}
 					%>
				</td>
				<td>
					<form action="storeInsertEntry.controller" method="post">
						<input type="submit" name="insert" value="新增/查詢">
					</form>
				</td>
			</tr>
			<tr>
				<td>店名：${store.title} ${nullmsg}</td>
				<td>
					<form action="storeUpdateEntry.controller" method="post">
						<input type="submit" name="delete" value="修改">
					</form>
				</td>
			</tr>
			<tr>
				<td>電話：${store.tel} ${nullmsg}</td>
				<td>
					<form action="storeDeleteEntry.controller" method="post">
						<input type="submit" name="delete" value="刪除">
					</form>
				</td>
			</tr>
		</table>

		<br />
		<!-- 同一企業帳號之其他分店 -->
		<hr />
		<br />
		<h3>其他分店資料</h3>

		<%
			for (Store sts : storeList) {

			if (sts.getStuserid().equals(userid)) {
				continue;
			} else {
		%>

		<table>
			<tr>
				<td>帳號：<%=sts.getStuserid()%></td>
				<td rowspan="4">
					<%
						if (sts.getPhoto() != null) {
					%> <img src="<%=request.getContextPath()%>/StoreIMG/<%=sts.getStuserid()%>" style="width: 400px">
					<%
						} else {
					%> <img src="storeImages/NoItem.jpg" style="width: 400px"> <%
 	}
 %>
				</td>
			</tr>
			<tr>
				<td>店名：<%=sts.getTitle()%>
				</td>
			</tr>
			<tr>
				<td>電話：<%=sts.getTel()%>
				</td>
			</tr>
		</table>
		<%
			}
		}
		%>





	</div>

	<%@ include file="/websiteForm/enterpriseWebsiteBody2.jsp"%>
</body>
</html>