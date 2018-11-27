<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
	
	
	<!-- 
	개발자: 윤동규
	시작시점: 2016년 10월 05일 
	
	-->
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-latest.js"></script>

  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script> 

$("document").ready(function(){ 
	$(".btn_Login").click(function() {
			if ($("#phone").val() == "") {
				alert("아이디를 입력하세요");
				$("#phone").focus();
				return false;
			}else if ($("#pw").val() == "") {
				alert("패스워드를 입력하세요");
				$("#pw").focus();
			return false;
			}
			loginSNS.submit();
		});
	$("#myCarousel").carousel({ interval:1500 });
});


</script>
<link rel="stylesheet" type="text/css" href="../resources/CSS/login2.css">
<style>

#note7{
	margin-top:-400px;
	margin-left:300px;
	height:400px;
	width: 270px;
	
	
	background-image: url('../resources/IMAGE/note7.PNG');
}
</style>
</head>
<body>
	<form id="top" method="GET">
		<!-- 자체 Header 겸 Login -->
		<div id=top00>
		<ul>
		
		<li><span class="logo"><img id="logo" src="../resources/gnb_image/logo.png"></span>	<span class="btn_Join"><a href="http://192.168.10.47:8000/mysns/user/login">가입하기</span></a></li>
		</ul>
		</div>
		
		
		
	</form>

	<form action="login2.do" id="loginSNS" method="POST">
		<!-- 자체 Join -->
	<%-- 	<c:choose>
		<c:when test="${sid eq null}">
			<jsp:include page="../header/header.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="../header/s_header.jsp" />
		</c:otherwise>
	</c:choose> --%>
		
		<H2 style="margin-left:900px">HanbitSNS에 로그인</H2>
		
		<div id="joinForm2">
		<div id="joinForm">
		
			
			<ul>
				<li><input type="text" placeholder="전화번호를 입력하세요" id="phone" name ="phone"></li>
			</ul>
			<ul>
				<li><input type="password" placeholder="비밀번호를 입력하세요" id="pw" name="pw"></li>
				<li><a href="http://192.168.10.47:8000/mysns/user/phonecheck"> 아이디 찾기</a>/<a href="http://192.168.10.47:8000/mysns/user/passcheck"> 비밀번호 찾기</a></li>
				
			</ul>
			
			
			<span class="btn_Login">로그인</span>
		</div>
		</div>
		<div id="note7"></div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
   		<img src="../resources/IMAGE/friend.PNG" alt="Friend">
     
    </div>

    <div class="item">
    	<img src="../resources/IMAGE/fp.PNG" alt="Flower">
      
    </div>

    <div class="item">
       <img src="../resources/IMAGE/frpic.png" alt="friendly">
    </div>

    <div class="item">
      <img src="../resources/IMAGE/location.PNG" alt="Flower">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	</form>
</body>
</html>