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
<link rel="stylesheet" type="text/css" media="all" href="css/movie-detail.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session"/>
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="directorInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="castingInfo" type="java.util.ArrayList" scope="application" />
    
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
	    <h5>MOVIE</h5>
	    <c:forEach items="${movieInfo}" var="movie" begin="0" varStatus="movieNum">
            <div class="movie-detail">
                
		<h6 id="<c:out value="${movieNum.index}" />">${movie.name}</h6>
                <p>
		    <img src="${movie.posterURL}" alt="movie" />
		</p>
		<table>
		    <tr>
			<th>Director:</th>
                        <td>
                                <c:forEach items="${directorInfo}" var="director" begin="0">
                                    <c:if test="${director.movie_id == movie.id}">
                                        ${director.director_name}<br/>
                                    </c:if>
                                </c:forEach>
                            
                        </td>
		    </tr>
		    <tr>
			<th>Casting:</th>
			<td>
                                <c:forEach items="${castingInfo}" var="casting" begin="0">
                                    <c:if test="${casting.movie_id == movie.id}">
                                        ${casting.casting_name}<br/>
                                    </c:if>
                                </c:forEach>
                        </td>
		    </tr>
		    <tr>
			<th>Duration:</th>
			<td>${movie.duration} minutes</td>
		    </tr>
		    <tr>
			<th>Category:</th>
			<td>${movie.category}</td>
		    </tr>
		    <tr>
			<th>Language:</th>
			<td>${movie.language}</td>
		    </tr>
		    <tr>
			<th>Subtitle:</th>
			<td>${movie.subtitle}</td>
		    </tr>
		    <tr>
			<th>Synopsis:</th>
			<td>${movie.synposis}</td>
		    </tr>
		</table>
		
		<form name="ticket" class="ticket" action="Session">
                    <input type="hidden" value="${movie.name}" name="movieName" />
                    <input type="submit" value="Buy ticket!" class="button" />
		</form>
	    </div>
	    </c:forEach>
	</div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>

