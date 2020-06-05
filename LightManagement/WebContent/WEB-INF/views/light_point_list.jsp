<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Light point manager</title>
</head>
<style><%@include file="/WEB-INF/css/style.css"%></style>
<body>
<div align="center">
		<h1>Light points list</h1>
		
		<h3><a href="new_lightPoint">New light point</a></h3>
		
		<table border="1" cellpadding="5" class="darkTable">
			<tr>
				<th>No</th>
				<th>Name</th>
				<th>Description</th>
				<th>Status</th>				
			</tr>
			
			<c:forEach items="${listLightPoint}" var="lightPoint" varStatus="status">
			<tr>
				<td>${status.index + 1}</td>
				<td>${lightPoint.lightPointName}</td>
				<td>${lightPoint.lightPointDescription}</td>
				<td>${lightPoint.lightPointStatus}</td>		
				<td>
					<a href="edit_lightPoint?lightPointId=${lightPoint.lightPointId}">Edit</a>
					&nbsp;&nbsp;&nbsp;
					<a href="delete_lightPoint?lightPointId=${lightPoint.lightPointId}">Delete</a>
				</td>		
			</tr>
			</c:forEach>
		</table>
		
		
	</div>
</body>
</html>