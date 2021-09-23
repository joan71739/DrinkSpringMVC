<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>addNewActivity</title>
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
			background-color: rgb(32, 129, 189);
			box-shadow: 2px 2px 2px rgba(100,100,100,.5);
			border-radius: 3px;
		}
		.container .sendOutBtn:hover{
			background-color: rgb(89, 159, 202);
			color:rgb(59, 59, 59);
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="header">
			活動設定
		</div>
		<form action="<%=request.getContextPath()%>/getAddNewActivity.controller" method="post" >
			<div class="inputItem">
				<label for="activityTopicId">活動標題:</label>
				<input type="text" class="inputBox activityTopic" name="activityTopic" id="activityTopicId" placeholder="輸入主題">
			</div>
			<div class="inputItem">
				<label for="">活動時間:</label>
				<input type="text" name="startTimeYMD" id="startTimeYMD" class="inputBox activityTimeYMD" placeholder="選擇日期">
				<select name="startTimeH" id="startTimeH" class="selectBox">
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
				<input type="text" name="endTimeYMD" id="endTimeYMD" class="inputBox activityTimeYMD" placeholder="選擇日期">
				<select name="endTimeH" id="endTimeH" class="selectBox">
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
				<textarea name="activityContent" id="activityContentId" placeholder="請輸入內容"></textarea>
			</div>
			<div class="inputItem">
				<label for="activityTopicId">活動圖片:</label>
				<input type="text" class="inputBox activityTopic" style="background-color:rgb(173, 173, 173)" name="activityTopic" id="activityTopicId" placeholder="未開放" disabled="disabled">
			</div>
			<div class="inputItem">
				<label for="">活動類型:</label>
				<input type="radio" class="activityTypeClass" name="activityType" value="1">限時優惠
				<input type="radio" class="activityTypeClass" name="activityType" value="2">優惠券
			</div>
			<div class="inputItem">
				<input type="submit" class="sendOutBtn" value="建立活動">
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

			$( "#startTimeYMD" ).on('blur',function(){
				console.log(">>>"+$( "#startTimeYMD" ).val())
			});
			
		})
	</script>
</body>
</html>