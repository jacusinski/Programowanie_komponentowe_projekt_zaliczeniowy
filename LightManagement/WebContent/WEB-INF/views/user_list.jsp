<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User manager</title>
</head>
<style><%@include file="/WEB-INF/css/style.css"%></style>
<body>
<div align="center">
		<h1>Users list</h1>
		<h3><a href="new_user">New user</a></h3>	
		
		<table border="1" cellpadding="5" class="darkTable">
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Description</th>
				<th>Status</th>	
				<th>Login</th>		
			</tr>
			
			<c:forEach items="${listUser}" var="user" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${user.userName}</td>
				<td>${user.userDescription}</td>
				<td>${user.userStatus}</td>		
				<td>${user.userLogin}</td>		
				<td>
					<a href="edit_user?userId=${user.userId}">Edit</a>
					&nbsp;&nbsp;&nbsp;
					<a href="delete_user?userId=${user.userId}">Delete</a>
				</td>		
			</tr>
			</c:forEach>
		</table>
		
		
	</div>
</body>
</html>