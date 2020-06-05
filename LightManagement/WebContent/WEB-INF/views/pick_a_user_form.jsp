<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form" %> 
    <%@ page import="java.sql.*" %>

    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pick a user</title>
</head>

<body>
  
    <div align="center">
        <h1>Pick a user</h1>
        <form:form action="pick_a_user_building" method="get" modelAttribute="user">
        <table cellpadding="5">
        	<form:hidden path="userId" />
        	
 			<tr>
        		<td>User type:</td>
        		<td>
        			<form:select path="userId">
						<option value="-1"> Select user</option>
						<%
						try
						{
							String sql = "SELECT * FROM users";
							Class.forName("com.mysql.jdbc.Driver").newInstance();
							Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/light_management","root","");
							Statement stm = con.createStatement();
							ResultSet rs = stm.executeQuery(sql);
							while(rs.next()){
								%>
								<option value="<%=rs.getInt("userId")%>"><%=rs.getString("userName")%></option>
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


