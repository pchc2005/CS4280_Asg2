<%-- 
    Document   : movie
    Created on : Apr 25, 2013, 3:38:17 PM
    Author     : Siuyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Cult Cinema Inc</title>
<link rel="stylesheet" type="text/css" media="all" href="css/booking.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">	
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session" />
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="sessionInfo" type="java.util.ArrayList" scope="session" />
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%
	    if (session.getAttribute("loginStatus") == "member" && 
		session.getAttribute("loginStatus") != null) {
	%>
	    <%@ include file="include/loginSuccessMember.jsp"%>
	    <%@ include file="include/quick-booking.jsp"%>
            <%@ include file="include/top-movie.jsp"%>
	<%
	    }
	    else if (session.getAttribute("loginStatus") == "staff" &&
		     session.getAttribute("loginStatus") != null) {
	%>
	    <%@ include file="include/loginSuccessStaff.jsp"%>
	<%
		if (staffInfo.getRole().equals("Officer")) {
	%>
		<%@ include file="include/quick-booking.jsp"%>
	<%
		}
	    }
	    else {
	%>
	    <%@ include file="include/login.jsp"%>
	    <%@ include file="include/quick-booking.jsp"%>
            <%@ include file="include/top-movie.jsp"%>
	<%
	    }
	%>
        </div>
	<div id="content-right">
                <h5>Booking Detail</h5> 
              <div id="movie-booking">
                	
               	                   
                  <form name="book" action="HouseSizeBySectID" method="post">
                        <label for="movieName">Name:</label>
                        <input type="text" name="movieName" disabled="disabled" value="<c:out value="${sessionScope.reqMovieName}" />"></input><br/>                     
                        <label for="session">Session:</label>
                        <select name="section">
			    <c:forEach items="${sessionInfo}" var="section">
                            <option value="${section.id}">${section.movie_start} (House:${section.movie_house})</option>
                            </c:forEach>
                          
                        </select><br/>                   
                        <br/>
                        
                        <input type="submit" value="Next" class="bookbutton" />
                    </form> 
                 
              </div>	
            </div>      
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>

