<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.hanbit.vo.*" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../resources/CSS/profile.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script>
$("document").ready(function(){
	$(".btn_Update").click(function(){
		alert("끌릭");
		if ($("#pw").val() == "") {
			alert("pw를 입력하세요");
			$("#pw").focus();
			return false;
		} 
		
		
		
		
		if($("#pw").val()== $("#pw2").val()){
			
			alert("같따!");
			passcheckSNS.submit(); 
			
		}else{
			alert("동일한 비밀번호를 입력하세요. ")
		}
		
		
		
		
		
	});
	
	
	
});

</script>

</head>
<body >

<jsp:include page="/resources/HEADER/header2.jsp" />

	<div id="page-wrapper">

		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			
			<ul class="sidebar-nav">
				
				<li class="sidebar-brand"><a href="http://192.168.10.47:8000/mysns/user/profile">내 프로필</a></li>
				<li class="sidebar-brand"><a href="http://192.168.10.47:8000/mysns/user/profileUpdate">개인 정보 편집</a></li>
				<li class="sidebar-brand"><a href="http://192.168.10.47:8000/mysns/user/passcheck3">비밀번호 변경</a></li>
				<li class="sidebar-brand"><a href="http://192.168.10.47:8000/mysns/user/logout.do">로그아웃</a></li>	
				<li class="sidebar-brand"><a href="http://192.168.10.47:8000/mysns/user/dropout">회원탈퇴 </a></li>		
					
			</ul>
		</div>
		<!-- /사이드바 -- 끝>

		<!-- 본문 -->
		
		
		<div id="wp" >
				
			<div class="tp" style="background-color:RGB(242, 240, 238);">
			<!-- 폼 -->
				<form action="passcheck3.do" id="passcheckSNS" method="post">
		<!-- 자체 Join -->
		
		<div id="passcheckform2" style="background-color:gray;">
		
		
		<div id="passcheckform" style="background-color:white;padding-top:25px; width:350px; margin-left:25px;margin-top:20px; height:200px;">
				
			<ul>
				<li><input type="password" placeholder="새로운 비밀번호를 입력하세요" id="pw" name ="pw"></li>
			</ul>
			<ul>
				<li><input type="password" placeholder="새로운 비밀번호 확인" id="pw2" name ="pw2"></li>
			</ul>
			
			
			
			<span class="btn_Update" style="cursor:pointer;background-color:skyblue;padding:10px; width:200px; margin-left:130px;font-weight:bold;">비밀번호 변경</span>
		</div>
		</div>
	</form>
			
		</div>

<div id="kk">   </div>

	</div>
	<!-- /본문 -->
	
	</div>


</body>
</html>