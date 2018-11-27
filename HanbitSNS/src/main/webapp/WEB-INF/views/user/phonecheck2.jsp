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
	$(".btn_phonecheck").click(function() {
		alert("끌릭! ");
			/* if ($("#phone").val() == "") {
				alert("아이디를 입력하세요");
				$("#phone").focus();
					return false;
			}else if ($("#nick").val() == "") {
				alert("패스워드를 입력하세요");
				$("#nick").focus();
			return false;
			} */
		phonecheck2SNS.submit();
		});
	
});
</script>
<style>
body{
/* background-image:url('resources/IMAGE/K2yuC15.jpg'); */
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


#phonecheck2form input[type=text]{
	text-align: right;
	width: 250px;
	border: 1px solid lightgray;
	padding: 18px;
	
	}
#phone{

margin-top: 80px;

}
li.Age{

}	
#phonecheck2form2{
	
}	
#phonecheck2form{
/* 	margin:auto;   */
	  margin-left: 590px; 
	border:1px solid black; /* 지워야함 */
	width: 400px;
	height: 400px;
	background-image:url('');
	
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
span.btn_phonecheck2{
/* 	background-image:url('../images/Blur-Backgrounds-980x551.jpg'); */
	/* float: left; */
	margin-left: 40px;
	background-color:skyblue;
	text-align: center;
	font-size: 12pt;
	font-weight: bold;	
	padding: 10px 120px 10px 120px;
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
<form action="phonecheck2.do" id="phonecheck2SNS" method="post">
		<!-- 자체 Join -->
		
		<div id="phonecheck2from">
		<H2>아이디확인 </H2>
		<div id="phonecheck2form">
			<ul>
			<li><input type="text" id="phone" name ="phone" value="${list.phone}"></li>
			</ul>
			
			
			
		<a href="http://192.168.10.47/mysns/user/login2"><span class="btn_phonecheck2">로그인 페이지로</span></a>
		</div>
		</div>
	</form>

</body>
</html>