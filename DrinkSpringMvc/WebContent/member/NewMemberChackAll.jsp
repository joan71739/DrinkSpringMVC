<%@page import="tw.login.dao.MemberDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NewMemberChack</title>
    <style>
      fieldset { 
        width: 500px;
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
        width: 300px;
      }
      .dd2 {
        margin-bottom: 20px;
      }
      .spa {
        font-size: 10px;
        color: gray;
      }
      .btn{
        width: 100%;
        position: relative;
        display: flex;
        justify-content: center;
      }
      .btn button{
        margin: 20px 10px 10px 10px;
      }
    </style>
  </head>
  <body>

    <div class="d1">
      <section>
        <form action="<%=request.getContextPath() %>/newMenberController" method="post">
          <fieldset>
          <%
			String sty_A="";
			String sty_B="style =\"display:none\"";
			String val="";

			//String formN= (String) request.getSession().getAttribute("Type");
			String formN= (String) request.getAttribute("Type");
			if(formN != null){
				if(formN.equals("A")){
					sty_A="";
					sty_B="style =\"display:none\"";
					val="form-a";
				}
				if(formN.equals("B")){
					sty_A="style =\"display:none\"";
					sty_B="";
					val="form-b";
				}
			}
			%>
			<input type="hidden" id="cla" name="type" value=<%=val %> />
            <legend>會員資料確認</legend>
            <div class="dd1">
              <div>
                <label for="userID">帳號：<%=MemberDB.getUserID() %></label>
              </div>
              <div>
              	<label <%=sty_B %>>企業名稱：<%=MemberDB.getVendor() %></label>
              </div>
            </div>
            <div class="dd1">
              <div>
                <%out.println("<label>密碼：**********</label>" );
                %>
              </div>
              <div>

              </div>
            </div>
            <div class="dd1">
              <div>
              	<label <%=sty_A %>>姓名：<%=MemberDB.getName() %></label>
              	<label <%=sty_B %>>負責人：<%=MemberDB.getPrincipal() %></label>
              </div>
              <div>
                <label <%=sty_A %>>出生年月日：<%=MemberDB.getBirthday() %></label>
                <label <%=sty_B %>>統一編號：<%=MemberDB.getVat() %></label>
              </div>
            </div>
            <div class="dd2">
              <div>
				<label <%=sty_B %>>住址：<%=MemberDB.getAddress() %></label>
				<label <%=sty_A %>>E-mail：<%=MemberDB.getEmail() %></label>
              </div>
            </div>
            <div>
              <div class="dd2">
                <label <%=sty_B %>>E-mail：<%=MemberDB.getEmail() %></label>
              </div>
            </div>
            <div class="btn">
              <button type="submit" name="sub" value="submit">送出</button>
              <button type="submit" name="sub" value="modify">修改</button>
            </div>
            
          </fieldset>
        </form>
      </section>
    </div>
  </body>
</html>
