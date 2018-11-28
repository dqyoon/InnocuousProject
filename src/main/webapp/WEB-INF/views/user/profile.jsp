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
	href="../resources/CSS/profile.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		var Status = 0;
		$("#follow").click(function() {
			if (Status == 0) {
				$(this).css("background-color", "blue");
				Status = 1;
			} else if (Status == 1) {
				$(this).css("background-color", "white");
				Status = 0;
			}
		});

		$(".hide_text").click(function() {
			$(".outline").hide();
		});

		
		
		
		

		

		

		$(".hide_text").click(function() {
			$(".outline").hide();
		});
		//색상 기본값 호출용 함수
		var colorDefalut = function() {
			$("#red").css("background-color", "#DC473A");
			$("#orange").css("background-color", "#FF7209");
			$("#yellow").css("background-color", "#FFC010");
			$("#green").css("background-color", "#20A464");
			$("#eme-green").css("background-color", "#0DC2AA");
			$("#skyblue").css("background-color", "#15AFF5");
			$("#blue").css("background-color", "#4787F2");
			$("#pp").css("background-color", "#3E4DAD");
			$("#white").css("background-color", "#F3F4F3");
			$("#black").css("background-color", "#1A1C1C");
		};

		var heightDefalut = function() {
			$("#red").css("height", "10px");
			$("#orange").css("height", "10px");
			$("#yellow").css("height", "10px");
			$("#green").css("height", "10px");
			$("#eme-green").css("height", "10px");
			$("#skyblue").css("height", "10px");
			$("#blue").css("height", "10px");
			$("#pp").css("height", "10px");
			$("#white").css("height", "10px");
			$("#black").css("height", "10px");
		}

		Status = 0; //색 선택 전 기본값 0

		$("#count_red").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#DC473A");
				heightDefalut();
				$("#red").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#DC473A");
				heightDefalut();
				$("#red").css("height", "40px");
				Status = 0;
			}

			$("#red").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});

		});

		$("#count_orange").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#FF7209");
				heightDefalut();
				$("#orange").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#FF7209");
				heightDefalut();
				$("#orange").css("height", "40px");
				Status = 0;
			}
			$("#orange").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});

		});
		$("#count_yellow").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#FFC010");
				heightDefalut();
				$("#yellow").css("height", "40px");
				Status = 1;

			} else if (Status == 1) {
				$(".color").css("background-color", "#FFC010");
				heightDefalut();
				$("#yellow").css("height", "40px");
				Status = 0;
			}

			$("#yellow").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
		$("#count_green").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#20A464");
				heightDefalut();
				$("#green").css("height", "40px");
				Status = 1;

			} else if (Status == 1) {
				$(".color").css("background-color", "#20A464");
				heightDefalut();
				$("#green").css("height", "40px");
				Status = 0;
			}

			$("#green").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
		$("#count_eme-green").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#0DC2AA");
				heightDefalut();
				$("#eme-green").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#0DC2AA");
				heightDefalut();
				$("#eme-green").css("height", "40px");
				Status = 0;
			}

			$("#eme-green").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
		$("#count_skyblue").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#15AFF5");
				heightDefalut();
				$("#skyblue").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#15AFF5");
				heightDefalut();
				$("#skyblue").css("height", "40px");
				Status = 0;
			}

			$("#skyblue").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
		$("#count_blue").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#4787F2");
				heightDefalut();
				$("#blue").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#4787F2");
				heightDefalut();
				$("#blue").css("height", "40px");
				Status = 0;
			}

			$("#blue").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
		$("#count_pp").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#3E4DAD");
				heightDefalut();
				$("#pp").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#3E4DAD");
				heightDefalut();
				$("#pp").css("height", "40px");
				Status = 0;
			}

			$("#pp").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
		$("#count_white").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#F3F4F3");
				heightDefalut();
				$("#white").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#F3F4F3");
				heightDefalut();
				$("#white").css("height", "40px");
				Status = 0;
			}

			$("#white").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
		$("#count_black").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#1A1C1C");
				heightDefalut();
				$("#black").css("height", "40px");
				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#1A1C1C");
				heightDefalut();
				$("#black").css("height", "40px");
				Status = 0;
			}

			$("#black").click(function() {
				colorDefalut();
				heightDefalut();
				Status = 0;
			});
		});
	});
</script>

<script>
	$("document").ready(
			function() {
				$("#result1").html("좋아요");
				$("#result2").html("싫어요");
				
				$("#like").click(function(){
					
					if($("#result1").text()=='좋아요취소')
						{
						$("#result1").html("좋아요");
						} 
					else{
						$("#result1").html("좋아요취소");
					}
				});
				$("#dislike").click(function(){
					if($("#result2").text()=='싫어요취소')
						{
						$("#result2").html("싫어요");
						} 
					else{
						$("#result2").html("싫어요취소");
						}

				});
				
				

				$("#fb1").click(function() {
					
					$("#fb1").val() == "팔로잉";

				});
				
				$("#reply").click(function() {
					
			$("#replymodal").modal();
	});
				//모달띄우기
				$(".btn_Modal").click(function() {
					
					$("#Modalbutton").modal();
				});
				//팔로워리스트
				$("#followerlist").click(function() {
					
					$("#followerModal").modal();

				});
				//팔로잉 리스트
				$("#followinglist").click(function() {
					
					$("#followingModal").modal();
				});
				//로그아웃
				$(".btn1").click(function() {

					

					var url = "http://localhost:8000/mysns/user/logout.do";
					$(location).attr('href', url);

				});
				//검색
				$("#search").click(
						function() {
							$("p").css('text-decoration', '');
							$("#searchimg").click(
									function() {
										if ($("#search").val() == null) {
											alert("검색어를 입력하세요");
											return false;
										} else {

											var k = $("#search").val();

											if ($("p:contains(" + k + ")")) {
												$("p:contains(" + k + ")")
														.attr("tabindex", -1)
														.focus();
											} else {
												alert("해당친구는 존재하지않습니다");
											}
										}
									});
						});
				//
				$("#fb1").click(function() {
					
					var url = "http://localhost:8000/mysns/friend";
					$(location).attr('href', url);

				});
				$("#fb2").click(function() {
					
					var url = "http://localhost:8000/mysns/friend";
					$(location).attr('href', url);

				});

				$(".btn2").click(function() {

					
					var url = "http://localhost:8000/mysns/user/dropout";
					$(location).attr('href', url);

				});
			});
</script>
<style>
.outline {
	/* border: 1px solid; */
	margin-left:160px;
	width: 640px;

	border: 1px solid RGB(242, 240, 238);
	
	border-radius: 10px;
}

.profile {
	width: 600px;
	height: 120px;
}

.profile_image {
	margin-top: 28px;
	border: 1px solid #BCC0C8;
	width: 60px;
	height: 60px;
	margin-left: 15px;
	float: left;
}

.profile_ul {
	list-style-type: none;
	margin-top: 35px;
	margin-left: -20px;
	float: left;
	font-weight: bold;
}

.profile_li {
	font-size: 14px;
	color: blue;
}

.profile_li2 {
	margin-top: 6px;
	font-size: 12px;
	color: #90949C;
}
/*
.hide_text {
	width: 150px;
	height: 20px;
	float: right;
	color: #525358;
	font-weight: bold;
	margin-right: 10px;
	margin-top: 15px;

}  */
.image_div1 {
	display: block;
	width: 296px;
	height: 210px;
	float: left;
	border-radius: 5px;
	cursor: pointer;
}

.image_div2 {
	display: block;
	width: 296px;
	height: 210px;
	float: left;
	border-radius: 5px;
	cursor: pointer;
}

#img1,#img2,#img3 {
	border-radius: 5px;
	margin-bottom: 25px;
	cursor: pointer;
	transition: 0.3s;
}

#img1:hover {
	opacity: 0.7;
	
	
	
}

#img2:hover {
	opacity: 0.7;
}

#img3:hover {
	opacity: 0.7;
}
/* The Modal (background) */
modal_text {
	margin-left: 50px;
	margin-top: 50px;
}

.modal0 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.9); /* Black w/ opacity */
}

/* Modal Content (image) */
.modal-content1 {
	margin-left: 190px;
	display: block;
	width: 650px;
	height: 500px;
}

/* Caption of Modal Image */
#caption {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

/* The Close Button */
.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover,.close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

.img_div1 {
	float: left;
}

.img_div2 {
	float: left;
}

.modal_profile_outline {
	border: 1px solid white;
	width: 400px;
	height: 500px;
	float: right;
	margin-top: -500px;
	margin-right: 290px;
	background-color: white;
}

.modal_line1 {
	width: 400px;
	height: 90px;
	background-color: #bed4f1;
}

.modal_line2 {
	width: 400px;
	height: 40px;
	background-color: #bed4f1;
}

.modal_ul {
	list-style-type: none;
	float: left;
	margin-top: -70px;
	margin-left: -10px;
}

.modal_li1 {
	font-size: 20pt;
	font-weight: bold;
}

.modal_li2 {
	color: blue;
	font-size: 14pt;
	font-weight: bold;
}

<!--
----------------------------------
-한새미--------------------------------------------->.modal_board {
	border: 1px solid #DFE0E4;
	width: 600px;
	height: 200px;
	margin-top: 100px;
	margin-left: 500px;
	border-radius: 5px;
	background-color: white;
}

.colorp {
	/* border: 1px solid; */
	width: 600px;
	height: 40px;
	/* margin-left: 3px;
	margin-top: 3px; */
}

#red,#orange,#yellow,#green,#eme-green,#skyblue,#blue,#pp,#white,#black
	{
	width: 59.9px;
	height: 10px;
	cursor: pointer;
	float: left;
}

#red {
	background-color: #DC473A;
	border-radius: 5px 0 0 0;
}

#orange {
	background-color: #FF7209;
}

#yellow {
	background-color: #FFC010;
}

#green {
	background-color: #20A464;
}

#eme-green {
	background-color: #0DC2AA;
}

#skyblue {
	background-color: #15AFF5;
}

#blue {
	background-color: #4787F2;
}

#pp {
	background-color: #3E4DAD;
}

#white {
	background-color: #F3F4F3;
}

#black {
	background-color: #1A1C1C;
	border-radius: 0 5px 0 0;
}

.color_count {
	float: left;
	margin-left: 20px;
	margin-top: -25px;
}

#count_red,#count_orange,#count_yellow,#count_green,#count_eme-green,#count_skyblue,#count_blue,#count_pp,#count_white,#count_black
	{
	float: left;
	cursor: pointer;
}

#count_orange,#count_yellow,#count_green,#count_eme-green,#count_skyblue,#count_blue,#count_pp,#count_white,#count_black
	{
	margin-left: 40px;
}

.detail {
	border: 1px solid;
	width: 592px;
	height: 40px;
	margin-left: 3px;
	margin-top: 30px;
}

span.btnUpload,span.btnUpCancel {
	cursor: pointer;
	display: inline-block;
	font-weight: bold;
	height: 30px;
	border-radius: 3px;
	float: right;
}

span.btnUpload {
	padding: 7px 0px 0px 20px;
	background-color: #E9EBEE;
	width: 65px;
	border: 1px solid #CED0D4;
	font-size: 12px;
}

span.btnUpCancel {
	width: 30px;
	border: 1px solid #CED0D4;
	background-color: #F6F7F9 /* #E9EBEE */;
	font-size: 16px;
	padding: 4px 0px 0px 9px;
	color: #4F4F4F /* #4B4F56 */;
	margin-left: 10px;
	margin-right: 15px;
}
<!--
----------------------------------
-한새미---------------------------------------------
>
</style>
<style type="text/css">
#visible,#hidden,#scroll,#auto {
	width: 295px;
	height: 245px;
}

#scroll {
	overflow: scroll;
}

#auto {
	overflow: auto;
}
</style>
</head>
<body>

	<jsp:include page="/resources/HEADER/header2.jsp" />

	<div id="page-wrapper">

		<!-- 사이드바 -->
		<div id="sidebar-wrapper">

			<ul class="sidebar-nav">

				<li class="sidebar-brand"><a
					href="http://localhost:8000/mysns/user/profile">내 프로필</a></li>
				<li class="sidebar-brand"><a
					href="http://localhost:8000/mysns/user/profileUpdate">개인 정보
						편집</a></li>
				<li class="sidebar-brand"><a
					href="http://localhost:8000/mysns/user/passcheck3">비밀번호 변경</a></li>
				<!-- <li class="sidebar-brand"><a href="http://192.168.10.47:8000/mysns/user/logout.do">로그아웃</a></li>	
				<li class="sidebar-brand"><a href="http://192.168.10.47:8000/mysns/user/dropout">회원탈퇴 </a></li> -->

			</ul>
		</div>
		<!-- /사이드바 -- 끝>

		<!-- 본문 -->


		<div id="wp">

			<div class="tp">
				<!-- 폼 -->
				<form action="Update.do" id="UpdateSNS" method="POST">
					<!-- 자체 Join -->



					<div id="profileForm3">
						<div id="holder">
							<%
								UserVO vo = (UserVO) request.getAttribute("list");
								System.out.println(vo.getImage());
							%>
							<%
								if (vo.getImage() == null) {
									out.println("<img src='../resources/UPLOADIMG/profile.PNG'>");

								} else {
									out.println("<img src='../resources/UPLOADIMG/" + vo.getImage()
											+ "'>");
								}
							%>


						</div>

						<div id="myprofile">
							${list.phone} (${list.gender}) <span class="btn_Modal">●●●</span>

						</div>

						<div id="myInfo">
						

							<c:set var="data" value="${list.love}" />
							${list.name} ${list.age }세
							<c:if test="${list.love != null}">
									
								<span class="label label-danger"
									style="font-size: 8pt; , width: 10px; , height: 10px;">
									${list.love}</span>
							</c:if>



							<br>
						</div>
						<div id="nickname">
							<span class="badge"><h5
									style="font-weight: bold; font-size: 9pt;">ㆍ닉네임ㆍ</h5></span>
							&nbsp;&nbsp; &nbsp;&nbsp;${list.nick}
						</div>
						<div id="myAddress">
							<span class="badge"><h5
									style="font-weight: bold; font-size: 9pt;">ㆍ거주지ㆍ</h5></span>
							&nbsp;&nbsp; &nbsp;&nbsp;${list.address}
						</div>

						<!-- {% block start-footer %} -->
						<div class="modal" id="Modalbutton" tabindex="-1" role="dialog">
							<div class="modal-dialog modal-sm">
								<div class="modal-content">

									<!-- <div class="modal-body">
										<h1></h1>
									</div> -->

									<div class="modal-footer">
										<button type="button" class="btn1" data-dismiss="modal">로그아웃</button>
										<button type="button" class="btn2" data-dismiss="modal">회원탈퇴</button>
									</div>

								</div>
							</div>
						</div>
						<!-- 	{% endblock %} -->
						<div id="followerform">
							<button type="button" id="followinglist" class="btn btn-primary">
								팔로잉<span class="badge" style="font-size:12pt;font-weight:bold;">${list.fcount2}명</span>
							</button>
							<button type="button" id="followerlist" class="btn btn-primary">
								팔로워<span class="badge" style="font-size:12pt;font-weight:bold;">${list.fcount}명</span>
							</button>
							<button type="button" id="contentlist" class="btn btn-primary">
								내 게시물<span class="badge" style="font-size:12pt;font-weight:bold;">${list.contentnumber}개</span>
							</button>

						</div>




						<div id="matpal">
							<div id="matpal-top">
								맞팔수 <span class="badge">${list.fcount3} 명</span>
							</div>
							<br />
							<h5>
								<input id="search"
									style="margin-left: 25px; border-radius: 15px;" type="text">
								<img id="searchimg" style="width: 30px;  height: 30px; cursor:pointer;"
									src='../resources/IMAGE/search.PNG'>
							</h5>

							<div id="auto">

								
								<c:forEach items="${list0}" var="list0"> 
							&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <a
										href='friendprofile.do?phone=${list0.phone}'> <img
										style="width: 45px; height: 45px; cursor: pointer;"
										src='../resources/UPLOADIMG/${list0.image}'>
									</a>  &nbsp;&nbsp; &nbsp;&nbsp;     <a
										href='friendprofile.do?phone=${list0.phone}'>
										${list0.phone} </a>
									<p id="sn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp; ${list0.name}</p>
									</br>	
														
						</c:forEach>
							

							</div>




						</div>






					</div>
					<!-- profile form끝 -->
			</div>
			</form>

		</div>


		<div id="kk">
			<!-- 내 게시물 (추가예정 장소) ID: KK  -->
<span style="font-size: 13pt;"> ${list.name}님이 올린 게시물${list.contentnumber}</span><br />
			<div class="outline">


				

				
			<!-- 
						<img style="margin-left:250px;"src="../resources/img/not.PNG"> -->
				
					
				<c:forEach items="${image}" var="image">
				  		
				  		
				  		<c:if test="${image.file1 == null}">
							<img style="border: 1px solid RGB(242, 240, 238)"
							;, src="../resources/BOARDIMAGE/not.PNG"  id="img1" width="300"
							height="300">
						</c:if >
						
					
   						<c:if  test="${image.file1 != null}">
							<img style="border: 1px solid RGB(242, 240, 238)"
							;, src="../resources/BOARDIMAGE/${image.file1}"  id="img1" width="300"
								height="300">
						</c:if >
						<c:if  test="${image.file2 == null}">
						<img style="border: 1px solid RGB(242, 240, 238)"
							;, src="../resources/BOARDIMAGE/not.PNG"  id="img2" width="300"
							height="300">
						</c:if >	
						
						<c:if  test="${image.file2 != null}">
						<img style="border: 1px solid RGB(242, 240, 238)"
							;, src="../resources/BOARDIMAGE/${image.file2}"  id="img2" width="300"
							height="300"><br/>
							
						</c:if >
					
						
						
						
					
		
						<div style="margin-left:650px; margin-top:-325px;">
				
						
						
						<div style="font-size:10pt;float:left; background-color:RGB(242, 240, 238); margin-bottom:25px; margin-right:150px;width:365px;height:300px; border:2px solid RGB(242, 240, 238); border-radius:15px;">
						업로드 날짜: ${image.uploaddate} 게시번호: ${image.no}<br/>
						<br/>
						
						내용: 
						<br/>
						<div style="font-size:14pt;border: 2px solid RGB(242, 240, 238);background-color:white;margin-left:40px; border-radius:15px;width:280px; height: 200px;">${image.content}<br/>
						
						</div>
						
						<span style="float:right; margin-top:10px; "> <a href='http://localhost:8000/mysns/user/profile1.do?no=${image.no}&phone=${list.name}'>게시물삭제</a></span>
					</div>
						
				</div> 	
							
				</c:forEach>
				
				
				
				
				
				<%-- <c:forEach items="${image}" var="image">
					<img style="border: 1px solid RGB(242, 240, 238)"
						;, src="../resources/img/${image.file2}" id="img2" width="300"
						height="300">
				</c:forEach> --%>
				
				<%-- <div style="margin-left:150px;">
				<c:forEach items="${image}" var="image">
						<div style="font-size:10pt; float:left; margin-right:150px;width:400px;height:100px; border:1px solid red;">
						${image.uploaddate}<br/>
						
						${image.content}  
						
						</div>
							
								
				</c:forEach>
			</div> --%>
				

				<!-- 게시물 모달-->
				<div id="Modal2" class="modal0">
					<span class="close">×</span> <img class="modal-content1" id="img01">
					<div class="modal_profile_outline">
						<div class="modal_line1"></div>
						<div class="modal_profile">
							<ul class="modal_ul">
								<li class="modal_li1">${list.name}</li>
								<li class="modal_li2"></li>
							</ul>
						</div>
						<!-------- modal_profile----- -->
						<div id="modal_text">
							<h3>
							
								${image[0].content}
								

							</h3>
						</div>

					</div>
					<div id="caption"></div>

				</div>




				<div class="modal" id="followerModal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">

							<c:forEach items="${list2}" var="list2">
							<h5>
								<img style="width: 35px; height: 35px; margin-top:-7px;"
									src='../resources/UPLOADIMG/${list2.image}'> ${list2.phone} ${list2.name}  </br>
							</h5>
							</c:forEach>
							<button type="button" id="fb1" class="btn btn-info">친구
								페이지로</button>

						</div>
					</div>
				</div>
				<div class="modal" id="followingModal" tabindex="-1" role="dialog">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">

							<c:forEach items="${list3}" var="list3">
							<h5>
								<img style="width: 35px; height: 35px; margin-top:-7px;"
									src='../resources/UPLOADIMG/${list3.image}'> ${list3.phone} ${list3.name} </br>
							</h5>
							</c:forEach>
							<button type="button" id="fb2" class="btn btn-danger">친구추가
								페이지로</button>




						</div>
					</div>
				</div>

			</div>

		</div>
		<!-- /본문 -->

	</div>


</body>
</html>