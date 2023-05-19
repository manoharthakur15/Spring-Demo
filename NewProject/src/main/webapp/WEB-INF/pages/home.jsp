<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

</head>
<body>
	<div class="button">
		<a href="<c:url value='/logout' />" class="btn btn-outline-success">Logout</a>
	</div>
	<div class="container mt-3">

		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center mb-3">Student List</h1>
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">id</th>
							<th scope="col">First name</th>
							<th scope="col">Last name</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${students}" var="s">
							<tr>
								<th scope="row">${s.id}</th>
								<td>${s.fname}</td>
								<td>${s.lname}</td>
								<td><a href="delete/${s.id}"><i
										class="fa-regular fa-trash-can text-danger"></i></a> <a
									href="update/${s.id}"><i
										class="fa-regular fa-pen-to-square"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="container text-center">
					<a href="add-student" class="btn btn-outline-success">Add
						Student</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>