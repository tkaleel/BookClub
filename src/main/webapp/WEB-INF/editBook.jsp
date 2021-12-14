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
<title>Edit Book</title>
</head>
<body>
	<div class="container mt-5">
		<form:form action="/books/${book.id }/edit" method="post" modelAttribute="book"
			class="form-control">
			<input type="hidden" name="_method" value="put" />

			<div>
				<form:label path="title" class="form-label">Title</form:label>
				<form:input path="title" type="text" class="form-control" />
				<form:errors path="title" class="text-danger" />
			</div>
			<div>
				<form:label path="description" class="form-label">Description</form:label>
				<form:input path="description" type="text" class="form-control" />
				<form:errors path="description" class="text-danger" />
			</div>
			<div>
				<form:label path="language" class="form-label">Language</form:label>
				<form:input path="language" type="text" class="form-control" />
				<form:errors path="language" class="text-danger" />
			</div>
			<div>
				<form:label path="numberOfPages" class="form-label">Number of Pages</form:label>
				<form:input path="numberOfPages" type="text" class="form-control" />
				<form:errors path="numberOfPages" class="text-danger" />
			</div>
			<button class="btn btn-primary">Re-Shelve</button>
		</form:form>



	</div>

</body>
</html>