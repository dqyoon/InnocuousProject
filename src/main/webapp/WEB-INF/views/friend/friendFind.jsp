<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="/resources/HEADER/header2.jsp"></c:import>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
#TOP5 {
	width: 250px;
	margin-left: 920px;
	float: right;
	margin-top: -20px;
	position: fixed;
}

.btn-group-vertical {
	margin-left: 920px;
	margin-top: 20px;
	position: fixed;
}

.btn-link {
	text-align: left;
}

#friendDetailSearch {
	width: 250px;
	margin-left: 920px;
	margin-top: 350px;
	position: fixed;
}

.panel-info {
	margin-top: 80px;
	width: 500px;
	margin-left: 400px;
}

.btn-info {
	float: right;
}

.dropdown {
	float: right;
}

img {
	margin-right: 10px;
	marign-left: 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		//팔로우 버튼 클릭한 경우
		$(".btn-info")
				.click(
						function() {
							var SID = "${sid}";
							var ID = $(this).attr("id");
							var PARENT = $(this).parent();
							var my = $(this);
							
							
							$.ajax({
								url : "followingCheck",
								data : {
									u_phone : SID,
									f_phone : ID
								}, 
								success : function(data){
									if(data == 1) {
										alert('이미 팔로우한 사람입니다');
										return
									} else if(data == 0) {
										$
										.ajax({
											url : "following",
											data : {
												u_phone : SID,
												f_phone : ID
											},
											success : function(data) {
												if (data == 1) {
													PARENT
															.append("<div class='dropdown'>"
																	+ "<button class='btn btn-success dropdown-toggle' type='button' data-toggle='dropdown'>"
																	+ "<span class='caret'></span></button>"
																	+ "<ul class='dropdown-menu' id='"+ID+"'>"
																	+ "<li class='disabled'><a href='#'>준비중인 기능</a></li>"
																	+ "<li><a href='friendPage?id="
																	+ ID
																	+ "' class='friendPage'>친구페이지 이동</a></li>"
																	+ "<li class='divider'></li>"
																	+ "<li><a class='noFollowing'>팔로우 해제 <span class='glyphicon glyphicon-remove'></span></a></li>"
																	+ "</ul></div>");
													my.remove();
												}
											},
											fail : function() {
												alert('팔로우 : 데이터 통신 실패');
											},
											error : function() {
												alert('팔로우 : 시스템 오류');
												console.log("팔로우 이벤트ㄱ");
												console.log(event);
											}
										});
									}
									
								},fail : function() {
									alert('팔로윙 : 데이터 통신 실패');
								},
								error : function() {
									alert('팔로윙 : 시스템 오류');
									console.log("팔로윙 이벤트ㄱ");
									console.log(event);
								}
							});							
						});

		//알수도 있는 사람 더보기 클릭한 경우
		$("#HUMANLIST")
				.on(
						'click',
						'ul.pager',
						function() {
							$(this).remove();
							$
									.getJSON(
											"friendMoreFind",
											{
												startNum : $
														.find(".panel-body").length
											},
											function(data) {
												$
														.each(
																data,
																function(index,
																		item) {
																	if (item.love != null) {
																		$(
																				".panel-info")
																				.append(
																						"<div class='panel-body'>"
																								+ "<a href='friendPage?id="
																								+ item.phone
																								+ "' data-toggle='tooltip' title='"
																								+ item.name
																								+ "님 페이지 이동!'>"
																								+ "<img src='../resources/UPLOADIMG/"+item.image+"' width='80px;' height='80px;' style='float: left;'>"
																								+ "</a> "
																								+ item.name
																								+ " ("
																								+ item.nick
																								+ ")"
																								+ "<br>"
																								+ item.age
																								+ " 세 / "
																								+ item.gender
																								+ "<br>"
																								+ item.love
																								+ "<button type='button' class='btn btn-info' id='"+item.phone+"'>"
																								+ " 팔로우 <span class='glyphicon glyphicon-plus'></span></button>");
																		var totalCount = "${humanTotalCount}";
																		if (index == 19
																				&& totalCount
																						- $
																								.find(".panel-body").length > 0) {
																			$(
																					".panel-info")
																					.append(
																							"<ul class='pager'><li><a>알수도 있는 사람 더보기</a></li></ul>");
																		}
																	} else if (item.love == null) {
																		$(
																				".panel-info")
																				.append(
																						"<div class='panel-body'>"
																								+ "<a href='friendPage?id="
																								+ item.phone
																								+ "' data-toggle='tooltip' title='"
																								+ item.name
																								+ "님 페이지 이동!'>"
																								+ "<img src='../resources/UPLOADIMG/"+item.image+"' width='80px;' height='80px;' style='float: left;'>"
																								+ "</a> "
																								+ item.name
																								+ " ("
																								+ item.nick
																								+ ")"
																								+ "<br>"
																								+ item.age
																								+ " 세 / "
																								+ item.gender
																								+ "<br>"
																								+ "<button type='button' class='btn btn-info' id='"+item.phone+"'>"
																								+ " 팔로우 <span class='glyphicon glyphicon-plus'></span></button>");
																		var totalCount = "${humanTotalCount}";
																		if (index == 19
																				&& totalCount
																						- $
																								.find(".panel-body").length > 0) {
																			$(
																					".panel-info")
																					.append(
																							"<ul class='pager'><li><a>알수도 있는 사람 더보기</a></li></ul>");
																		}
																	}

																});
											});
						});

		//팔로워TOP5 클릭한 경우
		$(".btn-link").click(function() {
			location.href = "friendPage?id=" + $(this).attr("id");
		})

		//팔로우 해제 클릭한 경우
		$("#HUMANLIST")
				.on(
						'click',
						'button.btn-success',
						function() {
							$('.dropdown-toggle').dropdown();
							$(".noFollowing")
									.click(
											function() {
												var SID = "${sid}";
												var PARENT = $(this).parent().parent();
												var ID = PARENT.attr("id");
												var my = $(this);
												$
														.ajax({
															url : "noFollowing",
															data : {
																u_phone : SID,
																f_phone : ID
															},
															success : function(
																	data) {
																if (data == 1) {
																	PARENT.parent().parent().append(
																					"<button type='button' class='btn btn-info' id='"+ID+"'>"
																							+ "팔로우 <span class='glyphicon glyphicon-plus'></span></button>");
																	PARENT.parent().remove();
																} else if (data == 0) {
																	alert('이미 팔로윙 해제된 사람입니다');
																}
															},
															fail : function() {
																alert('팔로우 해제 : 데이터 통신 실패');
															},
															error : function() {
																alert('팔로우 해제 : 시스템 오류');
																console
																		.log("팔로우 해제 이벤트ㄱ");
																console
																		.log(event);
															}
														});

											});
						});
	});
</script>
<body>
	<div class="well well-sm" id="TOP5">
		<strong>팔로워 TOP5</strong>
	</div>
	<div class="btn-group-vertical">
		<c:forEach items="${followerTop5}" var="top5" varStatus="idx">
			<c:choose>
				<c:when test="${top5.nick == null}">
					<button type="button" class="btn btn-link" id="${top5.phone}">
						${idx.count}. <img src='../resources/UPLOADIMG/${top5.image}'
							width="50px;" height="50px;"> <strong>${top5.name}</strong>
						<span class="badge"> ${top5.fcount} </span>
					</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-link" id="${top5.phone}">
						${idx.count}. <img src='../resources/UPLOADIMG/${top5.image}'
							width="50px;" height="50px;"> <strong>${top5.name}
							(${top5.nick})</strong> <span class="badge"> ${top5.fcount} </span>
					</button>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>

	<!-- <div class="well well-sm" id="friendDetailSearch">
		<strong>친구 상세 검색</strong>
	</div> -->
	<div class="panel panel-info" id="HUMANLIST">
		<div class="panel-heading">
			알수도 있는 사람 <span class="badge"> ${humanTotalCount} 명 </span>
		</div>
		<c:forEach items="${humanList}" var="hList" varStatus="idx">
			<c:choose>
				<c:when test="${hList.love != null}">
					<div class="panel-body">
						<a href="friendPage?id=${hList.phone}" data-toggle="tooltip"
							title="${hList.name}님 페이지 이동!"><img
							src="../resources/UPLOADIMG/${hList.image}" width="80px;"
							height="80px;" style="float: left;"></a> ${hList.name}
						(${hList.nick}) <br> ${hList.age} 세 / ${hList.gender} <br>
						${hList.love}
						<button type="button" class="btn btn-info" id="${hList.phone}">
							팔로우 <span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="panel-body">
						<a href="friendPage?id=${hList.phone}" data-toggle="tooltip"
							title="${hList.name}님 페이지 이동!"><img
							src="../resources/UPLOADIMG/${hList.image}" width="80px;"
							height="80px;" style="float: left;"></a> ${hList.name}
						(${hList.nick}) <br> ${hList.age} 세 / ${hList.gender} <br>
						<button type="button" class="btn btn-info" id="${hList.phone}">
							팔로우 <span class="glyphicon glyphicon-plus"></span>
						</button>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${humanTotalCount - 20>0}">
			<ul class="pager">
				<li><a>알수도 있는 사람 더보기</a></li>
			</ul>
		</c:if>
	</div>
</body>
</html>