<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Room manager</title>
</head>
<body>
<div align="center">
		<h1>Room List</h1>
		<h3><a href="new">New room</a></h3>
		
		<table border="1" cellpadding="5">
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Description</th>
				<th>Status</th>				
			</tr>
			
			<c:forEach items="${listRoom}" var="room" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${room.roomName}</td>
				<td>${room.roomDescription}</td>
				<td>${room.roomStatus}</td>		
				<td>
					<a href="edit?roomId=${room.roomId}">Edit</a>
					&nbsp;&nbsp;&nbsp;
					<a href="delete?roomId=${room.roomId}">Delete</a>
				</td>		
			</tr>
			</c:forEach>
		</table>
		
		
	</div>
</body>
</html>