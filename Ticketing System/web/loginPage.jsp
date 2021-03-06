<%-- 
    Document   : loginPage
    Created on : Apr 26, 2013, 1:54:20 AM
    Author     : PCHC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log in</title>
	
	<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />
        <link rel="stylesheet" type="text/css" media="all" href="css/login.css" />
        
        
    </head>
    <body>
	<jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
	<%@ include file="include/header.jspf"%>
	
	<div id="container">
            <div id="content2">
                <h5>LOGIN PAGE</h5>
                <form name="login" action="login" method="post">
                    <p>                        
                        <input type="radio" name="login-type" value="Member" id="Member" checked/>
                        <label for="Member">Member</label>
                        <input type="radio" name="login-type" value="Staff"  id="Staff"/>
                        <label for="Staff">Staff</label>
                        <br /><br />
                        <label for="UserName">User Name:</label>
                        <input type="text" name="UserName" /><br/>
                        <label for="Password">Password:</label>
                        <input type="password" name="Password" /><br/><br/>
                        <input type="submit" value="Submit" class="button" />
                        <input type="reset" onclick="formReset()" value="Reset" class="button" />
                    </p>
                </form>
            </div>
	</div>
	
	<%@ include file="include/footer.jsp"%>
    </body>
</html>
