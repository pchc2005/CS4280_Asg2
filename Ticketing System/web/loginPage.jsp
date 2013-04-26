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
	<%@ include file="include/header.jsp"%>
	
	<div id="container">
            <div id="content2">
                <form name="login" action="login" method="post">
                    <p>
                        <input type="radio" name="login-type" value="Member" />
                        <label for="member-type">Member</label>
                        <input type="radio" name="login-type" value="Staff" />
                        <label for="staff-type">Staff</label>
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
