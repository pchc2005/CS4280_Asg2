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
                <h5>Change Section Details/ Remove Section</h5>
                <div class="add-session">
                    <h4>You can choose the movie here:</h4>
                    <br/>
                    <form name="add" action="ModifySection" method="POST">                        
                        <label for="session">Movie Name:</label>
                        <select name="movieName">
                            <c:forEach items="${movieInfo}" var="movie">
                                <option value="${movie.name}">${movie.name}</option>
                            </c:forEach>
                        </select><br/><br/>
                        <input type="submit" value="Next" class="button"/>                          
                    </form>                    
                    
                </div>
                
                
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
