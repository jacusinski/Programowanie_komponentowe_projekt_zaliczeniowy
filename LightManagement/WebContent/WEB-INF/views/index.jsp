<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Light management menu</title>
</head>
<style><%@include file="/WEB-INF/css/style.css"%></style>
<body>
<div align="center">

		<h1>Main menu</h1>
		
		<table border="1" cellpadding="5" class="darkTable" >
		<tr>
		<th></th>
		</tr>
		<tr>
		<th><h3><a href="list_building">Buildings</a></h3></th>
		</tr>
		<tr>
		<th></th>
		</tr>
		<tr>
		<th><h3><a href="list_room">Rooms</a></h3></th>
		</tr>
		<tr>
		<th></th>
		</tr>
		<tr>
		<th><h3><a href="list_lightPoint">Light points</a></h3></th>
		</tr>
		<tr>
		<th></th>
		</tr>
		<tr>
		<th><h3><a href="list_user">Users</a></h3></th>	
		</tr>
		<tr>
		<th></th>
		</tr>
		</table>
		<!--</br></br>
		
		<h3><a href="pick_a_user">What's in my building?</a></h3>	
		-->
		
	</div>
</body>
</html>