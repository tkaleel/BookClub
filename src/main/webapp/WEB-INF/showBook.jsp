<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Book Detail</title>
</head>
<body>
<div class="container mt-5">
	<h1><c:out value="${book.title }"></c:out></h1>
	<h3><c:out value="${book.description }"></c:out></h3>
	<p>Language: <c:out value="${book.language }"></c:out></p>
	<p><c:out value="${book.numberOfPages }"></c:out> pages</p>

	<form action="/books/${book.id }/edit" method="get">
		<input type="submit" class="btn-sm btn-primary" value="Edit">
	</form>
	<form action="/books/${book.id}" method="post">
		<input type="hidden" name="_method" value="delete"> <input
			type="submit" class="btn-sm btn-danger" value="Delete">
	</form>
</div>
</body>
</html>