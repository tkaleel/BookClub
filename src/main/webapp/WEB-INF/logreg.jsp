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
<title>Login & Registration</title>
</head>
<body>
	<div class="row justify-content-md-center m-5">
	<h1>Welcome to the Book Club!</h1>
		<div class="container col-md">
	
		<form:form action="/register" method="post" modelAttribute="newUser">
			<div class="form-group">
				<h3>Register New Book Club Member</h3>
				<label>User Name:</label>
				<form:input path="userName" class="form-control" />
				<form:errors path="userName" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Email:</label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Password:</label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Confirm Password:</label>
				<form:password path="confirm" class="form-control" />
				<form:errors path="confirm" class="text-danger" />
			</div>
			<input type="submit" value="Register" class="btn btn-primary" />
		</form:form>
		</div>
		<div class="container col-md">
		<form:form action="/login" method="post" modelAttribute="newLogin">
			<div class="form-group">
				<h3>Already Have An Account? Login Here!</h3>
				<label>Email:</label>
				<form:input path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>
			<div class="form-group">
				<label>Password:</label>
				<form:password path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<input type="submit" value="Login" class="btn btn-success" />
		</form:form>
		</div>

	</div>
</body>
</html>