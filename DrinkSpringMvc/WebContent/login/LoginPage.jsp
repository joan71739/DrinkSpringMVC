<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LoginPage</title>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/Css/cs.css" />--%>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/Library/bootstrap-5.0.2-dist/css/bootstrap.css">
	
    <style>

	  * {
  margin: 0;
  padding: 0;
}

.container {
  margin: 80px auto;
  width: 640px;
}
.di1{
  /* position: relative; */
  /* width: 100%; */
  /* height: 100%; */
  width: 500px;
  height: 500px;
  position: absolute;
  top: 50%;
  left: 50%; 
  margin-top: -250px;
  margin-left: -250px;
  /* display: flex; */
  /* justify-content: center; */
}
.login {
  position: relative;
  /* position: absolute; */
  margin: 0 auto;
  padding: 20px 20px 20px;
  width: 300px;
  /* height: 300px; */
  background: white;
  border-radius: 3px;
  text-align: center;
  /* top: 25%; */
  /* left: 25%; */
  justify-content: center;
  /* -webkit-box-shadow: 0 0 200px rgba(255, 255, 255, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3); */
  box-shadow: 0 0 200px rgba(73, 48, 48, 0.5), 0 1px 2px rgba(0, 0, 0, 0.3);
}

.login input[type="text"],
input[type="password"] {
  width: 200px;
  height: 30px;
}

.login input[type="submit"] {
  width: 100px;
  height: 30px;
  font-weight: bold;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.15);
  
}

.login h1 {
  margin: 10px 10px;
}

.new_member {
  position: relative;
  margin: 0 auto;
  padding-bottom: 20px;
  /*margin-left: 53px;*/
  /*text-align: left;*/
  
}
.new_member a {
  text-decoration: none;
}

.remember_me {
  /* float: left; */
  line-height: 31px;
  /* margin-left: 53px; */
  margin: 10px 53px 2px;
  /* text-align: left; */
}

.login-help {
  margin: 20px 0;
  font-size: 11px;
  text-align: center;
}

.login-help a {
  text-decoration: none;
}
	  
      button{
        width: 80px;
        margin: 5px 10px;
      }
	    .err{
    	    font-size: 20px;
            margin-top: 10px;
            color: red;
	        }
        .lop{
			font-size: 20px;
			margin: 80px 0px 30px 0px;
		}
    </style>

</head>
<body>
	<!-- <section> -->
    <div class="di1">
      <div class="login">
       <% 
       String lon = (String)request.getSession().getAttribute("Longin");
       //  if(lon == null){
	   %>      
	   
       <c:set var="lon" value="${sessionScope.Longin}"></c:set>
       <c:if test="${lon == null}">
       <h1>登入</h1> 
       </c:if>
       <c:if test="${lon != null}">
       <h1>登出</h1> 
       </c:if>

<%--        <h1>登入</h1> 
        <%}else {%>
        <h1>登出</h1> 
        <%
        }
        %>
--%>        
		<%-- 
        <form action="<%=request.getContextPath()%>/LoginForm" method="post">
        --%>
        <form action="<%=request.getContextPath() %>/loginController" method="post">
          <p>
          <%
          if(lon == null)
          {
				Cookie cke = null;
		    	  Cookie[] cookies = null;
		    	  String userRe = null;
	   			  String usID = null;

		    	  cookies = request.getCookies();
		    	  if(cookies != null){
		    		  for( int i = 0; i<cookies.length; i++){
		    			  cke = cookies[i];
		    	    	  String cc = cke.getName();
		    	    	  	if(cc.equals("UserID")){
		    	          		usID = cke.getValue();
		    	    	  	}
		    	    	  	cc = cke.getName();
		    	    	  	if(cc.equals("remember_me")){
		    	          		userRe = cke.getValue();
		    	    	  	}
		    		  }
		    	  }
		    	  
		          if(usID != null){
		          %>
		        	  <input type="text" name="userID" value="<%=usID%>" placeholder="Username" />
		          <%
		          } else {
		        	  out.println("<input type=\"text\" name=\"userID\" value=\"\" placeholder=\"Username\" />");
		          }
		          %>
		          </p>
		            <p class="err">${errors.er_usID}</p>
		          <p>
		            <input
		              type="password" name="password" value="" placeholder="Password" />
		          </p>
				  <p class="err">${errors.er_pwd}</p>
				  
		          <p class="remember_me">
		            <%
				   	if(userRe != null && !"".equals(userRe)){
				   	%>
					<div class="di2">
						<div class="form-check form-switch">
  							<input class="form-check-input" style="float: none" type="checkbox" name="remember_me" value="remember_me" checked="checked">
  							<label class="form-check-label" for="remember_me">記住我</label>
						</div>
					</div>
					
					<%
				   	}else {
				   	%>
					<div class="form-check form-switch">
  						<input class="form-check-input" style="float: none" type="checkbox" name="remember_me" value="remember_me">
  						<label class="form-check-label" for="remember_me">記住我</label>
					</div>
				   	<%
				   	}
				   	%>
		          </p>
		          
				  <div>
				  	<p class="new_member">
				  	<a href="<%=request.getContextPath()%>/member/NewMemberAll.jsp">註冊會員</a>
					</p>
				  </div>
		          
		           
		          <p class="submit">
		            <button class="btn btn-primary" type="submit" name="sub" value="login">登入</button>
		            <button class="btn btn-secondary" type="submit" name="sub" value="cancel">取消</button>
		            <%-- <button class="btn btn-warning" type="submit" name="sub" value="autoLogin">一鍵登入</button>--%>
		            
		          </p>
		          <div class="login-help">
		            <p>忘記密碼嗎? <a href="<%=request.getContextPath() %>/login/ForgotPassword.jsp">找回密碼</a></p>
		            
		            <p class="err">${errors.pwderror}</p>
					<%--
		            <%         
		            String useID = (String) request.getSession().getAttribute("UserID");
		            String massag = "";
		            String fal = "t";
		            fal = (String) request.getSession().getAttribute("fal");
		            if(fal == null){
		            	fal = "t";
		            }
		            if(!(useID == null) && !fal.equals("t"))
		            {
		            	massag = "<p class= "+"err"+">登入失敗</p>";
		    			session.invalidate();
		            }
					%>
					<%= massag %>
					--%>
			<%
             }//if
             if(lon != null){
            	 String lonID= (String) request.getSession().getAttribute("UserID");
            %>
            	<p class="lop"><%=lonID %> 是否登出?</p>
 				<button type="submit" name="sub" value="longout">登出</button>
 				<button type="submit" name="sub" value="cancel">取消</button>
             <%
             }
             %>
          
          </div>
        </form>
      </div>
    </div>
    <!-- </section> -->
	<script	src="<%=request.getContextPath()%>/Library/bootstrap-5.0.2-dist/js/bootstrap.js"></script>
</body>
</html>