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
<script type="text/javascript">
function output()
{
 alert("Modify Section Successful!")
}
</script>
</head>
    
<body>
<div id="container">	
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="sessionInfo" type="java.util.ArrayList" scope="session" />
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/loginSuccessStaff.jsp"%>
	    <%@ include file="include/management-nav.jsp"%>                
	</div>

	<div id="content-right">
                <h5>Change Section Details/ Remove Section</h5>
                
                <div class="movie-management">
                    <h4>You can change or remove a section here:</h4>
                    <p>Type in '0' in both Date Time and Discount Ratio if you want to delete the section.</p>
                    <c:forEach items="${sessionInfo}" var="session">
                        <c:if test="${sessionScope.movieName == session.movie_name}">
                        <form name="movie-man" action="ModifySection" method="POST"><br/>
                            <label for="session">Session ID:</label>
                            <input type="text" name="sessionID" value="${session.id}" readonly="readonly"></input><br/>
                            <label for="movieName">Movie Name:</label>
                            <input type="text" name="movieName" value="${session.movie_name}" disabled="disabled"></input><br/>
                            <label for="HouseName">House Name:</label>
                            <input type="text" name="HouseName" value="${session.movie_house}" disabled="disabled"></input><br/>
                            <label for="dateTime">Date Time:</label>
                            <input type="text" name="dateTime" value="${session.movie_start}"></input><br/>
                            <label for="Discount">Discount Ratio:</label>
                            <input type="text" name="discount" value="${session.discount}"></input><br/><br/>
                            <input type="submit" value="Confirm Change(s)" class="button" onclick="output()"/><br/><br/>                     
                        </form>   
                        </c:if>
                        <hr/>
                    </c:forEach>
                    
                </div>
                
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
