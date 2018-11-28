<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	[헤더]
	<br>
	<c:choose>
		<c:when test="${searchList != null}">
			<div class="alert alert-success">
				<strong>오! </strong>${searchCount} 명의 친구를 찾았습니다.
			</div>
			<c:forEach items="${searchList}" var="list">
			${list.name}			
			</c:forEach>
		</c:when>
		<c:otherwise>
			<div class="alert alert-danger">
				<strong>이런!</strong> 검색 결과가 없습니다.
			</div>
		</c:otherwise>
	</c:choose>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br> {우측 사이드바} 친구 검색 조건




</body>
</html>