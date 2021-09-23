<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>ModifyMember</title>
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
	padding: 0 10px 10px;
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
	width: 500px;
}

.spa {
	font-size: 10px;
	color: gray;
}

.btn {
	width: 100%;
	position: relative;
	display: flex;
	justify-content: center;
}

.btn button {
	margin: 20px 10px 10px 10px;
}


</style>
</head>
<body>
	<div class="d1">
		<section>
			<form id="nForm" action="<%=request.getContextPath() %>/modifyMenberController" method="post">
			  <input type="hidden" name="type" value="form-a_mo" />
			  <%
			  String userID = (String) request.getSession().getAttribute("UserID");
			  String idClass = (String) request.getSession().getAttribute("ClassMember");
			  String rePws = (String) request.getAttribute("Type_fg");
			  
			  Map<String, String> userData = new HashMap<String, String>();
			  userData = (Map<String,String>)request.getAttribute("userData");
			  String pwsString = "";
		  	  String nameString = "";
		  	  String birthdayString = "";
		  	  String emailString = "";
			  if(userData != null){
				  pwsString = (String) userData.get("password");
			  	  nameString = (String) userData.get("name");
			  	  birthdayString = (String) userData.get("birthday");
			  	  emailString = (String) userData.get("email");
			  }

			  %>
				<fieldset>
					<legend>會員資料修改</legend>
						<%
	              		if("fa".equals(idClass)){
	              			pwsString = "";
	              		%>
				           <h1 style="color: red">請先修改密碼</h1>
				        <%	
				        //session.invalidate();
				        }
				        %>
					<div class="dd1">
						<div>
							<!--  <label for="userID">帳號：</label>-->
							<%
							out.println("<label>帳號："+userID+"</label>" );
                			%>
						  <input type="hidden" name="userID" value="<%=userID %>" />
						</div>
						<div>
							
						</div>
					</div>
					<div class="dd1">
						<div>
							
							<label for="password">密碼：</label>
							<%
							//String password = (String) request.getSession().getAttribute("password");
							String password = pwsString;

							//usernameID="aaa";
							if (password != null) {
							%>
							<input type="password" id="pws" name="pws"
								value="<%=password%>" style="width: 100px" />
							<%
							//out.println("<input type=\"password\" id=\"password\" name=\"password\" value=\""+password+"\" style=\"width: 100px\" />");
							} else {
							out.println("<input type=\"password\" id=\"pws\" name=\"pws\" style=\"width: 100px\" />");

							}
							%>

							<!-- <input type="password" id="password" name="password" style="width: 100px" /> -->
							<span id="pwsW" class="spa">至少6個字且必須包含英數字</span>
						</div>
						<div>
							<label for="passwordck">密碼確認：</label>
							<%
							String passwordck = pwsString;
							if (passwordck != null) {
							%>
							<input type="password" id="passwordck" name="passwordck"
								value="<%=passwordck%>" style="width: 100px" />
							<%
							//out.println("<input type=\"password\" id=\"passwordck\" name=\"passwordck\" value=\""+passwordck+"\" style=\"width: 100px\" />");
							} else {
							out.println("<input type=\"password\" id=\"passwordck\" name=\"passwordck\" style=\"width: 100px\" />");

							}
							%>
							<!-- <input type="password" id="passwordck" name="passwordck" style="width: 100px" /> -->
							<span id="pwsck" class="spa"></span>
						</div>
					</div>
					<div class="dd1">
						<div>
							<label for="name">姓名：</label>
							<%
							String name = nameString;
							if (name != null) {
							%>
							<input type="text" id="name" name="name" value="<%=name%>"
								style="width: 100px" />
							<%
							//out.println("<input type=\"text\" id=\"name\" name=\"name\" value=\""+name+"\" style=\"width: 100px\" />");
							} else {
							out.println("<input type=\"text\" id=\"name\" name=\"name\" style=\"width: 100px\" />");

							}
							%>
							<!-- <input type="text" id="name" name="name" style="width: 100px" /> -->
						</div>
						<div>
							<label for="birthday">出生年月日：</label>
							<%
							String birthday = birthdayString;
							if (birthday != null) {
							%>
							<input type="text" id="birthday" name="birthday" value="<%=birthday%>" style="width: 100px" />
							<%
							} else {
							out.println("<input type=\"text\" id=\"birthday\" name=\"birthday\" style=\"width: 100px\" />");

							}
							%>
							<!-- <input type="text" id="birthday" name="birthday" style="width: 100px" placeholder="ex:099/01/01" /> -->
						</div>
					</div>
					<div>
						<div>
							<label for="email">E-mail：</label>
							<%
							String email = emailString;
							if (email != null) {
							%>
							<input type="text" id="email" name="email" value="<%=email%>"
								style="width: 300px" autocomplete="off" />
							<%
							} else {
							out.println("<input type=\"text\" id=\"email\" name=\"email\" style=\"width: 300px\" autocomplete=\"off\"/>");
							}
							%>
							<!-- <input type="text" id="email" name="email" style="width: 300px"/> -->
						</div>
					</div>
					<div class="btn">
						<button type="submit" name="sub" value="modifySubmit">確認修改</button>
						<button type="submit" name="sub" value="cancel">取消</button>
					</div>

				</fieldset>
			</form>
		</section>
	</div>

	<script src="<%=request.getContextPath() %>Library/jquery-3.6.0.js"></script>
	<script src="<%=request.getContextPath() %>Library/jquery-ui-1.12.1/jquery-ui.js"></script>
	<script>
	$(function () {
		$("#birthday").datepicker({
			dateFormat: 'yy-mm-dd',
			changeMonth: true,
		     changeYear: true
		     });
	})

		document.getElementById("pws").onblur = pwsCk;
          function pwsCk() {
            let thePwsObjVal = document.getElementById("pws").value;
            let sp = document.getElementById("pwsW");
            let thp1 = false,
              thp2 = false
              // thp3 = false;
            //let spText = /^[!@#$%^&*]$/;
            let pwsL = thePwsObjVal.length;
            if (thePwsObjVal == "") {
              sp.innerHTML = "<img src='./images/error.png'>不可為空白";
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
	              sp.innerHTML = "<img src='./images/error.png'>不可為空白";
	              document.getElementById("pwsck").style.color = "red";
	            }else if(pw !== thePwsCkObjVal){
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
		document.getElementById("userID").onblur = checkUserID;

		function checkUserID() {
			document.getElementById("nForm").submit();
			//nForm.submit();
		}

	</script>
</body>
</html>
