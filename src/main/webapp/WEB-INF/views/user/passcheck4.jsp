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


li {
	list-style-type: none;
	font-size:10pt;
	font-weight:bold;
	color: black;
}




#passcheckform input[type=text]{
	text-align: right;
	width: 250px;
	border: 1px solid lightgray;
	padding: 18px;
	
	}

#passcheckform2{
	
}	
#passcheckform{
/* 	margin:auto;   */
	  margin-left: 590px; 
	border:1px solid black; /* 지워야함 */
	width: 400px;
	height: 400px;
	background-image:url('');
	
}

span.btn_passcheck{
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



</style>
</head>
<body>
<form action="passcheck3.do" id="passcheckSNS" method="post">
		<!-- 자체 Join -->
		
		<div id="passcheckform2">
		<H2>비밀번호 변경 </H2>
		<div id="passcheckform">
				
			<ul>
				<li><input type="text" placeholder="새로운 비밀번호를 입력하세요" id="pw" name ="pw"></li>
			</ul>
			
			
			
			<span class="btn_passcheck">비밀번호 변경</span>
		</div>
		</div>
	</form>

</body>
</html>