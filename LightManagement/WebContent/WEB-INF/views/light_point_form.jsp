<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %> 
    <%@ page import="java.sql.*" %>

    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New/Edit light point</title>
</head>
<style><%@include file="/WEB-INF/css/style.css"%></style>


<body>

    <div align="center">
        <h1>New/Edit light point</h1>
        <form:form action="save_lightPoint" method="post" modelAttribute="lightPoint">
        <table cellpadding="5" class="steelBlueCols">
        	<form:hidden path="lightPointId" />
        	<tr>
        		<td>Name:</td>
        		<td><form:input path="lightPointName" /></td>
        	</tr>
        	<tr>
        		<td>Description:</td>
        		<td><form:input path="lightPointDescription" /></td>
        	</tr>        	
        	<tr>
        		<td>Status:</td>
        		<td><form:input path="lightPointStatus" /></td>
        	</tr>
         	<tr>
        		<td>Room to which light point belongs:</td>
        		<td>
        			<form:select path="roomId">
						<option value="-1"> Select room</option>
						<%
						try
						{
							String sql = "SELECT * FROM rooms";
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/light_management","root","");
							Statement stm = con.createStatement();
							ResultSet rs = stm.executeQuery(sql);
							while(rs.next()){
								%>
								<option value="<%=rs.getInt("roomId")%>"><%=rs.getString("roomName")%></option>
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
        		<td>Light to which light point belongs:</td>
        		<td>
        			<form:select path="lightId">
						<option value="-1"> Select room</option>
						<%
						try
						{
							String sql = "SELECT * FROM lights";
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/light_management","root","");
							Statement stm = con.createStatement();
							ResultSet rs = stm.executeQuery(sql);
							while(rs.next()){
								%>
								<option value="<%=rs.getInt("lightId")%>"><%=rs.getString("lightName")%></option>
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
        		<td>Bulb to which light point belongs:</td>
        		<td>
        			<form:select path="bulbId">
						<option value="-1"> Select room</option>
						<%
						try
						{
							String sql = "SELECT * FROM bulbs";
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/light_management","root","");
							Statement stm = con.createStatement();
							ResultSet rs = stm.executeQuery(sql);
							while(rs.next()){
								%>
								<option value="<%=rs.getInt("bulbId")%>"><%=rs.getString("bulbName")%></option>
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


