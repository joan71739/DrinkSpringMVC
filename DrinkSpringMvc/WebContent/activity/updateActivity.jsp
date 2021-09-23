<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="activity.model.ActivityBean"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>setActivity</title>
	<!-- jQuery CSS 樣式(配合 jQuery UI)-->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/Library/jquery-ui-1.12.1/jquery-ui.css">
	<style>
		*{  
			padding: 0;
			margin: 0;
		}
		body{
			background-color:rgb(248, 255, 180);
		}
		.container{
			width:1300px;
			margin: 80px auto 200px;
			background-color:lightskyblue;
			border-radius: 30px;
			box-shadow: 8px 8px 10px rgba(100,100,100,.5);
		}
		.container .header{
			height:40px;
			width: 100%;
			padding: 30px 0;
			background-color:rgb(241, 148, 42);
			border-radius: 30px 30px 0 0;
			font-size:40px;
			line-height: 40px;
			text-align: center;
			letter-spacing:3px; /* 字距*/
		}
		.container form{
			display: block;
			padding: 20px 0 50px;
		}
		.container .inputItem{
			font-size: 23px;
			line-height: 30px;
			padding: 25px 0 0 30px;
		}
		.container .inputItem label{
			display: inline-block;
			height: 25px;
			width:  8%;
			margin-left: 8%;
			margin-right: 1%;
		}
		.container input,textarea,select{
			border:none;
		}
		.container input:focus,
		.container textarea:focus,
		.container select:focus{	/* 取消選擇時輸入格的外框變化 */
			outline: none;
			background-color:rgb(242, 250, 173);
		}

		.container .inputBox,
		.container .selectBox{
			position: relative;
			top:-4px;	/* 輸入格微調	*/
			height:36px;
			padding-left: 5px;
			vertical-align: top;
			background-color:rgb(247, 250, 219);
			font-size: 23px;
			border-radius: 5px;
		}

		.container .activityTopic{
			width:70%;
		}
		 .container .activityTimeYMD{
			width:150px;
		} 
		.container .selectBox{
			font-size: 20px;
			margin-right: 10px;
			opacity: 1;
		}
		.container textarea{
			vertical-align: top;
			height:200px;
			width:70%;
			resize:none; /* 不能調整尺寸 */
			padding: 5px 0 5px 5px;
			background-color:rgb(247, 250, 219);
			font-size: 23px;
			border-radius: 5px;
		} 
		.container .inputItem .activityTypeClass{
			height:15px;
			width: 15px;
			margin: 0 4px;
		}

		.container .sendOutBtn{
			margin-left:225px;
			height:70px;
			padding: 0 30px;
			font-size: 23px;
			cursor: pointer;
			box-shadow: 2px 2px 2px rgba(100,100,100,.5);
			border-radius: 3px;
			border: none;
		}
		.container .updateBtn{
			background-color: rgb(255, 190, 68);
		}
		.container .sendOutBtn:hover{
			background-color: rgb(255, 206, 115);
			color:rgb(59, 59, 59);
		}
		.container .deleteBtn{
			background-color: rgb(255, 54, 54);
		}
		.container .deleteBtn:hover{
			background-color: rgb(255, 124, 124);
			color:rgb(59, 59, 59);
		}
		.container .cancelBtn{
			background-color: rgb(255, 232, 188);
		}

		/* JS 會改到的部分 */

		.container .inputBox.unchangeable,
		.container .selectBox.unchangeable,
		.container textarea.unchangeable
		{
			background-color: rgb(190, 190, 190);
		}
		.container .cancelBtn.unchangeable{
			display: none;
		}

	</style>
</head>
<body>
	<%
		ActivityBean oneActivity = (ActivityBean)request.getAttribute("oneActivity");
		
		// 開始時間:
		String startTimeString = oneActivity.getStartTime();
		String[] aa = startTimeString.split("-");
		int startTimeYYYY = Integer.parseInt(aa[0]); //年
		int startTimeMM = Integer.parseInt(aa[1]);   //月
		String[] bb = aa[2].split(" ");
		int startTimeDD = Integer.parseInt(bb[0]);  //日
		String[] cc = bb[1].split(":");
		int startTimeHH = Integer.parseInt(cc[0]);  //時
		
		// 結束時間:
		String endTimeString = oneActivity.getEndTime();
		String[] dd = endTimeString.split("-");
		int endTimeYYYY = Integer.parseInt(dd[0]); //年
		int endTimeMM = Integer.parseInt(dd[1]);   //月
		String[] ee = dd[2].split(" ");
		int endTimeDD = Integer.parseInt(ee[0]);  //日
		String[] ff = ee[1].split(":");
		int endTimeHH = Integer.parseInt(ff[0]);  //時
	
		// activityType 邏輯
		int activityTypeString = oneActivity.getActivityType();
		
		String activityType_1 = "";
		String activityType_2 = "";
		if( activityTypeString == 1){
			activityType_1 = "checked";
		}else if( activityTypeString == 2 ){
			activityType_2 = "checked";
		}
		
	%>
	
	
	
	<div class="container">
		<div class="header">
			活動設定
		</div>
		<form action="<%=request.getContextPath()%>/updateOneActivity.controller" method="post" id="form">
			<div class="inputItem">
				<label for="activityTopicId">活動標題:</label>
				<input type="text" class="inputBox activityTopic unchangeable" name="activityTopic" id="activityTopicId" placeholder="輸入主題" disabled value="<%= oneActivity.getActivityTopic() %>" >
			</div>
			<div class="inputItem">
				<label for="">活動時間:</label>
				<input type="text" name="startTimeYMD" id="startTimeYMD" class="inputBox activityTimeYMD unchangeable" placeholder="選擇日期" disabled>
				<select name="startTimeH" id="startTimeH" class="selectBox unchangeable" disabled>
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
				</select>時
				到
				<input type="text" name="endTimeYMD" id="endTimeYMD" class="inputBox activityTimeYMD unchangeable" placeholder="選擇日期" disabled>
				<select name="endTimeH" id="endTimeH" class="selectBox unchangeable" disabled>
					<option value="00">00</option>
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
				</select>時
			</div>
			<div class="inputItem">
				<label for="activityContentId">活動內容:</label>
				<textarea name="activityContent" class="unchangeable" id="activityContentId" placeholder="請輸入內容" disabled><%= oneActivity.getActivityContent()  %></textarea>
			</div>
			<div class="inputItem">
				<label for="activityTopicId">活動圖片:</label>
				<input type="text" class="inputBox activityTopic" style="background-color:rgb(173, 173, 173)" name="activityTopic" id="activityTopicId" placeholder="未開放" disabled="disabled">
			</div>
			<div class="inputItem">
				<label for="">活動類型:</label>
				<input type="radio" class="activityTypeClass unchangeable" id="activityType1ID" name="activityType" value="1" <%=activityType_1 %> disabled >限時優惠
				<input type="radio" class="activityTypeClass unchangeable" id="activityType2ID" name="activityType" value="2" <%=activityType_2 %> disabled >優惠券
			</div>
			<!-- 放 delete、ID 參數 -->
			<input type="hidden" id="deleteValue" name="deleteValue" value="0">
			<input type="hidden" id="IDValue" name="IDValue" value="<%= oneActivity.getID() %>"  >
			<div class="inputItem">
				<button  type="button" class="sendOutBtn updateBtn" id="updateBtn" >修改活動</button>
				<button  type="button" class="sendOutBtn deleteBtn" id="deleteBtn" >刪除活動</button>
				<input type="reset" class="sendOutBtn cancelBtn unchangeable" id="cancelBtn" value="放棄修改"> 
			</div>
		</form>
	</div>
	<!-- jQuery CDN -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<!-- jQuery UI -->
    <script src="<%=request.getContextPath()%>/Library/jquery-ui-1.12.1/jquery-ui.js"></script>
	<script>
		$(function(){

			// 日期 UI
			$( "#startTimeYMD" ).datepicker();
			$( "#endTimeYMD" ).datepicker();
			
			function initDatepickerValue(){
				$( "#startTimeYMD" ).datepicker('setDate', new Date(<%= startTimeYYYY %>, <%= startTimeMM-1 %>, <%= startTimeDD %>));
				$( "#endTimeYMD" ).datepicker('setDate', new Date(<%= endTimeYYYY %>, <%= endTimeMM-1 %>, <%= endTimeDD %>));
			}
			
			initDatepickerValue();
			$('#startTimeH').find('option:eq('+<%= startTimeHH %>+')').attr('selected',true);
			$('#endTimeH').find('option:eq('+<%= endTimeHH %>+')').attr('selected',true);
			
			// 活動
			let updateState = false; // false 為不可更改模式，true 為更改模式
			
			// 放棄修改
			$('#form').on('reset',function(){
				setTimeout(function(){
					initDatepickerValue();
				},1)
			});
			
			// 刪除活動
			$('#deleteBtn').on('click',function(){
				// deleteValue = 1 代表刪除表單，deleteValue = 0 代表編輯表單
				$('#deleteValue').val('1');
				$('#form').submit();
			})

			// 確定修改(不可更改程式位置)
			$('#updateBtn').on('click',function(){
				if( updateState ){
					$('#form').submit();
				}
			})
			

			// 修改活動(不可更改程式位置)
			$('#updateBtn').on('click',function(){
				if( !(updateState) ){
					updateState = true;
					$('#activityTopicId').toggleClass("unchangeable").removeAttr("disabled")
					$('#startTimeYMD').toggleClass("unchangeable").removeAttr("disabled")
					$('#startTimeH').toggleClass("unchangeable").removeAttr("disabled")
					$('#endTimeYMD').toggleClass("unchangeable").removeAttr("disabled")
					$('#endTimeH').toggleClass("unchangeable").removeAttr("disabled")
					$('#activityContentId').toggleClass("unchangeable").removeAttr("disabled")
					$('#activityType1ID').toggleClass("unchangeable").removeAttr("disabled")//
					$('#activityType2ID').toggleClass("unchangeable").removeAttr("disabled")//
					
					$('#deleteBtn').toggle();
					$('#updateBtn').text("確定修改");
					$('#cancelBtn').toggleClass("unchangeable")
					
				}
			})
			
			// 放棄修改
			$('#cancelBtn').on('click',function(){
				updateState = false;
				$('#activityTopicId').toggleClass("unchangeable").attr("disabled","true")
				$('#startTimeYMD').toggleClass("unchangeable").attr("disabled","true")
				$('#startTimeH').toggleClass("unchangeable").attr("disabled","true")
				$('#endTimeYMD').toggleClass("unchangeable").attr("disabled","true")
				$('#endTimeH').toggleClass("unchangeable").attr("disabled","true")
				$('#activityContentId').toggleClass("unchangeable").attr("disabled","true")
				$('#activityType1ID').toggleClass("unchangeable").attr("disabled","true")//
				$('#activityType2ID').toggleClass("unchangeable").attr("disabled","true")//

				$('#deleteBtn').toggle();
				$('#updateBtn').text("修改活動");
				$('#cancelBtn').toggleClass("unchangeable")
			})
			
			
			
		})
		</script>
</body>
</html>