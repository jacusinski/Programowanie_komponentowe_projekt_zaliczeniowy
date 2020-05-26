<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New/Edit room</title>
</head>
<body>
    <div align="center">
        <h1>New/Edit room</h1>
        <form:form action="save" method="post" modelAttribute="room">
        <table cellpadding="5">
        	<form:hidden path="roomId" />
        	<tr>
        		<td>Name:</td>
        		<td><form:input path="roomName" /></td>
        	</tr>
        	<tr>
        		<td>Description:</td>
        		<td><form:input path="roomDescription" /></td>
        	</tr>        	
        	<tr>
        		<td>Status:</td>
        		<td><form:input path="roomStatus" /></td>
        	</tr>
        	<tr>
        		<td colspan="2" align="center"><input type="submit" value="Save" /></td>
        	</tr>
        </table>      	
        </form:form>        
    </div>              
</body>
</html>