<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="../resources/CSS/profile2.css">


<script src="//code.jquery.com/jquery-1.12.2.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script> 
$('document').ready(function(){
	$('.btn_Update2').click(function(){
		
		if($(".filename").val()==""){
			alert("변경할 프사를 등록하세요");
			return false;
		}
		profilechange.submit();
	});
	$('.info').click(function(){
		alert("띠링띠링~");
		
	});
	
	
});



</script>


<title>Insert title here</title>
</head>
<body>

	<div id="page-wrapper">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand"><a href="#">정보</a></li>
					<li><a href="http://192.168.10.47:8000/mysns/user/profile">기본정보</a></li>
				<li><a href="#">연애상태</a></li>
				<li><a href="http://192.168.10.47:8000/mysns/user/profile2">프로필사진 설정 및 변경</a></li>

			</ul>
		</div>
		<!-- /사이드바 -->
		<form id="profilechange" action="change.do" method="post" enctype="multipart/form-data">
		<!-- 본문 -->
		<div id="page-content-wrapper">

			<div class="container-fluid">
				<h1>
					나의 프로필<span class="btn_Update"><a href ="http://192.168.10.47:8000/mysns/user/profileUpdate">기본정보수정하러가기</a></span>
				</h1>

				<!-- 자체 Header 겸 Login -->


				<section id="wrapper"> 
				<header>
				<h1>프로필변경</h1>
				</header> 
				<article>
				<p id="status">프로필 변경</p>
				<p>
					<input name="fileimage" class ="filename" type=file>
				</p>
				<p>변경 할 이미지를 선택하십시오 </p>
				<div id="holder">   </div>  
			
				</article> 
				<span class="btn_Update2">프로필 수정</span>  
				<script>
					var upload = document.getElementsByTagName('input')[0], holder = document
							.getElementById('holder'), state = document
							.getElementById('status');

					if (typeof window.FileReader === 'undefined') {
						state.className = 'fail';
					} else {
						state.className = 'success';
						state.innerHTML = '미리보기 활성화중';
					}

					upload.onchange = function(e) {
						e.preventDefault();

						var file = upload.files[0], reader = new FileReader();
						reader.onload = function(event) {
							var img = new Image();
							img.src = event.target.result;
							$("#holder").css("background-image", "none");
							// note: no onload required since we've got the dataurl...I think! :)
							if (img.width > 200) { // holder width
								img.width = 250;
								img.height = 264
							}
							holder.innerHTML = '';
							holder.appendChild(img);
						};
						reader.readAsDataURL(file);

						return false;
					};
				</script> 
				</section>
				</div><!-- holder 끝 ㅇ -->
			
			
		</div>
		<!-- /본문 -->
		</form>
	</div>


</body>
</html>