<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.List" import="tw.kuziwu.model.DiscussBean" %>
<!DOCTYPE html>
<html>
		<head>
			<meta charset="UTF-8">
			<title>討論區</title>
			<%@ include file="/websiteForm/homeWebsiteHead.jsp" %>
			<style>
				body{
				background-color:	#324376;
				}
				.footdiv {
					font-family: 'Yellowtail', cursive;
					/* 英文 */
					color: aliceblue;
					font-size: 10px;
					bottom: 0px;
					right: 30px;
				}
			
				.footer {
					margin:  auto, auto, 10px, auto;
					background-color: rgb(3, 26, 102);
				}
			
				.footer .copyRight {
					color: white;
					text-align: center;
					padding: 20px 0;
				}
				
				.but1 { 
					text-align:right;
				    border: 0;
				    background-color: #628bce;
				    color: #fff;
				    font-family: 'Kosugi Maru', sans-serif;
				    /* 日文 */
				    border-radius: 3px
				}
				
				.but1:hover {
				    color: #628bce;
				    background-color: #fff;
				    border: 0px #003C9D solid;
				    font-family: 'Kosugi Maru', sans-serif;
				    /* 日文 */
				}
				table{
				  margin: auto;
				  padding: 20px;
				  border-collapse: separate;
				  border-spacing: 0;
				}
				tr{
				  border: 1px solid #f5dd90;
				}
				td{
				  border: 1px solid #607ee0;
				  padding: 10px 30px;
				  background-color:#f5dd90;
				  color: 324376;
				}
				
				/*第一欄第一列：左上*/
				tr:first-child td:first-child{
				  border-top-left-radius: 5px;
				}
				/*第一欄最後列：左下*/
				tr:last-child td:first-child{
				  border-bottom-left-radius: 5px;
				}
				/*最後欄第一列：右上*/
				tr:first-child td:last-child{
				  border-top-right-radius: 5px;
				}
				/*最後欄第一列：右下*/
				tr:last-child td:last-child{
				  border-bottom-right-radius: 5px;
				}
		</style>
		</head>
	<body>
		<%@ include file="/websiteForm/homeWebsiteBody1.jsp" %>
		<table>
				  <%
                List<DiscussBean> discussList = (List<DiscussBean>)request.getAttribute("discussAll");
                %>
                <%
                for(DiscussBean item : discussList){
                %>
                <tr>
                	<td>店家名稱:<%= item.getShopName()%></td>
                	<td>飲料名:<%= item.getDrink()%></td>
                	<td>評論:<%=item.getDrinkDiscuss() %></td>
                	<td><%=item.getDrinkstar()%>顆星</td>
                		<td><input type="submit" value="修改">
						<input type="submit" value="刪除"></td>
						
                </tr>
                <%
                }%>
          </table>      
                
                <%@ include file="/websiteForm/homeWebsiteBody2.jsp" %>
                	<div class="footer">
						<div class="copyRight"> &copy 2021/07/09，第三組 <div class="footdiv animate__animated animate__bounce animate__delay-2s">kuzi</div></div>
					</div>
	</body>
</html>