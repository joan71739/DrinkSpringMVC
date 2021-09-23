<%@page import="tw.login.dao.MemberDB"%>
<%@page import="tw.login.bean.SQLMemberID"%>
<%@page import="tw.login.dao.MemberDao"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NewMember</title>
<%@ include file="/websiteForm/homeWebsiteHead.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/Library/jquery-ui-1.12.1/jquery-ui.css">
<style>
fieldset { 
	width: 700px;
	border: 2px solid black;
	border-radius: 10px;
	margin-top: 30px;
	font-family: 標楷體;
	box-shadow: 0 0 20px rgba(73, 48, 48, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}

legend {
	margin: 5px 10px;
	font-size: 30px;
//	padding: 0 10px 10px;
}

.d1 {
	display: flex;
	position: relative;
	justify-content: center;
}

.dd1 {
	margin-bottom: 20px;
	display: flex;
	width: 100%;
}

.dd1 div {
	width: 400px;
}
.dd2 {
        margin-bottom: 20px;
      }
.spa {
	font-size: 10px;
	color: gray;
}

.btnn {
	width: 100%;
	position: relative;
	display: flex;
	justify-content: center;
}

.btnn button {
	margin: 20px 10px 10px 10px;
}

</style>
</head>
<body>
<%@ include file="/websiteForm/homeWebsiteBody1.jsp" %>

	<div class="d1">
		<section>
			<form id="nForm" action="<%=request.getContextPath() %>/newMenberController" method="post">
			  <input type="hidden" id="cla" name="type" value="form-a" />
				<fieldset>
				<%
				String sel_A ="selected";
				String sel_B ="";
				String type_A="text";
				String type_B="hidden";
				String sty_A="";
				String sty_B="style =\"display:none\"";
				String eName_A = "email";
				String eName_B = "";
				//String formN= (String) request.getSession().getAttribute("Type");
				String formN= (String) request.getAttribute("Type");
				if(formN != null){
					if(formN.equals("A")){
						sel_A ="selected";
						sel_B ="";
						type_A="text";
						type_B="hidden";
						sty_A="";
						sty_B="style =\"display:none\"";
						eName_A = "email";
						eName_B = "";
					}
					if(formN.equals("B")){
						sel_A ="";
						sel_B ="selected";
						type_A="hidden";
						type_B="text";
						sty_A="style =\"display:none\"";
						sty_B="";
						eName_A = "";
						eName_B = "email";
					}
				}
				%>
					<legend <%=sty_A %>>會員申請</legend>
					<legend <%=sty_B %>>企業會員申請</legend>
					<div class="dd1">
					
					<select id="sel">
    						<option value="memberA" <%=sel_A %>>一般會員</option>
    						<option value="memberVendorB" <%=sel_B %>>企業會員</option>
  					</select>
					
					</div>
					<div class="dd1">
						<div>
							<label for="userID">帳號：</label>
							<%
							String userID = request.getParameter("userID");
							String UserIDCk = (String) request.getAttribute("UserIDCk");
							
							if(userID == null){
								userID = MemberDB.getUserID();
							}
							if (userID != null) {
							%>
							<input type="text" id="userID" name="userID" value="<%=userID%>" style="width: 100px" />
							<%
							} else {
							out.println("<input type=\"text\" id=\"userID\" name=\"userID\" style=\"width: 100px\" />");
							}
							if ("T".equals(UserIDCk)) {
							out.println("<span class=\"spa\" style=\"color: red;\"><img src='./images/error.png'>帳號重複</span>");
							//session.invalidate();
							}
							if ("F".equals(UserIDCk) && (userID != null) && !"".equals(userID)){
							out.println("<span class=\"spa\" style=\"color: green;\"><img src='./images/correct.png'>帳號可以使用</span>");
							} if ("".equals(userID)) {
								out.println("<span class=\"spa\" style=\"color: red;\"><img src='./images/error.png'>帳號不可為空</span>");
							}
							%>
						</div>
						<div>
							<label for="vendor" <%=sty_B %>>企業名稱：</label>
                			<%String vendor =request.getParameter("vendor");
                				if(vendor == null){
                					vendor = MemberDB.getVendor();
                				}
                				if(vendor != null){
                			%>
                				<input type="<%=type_B %>" name="vendor" value="<%=vendor%>" style="width: 100px" />
                			<%
                				}else{%>
                					<input type="<%=type_B %>" id="vendor" name="vendor" style="width: 100px" />
                			<% 
                				}
                			%>
						</div>
					</div>
					<div class="dd1">
						<div>
							<label for="password">密碼：</label>
							<%
							String password = MemberDB.getPassword();

							if (password != null) {
							%>
							<input type="password" id="pws" name="pws"
								value="<%=password%>" style="width: 100px" />
							<%
							} else {
							out.println("<input type=\"password\" id=\"pws\" name=\"pws\" style=\"width: 100px\" />");

							}
							if ("".equals(password)) {
								out.println("<span id=\"pwsW\" class=\"spa\" style=\"color: red;\"><img src='./images/error.png'>密碼不可為空</span>");
							}else {
							%>
								<span id="pwsW" class="spa">至少6個字且必須包含英數字</span>
							<%
							}
							%>
							
						</div>
						<div>
							<label for="passwordck">密碼確認：</label>
							<%
							String passwordck = MemberDB.getPasswordck();
							if (passwordck != null) {
							%>
							<input type="password" id="passwordck" name="passwordck"
								value="<%=passwordck%>" style="width: 100px" />
							<%
							} else {
							out.println("<input type=\"password\" id=\"passwordck\" name=\"passwordck\" style=\"width: 100px\" />");

							}
							%>
							<% 
							if ("".equals(password)) {
								out.println("<span id=\"pwsck\" class=\"spa\" style=\"color: red;\"><img src='./images/error.png'>密碼不可為空</span>");
							}else {
							%>
								<span id="pwsck" class="spa"></span>
							<%
							}
							%>
							
						</div>
					</div>
					<div class="dd1">
						<div>
							<!-- 一般 -->
							<label for="name" <%=sty_A %>>姓名：</label>
							<%
							String name = MemberDB.getName();
							if (name != null) {
							%>
							<input type="<%=type_A %>" name="name" value="<%=name%>" style="width: 100px" />
							<%
							} else {
							%>
							<input type="<%=type_A %>" name="name" style="width: 100px" />
							<%
							}
							%>
							
							<!-- 企業 -->
							<label for="principal" <%=sty_B %>>負責人：</label>
                			<%
                			String principal = request.getParameter("principal");
        					if(principal == null){
        						principal = MemberDB.getPrincipal();
        					}
                		
                			if(principal != null){
                			%>
                			<input type="<%=type_B %>" name="principal" value="<%=principal%>" style="width: 100px" />
                			<%
                			}else{
                			%>
                			<input type="<%=type_B %>" name="principal" style="width: 100px" />
                			<%
                			}
                			%>
						</div>
						<div>
							<!-- 一般 -->
							<label for="birthday" <%=sty_A %>>出生年月日：</label>
							<%
							String birthday = MemberDB.getBirthday();
							if (birthday != null) {
							%>
							<input type="<%=type_A %>" id="birthday" name="birthday" value="<%=birthday%>" style="width: 100px" autocomplete="off"/>
							<%
							} else {
							%>
							<input type="<%=type_A %>" id="birthday" name="birthday" style="width: 100px" autocomplete="off"/>
							<%
							}
							%>
							<!-- 企業 -->
							<label for="vat" <%=sty_B %>>統一編號：</label>
                			<%
                			String vat = request.getParameter("vat");
        					if(vat == null){
        						vat = MemberDB.getVat();
        					}
                			if(vat != null){
                			%>
                			<input type="<%=type_B %>" id="vat" name="vat" value="<%=vat%>" style="width: 100px" />
                			<%
                			}else{
                			%>
                			<input type="<%=type_B %>" id="vat" name="vat" style="width: 100px" />
                			<%
                			}
                			%>
						</div>
					</div>
					<div class="dd2">
              			<div>
                			<label for="email" <%=sty_A %>>E-mail：</label>
			                <%String email = request.getParameter("email");
			        			if(email == null){
			        				email = MemberDB.getEmail();
			        			}
			                	if(email != null && "A".equals(formN)){
			                %>
			                	<input type="<%=type_A %>" name="<%=eName_A %>" value="<%=email %>" style="width: 300px" autocomplete="off" />
			                <%
			                	}else if ("A".equals(formN) || formN == null){
			                %>
			                	<input type="<%=type_A %>" name="<%=eName_A %>" style="width: 300px" autocomplete="off" />
			                <%
			                }
			                %>

                			<label for="address" <%=sty_B %>>住址：</label>
                			<%String address = request.getParameter("address");
        					if(address == null){
        						address = MemberDB.getAddress();
        					}
			                	if(address != null){
			                %>
			                	<input type="<%=type_B %>" name="address" value="<%=address%>" style="width: 300px" autocomplete="off" />
			                	
			                <%
			                	}else{
			                %>
			                	<input type="<%=type_B %>" name="address" style="width: 300px" autocomplete="off"/>
			                <%
			                	}
			                %>
			              </div>
			            </div>
			            <div>
			              <div class="dd2">
			              
			                <label for="email" <%=sty_B %>>E-mail：</label>
			                <%//String emailB = request.getParameter("email");
			        			//if(email == null){
			        				//email = MemberDB.getEmail();
			        			//}
			                	if(email != null){
			                %>
			                	<input type="<%=type_B %>" name="<%=eName_B %>" value="<%=email%>" style="width: 300px" autocomplete="off" />
			                	
			                <%
			                	}else{%>
			                	<input type="<%=type_B %>" name="<%=eName_B %>" style="width: 300px" autocomplete="off" />
			                <%		
			                }
			                %>
			                <!-- <input type="text" id="email" name="email" style="width: 300px" /> -->
			              </div>
			            </div>
					<div class="btnn">
						<button type="submit" id="sub1" name="sub" value="nextChack">送出</button>
						<button type="submit" id="sub2" name="sub" value="res">清除重填</button>
						<button type="submit" name="sub" value="cancel">取消</button>

					</div>

				</fieldset>
			</form>
		</section>
	</div>
	
	
	<script src="<%=request.getContextPath() %>/Library/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath() %>/Library/jquery-ui-1.12.1/jquery-ui.js"></script>
	<script>
	$(function () {
		//日期選擇
		$("#birthday").datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
		     changeYear: true
		     });
	})
	
	    //密碼檢查
		document.getElementById("pws").onblur = pwsCk;
          function pwsCk() {
            let thePwsObjVal = document.getElementById("pws").value;
            let sp = document.getElementById("pwsW");
            let thp1 = false,thp2 = false;
            let pwsL = thePwsObjVal.length;
            if (thePwsObjVal == "") {
              sp.innerHTML = "<img src='./images/error.png'>密碼不可為空";
              document.getElementById("pwsW").style.color = "red";
            } else if (pwsL < 6) {
              sp.innerHTML =
                "<img src='./images/error.png'>至少6個字且必須包含英數字";
              document.getElementById("pwsW").style.color = "red";
            } else if (pwsL >= 6) {
              for (let i = 0; i < pwsL; i++) {
                let ch = thePwsObjVal.charAt(i).toUpperCase();
                if (ch >= "A" && ch <= "Z") {
                  thp1 = true;
                }
                if (ch >= "0" && ch <= "9") {
                  thp2 = true;
                }
              }
              if(thp1 || thp2){
            	  sp.innerHTML = "<img src='./images/error.png'>必須包含英數字";
            	  document.getElementById("pwsW").style.color = "red";
              }
              if (thp1 && thp2) {
                sp.innerHTML = "<img src='./images/correct.png'>正確";
                document.getElementById("pwsW").style.color = "green";
              }
             
            }
          }
          
		document.getElementById("passwordck").onblur = checkPws;
			function checkPws() {
	            let thePwsCkObjVal = document.getElementById("passwordck").value;
	            let sp = document.getElementById("pwsck");
	            let pw = document.getElementById("pws").value
	            let thp1 = false,
	              thp2 = false
	              // thp3 = false;
	            //let spText = /^[!@#$%^&*]$/;
	            let pwsL = thePwsCkObjVal.length;
	            if (thePwsCkObjVal == "") {
	              sp.innerHTML = "<img src='./images/error.png'>密碼不可為空";
	              document.getElementById("pwsck").style.color = "red";
	            }else if(pw != thePwsCkObjVal){
	            	sp.innerHTML = "<img src='./images/error.png'>兩次密碼不符"
	            	document.getElementById("pwsck").style.color = "red";
	            }else if (pwsL < 6) {
	              sp.innerHTML =
	                "<img src='./images/error.png'>至少6個字且必須包含英數字";
	              document.getElementById("pwsck").style.color = "red";
	            } else if (pwsL >= 6) {
	              for (let i = 0; i < pwsL; i++) {
	                let ch = thePwsCkObjVal.charAt(i).toUpperCase();
	                if (ch >= "A" && ch <= "Z") {
	                  thp1 = true;
	                }
	                if (ch >= "0" && ch <= "9") {
	                  thp2 = true;
	                }
	              }
	              if (thp1 && thp2 && (pw === thePwsCkObjVal)) {
	                sp.innerHTML = "<img src='./images/correct.png'>正確";
	                document.getElementById("pwsck").style.color = "green";
	              }
	            }
		}
		//帳號檢查--送出
		document.getElementById("userID").onblur = checkUserID;
		function checkUserID() {
			let se=document.getElementById("sel").value
	        if(se=="memberA"){
	          //隱藏碼
	          document.getElementById("cla").value="form-a"
	        }
	        if(se=="memberVendorB"){
	          document.getElementById("cla").value="form-b"
	        }
	        document.getElementById("nForm").submit();
		}
		//選擇類別
		document.addEventListener("DOMContentLoaded", function () {
	        document.getElementById("sel").addEventListener("change",ss);
	        document.getElementById("sub1").addEventListener("click",addFormN);
	        document.getElementById("sub2").addEventListener("click",addFormN);
	      });
	      //
	      function ss(){
	      let se=document.getElementById("sel").value
	        if(se=="memberA"){
	          //隱藏碼
	          document.getElementById("cla").value="form-a"
	        }
	        if(se=="memberVendorB"){
	          document.getElementById("cla").value="form-b"
	        }
	          document.getElementById("nForm").submit();
	      }
		//送出編碼
		//document.getElementById("sub1").click = addFormN;
		function addFormN() {
			let se=document.getElementById("sel").value
	        if(se=="memberA"){
	          //隱藏碼
	          document.getElementById("cla").value="form-a"
	          
	        }
	        if(se=="memberVendorB"){
	          document.getElementById("cla").value="form-b"
	        }
		}
	</script>
<%@ include file="/websiteForm/homeWebsiteBody2.jsp" %>
</body>
</html>