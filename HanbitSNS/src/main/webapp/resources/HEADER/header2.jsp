<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
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

.gnb_li_mypage {
	padding-left: 32px;
	margin-top: -30px;
	margin-right: 77px;
}

.gnb_li_friend {
	margin-top: -30px;
	margin-right: 110px;
}

.gnb__li_logo {
	margin-left: 27px;
	margin-top: 10px;
}

.gnb_color {
	margin-left: 610px;
	margin-top: -46px;
}

span[class^=gnb] {
	cursor: pointer
}
</style>
<script type="text/javascript">
	$(function() {
		//칼라 정렬 클릭시(페이지 새로고침 필요)
		$("span[class^=gnb]").click(function() {
			$.ajax({
				url : 'http://127.0.0.1:8000/mysns/board/colorSorting',
				data : {
					color : $(this).attr("class").substr(4)
				},
				success : function(data) {
					console.log(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="affix">
		<ul class="gnb_list">
			<li class="gnb__li_logo"><a
				href="http://localhost:8000/mysns/board/boardcontent"><img
					src="http://localhost:8000/mysns/resources/gnb_image/logo01.png"
					style="height: 40px;"></a></li>
			<li class="gnb_li_mypage" style="float: right;"><a
				href="http://localhost:8000/mysns/user/profile"><img
					src="http://localhost:8000/mysns/resources/gnb_image/gnb_mypage01.png"
					style="height: 20px;"></a></li>
			<li class="gnb_li_friend" style="float: right;"><a
				href="http://localhost:8000/mysns/friend"><img
					src="http://localhost:8000/mysns/resources/gnb_image/gnb_friend01.png"
					style="height: 20px;"></a></li>
		</ul>
		<div class="gnb_color">
			<span class="gnb_red"><img
				src="http://localhost:8000/mysns/resources/gnb_image/red.png"></span>
			<span class="gnb_orange"><img
				src="http://localhost:8000/mysns/resources/gnb_image/orange.png"></span>
			<span class="gnb_yellow"><img
				src="http://localhost:8000/mysns/resources/gnb_image/yellow.png"></span>
			<span class="gnb_green"><img
				src="http://localhost:8000/mysns/resources/gnb_image/green.png"></span>
			<span class="gnb_eme-green"><img
				src="http://localhost:8000/mysns/resources/gnb_image/eme-green.png"></span>
			<span class="gnb_skyblue"><img
				src="http://localhost:8000/mysns/resources/gnb_image/skyblue.png"></span>
			<span class="gnb_blue"><img
				src="http://localhost:8000/mysns/resources/gnb_image/blue.png"></span><span
				class="gnb_pp"><img
				src="http://localhost:8000/mysns/resources/gnb_image/pp.png"></span><span
				class="gnb_white"><img
				src="http://localhost:8000/mysns/resources/gnb_image/white.png"></span>
			<span class="gnb_black"><img
				src="http://localhost:8000/mysns/resources/gnb_image/black.png"></span>
		</div>
	</div>
</body>
</html>