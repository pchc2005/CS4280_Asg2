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
 alert("Add Section Successful!")
}
</script>
</head>
    
<body>
<div id="container">	
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/loginSuccessStaff.jsp"%>
	    <%@ include file="include/management-nav.jsp"%>                
	</div>

	<div id="content-right">
                <h5>Add Section</h5>
                <div class="add-session">
                    <h4>You can add a section here:</h4>
                    <form name="add" action="AddSection" method="POST">  <br/>                      
                        <label for="session">Movie Name:</label>
                        <select name="movieName">
                            <c:forEach items="${movieInfo}" var="movie">
                                <option value="${movie.id}">${movie.name}</option>
                            </c:forEach>
                        </select><br/>
                        <label for="House">House Name:</label>
                        <select name="movieHouse">
                            <c:forEach items="${movieHouseInfo}" var="movieHouse">
                                <option value="${movieHouse.id}">${movieHouse.name}</option>
                            </c:forEach>
                        </select><br/>                        
                        <label for="dateTime">Date Time:</label>
                        <input type="text" name="dateTime" value=""></input><br/>
                        <label for="Discount">Discount Ratio:</label>
                        <input type="text" name="discount" value=""></input><br/><br/> 
                        <input type="submit" value="Add Section" class="button" onClick="output();"/>                          
                    </form>                    
                    
                </div>
                
                
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
