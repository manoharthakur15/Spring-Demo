<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
</head>
<body>
	<div class="button">
		<a href="<c:url value='/logout' />" class="btn btn-outline-success">Logout</a>
	</div>
	<div class="col-md-6 offset-md-3">
		<h1 class="text-center mb-3">Change Student Details</h1>
		<form class="container mt-3"
			action="${pageContext.request.contextPath }/handle-student"
			method="post">

			<input type="hidden" class="form-control" value="${student.id }"
				name="id" /><br>
			<div class="col">
				<input type="text" class="form-control" name="fname"
					placeholder="First name" value="${student.fname }">
			</div>
			<br>
			<div class="col">
				<input type="text" class="form-control" name="lname"
					placeholder="Last name" value="${student.lname }">
			</div>
			<div class="container mt-5 text-center">
				<a href="${pageContext.request.contextPath }/"
					class="btn btn-outline-danger">Home</a>
				<button class="btn btn-primary" type="submit">Update</button>
			</div>
		</form>
	</div>
</body>
</html>