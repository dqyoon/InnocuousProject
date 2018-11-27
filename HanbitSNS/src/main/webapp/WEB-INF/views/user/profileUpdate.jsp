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
<link rel="stylesheet"
	href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../resources/CSS/profileUpdate.css">

<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	
<script>
	$("document").ready(function() {
		
		
		$(".btn_Update").click(function() {
			
			var k = $(".filename").val().lastIndexOf(".");
			
			var ext = $(".filename").val().substring(k + 1);
	

			//
			/* if($(".filename").text().substring($(".filename").val().lastIndexOf(".")+1).equalsIgnoreCase("PNG")) */

			if (ext == "PNG") {
				
				UpdateSNS.submit();
			} else if (ext == "png") {

				
				UpdateSNS.submit();
			} else if (ext == "JPEG") {
				
				UpdateSNS.submit();
			} else if (ext == "jpeg") {
			
				UpdateSNS.submit();
			} else if (ext == "jpg") {
				
				UpdateSNS.submit();
			} else if (ext == "JPG") {
			
				UpdateSNS.submit();
			} else {

				$(".filename").empty();

			
				alert("파일형식은 JPG,JPEG,PNG 형식만지원합니다.");
				/* $("#holder"). */
			}

			if ($(".filename").val() == "") {
				alert("변경할 프사를 등록하세요");
				return false;
			}

		});
		$('.info').click(function() {
		

		});

	});
</script>
<body>
	<jsp:include page="/resources/HEADER/header2.jsp" />
	<div id="page-wrapper">
		<!-- 사이드바 -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">

				<li class="sidebar-brand"><a
					href="http://192.168.10.47:8000/mysns/user/profile">내 프로필</a></li>
				<li class="sidebar-brand"><a
					href="http://192.168.10.47:8000/mysns/user/profileUpdate">개인 정보
						편집</a></li>
				<li class="sidebar-brand"><a
					href="http://192.168.10.47:8000/mysns/user/passcheck3">비밀번호 변경</a></li>
				<li class="sidebar-brand"><a
					href="http://192.168.10.47:8000/mysns/user/logout.do">로그아웃</a></li>
				<li class="sidebar-brand"><a
					href="http://192.168.10.47:8000/mysns/user/dropout">회원탈퇴 </a></li>

			</ul>
		</div>
		<!-- /사이드바 -->
		<form action="Update.do" id="UpdateSNS" method="post"
			enctype="multipart/form-data">
			<!-- 본문 -->
			<div id="wp">

				<div class="container-fluid">
					<h1>내 정보 수정</h1>

					<!-- 자체 Header 겸 Login -->
					<section id="wrapper">

					



					<div id="holder">
						<%
							UserVO vo = (UserVO) request.getAttribute("list");
							System.out.println(vo.getImage());
						%>
						<%
							if (vo.getImage() == null) {
								out.println("<img src='../resources/UPLOADIMG/profile.PNG'>");

							} else {

								int pos = vo.getImage().lastIndexOf(".");
								System.out.println("pos" + pos);
								String ext = vo.getImage().substring(pos + 1);
								System.out.println("확장자명" + ext);

								if (ext.equalsIgnoreCase("png") || ext.equalsIgnoreCase("jpg")
										|| ext.equalsIgnoreCase("jpeg")) {
									System.out.println("1");
									out.println("<img src='../resources/UPLOADIMG/"
											+ vo.getImage() + "'>");
								} else {
									System.out.println("2");
									out.println("<img src='../resources/UPLOADIMG/profile.PNG'>");
								}
							}
						%>
					</div>
					<p id="status">프로필 변경</p>
					<p>파일형식은 JPG,JPEG,PNG 형식만지원합니다.</p>
					<p>
						<input name="fileimage" class="filename" type=file
							accept="image/*">
					</p>


					<script>
						var upload = document.getElementsByTagName('input')[0], holder = document
								.getElementById('holder'), state = document
								.getElementById('status');

						if (typeof window.FileReader === 'undefined') {
							state.className = 'fail';
						} else {
							state.className = 'success';
							state.innerHTML = '';
						}

						upload.onchange = function(e) {
							e.preventDefault();

							var file = upload.files[0], reader = new FileReader();
							reader.onload = function(event) {
								var img = new Image();
								img.src = event.target.result;
								$("#holder").css("background-image", "none");

								if (img.width > 200) { // holder width
									img.width = 250;
									img.height = 264;
								}
								holder.innerHTML = '';
								holder.appendChild(img);
							};
							reader.readAsDataURL(file);

							return false;
						};
					</script> </section>
				</div>
				<!-- holder 끝 ㅇ -->




				<div id="profileForm">
					<!--이미지 프로필구간. -->

					<ul>
						<li>ID:<input type="text" name="phone" id="phone"
							value="${list.phone}" disabled /></li>
					</ul>
					<ul>
						<li>이름:<input type="text" class="Name" name="name" id="Name"
							value="${list.name}" disabled /></li>
					</ul>

					<ul>
						<li>성별:<input type="text" id="gender" name="gender"
							value="${list.gender}" disabled /></li>
					</ul>

					<ul>
						<li>나이:<input type="text" name="age" id="age"
							value="${list.age}" disabled /></li>
					</ul>
				</div>


				<div id="profileForm2">
					

				<%-- <ul>
								<li>PW:<input type="password" id="pw" name="pw"
									value="${list.pw}" disabled/></li>
							</ul> --%>
				<ul>
					<li>거주:<input type="text" name="address" id="address"
						value="${list.address}"></li>
				</ul>



				<ul>
					<li>상태:<select id="love" name="love" size="1">
							<option value="솔로" selectedt>솔로</option>
							<option value="연애중">연애중</option>
							<option value="기혼">기혼</option>
							<option value="미혼">미혼</option>
					</select>
					</li>
					<%-- <li><input type="text" name ="love2" id="love2"
									value="${list.love}" ></li> --%>

				</ul>
				<ul>
					<li>별명:<input type="text" name="nick" id="nick"
						value="${list.nick}"></li>
				</ul>
				<ul>
					<li><input type="hidden" name="image" id="image"
						value="${list.image}"></li>
				</ul>
				<ul>
					<li><span class="btn_Update">변경완료</span></li>
				</ul>
			</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</form>
</head>
<!-- /본문 -->



</body>
</html>