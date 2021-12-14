<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Dashboard</title>
</head>
<body>
	<div class="container mt-5">
		<h1>Book Club</h1>
		<h5>Welcome, ${userName }</h5>
		<a href="/books/add">+ Add a Book to the Shelf</a>
		<table class="table table-striped">
			<tr>
				<th>Title</th>
				<th>Language</th>
				<th>Pages</th>
				<th>Posted By</th>
			</tr>
			<c:forEach var="book" items="${books }">
				<tr>
					<td><a href="/books/${book.id }">${book.title }</a></td>
					<td>${book.language }</td>
					<td>${book.numberOfPages }</td>
					<td>${book.user.userName }</td>
				</tr>
			</c:forEach>

		</table>



		<a href="/logout">Logout</a>
	</div>
</body>
</html>