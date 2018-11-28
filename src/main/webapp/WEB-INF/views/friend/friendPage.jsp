<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){		
	});
</script>
</head>
<body>
	<h1>친구페이지 입니다.</h1>
	<table>
		<tr>
			<th>폰번호</th>
			<th>이름</th>
			<th>별명</th>
			<th>성별</th>
			<th>나이</th>
			<th>주소</th>
			<th>이미지</th>
			<th>연애상태</th>
			<th>팔로우 수</th>
			<th>팔로워 수</th>
			<th>게시물 수</th>
		</tr>
		<tr>
			<td>${profile.phone}</td>
			<td>${profile.name}</td>
			<td>${profile.nick}</td>
			<td>${profile.gender}</td>
			<td>${profile.age}</td>
			<td>${profile.address}</td>
			<td>${profile.image}</td>
			<td>${profile.love}</td>
			<td>${followCount}</td>
			<td>${followerCount}</td>
			<td>${boardCount}</td>
		</tr>
	</table>
</body>
</html>