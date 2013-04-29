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
<link rel="stylesheet" type="text/css" media="all" href="css/seating.css" />

<script type="text/javascript">
function output(elem)
{
    if(elem.checked==true){        
        elem.parentNode.style.backgroundColor="green";
    }
    else {
        elem.parentNode.style.backgroundColor="#FF6";
    }
}
</script>
</head>
    
<body onload="disableElement()">
<div id="container">	
    
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session" />
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="sessionInfo" type="java.util.ArrayList" scope="session" />
    <jsp:useBean id="sessionHouseSize" class="cs4280asg2.dto.SessionHouseBean" scope="session" />
    <%
    if (session.getAttribute("unavaiSeatsInfo") != null) {
    %>
    <jsp:useBean id="unavaiSeatsInfo" type="java.util.ArrayList" scope="session" />
    <%
    }
    %>
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
                  <form name="book" action="ConfirmBuy" method="POST">
                        <label for="movieName">Name:</label>
                        <input type="text" name="movieName" disabled="disabled" value="<c:out value="${sessionScope.reqMovieName}" />"></input><br/>                     
                        <label for="session">Session:</label>
			<c:forEach items="${sessionInfo}" var="session">
			    <c:if test="${session.id == sessionScope.sessionID}">
				<input type="text" name="session" disabled="disabled" value="<c:out value="${session.movie_start} (House:${session.movie_house})" />"></input><br/>
			    </c:if>
			</c:forEach>
			
                        <br/>
			
                        <p>Please choose the seat(s) below:</p>
                   
			<table class="seatingplan" align="center">
			    <caption>SCREEN</caption>
			    <c:set var="row" scope="session" value="${sessionHouseSize.house_row}"/>
			    <c:set var="col" scope="session" value="${sessionHouseSize.house_col}"/>
			    <%
				for (int i = 0; i < Integer.parseInt(session.getAttribute("row").toString()); i++) {
			    %>
				    <tr>
					<%
					for (int j = 0; j < Integer.parseInt(session.getAttribute("col").toString()); j++) {
					%>
					
					<td>
					    <label for="<%= String.valueOf(Character.toChars('A'+i)) %><%= j%>"><%= String.valueOf(Character.toChars('A'+i)) %><%= j%></label>
					    <input onchange="output(this)" name="seats" type="checkbox" id="<%= String.valueOf(Character.toChars('A'+i)) %><%= j%>" value="<%= String.valueOf(Character.toChars('A'+i)) %><%= j%>"></input>
					</td>
					<%
					}
					%>
				    </tr>
			    <%
				}
			    %>
			<c:remove var="row" scope="session"/>
			<c:remove var="col" scope="session"/>
		    </table>
                        <input type="submit" value="Submit" class="bookbutton" />
                    </form>
		    <%
		    if (session.getAttribute("unavaiSeatsInfo") != null) {
		    %>
		    <script type="text/javascript">
			function disableElement(){
			var unavai = new Array();
			<c:forEach var="unavaiSeats" items="${unavaiSeatsInfo}" varStatus="i">
			unavai[${i.index}] = "${unavaiSeats.seat}";
			</c:forEach>
			for (var i = 0; i < ${sessionScope.unavaiSeatsNo}; i++) {
			    document.getElementById(unavai[i]).disabled = true;
			    document.getElementById(unavai[i]).parentNode.style.backgroundColor="red";
			}
			}
		    </script>
		    <%
		    }
		    %>
              </div>	
            </div>      
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>

