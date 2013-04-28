<%-- 
    Document   : index
    Created on : Apr 16, 2013, 2:48:26 PM
    Author     : PCHC
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
<script type="text/javascript">

</script>
</head>
    
<body>
<div id="container">	
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session" />
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="sessionInfo" type="java.util.ArrayList" scope="session" />
    <jsp:useBean id="sessionHouseSize" class="cs4280asg2.dto.SessionHouseBean" scope="session" />
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
            <h5>CONFIRMATION</h5> 
            <div id="confirm">
		<form name="booking-confirm" method="POST" action="/BuyTicket">
                <table >
                    <caption>BOOKING DETAIL</caption>
                    
                    <tr>
                        <th>Movie</th>
                        <td><c:out value="${sessionScope.reqMovieName}"/></td>
                    </tr>
                    <tr>
                        <th>House</th>
                        <td><c:out value="${sessionScope.sessionHouseName}"/></td>
                    </tr>
                    <tr>
                        <th>Time</th>
                        <td>
			    <c:forEach items="${sessionInfo}" var="session">
			    <c:if test="${session.id == sessionScope.sessionID}">
				<c:out value="${session.movie_start}" />
			    </c:if>
			    </c:forEach>
			</td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>
			    <c:forEach items="${movieInfo}" var="movie">
			    <c:if test="${movie.id == sessionScope.sessionMovieID}">
				$<c:out value="${movie.base_price}" /> * <c:out value="${sessionScope.seatsCount}" />
			    
			</td>
                    </tr>
                    <tr>
                        <th>Total price</th>
                        <td>$<c:out value="${movie.base_price * sessionScope.seatsCount}" /></td>
                    </tr>
			    </c:if>
			    </c:forEach>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Confirm!" class="button" />
                            <input type="reset" onclick="back_to_index()" value="Cancel" class="button" />
			</td>
                    </tr>

                </table>
		</form>
            </div>
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
