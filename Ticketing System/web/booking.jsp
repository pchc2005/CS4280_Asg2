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
                	
               	                   
                  <form name="book" action="booking_confirmation.jsp">
                        <label for="movieName">Name:</label>
                        <input type="text" name="movieName" disabled="disabled" value="<c:out value="${sessionScope.reqMovieName}" />"></input><br/>                     
                        <label for="session">Session:</label>
                        <select>
			    <c:forEach items="${sessionInfo}" var="session">
                            <option value="${session.id}">${session.movie_start} (House:${session.movie_house})</option>
			    </c:forEach>
                        </select><br/>                   
                       
                        <br/>
                        <label for="Adult">Adult:</label>
                            <select class="type">
                                <option value="Adult10">0</option>
                                <option value="Adult1">1</option>
                                <option value="Adult2">2</option>
                                <option value="Adult3">3</option>
                                <option value="Adult4">4</option>
                                <option value="Adult5">5</option>
                                <option value="Adult6">6</option>
                                <option value="Adult7">7</option>
                                <option value="Adult8">8</option>
                                <option value="Adult9">9</option>
                                <option value="Adult10">10</option>
                            </select> <br/>
                        <label for="Child">Child:</label>
                            <select class="type">
                                <option value="Child0">0</option>
                                <option value="Child1">1</option>
                                <option value="Child2">2</option>
                                <option value="Child3">3</option>
                                <option value="Child4">4</option>
                                <option value="Child5">5</option>
                                <option value="Child6">6</option>
                                <option value="Child7">7</option>
                                <option value="Child8">8</option>
                                <option value="Child9">9</option>
                                <option value="Child10">10</option>
                            </select>  <br/>
                        <label for="Student">Student:</label>
                            <select class="type">
                                <option value="Student0">0</option>
                                <option value="Student1">1</option>
                                <option value="Student2">2</option>
                                <option value="Student3">3</option>
                                <option value="Student4">4</option>
                                <option value="Student5">5</option>
                                <option value="Student6">6</option>
                                <option value="Student7">7</option>
                                <option value="Student8">8</option>
                                <option value="Student9">9</option>
                                <option value="Student10">10</option>
                            </select> <br/>
                        <label for="Elderly">Elderly:</label>
                            <select class="type">
                                <option value="Elderly0">0</option>
                                <option value="Elderly1">1</option>
                                <option value="Elderly2">2</option>
                                <option value="Elderly3">3</option>
                                <option value="Elderly4">4</option>
                                <option value="Elderly5">5</option>
                                <option value="Elderly6">6</option>
                                <option value="Elderly7">7</option>
                                <option value="Elderly8">8</option>
                                <option value="Elderly9">9</option>
                                <option value="Elderly10">10</option>
                            </select>     
                                       
                   
                        <p>Please choose the seat(s) below:</p>
                        <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                           XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>

                        <input type="submit" value="Submit" class="bookbutton" />
                    </form> 
                 
              </div>	
            </div>      
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>

