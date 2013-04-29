<%-- 
    Document   : management
    Created on : Apr 26, 2013, 9:10:26 PM
    Author     : Siuyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Cult Cinema Inc</title>
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/management.css" />

</head>
    
<body>
<div id="container">	
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="statInfo" type="java.util.ArrayList" scope="session" />
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/login.jsp"%>
	    <%@ include file="include/management-nav.jsp"%>                
	</div>

	<div id="content-right">
                <h5>Statistics</h5>   

                <h4>Sales statistics of each house and movie show time</h4>
                
                <table name="sold-movie">
                      <tr>
                        <th id="title" colspan="3"></th>
                      </tr>
                      <tr>
                        <th>House</th>
                        <th>Show Time</th>
                        <th>Ticket Sold</th>
                      </tr>
                      <c:forEach items="${statInfo}" var="stat" begin="0">
                      <tr>
                        <td>${stat.movie_house}</td>
                        <td>${stat.movie_start}</td>
                        <td>${stat.total_sales}</td>
                      </tr>
                      </c:forEach>
                      
                 </table>
               
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
