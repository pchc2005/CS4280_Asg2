<%-- 
    Document   : management
    Created on : Apr 26, 2013, 9:10:26 PM
    Author     : Siuyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/loginSuccessStaff.jsp"%>
	    <%@ include file="include/management-nav.jsp"%>                
	</div>

	<div id="content-right">
                <h5>Movie Management</h5>    
                <div class="movie-management">
                    <form name="movie-man">
                        <label for="session">Session ID:</label> 01<br/>
                        <label for="dateTime">Date Time:</label>
                        <input type="text" name="Date Time" value="2013-04-26 10:00:00"></input><br/>
                        <label for="dateTime">Basic Price:</label>
                        <input type="text" name="Date Time" value="$100"></input><br/>
                        <input type="submit" value="Confirm Change(s)" class="button" />                          
                    </form>                    
                    <hr/>
                </div>
                <div class="movie-management">
                    <form name="movie-man">
                        <label for="session">Session ID:</label> 02<br/>
                        <label for="dateTime">Date Time:</label>
                        <input type="text" name="Date Time" value="2013-04-26 10:00:00"></input><br/>
                        <label for="dateTime">Basic Price:</label>
                        <input type="text" name="Date Time" value="$100"></input><br/>
                        <input type="submit" value="Confirm Change(s)" class="button" />                          
                    </form>                    
                    <hr/>
                </div>
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
