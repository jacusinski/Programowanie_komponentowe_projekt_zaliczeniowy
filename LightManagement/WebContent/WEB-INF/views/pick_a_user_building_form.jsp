<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %> 
    <%@ page import="java.sql.*" %>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pick a building</title>
</head>

<body>

    <div align="center">
 
 		<h1>Pick a building</h1>
 
	<%	
	String text = request.getQueryString().toString();
	int beginIndex = text.lastIndexOf("=") + 1;
	int endIndex = text.length();
	
	String ID = text.substring(beginIndex, endIndex);
	int userIdLocal = Integer.parseInt(ID);	
	
	//out.print(userId);
	%>
	
<table border="1" cellpadding="5">
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
		
		
		 <form:form action="pick_a_user_building_room" method="get" modelAttribute="building">
        <table cellpadding="5">
        	<form:hidden path="buildingId" />
        	
 			<tr>
        		<td>User type:</td>
        		<td>
        			<form:select path="buildingId">
						<option value="-1"> Select user type</option>
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
								String userId = session.setAttribute(rs.getInt("userId")).toString();
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
        		<td colspan="2" align="center"><input type="submit" value="CONTINUE" /></td>
        	</tr>
        </table>      	
        </form:form>   
        
    </div>              
</body>
</html>


