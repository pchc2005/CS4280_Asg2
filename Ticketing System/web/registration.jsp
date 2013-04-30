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
<link rel="stylesheet" type="text/css" media="all" href="css/registration.css"/>
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />
<script type="text/javascript">
function output()
{
    alert("Sign Up Successful!")
}
</script>
</head>
    
<body>
<div id="container">
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session"/>
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
                <form name="sign-up" action="NewUser" method="post">
                        <fieldset>
                            <legend>Please Sing up here(with* field cannot be empty):</legend> <br/> <br/>   
                            <label for="sign-Name">Actual Name*:</label>
                            <input type="text" name="sign-Name" /><br/><br/> 
                            
                            <label for="sign-UserName">Login Name*:</label>
                            <input type="text" name="sign-UserName" /><br/><br/>
                            
                            <label for="sign-Password">Password*:</label>
                            <input type="password" name="signPassword" /><br/><br/>                                   
                            <label for="sign-Email">Email:</label>
                            <input type="text" name="sign-Email" /><br/><br/> 
                            <label for="sign-Phone">Phone No.*:</label>
                            <input type="text" name="Phone" /><br/><br/>
                            <label for="sign-Phone">Credit Card*:</label>
                            <input type="text" name="creditCard" /><br/><br/>
                            <label for="sign-Address">Address:</label>
                            <textarea rows="4" cols="50" name='addr' value=""></textarea> <br/><br/> 
                            <input type="submit" value="Submit" class="button" />
                            <input type="reset" onclick="output()" value="Reset" class="button" />
                        </fieldset>
                    </form>
            </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
