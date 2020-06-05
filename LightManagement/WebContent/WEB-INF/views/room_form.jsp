<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %> 
    <%@ page import="java.sql.*" %>

    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New/Edit room</title>
</head>
<style><%@include file="/WEB-INF/css/style.css"%></style>


<body>

    <div align="center">
        <h1>New/Edit room</h1>
        <form:form action="save_room" method="post" modelAttribute="room">
        <table cellpadding="5" class="steelBlueCols">
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
        		<td>Building to which room belongs:</td>
        		<td>
        			<form:select path="buildingId">
						<option value="-1"> Select building</option>
						<%
						try
						{
							String sql = "SELECT * FROM buildings";
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/light_management","root","");
							Statement stm = con.createStatement();
							ResultSet rs = stm.executeQuery(sql);
							while(rs.next()){
								%>
								<option value="<%=rs.getInt("buildingId")%>"><%=rs.getString("buildingName")%></option>
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
        		<td colspan="2" align="center"><input type="submit" value="Save" /></td>
        	</tr>
        </table>      	
        </form:form>        
    </div>              
</body>
</html>


