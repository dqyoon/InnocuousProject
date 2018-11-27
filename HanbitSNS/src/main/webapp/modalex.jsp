<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="http://code.jquery.com/jquery-1.6.2.min.js"></script>
<script>
	$(function() {
		(".gnb_yellow").click(function(){
			$ajax({
				type : "POST"
					
			});
			
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

		var modal_boardDefalut = function() {

			$("#modal_board").css("border", "1px solid #DFE0E4");
		}

		var selectColor;

		Status = 0; //색 선택 전 기본값 0

		$("#count_red").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#DC473A");
				heightDefalut();
				$("#red").css("height", "40px");
				$("#modal_board").css("border", "1px solid #DC473A");

				selectColor = "red";

				/* var REDCOUNT = $("#predcount").text();
				$("#predcount").text(Number(REDCOUNT)+1); */

				Status = 1;
			} else if (Status == 1) {
				$(".color").css("background-color", "#DC473A");
				heightDefalut();
				$("#red").css("height", "40px");
				$("#modal_board").css("border", "1px solid #DC473A");
				selectColor = "red";
				Status = 0;

			}

			$("#red").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				/* var REDCOUNT = $("#predcount").text();
				alert(REDCOUNT);
				$("#predcount").text(Number(REDCOUNT)-1); */
				Status = 0;
				selectColor = null;
			});

		});

		$("#count_orange").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#FF7209");
				heightDefalut();
				$("#orange").css("height", "40px");
				$("#modal_board").css("border", "1px solid #FF7209");
				Status = 1;
				selectColor = "orange";
			} else if (Status == 1) {
				$(".color").css("background-color", "#FF7209");
				heightDefalut();
				$("#orange").css("height", "40px");
				$("#modal_board").css("border", "1px solid #FF7209");
				Status = 0;
				selectColor = "orange";
			}
			$("#orange").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});

		});
		$("#count_yellow").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#FFC010");
				heightDefalut();
				$("#yellow").css("height", "40px");
				$("#modal_board").css("border", "1px solid #FFC010");
				Status = 1;
				selectColor = "yellow";

			} else if (Status == 1) {
				$(".color").css("background-color", "#FFC010");
				heightDefalut();
				$("#yellow").css("height", "40px");
				$("#modal_board").css("border", "1px solid #FFC010");
				Status = 0;
				selectColor = "yellow";
			}

			$("#yellow").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		$("#count_green").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#20A464");
				heightDefalut();
				$("#green").css("height", "40px");
				$("#modal_board").css("border", "1px solid #20A464");
				Status = 1;
				selectColor = "green";

			} else if (Status == 1) {
				$(".color").css("background-color", "#20A464");
				heightDefalut();
				$("#green").css("height", "40px");
				$("#modal_board").css("border", "1px solid #20A464");
				Status = 0;
				selectColor = "green";
			}

			$("#green").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		$("#count_eme-green").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#0DC2AA");
				heightDefalut();
				$("#eme-green").css("height", "40px");
				$("#modal_board").css("border", "1px solid #0DC2AA");
				Status = 1;
				selectColor = "eme-green";
			} else if (Status == 1) {
				$(".color").css("background-color", "#0DC2AA");
				heightDefalut();
				$("#eme-green").css("height", "40px");
				$("#modal_board").css("border", "1px solid #0DC2AA");
				Status = 0;
				selectColor = "eme-green";

			}

			$("#eme-green").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		$("#count_skyblue").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#15AFF5");
				heightDefalut();
				$("#skyblue").css("height", "40px");
				$("#modal_board").css("border", "1px solid #15AFF5");
				Status = 1;
				selectColor = "skyblue";
			} else if (Status == 1) {
				$(".color").css("background-color", "#15AFF5");
				heightDefalut();
				$("#skyblue").css("height", "40px");
				$("#modal_board").css("border", "1px solid #15AFF5");
				Status = 0;
				selectColor = "skyblue";
			}

			$("#skyblue").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		$("#count_blue").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#4787F2");
				heightDefalut();
				$("#blue").css("height", "40px");
				$("#modal_board").css("border", "1px solid #4787F2");
				Status = 1;
				selectColor = "blue";
			} else if (Status == 1) {
				$(".color").css("background-color", "#4787F2");
				heightDefalut();
				$("#blue").css("height", "40px");
				$("#modal_board").css("border", "1px solid #4787F2");
				Status = 0;
				count = "blue";
			}

			$("#blue").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		$("#count_pp").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#3E4DAD");
				heightDefalut();
				$("#pp").css("height", "40px");
				$("#modal_board").css("border", "1px solid #3E4DAD");
				Status = 1;
				selectColor = "pp";
			} else if (Status == 1) {
				$(".color").css("background-color", "#3E4DAD");
				heightDefalut();
				$("#pp").css("height", "40px");
				$("#modal_board").css("border", "1px solid #3E4DAD");
				Status = 0;
				selectColor = "pp";
			}

			$("#pp").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		$("#count_white").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#F3F4F3");
				heightDefalut();
				$("#white").css("height", "40px");
				$("#modal_board").css("border", "1px solid #C3C3C3");
				Status = 1;
				selectColor = "white";
			} else if (Status == 1) {
				$(".color").css("background-color", "#F3F4F3");
				heightDefalut();
				$("#white").css("height", "40px");
				$("#modal_board").css("border", "1px solid #C3C3C3");
				Status = 0;
				selectColor = "white";
			}

			$("#white").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		$("#count_black").click(function() {
			if (Status == 0) {
				$(".color").css("background-color", "#1A1C1C");
				heightDefalut();
				$("#black").css("height", "40px");
				$("#modal_board").css("border", "1px solid #1A1C1C");
				Status = 1;
				selectColor = "black";
			} else if (Status == 1) {
				$(".color").css("background-color", "#1A1C1C");
				heightDefalut();
				$("#black").css("height", "40px");
				$("#modal_board").css("border", "1px solid #1A1C1C");
				Status = 0;
				selectColor = "black";
			}

			$("#black").click(function() {
				colorDefalut();
				heightDefalut();
				modal_boardDefalut();
				Status = 0;
				selectColor = null;
			});
		});
		//X아이콘 숨김(기본값)
		$("#btnUpCancle").hide();
		//게시글 모달 처리
		$(".con_detail").click(
				function() {
					$("body").css("background-color", "#5D5E5F");
					$(".affix").css("background-color", "#5D5E5F").css(
							"display", "none");
					$(".btnUpload").css("margin-right", "0px");

					$("#btnUpCancle").show();
					$("#btnUpCancle").click(
							function() {
								$("body").css("background-color", "#F3F4F3");
								$(".affix").css("background-color", "white")
										.css("display", "block");
							});
				});

		$("#photoadd").hide();
		$("#delete1").hide();
		$("#delete2").hide();

		//게시글 등록 처리
		$(".btnUpload").click(
				function() {
					//칼라 선택 유효성 체크해야됨
					
					//이미지 선택 유효성 체크해야됨(1개일때, 2개일때, 0개일때)
				
					/*  var img = new Image(); 
					 img.onload=function(){
						    //파일 존재 시 내용
						    
						   } 
						   img.onerror=function(){
						    //파일 없을 시 내용   
						    

						   }  */
						   var holder = document.getElementById('holder');
							var holder2 = document
									.getElementById('photoadding');
							
						

					//폼 데이터 정렬
					var formData = new FormData();
					formData.append("color", selectColor);
					formData.append("content", $("textarea[name=content]")
							.val());
				formData.append("filename1",
							$("input[name=filename1]")[0].files[0]);
					formData.append("filename2",
							$("input[name=filename2]")[0].files[0]); 
					
					/* 
				    if(holder.innerHTML == '1'){
				        if(holder2.innerHTML = '2'){
				           formData.append("filename1",$("input[name=filename1]")[0].files[0]);
				                     formData.append("filename2",$("input[name=filename2]")[0].files[0]);
				        }else if(holder1.innerHTML ='1'){
				           formData.append("filename1",$("input[name=filename1]")[0].files[0]);
				                    }
				     }else if(holder2.innerHTML = '1'){
				     if(holder2.innerHTML = '2'){
				        formData.append("filename2",$("input[name=filename2]")[0].files[0]);
				     }
				     }
					 */
					
					//ajax전송
					 $.ajax({
						type : "POST",
						url : "board/post.do",
						data : formData,
						processData: false,
		        	    contentType: false,
						success : function() {
							alert('업로드 됨');
						},
						fail : function() {
							alert('글등록 실패!!!!');
						},
						error : function(event) {
							alert('시스템오류');
							console.log(event);
						}
					}); 
				});

		var session = "${sid}";
		console.log(session);

		var img = "${propilemy}";
		console.log(img);

	});
</script>
<script>
function fc_chk_byte(memo) 
{ 
 var ari_max=600;
 var ls_str = memo.value; // 이벤트가 일어난 컨트롤의 value 값 
 var li_str_len = ls_str.length; // 전체길이 

 // 변수초기화 
 var li_max = ari_max; // 제한할 글자수 크기 
 var i = 0;     // for문에 사용 
 var li_byte = 0;  // 한글일경우는 2 그밗에는 1을 더함 
 var li_len = 0;  // substring하기 위해서 사용 
 var ls_one_char = ""; // 한글자씩 검사한다 
 var ls_str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다. 

 for(i=0; i< li_str_len; i++) 
 { 
  // 한글자추출 
  ls_one_char = ls_str.charAt(i); 

  // 한글이면 2를 더한다. 
  if (escape(ls_one_char).length > 4) { 
   li_byte += 2; 
  }else{   // 그밗의 경우는 1을 더한다. 
   li_byte++; 
  } 
  // 전체 크기가 li_max를 넘지않으면 
  if(li_byte <= li_max){ 
   li_len = i + 1; 
  } 
 } 

 // 전체길이를 초과하면 
 if(li_byte > li_max){ 
  alert("300 글자를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. "); 
  ls_str2 = ls_str.substr(0, li_len); 
  memo.value = ls_str2; 
 } 
 memo.focus(); 
} 

function fc_chk2() 
{ 
 if(event.keyCode == 13) 
 event.returnValue=false; 
} 

</script>

<style>
body {
	background-color: #F3F4F3 /* #FAFAFA */;
}

.affix {
	margin: -8px;
	height: 55px;
	width: 100%;
	background-color: white /*  #E9EBEE */ /* #F3F4F3 */;
	border-bottom: 1px solid #DBDBDB;
	float: left;
	top: 0;
}

.gnb_list {
	list-style: none;
}

/* .gnb_li_mypage, .gnb_li_friend{
margin-top:-30px;
} */
.gnb_li_mypage {
	padding-left: 32px;
	margin-right: 327px;
	margin-top: -30px;
}

.gnb_li_friend {
	margin-top: -30px;
	margin-right: 370px;
}

.gnb__li_logo {
	margin-left: 327px;
	margin-top: 10px;
}

.gnb_color {
	margin-left: 610px;
	margin-top: -46px;
}

span.gnb_red, span.gnb_orange, span.gnb_yellow, span.gnb_green, span.gnb_eme-green,
	span.gnb_skyblue, span.gnb_blue, span.gnb_pp, span.gnb_white, span.gnb_black
	{
	cursor: pointer
}

.modal_board {
	border: 1px solid #DFE0E4;
	width: 600px;
	/* 	height: 200px; */
	margin-top: 100px;
	margin-left: 500px;
	border-radius: 6px;
	background-color: white;
}

.colorp {
	/* border: 1px solid; */
	width: 600px;
	height: 40px;
	/* margin-left: 3px;
	margin-top: 3px; */
}

#red, #orange, #yellow, #green, #eme-green, #skyblue, #blue, #pp, #white,
	#black {
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

#count_red, #count_orange, #count_yellow, #count_green, #count_eme-green,
	#count_skyblue, #count_blue, #count_pp, #count_white, #count_black {
	float: left;
	cursor: pointer;
}

#count_orange, #count_yellow, #count_green, #count_eme-green,
	#count_skyblue, #count_blue, #count_pp, #count_white, #count_black {
	margin-left: 40px;
}

.contents-detail {
	height: 80px;
}

.profile_img {
	width: 60px;
	height: 60px;
	margin-left: 15px;
	margin-top: 28px;
	border: 1px solid #BCC0C8;
	border-radius: 1px;
}

.con_detail {
	float: right;
	margin-top: -60px;
	margin-right: 15px;
	border: none;
}

.detail {
	width: 592px;
	height: 40px;
	margin-left: 3px;
	margin-top: -10px;
}

span.btnUpload, span.btnUpCancel {
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

.fileUpload2 {
	position: absolute;
	top: 0;
	right: 0;
	margin-top: 280px;
	margin-right: 590px;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
	cursor: pointer;
}

.fileUpload {
	position: relative;
	overflow: hidden;
}

.fileUpload input.upload {
	position: absolute;
	top: 0;
	right: 0;
	margin: 0;
	padding: 0;
	font-size: 20px;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.fileUpload {
	margin-top: -3px;
	margin-left: 0px;
	cursor: pointer;
}

span.btnPhoto {
	margin-left: 15px;
}

.photoadd {
	width: 90px;
	height: 90px;
	margin-top: -10px;
	font-weight: bold;
	font-size: 40px;
	color: #DFE0E4;
	margin-left: 135px;
	margin-top: -98px;
	border: 3px dotted #DFE0E4;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
	padding-top: 15px;
}

.photoadding {
	width: 105px;
	height: 105px;
	margin-left: 135px;
}

.delete2 {
	height: 20px;
	width: 20px;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	border: 2px solid gray;
	border-radius: 15px;
	margin-left: 220px;
	cursor: pointer;
}

.delete1 {
	height: 20px;
	width: 20px;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	border: 2px solid gray;
	border-radius: 15px;
	margin-left: 100px;
	margin-top: 0px;
	cursor: pointer;
}
</style>
</head>
<body class="bady">
	<div class="affix">
		<ul class="gnb_list">
			<li class="gnb__li_logo"><a href="#"><img
					src="resources/gnb_image/logo01.png" style="height: 40px;"></a></li>
			<li class="gnb_li_mypage" style="float: right;"><a href="#"><img
					src="resources/gnb_image/gnb_mypage01.png" style="height: 20px;"></a></li>
			<li class="gnb_li_friend" style="float: right;"><a href="#"><img
					src="resources/gnb_image/gnb_friend01.png" style="height: 20px;"></a></li>
		</ul>
		<div class="gnb_color">
			<span class="gnb_red"><img src="resources/gnb_image/red.png"></span>
			<span class="gnb_orange"><img
				src="resources/gnb_image/orange.png"></span> <span class="gnb_yellow"><img
				src="resources/gnb_image/yellow.png"></span> <span class="gnb_green"><img
				src="resources/gnb_image/green.png"></span> <span
				class="gnb_eme-green"><img
				src="resources/gnb_image/eme-green.png"></span> <span
				class="gnb_skyblue"><img
				src="resources/gnb_image/skyblue.png"></span> <span class="gnb_blue"><img
				src="resources/gnb_image/blue.png"></span><span class="gnb_pp"><img
				src="resources/gnb_image/pp.png"></span><span class="gnb_white"><img
				src="resources/gnb_image/white.png"></span> <span class="gnb_black"><img
				src="resources/gnb_image/black.png"></span>
		</div>
	</div>

	<div class="modal_board" id="modal_board">
		<div class="colorp">
			<span class="color" id="red"></span> <span class="color" id="orange"></span>
			<span class="color" id="yellow"></span> <span class="color"
				id="green"></span> <span class="color" id="eme-green"></span> <span
				class="color" id="skyblue"></span> <span class="color" id="blue"></span>
			<span class="color" id="pp"></span> <span class="color" id="white"></span>
			<span class="color" id="black"></span>
		</div>
		<div class="color_count">
			<span class="count_red" id="count_red"><img
				src="resources/gnb_image/red.png" style="width: 20px;"> <!-- <p id="predcount"
					style="font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_orange" id="count_orange"><img
				src="resources/gnb_image/orange.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_yellow" id="count_yellow"><img
				src="resources/gnb_image/yellow.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_green" id="count_green"><img
				src="resources/gnb_image/green.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_eme-green" id="count_eme-green"><img
				src="resources/gnb_image/eme-green.png" style="width: 20px;">
				<!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_skyblue" id="count_skyblue"><img
				src="resources/gnb_image/skyblue.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_blue" id="count_blue"><img
				src="resources/gnb_image/blue.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_pp" id="count_pp"><img
				src="resources/gnb_image/pp.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_white" id="count_white"><img
				src="resources/gnb_image/white.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: black; margin-left: 3px; margin-top: -17px;">00</p> --></span>
			<span class="count_black" id="count_black"><img
				src="resources/gnb_image/black.png" style="width: 20px;"> <!-- <p
					style="font-size: 12px; font-size: 12px; color: white; margin-left: 3px; margin-top: -17px;">00</p> --></span>
		</div>
		<!-- <form name="upload" action="board/post.do" id="Uploadboard"
			method="post" enctype="multipart/form-data"> -->
		<div class="contents">

			<div class="contents-detail">
				<div class="profile_img">
					<img src="../resources/UPLOADIMG/${propilemy}" height="60px"
						width="60px">
				</div>

				<textarea class=con_detail cols=67 rows=3 id="contentText"
					placeholder="400자 내로 내용을 입력해 주세요." name="content" onkeyup="fc_chk_byte(this);" onkeypress="fc_chk2();"></textarea>
			</div>

			<!-- <div class="photocon"> -->

			<div id="holder" style="margin: 10px 15px -15px 15px;"></div>
			<div id="delete1">
				<p class="delete1"
					style="background-color: gray; color: white; position: relative;">X</p>
			</div>
			<div id="delete2">
				<p class="delete2"
					style="background-color: gray; color: white; position: relative;">X</p>
			</div>


			<div id="photoadd">

				<p class="photoadd">+</p>
				<div class="photoadding" id="photoadding"></div>


				<div class="fileUpload2">
					<input name="filename2" type="file" class="upload"
						id="files-upload2" accept="image/*" />
				</div>

			</div>

			<!-- </div>	 -->
			<hr style="color: #E9EAED;">
		</div>
	

		<div class="detail">
		



			<div class="fileUpload btn btn">
				<span><img src="resources/icon/photo.png"
					style="height: 20px;"></span> <input name="filename1" type="file"
					class="upload" id="files-upload" accept="image/*" />
			</div>

			


			<script>
				$(".upload").change(
						function(e) {
							e.preventDefault();

							var file = this.files[0];
							var holder = document.getElementById('holder');
							var holder2 = document
									.getElementById('photoadding');
							var reader = new FileReader();
							var ID = $(this).attr("id");
							/* var deldel; */

							reader.onload = function(event) {
								var img = new Image();
								img.src = event.target.result;
								if (img.width > 80) {
									img.width = 105;
									img.height = 105;
								}

								if (ID == "files-upload") {
									holder.innerHTML = '';
									holder.appendChild(img);
									$("#delete1").show();
									$("#delete1").css("margin-top", "70px;");
									/* if($("photoadd").attr("show", "true")) {
										alert("이미지 있음");
										return;
									} else { */
									$("#photoadd").show();
									$("#photoadding").hide();
									/* 	return;
									}									
									 */
									$("#delete1").click(function() {
										$("#holder").empty();
										$("#delete1").hide();
										$("#photoadd").hide();
										$("#delete2").hide();

									});

									/* $("#photoadd").css("margin-left", "135px")
									.css("margin-top", "-107px")
									; */
								} else if (ID == "files-upload2") {
									holder2.innerHTML = '';
									holder2.appendChild(img);

									/* deldel =  */
									$("#delete2").show();
									$("#delete2").css("margin-top", "-30px");
									$("#photoadding").show();
									$("#photoadding").css("margin-left",
											"135px")
											.css("margin-top", "-120px");

									$(".photoadd").hide();
									$("#delete2").click(function() {
										$(".photoadd").show();
										$("#photoadding").empty();
										$("#delete2").hide();
									});

								}

							};
							reader.readAsDataURL(file);
							return false;

						});
			</script>


			<span class="btnCheckin"><img src="resources/icon/checkin.png"
				style="height: 20px; margin-top: -3px; margin-left: 5px;"></span> <span
				class="btnUpCancel" id="btnUpCancle">X</span> <span
				class="btnUpload" id="btnUpload" style="margin-right: 15px;">게시</span>
		</div>
		<!-- </form> -->

	</div>
</body>
</html>