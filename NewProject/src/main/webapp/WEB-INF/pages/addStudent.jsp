<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page isELIgnored="false"%>

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
		<h1 class="text-center mb-3">Add Student Details</h1>

		<form:form class="container mt-3" action="handle-student"
			method="post" modelAttribute="student">
			<div class="col">
				<form:input class="form-control" path="fname"
					placeholder="First name" />
				<form:errors class="error" path="fname"></form:errors>
			</div>
			<br>
			<div class="col">
				<form:input class="form-control" path="lname"
					placeholder="Last name" />
				<form:errors class="error" path="lname"></form:errors>
			</div>
			<div class="container mt-5 text-center">
				<a href="${pageContext.request.contextPath }/"
					class="btn btn-outline-danger">Back</a>
				<button class="btn btn-primary" type="submit">Add</button>
			</div>
		</form:form>

	</div>
</body>
</html>