<%-- 
    Document   : index
    Created on : Apr 16, 2013, 2:48:26 PM
    Author     : PCHC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Cult Cinema Inc</title>
<link rel="stylesheet" type="text/css" media="all" href="css/house.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session" />
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
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
                <h5>HOUSE</h5>
		<c:forEach items="${movieHouseInfo}" var="movieHouse" >
		<div class="house">
		    <h6>${movieHouse.name}</h6>
		    <p>Capacity: ${movieHouse.size}(${movieHouse.capacity})</p>
		    <p>Seat:</p>
                   
		    <table class="seatingplan" align="center">
                        <caption>SCREEN</caption>
			<c:set var="row" scope="session" value="${movieHouse.row}"/>
			<c:set var="col" scope="session" value="${movieHouse.col}"/>
			<%
			    for (int i = 0; i < Integer.parseInt(session.getAttribute("row").toString()); i++) {
			%>
			<tr>
			    <%
			    for (int j = 0; j < Integer.parseInt(session.getAttribute("col").toString()); j++) {
			    %>
			    <td><%= String.valueOf(Character.toChars('A'+i)) %><%= j%></td>
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
                   
                </div>
		</c:forEach>
            </div>
	</div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
