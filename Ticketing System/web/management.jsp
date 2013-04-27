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
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/loginSuccessStaff.jsp"%>
	    <%@ include file="include/management-nav.jsp"%>                
	</div>

	<div id="content-right">
                <h5>Movie Management</h5>
                <div class="add-session">
                    <h4>You can add a session here:</h4>
                    <form name="add">                        
                        <label for="session">Movie Name:</label>
                        <select>
                            <option value="Movie1">Volvo</option>
                            <option value="Movie2">Saab</option>
                            <option value="Movie3">Mercedes</option>
                            <option value="Movie4">Audi</option>
                        </select><br/>
                        <label for="House">House Name:</label>
                        <select>
                            <option value="House1">SUN</option>
                            <option value="House2">CLOUD</option>
                            <option value="House3">MOON</option>
                            <option value="House4">STAR</option>
                        </select><br/>                        
                        <label for="dateTime">Date Time:</label>
                        <input type="text" name="Date Time" value=""></input><br/>
                        <label for="Discount">Discount Ratio:</label>
                        <input type="text" name="Discount" value=""></input><br/>
                        <input type="submit" value="Add Session" class="button" />                          
                    </form>                    
                    
                </div>
                <div class="movie-management">
                    <h4>You can change or remove a session here:</h4>
                    <form name="movie-man">
                        <label for="session">Session ID:</label>
                        <input type="text" name="session" value="01" disabled="disabled"></input><br/>
                        <label for="movieName">Movie Name:</label>
                        <input type="text" name="movieName" value="Hello Kitty" disabled="disabled"></input><br/>
                        <label for="HouseName">House Name:</label>
                        <input type="text" name="HouseName" value="Cloud" disabled="disabled"></input><br/>
                        <label for="dateTime">Date Time:</label>
                        <input type="text" name="Date Time" value="2013-04-26 10:00:00"></input><br/>
                        <label for="Discount">Discount Ratio:</label>
                        <input type="text" name="Discount" value="1"></input><br/>
                        <input type="submit" value="Confirm Change(s)" class="button" />                          
                    </form>                    
                    
                </div>
                
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
