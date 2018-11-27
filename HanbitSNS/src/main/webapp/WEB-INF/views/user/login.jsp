
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 
	개발자: 윤동규
	시작시점: 2016년 10월 05일 
	
	-->


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

	$("document").ready(
			function() {
				
				$(".phone").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
				$("#phone").keyup(function(){$(this).val( $(this).val().replace(/[^0-9]/g,"") );} );
				
				$("#btn_Login").click(function() {
					if ($("#phone").val() == "") {
						alert("아이디를 입력하세요");
						$("#phone").focus();
						return false;
					} else if ($("#pw").val() == "") {
						alert("패스워드를 입력하세요");
						$("#pw").focus();
						return false;
					}
					loginSNS.submit();
				});
				$(".btn_Join").click(function() {

					if ($(".phone").val() == "") {
						alert("아이디를 입력하세요");
						$(".phone").focus();
						return false;
					} else if ($(".pw").val() == "") {
						alert("패스워드를 입력하세요");
						$(".pw").focus();
						return false;
					}else if($(".nick").val()==""){
						alert("닉네임을 입력하세요");
						$(".nick").focus();
						return false;
					}else if($(".age").val()=="Select"){
						alert("나이를입력하세요");
						
						return false;
					}else if($(".address").val()=="Select"){
						alert("주소를 입력하세요");
						$(".address").focus();
						return false;
					}
					

					if ($("#result").text().trim() == "아이디 사용이 가능합니다.") {

						joinSNS.submit();
					} else {
						alert("가입불가");
					}

				});

				$("#age").change(function() {

				

					if ($("#age").val() !== "" || null) {
						$("#age2").val($("#age").val());
					}

				});

				$(".cpw").blur(function() {
					if ($(".pw").val() != $(".cpw").val()) {
						alert("비번이 불일치합니다");
					}
				});

				$('.phone').change(
						function() {
							var params = $("#joinSNS").serialize();
							$.ajax({
								url : "idCheck.do",
								data : params,
								success : function(data) {

									var succ = data.trim();

									if (succ == "Y") {
										$("#result").text("아이디가 중복되었습니다").css(
												"color", "red").css(
												"font-size", "9pt");
									} else {
										$("#result").text("아이디 사용이 가능합니다.")
												.css("color", "blue").css(
														"font-size", "9pt");
									}

								}
							});
						});

			});
</script>
<link rel="stylesheet" type="text/css" href="../resources/CSS/login.css">
 <style>

 #joinForm {
	/* padding-top: 50px;
	margin-top: 150px;
	width: 600px;
	height: 550px;
	
	background-image: url('../resources/IMAGE/social.PNG');
	background-repeat: no-repeat;  */
	
	
	background-image:url('../resources/IMAGE/blocks_rainbow_3d_graphics_background_76559_1920x1080.jpg')
	
}
</style>
</head>
<body>






	<form action="login.do" id="loginSNS" method="post">
		<!-- 자체 Header 겸 Login -->
		<div id=top00>

			<div id="top02">
				<ul>
					<li>비밀번호</li>
					<li><input type="password" placeholder="---" id="pw" name="pw"></li>

				</ul>
				<ul>
					<li><span class="btn_Login" id="btn_Login">로그인</span></li>
				</ul>
			</div>
			<div id="top01">
				<ul>
					<li>전화 번호</li>
					<li><input type="text" placeholder="---" id="phone"
						name="phone"></li>

				</ul>
			</div>


			<span class="logo"><img id="logo"
				src="../resources/gnb_image/logo.png"></span>

		</div>
	</form>

	<form action="join.do" id="joinSNS" method="post">
		<!-- 자체 Join -->


		<div id="joinForm">
			<div id="joinForm3">
				<div id="joinForm2">
					<ul>
						<li><span style="font-size: 20pt">회원가입</span></li>
					</ul>
					<ul>
						<li><input type="text" placeholder="전화번호" name="phone"
							class="phone" maxlength="11">

						</li>
					</ul>
					<ul>
						<li><span id="result">폰번호 중복체크중</span></li>
					</ul>
					<ul>
						<li><span id="result"></span></li>
					</ul>
					<ul>
						<!-- <li><input type="text" placeholder="FirstName" class="FirstName" id="FirstName"></li>
				<li><input type="text" placeholder="LastName" class="LastName"></li> -->
						<li><input type="text" placeholder="이름" class="name"
							name="name" maxlength="5"></li>
					</ul>
					<ul>
						<li><input type="password" placeholder="비밀번호" class="pw"
							name="pw"></li>
					</ul>
					<ul>
						<li><input type="password" placeholder="비밀번호 확인" class="cpw"
							name="cpw"></li>
					</ul>
					<ul>
						<li>남 <input type="radio" name="gender" id="gender" value="남">
							여 <input type="radio" name="gender" id="gender" value="여">
						</li>

					</ul>
					<ul>
						<li>나이 <select id="age" name="age" size="1">
								<option value="Select" selected>Select</option>
								<%
									for (int i = 8; i <= 100; i++) {
								%>
								<option value="<%=i%>"><%=i + "세"%></option>
								<%
									}
								%>

						</select>
						</li>
						<li><input type="text" name="age2" id="age2"
							placeholder="----" disabled/></li>

					</ul>
					<ul>
						<li><input type="text" placeholder="거주지역을 간단히 입력하세요" class="address"
							name="address"></li>
					</ul>
					<ul>
						<li><input type="text" placeholder="원하는 닉네임을 입력하세요" class="nick"
							name="nick"></li>
					</ul>
					
					<span class="btn_Join" class="btn_Join">Join!!</span>
				</div>
				
			</div>
		</div>
	</form>
</body>
</html>