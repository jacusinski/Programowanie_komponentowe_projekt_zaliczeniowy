<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New/Edit building</title>
</head>
<style><%@include file="/WEB-INF/css/style.css"%></style>
<body>
    <div align="center">
        <h1>New/Edit building</h1>
        <form:form action="save_building" method="post" modelAttribute="building">
        <table cellpadding="5" class="steelBlueCols">
        	<form:hidden path="buildingId" />
        	<tr>
        		<td>Name:</td>
        		<td><form:input path="buildingName" /></td>
        	</tr>
        	<tr>
        		<td>Description:</td>
        		<td><form:input path="buildingDescription" /></td>
        	</tr>        	
        	<tr>
        		<td>Status:</td>
        		<td><form:input path="buildingStatus" /></td>
        	</tr>
    	  	<tr>
        		<td>Address:</td>
        		<td><form:input path="buildingAddress" /></td>
        	</tr>
        	<tr>
        		<td colspan="2" align="center"><input type="submit" value="Save" /></td>
        	</tr>
        </table>      	
        </form:form>        
    </div>              
</body>
</html>