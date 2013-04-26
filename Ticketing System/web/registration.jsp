<%-- 
    Document   : index
    Created on : Apr 16, 2013, 2:48:26 PM
    Author     : PCHC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Cult Cinema Inc</title>
<link rel="stylesheet" type="text/css" media="all" href="css/registration.css"/>
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
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
                <h5>Registration</h5>            			
                    <form name="sign-up">
                        <fieldset>
                            <legend>Please Sing up here:</legend> <br/> <br/>   
                            <label for="sign-Name">Actual Name:</label>
                            <input type="text" name="sign-Name" /><br/><br/> 
                            <label for="sign-UserName">Login Name:</label>
                            <input type="text" name="sign-UserName" /><br/><br/> 
                            <label for="sign-Password">Password:</label>
                            <input type="password" name="sinPassword" /><br/><br/>                                   
                            <label for="sign-Email">Email:</label>
                            <input type="text" name="sign-Email" /><br/><br/> 
                            <label for="sign-Phone">Phone Number:</label>
                            <input type="text" name="Phone" /><br/><br/>
                            <label for="sign-Phone">Credit Card:</label>
                            <input type="text" name="Phone" /><br/><br/>
                            <label for="sign-Address">Address:</label>
                            <textarea rows="4" cols="50"></textarea> <br/><br/> 
                            <input type="submit" value="Submit" class="button" />
                    		<input type="reset" onclick="formReset()" value="Reset" class="button" />
                        </fieldset>
                    </form>
            </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
