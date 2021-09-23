<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<title>評論區</title>
			<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
			<%@ include file="/websiteForm/homeWebsiteHead.jsp"%>
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
			
			.div_mid {
				border:3px black solid;
				margin:50px;
				padding:10px;
				border-radius:5px;
				background-color:#586ba4;
			}
			
			.but1 {
				text-align:right;
			    border: 0;
			    background-color: #f5dd90;
			    font-family: 'Kosugi Maru', sans-serif;
			    /* 日文 */
			    border-radius: 3px
			}
			
			.but1:hover {
			    background-color: #f76c5e;
			    border: 0px #003C9D solid;
			    font-family: 'Kosugi Maru', sans-serif;
			    /* 日文 */
			}
		</style>
	</head>

	<body>
		<%@ include file="/websiteForm/homeWebsiteBody1.jsp"%>
		<form action="<%=request.getContextPath()%>/DiscussController" method="get">
	
				<div class="div_mid">
					店家: <select name="shopName">
						 	<option>清欣</option>
						 	<option>可佈可</option>
						 	<option>50懶</option>
						</select><br> <br>
					飲料名稱:<input type="text" id="name" name="drink">
					<span id="idn"></span><br><br> 
					<input type="hidden" name="drinkstar" id="drinkstar" value="">
					<div id="stars" class="left">
						<img src="images/whitestar.png" alt=""> 
						<img src="images/whitestar.png" alt="">
						<img src="images/whitestar.png" alt=""> 
						<img src="images/whitestar.png" alt=""> 
						<img src="images/whitestar.png" alt="">
					</div>
					<div id="comment" class="left"></div>
					評論: <input type="text" id="talk" name="drinkDiscuss"> <span id="ttalk"></span><br><br>
					<div>
						<input class="but1" type="submit" value="確認">
					</div>
				</div>
		</form>
	
		<%@ include file="/websiteForm/homeWebsiteBody2.jsp"%>
		<div class="footer">
			<div class="copyRight">&copy 2021/07/09，第三組<div class="footdiv animate__animated animate__bounce animate__delay-2s">kuzi</div></div>
		</div>
		
		
		
		<script src="<%=request.getContextPath()%>/Library/jquery-3.6.0.js"></script>
		<script>
			$(function() {
				$('#selectButton').on('click', function() {
					$('#header_select').toggleClass('show');
				})
	
			})
			// let nowTime = new Date();
			// console.log("nowTime="+nowTime);
			//制作一個星星評分
			var drinkstar = document.getElementById("drinkstar");
			var divStars = document.getElementById("stars");
			var divComment = document.getElementById("comment");
			var attitude = [ "較差", "差", "一般", "好", "很好" ];
			var starNum = -1; //記錄當前第幾顆星星被點擊
			var starArray = Array.from(divStars.children); //星星陣列
	
			//滑鼠移入
			divStars.onmouseover = function(e) {
				if (e.target.tagName === "IMG") { //事件源是圖片
					//把滑鼠移動到的星星替換圖片
					e.target.src = "images/blackstar.png";
					//把滑鼠移動到的星星之前的星星替換圖片
					var prev = e.target.previousElementSibling;
					while (prev) {
						prev.src = "images/blackstar.png";
						prev = prev.previousElementSibling;
					}
					//把滑鼠移動到的星星之后的星星替換圖片
					var next = e.target.nextElementSibling;
					while (next) { //把滑鼠移動到的星星之后的星星替換圖片
						next.src = "images/whitestar.png";
						next = next.nextElementSibling;
					}
	
					var index = starArray.indexOf(e.target); //找到滑鼠移動到的星星的序號
					divComment.innerHTML = attitude[index]; //顯示對應的評論
				}
			}
	
			//滑鼠點擊
			divStars.onclick = function(e) {
				if (e.target.tagName === "IMG") {
					//記錄當前點擊的星星序號
					starNum = starArray.indexOf(e.target);
					drinkstar.value = starNum + 1;
					// console.log(starNum+1); 	
				}
			}
	
			//滑鼠移出
			divStars.onmouseout = function(e) {
				if (starNum !== -1) { //滑鼠點擊事件發生，將評分固定在點擊的星星上
					for (var i = 0; i < divStars.children.length; i++) {
						if (i <= starNum) {
							divStars.children[i].src = "images/blackstar.png";
	
						} else {
							divStars.children[i].src = "images/whitestar.png";
						}
					}
					divComment.innerHTML = attitude[starNum]; //顯示對應的評論
				} else {
					for (var i = 0; i < divStars.children.length; i++) {
						divStars.children[i].src = "images/whitestar.png";
					}
					divComment.innerHTML = ""; //不顯示評論
				}
			}
		</script>
	</body>

</html>