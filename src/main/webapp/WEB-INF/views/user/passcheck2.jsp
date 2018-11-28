<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$("document").ready(function(){ 
	$(".btn_passcheck").click(function() {
		alert("끌릭!");
			/* if ($("#phone").val() == "") {
				alert("아이디를 입력하세요");
				$("#phone").focus();
					return false;
			}else if ($("#nick").val() == "") {
				alert("패스워드를 입력하세요");
				$("#nick").focus();
			return false;
			} */
		 passcheckSNS.submit(); 
		});
	
});
</script>
<style>
body{
background-image:url('../resources/IMAGE/blocks_rainbow_3d_graphics_background_76559_1920x1080.jpg'); 
}
#top01,#top02 {
	
	display: block;
	float:right;
	text-align: right;
}

li {
	list-style-type: none;
	font-size:10pt;
	font-weight:bold;
	color: black;
}

.id, .nick{

	border: 1px solid lightgray;
	padding: 5px;
	
}


#passcheckform input[type=text]{
	text-align: right;
	width: 280px;
	border: 1px solid lightgray;
	padding: 18px;
	
	}
#phone{

margin-top: 80px;

}
li.Age{

}	
#passcheckform2{
	 margin-left: 500px; 
	margin-top: 50px;
	border:1px solid RGB(242,240,238)	; /* 지워야함 */
	width: 450px;
	height: 400px;
	background-color:RGB(242,240,238);
}	
#passcheckform{
	padding-top:50px;
	margin-left:25px;
	margin-top:25px;
	
	width: 400px;
	height: 300px;
	background-image:url('');
	background-color:white;
	
}
.FirstName{
	margin-left: 290px;
}
ul li.FirstName{
	
}
#birthday{
	width: 260px;
	height:50px;
}
#top00{
	height:110px;
	border: 3px solid red; /* 지워야함 */
	/* background-color: skyblue; */
}	

span.btn_passcheck{
/* 	background-image:url('../images/Blur-Backgrounds-980x551.jpg'); */
	/* float: left; */
	margin-left: 50px;
	background-color:skyblue;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;	
	padding: 10px 100px 10px 100px;
	cursor: pointer;
	color: black;
	
}
span.logo{
float: left;}

#hello{
background-color: gray;
}

</style>
</head>
<body>
<form action="passcheck2.do" id="passcheckSNS" method="post">
		<!-- 자체 Join -->
		<H2 style ="margin-left:600px; color:white;">임시비밀번호 발급</H2>
		<div id="passcheckform2">
		
		<div id="passcheckform">
			<ul>
				<li><input type="hidden"  id="phone" name ="phone" value="${list.phone}" ></li>
			</ul>
			<ul>
				<li><input type="text" id="rpw" name ="rpw" value="${list.rpw}"></li>
			</ul>
			
			
			
			<span class="btn_passcheck">로그인 페이지</span><br/><br/>
			<div id="alert" style="text-align:center; font-weight: bold; color:red;">*임시비밀번호가 장문입니다.<br/>복사를 추천드립니다*.<br/><br/><br/> 로그인페이지버튼을 눌러주세요</div>
			</div>
		</div>
	</form>

</body>
</html>