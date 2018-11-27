<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/HEADER/header2.jsp"></c:import>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="resources/jQueryUI/jquery-ui.js"></script>
<style>
.well {
	margin-top: 50px;
	width: 750px;
	margin-left: 400px;
	margin-bottom: 0px;
}

.human {
	border: solid #E9EBEE 1px;
	text-align: center;
	float: left;
	margin: 8px;
	text-align: center;
	width: 130px;
	height: 140px;
}

#humanList {
	width: 750px;
	height: 210px;
	margin-left: 400px;
}

.friend {
	border: solid #337AB7 1px;
	text-align: center;
	float: left;
	margin: 15px;
	width: 130px;
	height: 150px;
}

.follower {
	border: solid #449D44 1px;
	text-align: center;
	float: left;
	margin-top: 20px;
	margin-left: 10px;
	margin-right: 10px;
	width: 130px;
	height: 180px;
	padding: 5px;
}

#friendList {
	width: 650px;
	margin-left: 450px;
}

.profile {
	cursor: pointer;
	width: 120px;
	height: 120px;
	margin-bottom: 0px;
}

.btn-group {
	position: absolute;
	margin-left: 450px;
}

.input-group {
	margin-left: 750px;
}

#msg {
	width: 200px;
	height: 30px;
	padding: 5px;
	float: right;
	position: relative;
	margin-right: 550px;
}
</style>
<script type="text/javascript">
	$(function() {

		//스테이터스 기본값 0 = 팔로우목록 클릭상태
		var Status = 0;

		//검색어 미입력 경고 메시지 숨기기(기본값)
		$("#msg").hide();

		//팔로윙 함수
		var Following = function(parent, F_phone) {
			$
					.ajax({
						url : "friend/following",
						data : {
							u_phone : "${sid}",
							f_phone : F_phone
						},
						success : function(data) {
							if (data == 1) {
								//알수도 있는사람 목록 갱신									
								parent.remove();
								//팔로윙 카운트 증가
								var followingCount = Number($("#followingCount")
										.text())
								$("#followingCount").text(followingCount + 1);
								HumanRefresh();
								if (Status == 0
										&& $.find(".friend").length != 0
										&& $.find(".friend").length % 10 == 0) {
									FriendRefresh(1, $.find(".friend").length);
									return;
								} else if (Status == 0
										&& $.find(".friend").length % 10 != 0) {
									FriendRefresh(1,
											$.find(".friend").length + 1);
									return;
								} else if (Status == 0
										&& $.find(".friend").length == 0) {
									FriendRefresh(1, 10);
									return;
								} else if (Status == 1) {
									FriendRefresh(1, 10);
								}
							} else if (data == 0) {
								alert('이미 팔로윙중인 사람입니다');
							}
						},
						fail : function() {
							alert('팔로우 : 데이터 통신 실패');
						},
						error : function(event) {
							alert('팔로우 : 시스템 오류');
							console.log("팔로우 이벤트ㄱ");
							console.log(event);
						}
					});
		};

		//팔로윙 해제 함수
		var NoFollowing = function(parent, F_phone) {
			$
					.ajax({
						url : "friend/noFollowing",
						data : {
							u_phone : "${sid}",
							f_phone : F_phone
						},
						success : function(data) {
							if (data == 1) {
								//친구 목록 갱신	
								parent.remove();
								//팔로윙 카운트 감소
								var followingCount = Number($("#followingCount")
										.text());
								$("#followingCount").text(followingCount - 1);
								HumanRefresh();
								FriendRefresh(1, $.find(".friend").length);

							} else if (data == 0) {
								alert('이미 팔로윙 해제된 사람입니다');
							}

						},
						fail : function() {
							alert('팔로윙 해제 : 데이터 통신 실패');
						},
						error : function() {
							alert('팔로윙 해제 : 시스템 오류');
							console.log("팔로윙 해제 이벤트ㄱ");
							console.log(event);
						}

					});
		};

		//친구목록 새로고침 함수
		var FriendRefresh = function(start, end) {
			$
					.getJSON(
							"friend/friendRefresh",
							{
								startNum : start,
								endNum : end
							},
							function(data) {
								//친구 목록 새로고침								
								$("#friendList").empty("");
								$
										.each(
												data,
												function(index, item) {
													$("#friendList")
															.append(
																	"<div class='friend' id='"+item.phone+"'>"
																			+ "<a href='friend/friendPage?id="
																			+ item.phone
																			+ "' data-toggle='tooltip' title='"
																			+ item.name
																			+ "님 페이지 이동!'>"
																			+ "<img src='resources/UPLOADIMG/"+item.image+"' class='profile'></a>"
																			+ "<div class='dropdown'>"
																			+ "<strong>"
																			+ item.name
																			+ "</strong> "
																			+ "<button class='btn btn-success dropdown-toggle' type='button' data-toggle='dropdown'>"
																			+ "<span class='caret'></span></button>"
																			+ "<ul class='dropdown-menu' id='"+item.phone+"'>"
																			+ "<li class='disabled'><a href='#'>준비중인 기능</a></li>"
																			+ "<li><a href='friend/friendPage?id="
																			+ item.phone
																			+ "' class='friendPage'>친구페이지 이동</a></li>"
																			+ "<li class='divider'></li>"
																			+ "<li><a class='noFollowing'>팔로우 해제 <span class='glyphicon glyphicon-remove'></span></a></li></ul></div>");
												});
								var totalCount = $("#followingCount").text();
								if (totalCount - $.find(".friend").length > 0) {
									$("#friendList")
											.append(
													"<button type='button' class='btn btn-danger' id='"
															+ ($
																	.find(".friend").length / 10 + 1)
															+ "'"
															+ "style='position: relative;'>더보기</button>");
									return;
								}

							});
			Status = 0;
		}

		//추천목록 새로고침 함수
		var HumanRefresh = function() {
			$
					.getJSON(
							"friend/humanRefresh",
							function(data) {
								//알수도 있는 사람 목록 새로고침	
								$("#humanList").empty("");
								$
										.each(
												data,
												function(index, item) {
													var image = item.image;
													if (image != null) {
														$("#humanList")
																.append(
																		"<div class='human'>"
																				+ "<a href='friend/friendPage?id="
																				+ item.phone
																				+ "' data-toggle='tooltip' title='"
																				+ item.name
																				+ "님 페이지 이동!'>"
																				+ "<img src='resources/UPLOADIMG/"+item.image+"' class='profile'></a>"
																				+ "<strong>"
																				+ item.name
																				+ "</strong><br>"
																				+ "<button type='button' class='btn btn-info' id='"+item.phone+"' style='margin-top: 10px;'>팔로우 <span class='glyphicon glyphicon-plus'></span></button></div>");
													} else {
														$("#humanList")
																.append(
																		"<div class='human'>"
																				+ "<a href='friend/friendPage?id="
																				+ item.phone
																				+ "' data-toggle='tooltip' title='"
																				+ item.name
																				+ "님 페이지 이동!'>"
																				+ "<img src='resources/IMAGE/noImages.png' class='profile'></a>"
																				+ "<strong>"
																				+ item.name
																				+ "</strong><br>"
																				+ "<button type='button' class='btn btn-info' id='"+item.phone+"' style='margin-top: 10px;''>팔로우 <span class='glyphicon glyphicon-plus'></span></button></div>");
													}
												});
							});
		}

		//팔로워 목록 새로고침 함수
		var FollowerRefresh = function(start, end) {
			$
					.getJSON(
							"friend/followerRefresh",
							{
								startNum : start,
								endNum : end
							},
							function(data) {
								//팔로워 목록 새로고침	
								$("#friendList").empty();
								$
										.each(
												data,
												function(index, item) {
													$("#friendList")
															.append(
																	"<div class='follower' id='"+item.phone+"'>"
																			+ "<a href='friend/friendPage?id="
																			+ item.phone
																			+ "' data-toggle='tooltip' title='"
																			+ item.name
																			+ "님 페이지 이동!'>"
																			+ "<img src='resources/UPLOADIMG/"+item.image+"' class='profile'></a>"
																			+ "<div class='dropdown'>"
																			+ "<strong>"
																			+ item.name
																			+ "</strong><br>"
																			+ "<button type='button' class='btn btn-info' id='"+item.phone+"' style='margin-top: 10px;''>팔로우 <span class='glyphicon glyphicon-plus'></span></button></div></div>");
												});
								var totalCount = $("#followerCount").text();
								if (totalCount - $.find(".follower").length > 0) {
									$("#friendList")
											.append(
													"<button type='button' class='btn btn-danger' id='"
															+ ($
																	.find(".friend").length / 10 + 1)
															+ "'"
															+ "style='position: relative;'>더보기</button>");
									return;
								}

							});
		}

		//내가 팔로우한 사람 클릭한 경우	
		$("#following").click(function() {
			if (Status == 1) {

				//버튼 활성화 변경
				$(this).attr("class", "btn btn-primary");
				$("#follower").attr("class", "btn btn-default");

				FriendRefresh(1, 10);
			}
			Status = 0;
		});

		//팔로우버튼 클릭한경우(새로고침)
		$("#humanList").on('click', 'button.btn-info', function() {
			var parent = $(this).parent();
			var F_phone = $(this).attr("id");

			$("#following").attr("class", "btn btn-primary");
			$("#follower").attr("class", "btn btn-default");

			Following(parent, F_phone);
		});

		//나를 팔로우 한사람 => 팔로우 클릭한경우(새로고침)
		$("#friendList").on('click', 'button.btn-info', function() {
			var parent = $(this).parent();
			var F_phone = $(this).attr("id");

			$.ajax({
				url : "friend/followingCheck",
				data : {
					u_phone : "${sid}",
					f_phone : F_phone
				},
				success : function(data) {
					if (data == 1) {
						alert('이미 팔로윙중인 사람입니다');
						Status = 1;
					} else if (data == 0) {
						Following(parent, F_phone);
						$("#following").attr("class", "btn btn-primary");
						$("#follower").attr("class", "btn btn-default");
						Status = 0;
					}
				},
				fail : function() {
					alert('팔로윙 추가 : 데이터 통신 실패');
				},
				error : function() {
					alert('팔로윙 추가 : 시스템 오류');
					console.log("팔로윙 추가 이벤트ㄱ");
					console.log(event);
				}
			});

		});

		//팔로우 해제 클릭한경우(새로고침)
		$("#friendList").on('click', 'button.btn-success', function() {
			$('.dropdown-toggle').dropdown();
			$(".noFollowing").click(function() {
				var parent = $(this).parent().parent().parent().parent();
				var F_phone = $(this).parent().parent().attr("id");

				NoFollowing(parent, F_phone);
			});
		});

		//나를 팔로우한 사람 클릭한 경우(새로고침)
		$(".btn-group").on('click', "#follower", function() {
			if (Status == 0) {
				//버튼 활성화 변경
				$(this).attr("class", "btn btn-primary");
				$("#following").attr("class", "btn btn-default");

				FollowerRefresh(1, 10);
			}
			Status = 1;
		});

		//검색어 자동완성	
		$("#search_key").autocomplete(
				{
					source : function(request, response) {
						$.ajax({
							url : "friend/autoComplete",
							dataType : "json",
							type : "get",
							data : request,
							success : function(data) {
								response($.map(data, function(item, index) {
									return {
										"label" : item.name,
										"value" : item.phone,
										"nick" : item.nick,
										"age" : item.age,
										"img" : item.image,
										"id" : item.phone,
										"idx" : index
									}
								}));
							},
							error : function(status, error) {
								console.log(status);
								console.log(error);
							}
						});
					},
					width : 1000,
					delay : 100,
					scroll : true,
					autoFocus : true,
					minLength : 2,
					select : function(event, ui) {
						console.log(ui);
						if (ui.item.id != "") {
							location.href = "friend/friendPage?id="
									+ ui.item.id;
						} else if (ui.item.id == "") {
							location.href = "friend/friendSearch?keyword="
									+ $("#search_key").val();
						}
					}
				}).autocomplete("instance")._renderItem = function(ul, item) {
			if (item.idx <= 6) {
				return $("<li>")
						.append(
								"<div style='height : 60px; padding:5px;'><img src='resources/UPLOADIMG/"+item.img+"' style='width:50px; height:50px; float:left;'>"
										+ item.label
										+ "<br>"
										+ item.age
										+ " 세"
										+ "<div></li>").appendTo(ul);
			} else if (item.idx == 7) {
				item.age = "";
				item.id = "";
				item.img = "";
				item.label = "";
				item.nick = "";
				item.value = "";
				return $(
						"<li><div style='text-align:center;'><button type='button' class='btn btn-warning'>검색결과 전체보기</button></div></li>")
						.appendTo(ul);
			} else if (item.idx > 7) {
				return ul;
			}

		};

		//친구 더보기 클릭한 경우
		$("#friendList")
				.on(
						'click',
						'button.btn-danger',
						function() {
							if (Status == 0) {
								$(this).remove();
								$
										.getJSON(
												"friend/moreFriendList",
												{
													nowCount : $
															.find(".friend").length
												},
												function(data) {
													$
															.each(
																	data,
																	function(
																			index,
																			item) {
																		var image = item.image;
																		$(
																				"#friendList")
																				.append(
																						"<div class='friend' id='"+item.phone+"'>"
																								+ "<a href='friend/friendPage?id="
																								+ item.phone
																								+ "' data-toggle='tooltip' title='"
																								+ item.name
																								+ "님 페이지 이동!'>"
																								+ "<img src='resources/UPLOADIMG/"+item.image+"' class='profile'></a>"
																								+ "<div class='dropdown'>"
																								+ "<strong>"
																								+ item.name
																								+ "</strong> "
																								+ "<button class='btn btn-success dropdown-toggle' type='button' data-toggle='dropdown'>"
																								+ "<span class='caret'></span></button>"
																								+ "<ul class='dropdown-menu' id='"+item.phone+"'>"
																								+ "<li class='disabled'><a href='#'>준비중인 기능</a></li>"
																								+ "<li><a href='friend/friendPage?id="
																								+ item.phone
																								+ "' class='friendPage'>친구페이지 이동</a></li>"
																								+ "<li class='divider'></li>"
																								+ "<li><a class='noFollowing'>팔로우 해제 <span class='glyphicon glyphicon-remove'></span></a></li></ul></div>");

																		var totalCount = $(
																				"#followingCount")
																				.text();
																		if (index != 0
																				&& index == 9
																				&& totalCount
																						- $
																								.find(".friend").length > 1) {
																			$(
																					"#friendList")
																					.append(
																							"<button type='button' class='btn btn-danger' id='"
																									+ ($
																											.find(".friend").length / 10 + 1)
																									+ "'"
																									+ "style='position: relative;'>더보기</button>");
																			return;
																		}

																	})

												});

							} else if (Status == 1) {
								$(this).remove();
								$
										.getJSON(
												"friend/moreFollowerList",
												{
													nowCount : ($
															.find(".friend").length) / 10 + 1
												},
												function(data) {
													$
															.each(
																	data,
																	function(
																			index,
																			item) {
																		var image = item.image;
																		if (image != null) {
																			$(
																					"#friendList")
																					.append(
																							"<div class='follower' id='"+item.phone+"'>"
																									+ "<a href='friend/friendPage?id="
																									+ item.phone
																									+ "' data-toggle='tooltip' title='"
																									+ item.name
																									+ "님 페이지 이동!'>"
																									+ "<img src='resources/UPLOADIMG/"+item.image+"' class='profile'></a>"
																									+ "<div class='dropdown'>"
																									+ "<strong>"
																									+ item.name
																									+ "</strong><br>"
																									+ "<button type='button' class='btn btn-info' id='"+item.phone+"' style='margin-top: 10px;''>팔로우 <span class='glyphicon glyphicon-plus'></span></button></div></div>");
																		} else {
																			$(
																					"#friendList")
																					.append(
																							"<div class='follower' id='"+item.phone+"'>"
																									+ "<a href='friend/friendPage?id="
																									+ item.phone
																									+ "' data-toggle='tooltip' title='"
																									+ item.name
																									+ "님 페이지 이동!'>"
																									+ "<img src='resources/IMAGE/noImages.png' class='profile'></a>"
																									+ "<div class='dropdown'>"
																									+ "<strong>"
																									+ item.name
																									+ "</strong><br>"
																									+ "<button type='button' class='btn btn-info' id='"+item.phone+"' style='margin-top: 10px;''>팔로우 <span class='glyphicon glyphicon-plus'></span></button></div></div>");
																		}
																		var totalCount = $(
																				"#followerCount")
																				.text();
																		if (index != 0
																				&& index == 9
																				&& totalCount
																						- $
																								.find(".friend").length > 1) {
																			$(
																					"#friendList")
																					.append(
																							"<button type='button' class='btn btn-danger' id='"
																									+ ($
																											.find(".friend").length / 10 + 1)
																									+ "'"
																									+ "style='position: relative;'>더보기</button>");
																		}

																		return;
																	})

												});
							}

						});

		//친구 찾기를 클릭한 경우
		$("#friendSearch").click(
				function() {
					if ($("#search_key").val() == "") {
						$("#msg").show();
						$("#msg").delay(3000).fadeOut();
						return false;
					}
					location.href = "friend/friendSearch?keyword="
							+ $("#search_key").val();
				});

		//알수도 있는사람 - 전체보기 클릭 한 경우
		$("#humanTotal").click(function() {
			location.href = "friend/friendFind";
		});

	});//레디 function END
</script>
</head>
<body>

	<div class="well well-sm">
		<strong>알수도 있는 사람</strong>
		<button class="btn btn-link" style="margin-left: 16px;"
			id="humanTotal">전체 보기</button>
	</div>
	<div id="humanList">
		<c:forEach items="${humanList}" var="hList">
			<div class='human'>
				<a href="friend/friendPage?id=${hList.phone}" data-toggle="tooltip"
					title="${hList.name}님 페이지 이동!"><img
					src='resources/UPLOADIMG/${hList.image}' class='profile'></a> <strong>${hList.name}</strong><br>
				<button type="button" class="btn btn-info" id='${hList.phone}'
					style="margin-top: 10px;">
					팔로우 <span class="glyphicon glyphicon-plus"></span>
				</button>
			</div>
		</c:forEach>
	</div>
	<br>
	<h3 class="glyphicon glyphicon-user" style="margin-left: 450px;">친구</h3>
	<div class="alert alert-danger" id="msg">
		<strong>확인!</strong> 검색어를 입력해주세요
	</div>
	<br>
	<div class="btn-group">
		<button type="button" class="btn btn-primary" id="following">
			팔로우 수 <span class="badge" id="followingCount">${followingCount}</span>
		</button>
		<button type="button" class="btn btn-default" id="follower">
			팔로워 수 <span class="badge" id="followerCount">${followerCount}</span>
		</button>
	</div>

	<div class="input-group">
		<input type="text" class="form-control" name="q"
			placeholder="Name or Phone" id="search_key"
			style="width: 200px; font-size: 14px;"> <span
			class="input-group-btn" style="float: left;">
			<button class="btn btn-warning" id="friendSearch">
				친구찾기 <span class="glyphicon glyphicon-search"></span>
			</button>
		</span>
	</div>

	<div id="friendList">
		<c:forEach items="${friendList}" var="fList">
			<div class='friend' id='${fList.phone}'>
				<c:choose>
					<c:when test="${fList.image == null}">
						<a href="friend/friendPage?id=${fList.phone}"
							data-toggle="tooltip" title="${fList.name}님 페이지 이동!"><img
							src='resources/IMAGE/noImages.png' class='profile'></a>
					</c:when>
					<c:otherwise>
						<a href="friend/friendPage?id=${fList.phone}"
							data-toggle="tooltip" title="${fList.name}님 페이지 이동!"><img
							src='resources/UPLOADIMG/${fList.image}' class='profile'></a>
					</c:otherwise>
				</c:choose>
				<div class='dropdown'>
					<Strong>${fList.name}</Strong>
					<button class='btn btn-success dropdown-toggle' type='button'
						data-toggle='dropdown'>
						<span class='caret'></span>
					</button>
					<ul class='dropdown-menu' id='${fList.phone}'>
						<li class='disabled'><a href='#'>준비중인 기능</a></li>
						<li><a href='friend/friendPage?id=${fList.phone}'
							class='friendPage'>친구페이지 이동</a></li>
						<li class='divider'></li>
						<li><a class='noFollowing'>팔로우 해제 <span
								class='glyphicon glyphicon-remove'></span></a></li>
					</ul>
				</div>
			</div>
		</c:forEach>
		<c:forEach items="${friendList}" var="list" varStatus="idx">
			<c:if test="${idx.last}">
				<c:if test="${followingCount-idx.count>0 && idx.count == 10}">
					<button type='button' class='btn btn-danger' id='2'
						style='position: relative; margin-top: 120px;'>더보기</button>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>