<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$("document").ready(function() {
		$("#btn_Drop").click(function() {
			alert("띠딩");
			if ($("#reason").val() == "즉시탈퇴") {
				alert($("#reason").val());	
				deleteSNS.submit();
			}

		});
		$("#delete2").click(function() {
			alert("띠딩2");
			
				
				
				
			

	});
		$(".delete2").click(function(){
			alert("3");
			$(".modal").modal();
		
		});
		$(".btn1").click(function(){
			alert("예쓰끌릭");
			delete2SNS.submit();
		
		});
		
		$(".delete3").click(function(){
			
			var url = "http://192.168.10.47:8000/mysns/user/profile";    
			alert("취소클릭끌릭"+ url+ "로 이동");
			$(location).attr('href',url);
		
		});
		
		
	});
</script>
<link rel="stylesheet" type="text/css" href="../resources/CSS/drop.css">

</head>
<body>
	<form action="delete.do" id="deleteSNS" method="post">
		<!-- 자체 Join -->
		<H2><img id="logo" src="../resources/gnb_image/logo.png"> 탈퇴</H2>
계정을 비활성화하시겠습니까?<br/>
<br/>
계정을 비활성화하면 프로필을 사용할 수 없게 되며 한빛SNS에서 <br/>
공유했던 게시물 대부분에서 회원님의 이름과 사진이 사라집니다. <br/>
그러나 기존 친구의 친구 리스트나 회원님이 보낸 메시지에는 <br/>
회원님의 이름이 표시되는 등 다른 사람이 회원님의 정보 일부를 계속 보게 될 수 있습니다.<br/>

		<div id="joinForm">
			<ul>
				<li><!-- 탈퇴사유  --><select id="reason" name="reason" size="1" hidden/>
						<option value="즉시탈퇴" selected>즉시탈퇴</option>
						

						<%-- 	<%
								for (int i = 8; i <= 100; i++) {
							%>
							<option value="<%=i%>"><%=i + "세"%></option>
							<%
								}
								%> --%>

				</select>
				</li>
			</ul>
<div id="userpic">
						

<br/>

<h1>  ${list.name}님을 팔로잉하는사람 </br> <span class="badge">${list.fcount}</span> 명이 몹시 아쉬워 할 것 입니다.. </h1>
탈퇴 시 친구 소식을 더 이상 들을 수 없게 됩니다.<br/>



</div>
			<span id ="btn_Drop" name ="btn_Drop" class="btn_Drop">회원탈퇴!</span>
		</div>

	</form>
	<form action="delete2.do" id ="delete2SNS" method="post">
	<div><span id="delete2" class="delete2">비활성화</span></div>
	
	</form>
	<form action="delete3.do" id ="delete3SNS" method="post">
	<div><span id="delete3" class="delete3">취소</span></div>
	<div class="modal" id="testModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">

					*계정 비활성화* </br>계정이 72시간 뒤 자동으로 소멸되며 이전 로그인 할시 비활성화는 취소됩니다. </br>그래도 계속하시겠습니까?

					<div class="modal-footer">
					<button type="button" class="btn1" data-dismiss="modal">예</button>
					<button type="button" class="btn2" data-dismiss="modal">아니오</button>
				</div>

			</div>
		</div>
	</div>
	
	</form>
	
</body>
</html>