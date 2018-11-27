<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.hanbit.dao.*" import="java.util.*"
	import="com.hanbit.vo.*" import="net.sf.json.JSONArray" session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/resources/HEADER/header2.jsp"></c:import>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
/*■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ 글등록 CSS ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■*/
.colorp {
	width: 600px;
	height: 40px;
}

span.color {
	width: 59.9px;
	height: 10px;
	cursor: pointer;
	float: left;
}

.color_select {
	float: left;
	margin-top: -25px;
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

#purpleblue {
	background-color: #3E4DAD;
}

#white {
	background-color: #D5D5D5;
}

#black {
	background-color: #1A1C1C;
	border-radius: 0 5px 0 0;
}

#select_red {
	margin-left: 20px;
	cursor: pointer;
}

#select_orange, #select_yellow, #select_green, #select_eme-green,
	#select_skyblue, #select_blue, #select_purpleblue, #select_white,
	#select_black {
	margin-left: 36px;
	cursor: pointer;
}

.contents-detail {
	height: 80px;
}

.con_detail {
	float: right;
	margin-top: -50px;
	margin-right: 40px;
	border: none;
}

.profile_img {
	width: 60px;
	height: 60px;
	margin-left: 40px;
	border: 1px solid #BCC0C8;
	border-radius: 1px;
}

.detail {
	width: 592px;
	height: 50px;
	margin-left: 3px;
	margin-top: -10px;
	padding: 8px;
}

.fileUpload {
	position: relative;
	overflow: hidden;
	margin-top: 15;
	cursor: pointer;
}

.fileUpload input.upload {
	position: absolute;
	overflow: hidden;
	padding: 0px;
	width: 40px;
	height: 40px;
	margin-top: -30px;
	margin-left: -10px;
	opacity: 0;
}

.fileUpload2 {
	overflow: hidden;
	padding: 35px;
	margin-top: -100px;
	font-size: 30px;
	position: relative;
	opacity: 10;
	width: 110px;
	height: 110px;
	font-weight: bold;
	color: #DFE0E4;
	margin-left: 160px;
	border: 3px dotted #DFE0E4;
	border-radius: 5px;
	text-align: center;
	cursor: pointer;
}

.fileUpload2 input.upload {
	position: absolute;
	overflow: hidden;
	padding: 0px;
	width: 110px;
	height: 160px;
	margin-top: -130px;
	margin-left: -30px;
	opacity: 0;
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
	margin-top: -100px;
	cursor: pointer;
	background-color: gray;
	position: absolute;
	color: white;
}

.delete2 {
	height: 20px;
	width: 20px;
	text-align: center;
	font-size: 12px;
	font-weight: bold;
	border: 2px solid gray;
	border-radius: 15px;
	margin-left: 250px;
	margin-top: -130px;
	cursor: pointer;
	background-color: gray;
	position: absolute;
	color: white;
}

span.btnUpload, span.btnUpCancel {
	cursor: pointer;
	display: inline-block;
	font-weight: bold;
	height: 25px;
	border-radius: 3px;
	float: right;
}

span.btnUpload {
	background-color: #E9EBEE;
	width: 60px;
	text-align: center;
	border: 1px solid #CED0D4;
	font-size: 12px;
	text-align: center;
}

span.btnUpCancel {
	width: 30px;
	border: 1px solid #CED0D4;
	background-color: #F6F7F9;
	font-size: 16px;
	padding: 2px 0px 0px 9px;
	color: #4F4F4F;
	margin-left: 10px;
	margin-right: 15px;
	margin-top: -15px;
	text-align: center;
}

.modal_board {
	border: 1px solid #DFE0E4;
	width: 600px;
	margin-top: 100px;
	margin-left: 500px;
	border-radius: 6px;
	background-color: white;
}

/*◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆게시글 목록 관련 CSS◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆◆ 시작*/
.outline {
	width: 600px;
	border-radius: 6px;
	background-color: white;
	margin-left: 500px;
	margin-top: 50px;
	margin-bottom: 10px;
}

.profile {
	width: 600px;
	height: 120px;
}

.profile_image {
	border: 1px solid #BCC0C8;
	width: 60px;
	height: 60px;
	margin-left: 15px;
	float: left;
}

.profile_ul {
	list-style-type: none;
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

.main_text {
	border-top: 1px solid #E9EAED;
	width: 570px;
	height: 80px;
	margin: 0 15px 0 15px;
	padding-top: 12px;
}

.img_div1 {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}

.img_div1:hover {
	opacity: 0.7;
}

/* The Modal (background) */
.modal {
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
.modal-content {
	margin-left: 250px;
	display: block;
	width: 661px;
	height: 504px;
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
	top: 100px;
	right: 280px;
	color: #88282;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: gray;
	text-decoration: none;
	cursor: pointer;
}

.modal_profile_outline {
	border: 1px solid #E9EAED;
	width: 400px;
	height: 502px;
	float: right;
	margin-top: -504px;
	margin-right: 270px;
	background-color: white;
	border-radius: 0 5px 0 0;
}

.modal_profile {
	width: 400px;
	height: 100px;
}

.modal_profile_img {
	border: 1px solid white;
	width: 60px;
	height: 60px;
	margin-top: 50px;
	margin-left: 20px;
	float: left;
	background-color: #F3F4F3;
}

#modal_text {
	border-top: 1px solid #E9EAED;
	padding: 20px 25px 20px 20px;
	margin-top: 40px;
	margin-left: 20px;
	width: 355px;
	height: 320px;
	background-color: #F3F4F3;
}

.modal_ul {
	list-style-type: none;
	float: left;
	margin-top: 55px;
	margin-left: -20px;
}

.modal_li1 {
	font-size: 15px;
	font-weight: bold;
}

.modal_li2 {
	margin-top: 6px;
	font-size: 12px;
	color: #90949C;
}

.btn_more {
	border: 1px solid;
	width: 100px;
	height: 100px;
	margin-left: 600px;
}

.modify {
	border: 1px solid;
	width: 300px;
	height: 300px;
	display: none;
}

.modifybutton {
	border: 1px solid;
	width: 50px;
	height: 50px;
}

.detail123 {
	padding-bottom: 30px;
	height: 60px;
}

.btnUpCancel1 {
	display: block;
	margin-top: 10px;
	margin-left: 555px;
	padding-top: 4px;
	padding-bottom: 4px;
	text-align: center;
	border: 1px solid #CED0D4;
	width: 30px;
	background-color: #F6F7F9;
	font-size: 16px;
	color: #4F4F4F;
	border-radius: 2px;
}

.btnUpload1 {
	display: block;
	width: 60px;
	padding-top: 5px;
	padding-bottom: 5px;
	background-color: #E9EBEE;
	margin-left: 490px;
	margin-top: -32px;
	border: 1px solid #CED0D4;
	font-size: 14px;
	text-align: center;
	border-radius: 2px;
}

.colorp1 {
	width: 600px;
	height: 40px;
}

#red1, #orange1, #yellow1, #green1, #eme-green1, #skyblue1, #blue1,
	#purpleblue1, #white1, #black1 {
	width: 59.9px;
	height: 10px;
	cursor: pointer;
	float: left;
}

#red1 {
	background-color: #DC473A;
	border-radius: 5px 0 0 0;
}

#orange1 {
	background-color: #FF7209;
}

#yellow1 {
	background-color: #FFC010;
}

#green1 {
	background-color: #20A464;
}

#eme-green1 {
	background-color: #0DC2AA;
}

#skyblue1 {
	background-color: #15AFF5;
}

#blue1 {
	background-color: #4787F2;
}

#purpleblue1 {
	background-color: #3E4DAD;
}

#white1 {
	background-color: #F3F4F3;
}

#black1 {
	background-color: #1A1C1C;
	border-radius: 0 5px 0 0;
}
</style>
<script type="text/javascript" language="javascript" charset="UTF-8"
	src="http://code.jquery.com/jquery-1.6.2.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script>
	$(document)
			.ready(
					function() {
						//X아이콘 숨김(기본값)
						$("#btnUpCancle").hide();

						//두번째이미지 추가버튼 숨김(기본값)
						$(".fileUpload2").hide();

						//이미지 업로드취소버튼 숨김(기본값)
						$(".delete1").hide();
						$(".delete2").hide();

						//칼라 미선택 상태(기본값);
						var Status = 0;

						//색상 기본값 호출용 함수
						var colorDefalut = function() {
							$("#red").css("background-color", "#DC473A");
							$("#orange").css("background-color", "#FF7209");
							$("#yellow").css("background-color", "#FFC010");
							$("#green").css("background-color", "#20A464");
							$("#eme-green").css("background-color", "#0DC2AA");
							$("#skyblue").css("background-color", "#15AFF5");
							$("#blue").css("background-color", "#4787F2");
							$("#purpleblue").css("background-color", "#3E4DAD");
							$("#white").css("background-color", "#D5D5D5");
							$("#black").css("background-color", "#1A1C1C");
						};

						//높이 기본값 호출용 함수
						var heightDefalut = function() {
							$("#red").css("height", "10px");
							$("#orange").css("height", "10px");
							$("#yellow").css("height", "10px");
							$("#green").css("height", "10px");
							$("#eme-green").css("height", "10px");
							$("#skyblue").css("height", "10px");
							$("#blue").css("height", "10px");
							$("#purpleblue").css("height", "10px");
							$("#white").css("height", "10px");
							$("#black").css("height", "10px");
						};

						var ID;
						var COLOR;
						var CSS;
						//색상 선택
						$(".select_color").click(
								function() {
									ID = $(this).attr("id");
									COLOR = ID.substr(7);
									switch (COLOR) {
									case "red":
										CSS = "#DC473A";
										break;
									case "orange":
										CSS = "#FF7209";
										break;
									case "yellow":
										CSS = "#FFC010";
										break;
									case "green":
										CSS = "#20A464";
										break;
									case "eme-green":
										CSS = "#0DC2AA";
										break;
									case "skyblue":
										CSS = "#15AFF5";
										break;
									case "blue":
										CSS = "#4787F2";
										break;
									case "purpleblue":
										CSS = "#3E4DAD";
										break;
									case "white":
										CSS = "#D5D5D5";
										break;
									case "black":
										CSS = "#1A1C1C";
										break;
									default:
										CSS = "미선택";
									}

									if (Status == 0) {
										$(".color")
												.css("background-color", CSS);
										heightDefalut();
										$("#" + COLOR).css("height", "40px");
										$("#modal_board").css("border",
												"3px solid " + CSS);
										Status = 1;
									} else if (Status == 1) {
										$(".color")
												.css("background-color", CSS);
										heightDefalut();
										$("#" + COLOR).css("height", "40px");
										$("#modal_board").css("border",
												"3px solid " + CSS);
									}

									$("#" + COLOR).click(function() {
										ID = $(this).attr("id");
										CSS = $(this).css("background-color");
										colorDefalut();
										heightDefalut();
										Status = 0;
										COLOR = "미선택";
									});
								});

						var ImgSelect1;
						//이미지1 적용
						$(".fileUpload")
								.on(
										'click',
										'#files-upload',
										function() {
											$("#files-upload").val("");
											var holder = document
													.getElementById('holder');
											$("#files-upload").val(""); //파일 경로 청소
											$("#files-upload")
													.on(
															'change',
															function(e1) {
																e1
																		.preventDefault();
																var file = this.files[0];
																if (file.type
																		.substring(
																				0,
																				5) != "image") {
																	alert('이미지 파일만 등록가능합니다');
																	return false;
																}
																ImgSelect1 = file;

																var reader = new FileReader();
																reader.onload = function() {
																	var img = new Image();
																	img.src = event.target.result;
																	if (img.width > 80) {
																		img.width = 105;
																		img.height = 105;
																	}

																	holder.innerHTML = '';
																	holder
																			.appendChild(img);
																	$(
																			".delete1")
																			.show();
																	if (ImgSelect2 == null) {
																		$(
																				".fileUpload2")
																				.show();

																	}

																	$(
																			".delete1")
																			.click(
																					function() {
																						if (ImgSelect2 != null) {
																							$(
																									"#holder")
																									.empty();
																							$(
																									".delete1")
																									.hide();
																							$(
																									".fileUpload2")
																									.css(
																											"margin-top",
																											"30px")
																						} else {
																							$(
																									"#holder")
																									.empty();
																							$(
																									".delete1")
																									.hide();
																							$(
																									".fileUpload2")
																									.hide();
																							$(
																									".delete2")
																									.hide();
																						}
																					});
																}
																reader
																		.readAsDataURL(file);
																return false;
															});
										});

						var ImgSelect2;
						//이미지2 적용
						$(".fileUpload2")
								.on(
										'click',
										'#files-upload2',
										function() {
											$("#files-upload2").val("");
											var holder2 = document
													.getElementsByClassName('fileUpload2')[0];
											$("#files-upload2")
													.on(
															'change',
															function(e2) {

																e2
																		.preventDefault();
																var file = this.files[0];
																if (file.type
																		.substring(
																				0,
																				5) != "image") {
																	alert('이미지 파일만 등록가능합니다');
																	return false;
																}
																ImgSelect2 = file;

																var reader = new FileReader();
																reader.onload = function() {
																	var img = new Image();
																	img.src = event.target.result;
																	if (img.width > 80) {
																		img.width = 105;
																		img.height = 105;
																	}

																	holder2.innerHTML = '';
																	holder2
																			.appendChild(img);
																	$(
																			".delete2")
																			.show();
																	$(
																			".fileUpload2")
																			.css(
																					"padding-left",
																					"0px")
																			.css(
																					"padding-top",
																					"0px");

																	$(
																			".delete2")
																			.click(
																					function() {
																						$(
																								".delete2")
																								.hide();
																						if (ImgSelect1 == null) {
																							$(
																									".fileUpload2")
																									.empty();

																							$(
																									".fileUpload2")
																									.hide();

																							$(
																									".fileUpload2")
																									.css(
																											"marign-top",
																											"-100px");

																							return;
																						} else if (ImgSelect1 != null) {

																							$(
																									".fileUpload2")
																									.empty();
																							$(
																									".fileUpload2")
																									.append(
																											"<p class='photoadd'>+</p>"
																													+ "<input name='filename2' type='file' class='upload' id='files-upload2' accept='image/*' />");
																							$(
																									".fileUpload2")
																									.css(
																											"padding-left",
																											"35px")
																									.css(
																											"padding-top",
																											"35px");

																							$(
																									".fileUpload2")
																									.css(
																											"border",
																											"3px dotted #DFE0E4");
																						}
																					});
																}
																$(
																		".fileUpload2")
																		.css(
																				"border",
																				"none");
																reader
																		.readAsDataURL(file);

																return false;
															});
										});

						//게시글 모달 처리
						$(".con_detail")
								.click(
										function() {
											$("body").css("background-color",
													"#5D5E5F");
											$(".affix").css("background-color",
													"#5D5E5F").css("display",
													"none");
											$(".outline")
													.css("display", "none");
											$("#btnUpload").css("margin-right",
													"0px");
											$("#btnUpCancle").show();
											$("#btnUpCancle")
													.click(
															function() {
																$("body")
																		.css(
																				"background-color",
																				"#F3F4F3");
																$(".affix")
																		.css(
																				"background-color",
																				"white")
																		.css(
																				"display",
																				"block");
																$(".outline")
																		.css(
																				"display",
																				"block");
																$("#btnUpload")
																		.css(
																				"margin-right",
																				"55px");
																$(this).hide();
															});
										});

						//게시글 등록 처리
						$(".btnUpload")
								.click(
										function() {
											if ($("#contentText").val() == "") {
												alert('컨텐츠 내용을 입력하세요');
												return false;
											} else if (COLOR == null
													|| COLOR == "미선택") {
												alert('칼라 선택은 필수입니다');
												return false;
											}

											//폼 데이터 생성
											var formData = new FormData();
											formData.append("color", COLOR);
											formData.append("content", $(
													"textarea[name=content]")
													.val());
											if (ImgSelect1 != null
													&& ImgSelect2 != null) {
												formData.append("filename1",
														ImgSelect1);
												formData.append("filename2",
														ImgSelect2);
											} else if (ImgSelect1 != null
													&& ImgSelect2 == null) {
												formData.append("filename1",
														ImgSelect1);
											} else if (ImgSelect1 == null
													&& ImgSelect2 != null) {
												formData.append("filename2",
														ImgSelect2);
											}
											$
													.ajax({
														type : "POST",
														url : "post.do",
														data : formData,
														processData : false,
														contentType : false,
														enctype : "multipart/form-data",
														success : function(
																response) {
															alert('글등록이 완료되었습니다');
															location.href = "boardcontent";
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

						/*★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★게시글 목록 관련 스크립트 시작★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★*/

						//글 더보기
						$(".btn_more")
								.click(
										function() {
											var count = $.find(".outline").length;
											$
													.ajax({
														url : "moreList",
														data : {
															startNum : count + 1,
															endNum : count + 5
														},
														success : function(data) {
															$
																	.each(
																			data.moreList,
																			function(
																					index,
																					item) {																			
																				$(
																						"#body1")
																						.append(
																								"<div class='outline' id='"+item.no+"' style='border : 3px solid "+item.color+"'>"
																										+ "<div class='modal_board1'>"
																										+ "<div class=colorp1>"
																										+ "<span class='color1' id='red1'></span>"
																										+ "<span class='color1' id='orange1'></span>"
																										+ "<span class='color1' id='yellow1'></span>"
																										+ "<span class='color1' id='green1'></span>"
																										+ "<span class='color1' id='eme-green1'></span>"
																										+ "<span class='color1' id='skyblue1'></span>"
																										+ "<span class='color1' id='blue1'></span>"
																										+ "<span class='color1' id='purpleblue1'></span>"
																										+ "<span class='color1' id='white1'></span>"
																										+ "<span class='color1' id='black1'></span>"
																										+ "</div>"
																										+ "<div class='board_contenet'> <div class='profile'><div class='profile_image'>"
																										+"<img style='width: 60px; , height: 40px;' src='http://192.168.10.47:8000/mysns/resources/UPLOADIMG/"+item.image+"'>"
																										+"</div><ul class='profile_ul'><li class='profile_li'>"
																										+ item.nick
																										+ "</li>"
																										+ "<li class='profile_li2'>"
																										+ item.uploaddate
																										+ "</li></ul></div>"
																										+ "<div class='main_text'>"
																										+ item.content
																										+ "</div>"
																										+ "<div class='img_div1'>"
																										+ "<img src='../resources/BOARDIMAGE/"+item.file1+"' class='img1' style='width: 570px; height: 300px; margin-left: 15px;'>"
																										+ "<img src='../resources/BOARDIMAGE/"+item.file2+"' class='img2' style='width: 570px; height: 300px; margin-left: 15px;'>"
																										+ "</div></div>"
																										+ "<div id='myModal' class='modal'><span class='close'>×</span> <img class='modal-content' id='img01'>"
																										+ "<div class='modal_profile_outline'><div class='modal_line1'></div><div class='modal_profile'>"
																										+ "<div class='modal_profile_img'></div><ul class='modal_ul'>"
																										+ "<li class='modal_li1'>"
																										+ item.nick
																										+ "</li><li class='modal_li2'>2016.10.13</li></ul></div>"
																										+ "<div id='modal_text'></div><div class='modal_line2'></div>"
																										+ "</div><div id='caption'></div></div><div id='mymodify' class='modify'>"
																										+ "<div class='detail123'><span class='btnUpCancel1' id='btnUpCancel1'>X</span> <span class='btnUpload1' id='btnUpload1'>수정</span>"
																										+ "</div></div></div></div>");
																			});

														},
														faile : function() {
															alert('통신 오류');
														},
														error : function(event) {
															alert('시스템오류');
															console.log(event);
														}
													});
											$(".btn_more").remove();
										});
						
						//글 삭제
						
						
						
						
						
						
						
						
						
						

						$(".modifybutton")
								.click(
										function() {
											var No = 6;
											alert(No);
											$
													.ajax({
														url : "http://192.168.10.47:8000/mysns/board/contentform",
														data : {
															no : No,
															content : $(
																	".textarea1")
																	.val()
														},
														type : "post",
														success : function() {
															alert('수정성공');
														}
													});

										});

						var getmodifycontent = function(No) {
							$
									.ajax({
										type : "POST",
										url : "http://192.168.10.47:8000/mysns/board/boardcontent3",
										data : {
											no : No
										},
										dataType : "json",
										success : function(data) {
											if (data.length == 0) {
												alert("결과가 없습니다.");
											} else {
												var htmlText = "";

												for (var i = 0; i < data.length; i++) {
													htmlText += data[i].content;
												}

												$(".con_detail").html(htmlText);

											}
										}
									});
						};

						$(".btnUpCancel1")
								.click(
										function() {
											if (confirm("삭제하시겠습니까?")) {

												var NO = $(this).parent()
														.parent().parent()
														.attr("id");
												var thisDelete = $(this)
														.parent().parent()
														.parent();
												$
														.ajax({
															type : "get",
															url : "http://192.168.10.47:8000/mysns/board/contentdelete",
															data : {
																no : NO
															},
															success : function(
																	data) {
																if (data == 1) {
																	$(
																			thisDelete)
																			.remove();
																	var totalCount = "${count}";
																	if (totalCount - 1 <= 5) {
																		$(
																				".btn_more")
																				.remove();
																	}
																} else if (data == 0) {
																	alert('이미 삭제된 글입니다');
																}
															}
														});

											} else if (data == 0) {
												alert('이미 삭제된 글입니다');

											}
										});
					

						
						
						
						
						
						
						
						
						
						
						
						
						var modal = document.getElementById("myModal");
						var modalImg1 = document.getElementById("img01");
						var modalImg2 = document.getElementById("img02");

						var getConetent = function(contentNo) {
							$
									.ajax({
										type : "POST",
										url : "http://192.168.10.47:8000/mysns/board/boardcontent2",
										data : {
											no : contentNo
										},
										dataType : "json",
										success : function(data) {
											if (data.length == 0) {
												alert("결과가 없습니다.");
											} else {
												var htmlText = "";
												var htmlnick = "";
												var htmldate = "";
												var htmlprofile = "";
												for (var i = 0; i < data.length; i++) {
													htmlText += data[i].content;
													htmlnick += data[i].nick;
													htmldate += data[i].uploaddate;
													htmlprofile += data[i].image;

												}
												$(".modal_li1").html(htmlnick);
												$(".modal_li2").html(htmldate);
												$("#modal_text").html(htmlText);
												$(".modal_profile_img").html(
														htmlprofile);
											}
										}
									});
						};

						$(".board_contenet").on(
								'click',
								'.img_div1',
								function() {
									alert('클릭됨');
									modal.style.display = "block";
									/* console.log(document.getElementsByClassName("img1")); */
									var SRC1 = $(this).children(".img1").attr(
											"src");
									var SRC2 = $(this).children(".img2").attr(
											"src");
									var CUT1 = SRC1.substr(23);
									var CUT2 = null;
									if (SRC2 != null) {
										CUT2 = SRC2.substr(23);
									}
									if (CUT2 == null) {
										modalImg1.src = SRC1;
										/* $("img").css("margin-top", "120px"); */
										modalImg2.remove();
									} else {
										modalImg1.src = SRC1;
										modalImg2.src = SRC2;
									}

									var contentNo = $(this).parent().parent()
											.parent().parent().attr("id");
									getConetent(contentNo);

								});

						var span = document.getElementsByClassName("close")[0];
						span.onclick = function() {
							modal.style.display = "none";

						};

						$(".hide_text").click(function() {
							$(".outline").hide();
						});

						var modal_boardDefalut = function() {

							$(".outline").css("border", "1px solid #DFE0E4");
						};

					});//END READY FUNCTION
</script>
<script>
	//글자수 제한
	function fc_chk_byte(memo) {
		var ari_max = 280;
		var ls_str = memo.value; // 이벤트가 일어난 컨트롤의 value 값 
		var li_str_len = ls_str.length; // 전체길이
		// 변수초기화 
		var li_max = ari_max; // 제한할 글자수 크기 
		var i = 0; // for문에 사용 
		var li_byte = 0; // 한글일경우는 2 그밖에는 1을 더함 
		var li_len = 0; // substring하기 위해서 사용 
		var ls_one_char = ""; // 한글자씩 검사한다 
		var ls_str2 = ""; // 글자수를 초과하면 제한할수 글자전까지만 보여준다.
		for (i = 0; i < li_str_len; i++) {
			// 한글자추출 
			ls_one_char = ls_str.charAt(i);
			// 한글이면 2를 더한다. 
			if (escape(ls_one_char).length > 4) {
				li_byte += 2;
			} else { // 그밗의 경우는 1을 더한다. 
				li_byte++;
			}
			// 전체 크기가 li_max를 넘지않으면 
			if (li_byte <= li_max) {
				li_len = i + 1;
			}
		}
		// 전체길이를 초과하면 
		if (li_byte > li_max) {
			alert("140 글자를 초과 입력할수 없습니다. \n 초과된 내용은 자동으로 삭제 됩니다. ");
			ls_str2 = ls_str.substr(0, li_len);
			memo.value = ls_str2;
		}
		memo.focus();
	}
	function fc_chk2() {
		if (event.keyCode == 13)
			event.returnValue = false;
	}
</script>
</head>
<body class="body" id="body1" style="background-color: #FAFAFA;">
	<div class="modal_board" id="modal_board">
		<div class="colorp">
			<span class="color" id="red"></span> <span class="color" id="orange"></span>
			<span class="color" id="yellow"></span> <span class="color"
				id="green"></span> <span class="color" id="eme-green"></span> <span
				class="color" id="skyblue"></span> <span class="color" id="blue"></span>
			<span class="color" id="purpleblue"></span> <span class="color"
				id="white"></span> <span class="color" id="black"></span>
		</div>
		<div class="color_select">
			<span class="select_color" id="select_red"><img
				src="../resources/gnb_image/red.png" style="width: 20px;"></span> <span
				class="select_color" id="select_orange"><img
				src="../resources/gnb_image/orange.png" style="width: 20px;"></span>
			<span class="select_color" id="select_yellow"><img
				src="../resources/gnb_image/yellow.png" style="width: 20px;"></span>
			<span class="select_color" id="select_green"><img
				src="../resources/gnb_image/green.png" style="width: 20px;"></span> <span
				class="select_color" id="select_eme-green"><img
				src="../resources/gnb_image/eme-green.png" style="width: 20px;"></span>
			<span class="select_color" id="select_skyblue"><img
				src="../resources/gnb_image/skyblue.png" style="width: 20px;"></span>
			<span class="select_color" id="select_blue"><img
				src="../resources/gnb_image/blue.png" style="width: 20px;"></span> <span
				class="select_color" id="select_purpleblue"><img
				src="../resources/gnb_image/pp.png" style="width: 20px;"></span> <span
				class="select_color" id="select_white"><img
				src="../resources/gnb_image/white.png" style="width: 20px;"></span> <span
				class="select_color" id="select_black"><img
				src="../resources/gnb_image/black.png" style="width: 20px;"></span>
		</div>
		<div class="contents">
			<div class="contents-detail">
				<div class="profile_img">
					<img id="searchimg" style="width: 60px; , height: 30px;"
						src='http://192.168.10.47:8000/mysns/resources/UPLOADIMG/${vo.image}'>
				</div>
				<textarea class=con_detail cols=55 rows=2 id="contentText"
					placeholder="140자 내로 내용을 입력해 주세요." name="content"
					onkeyup="fc_chk_byte(this);" onkeypress="fc_chk2();"></textarea>
			</div>
			<div id="holder" style="margin: 10px 15px -15px 15px;"></div>
			<div id="delete1">
				<p class="delete1">X</p>
			</div>
			<div class="fileUpload2">
				<p class="photoadd">+</p>
				<input name="filename2" type="file" class="upload"
					id="files-upload2" accept="image/*" />
			</div>
			<div id="delete2">
				<p class="delete2">X</p>
			</div>
			<hr style="color: #E9EAED;">
		</div>
		<div class="detail">
			<div class="fileUpload btn btn">
				<span><img src="../resources/icon/photo.png"
					style="height: 20px;"></span> <input name="filename1" type="file"
					class="upload" id="files-upload" accept="image/*" />
			</div>
			<span class="btnUpCancel" id="btnUpCancle" style="margin-top: 5px;">X</span>
			<span class="btnUpload" id="btnUpload"
				style="margin-right: 55px; margin-top: 5px;">게시</span>
		</div>
		<!-- </form> -->
	</div>

	<!-------------------------------------------------------  게시글 목록 시작 ------------------------------------------------------------------------->
	<c:forEach items="${list}" var="blist">
		<c:if test="${blist.color != 'purpleblue'}">
			<div class="outline" id="${blist.no}"
				style="border: 3px solid ${blist.color}">
		</c:if>
		<c:if test="${blist.color == 'purpleblue'}">
			<div class="outline" id="${blist.no}"
				style="border: 3px solid #3E4DAD">
		</c:if>
		<div class="modal_board1">
			<div class="colorp1">
				<span class="color1" id="red1"></span> <span class="color1"
					id="orange1"></span> <span class="color1" id="yellow1"></span> <span
					class="color1" id="green1"></span> <span class="color1"
					id="eme-green1"></span> <span class="color1" id="skyblue1"></span>
				<span class="color1" id="blue1"></span> <span class="color1"
					id="purpleblue1"></span> <span class="color1" id="white1"></span> <span
					class="color1" id="black1"></span>
			</div>
			<div class="board_contenet">
				<div class="profile">
					<div class="profile_image">
						<img style="width: 60px; , height: 40px;"
							src="http://192.168.10.47:8000/mysns/resources/UPLOADIMG/${blist.image}">
					</div>
					<ul class="profile_ul">
						<li class="profile_li">${blist.nick}</li>
						<li class="profile_li2">${blist.uploaddate}</li>
					</ul>
				</div>
				<div class="main_text">${blist.content}</div>
				<div class="img_div1">
					<c:if test="${blist.file1 != null}">
						<img src="../resources/BOARDIMAGE/${blist.file1}" class="img1"
							style="width: 570px; height: 300px; margin-left: 15px;">
					</c:if>
					<c:if test="${blist.file2 != null}">
						<img src="../resources/BOARDIMAGE/${blist.file2}" class="img2"
							style="width: 570px; height: 300px; margin-left: 15px;">
					</c:if>
				</div>
			</div>
			<!-- The Modal -->
			<div id="myModal" class="modal">
				<span class="close">×</span>
				<div class="modal-content">
					<img id="img01" width="610px" height="250px">
					<c:if test="${blist.file2 != null }">
						<img id="img02" width="610px" height="250px">
					</c:if>
				</div>
				<div class="modal_profile_outline">
					<div class="modal_line1"></div>
					<div class="modal_profile">
						<div class="modal_profile_img"></div>
						<ul class="modal_ul">
							<li class="modal_li1">김기웅</li>
							<li class="modal_li2">2016.10.13</li>
						</ul>
					</div>
					<!-------- modal_profile----- -->
					<div id="modal_text"></div>
					<div class="modal_line2"></div>
				</div>
				<!------ mdal_profile_outline----------- end -->
				<div id="caption"></div>
			</div>
			<c:if test="${sid == blist.user_phone}">
				<div class="detail123">
					<span class="btnUpCancel1" id="btnUpCancel1">X</span> <span
						class="btnUpload1" id="btnUpload1">수정</span>
				</div>
			</c:if>
		</div>
		</div>
		<!-------------------------------- outline end ---------------------------- -->
	</c:forEach>
	<c:choose>
		<c:when test="${count > 5}">
			<span class="btn_more" id="btn_more1">게시글 더 보기</span>
		</c:when>
	</c:choose>
</body>
</html>
