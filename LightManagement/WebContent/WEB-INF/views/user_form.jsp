<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %> 
    <%@ page import="java.sql.*" %>

    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New/Edit user</title>
</head>
<style><%@include file="/WEB-INF/css/style.css"%></style>


<body>

    <div align="center">
        <h1>New/Edit user</h1>
        <form:form action="save_user" method="post" modelAttribute="user">
        <table cellpadding="5" class="steelBlueCols">
        	<form:hidden path="userId" />
        	<tr>
        		<td>Name:</td>
        		<td><form:input path="userName" /></td>
        	</tr>
        	<tr>
        		<td>Description:</td>
        		<td><form:input path="userDescription" /></td>
        	</tr> 
 			<tr>
        		<td>User type:</td>
        		<td>
        			<form:select path="userTypeId">
						<option value="-1"> Select user type</option>
						<%
						try
						{
							String sql = "SELECT * FROM user_types";
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/light_management","root","");
							Statement stm = con.createStatement();
							ResultSet rs = stm.executeQuery(sql);
							while(rs.next()){
								%>
								<option value="<%=rs.getInt("userTypeId")%>"><%=rs.getString("userTypeName")%></option>
								<%
							}
						}
						catch (Exception ex)
						{
							ex.printStackTrace();
						}
						%>
				    </form:select>	
				  				    		
				</td>
        	</tr>         	       	
        	<tr>
        		<td>Status:</td>
        		<td><form:input path="userStatus" /></td>
        	</tr>
         	<tr>
        		<td>Login:</td>
        		<td><form:input path="userLogin" /></td>
        	</tr>        	
        	<tr>
        		<td>Password:</td>
        		<td><form:input path="userPassword" /></td>
        	</tr>        	
        	
          	<tr>
        		<td colspan="2" align="center"><input type="submit" value="Save" /></td>
        	</tr>
        </table>      	
        </form:form>        
    </div>              
</body>
</html>


