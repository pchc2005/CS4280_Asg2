<%-- 
    Document   : transaction
    Created on : Apr 25, 2013, 4:36:57 PM
    Author     : Siuyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The Cult Cinema Inc</title>
<link rel="stylesheet" type="text/css" media="all" href="css/transaction.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session"/>
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application" />
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application" />
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/loginSuccessMember.jsp"%>
	    <%@ include file="include/user-nav.jsp"%>
	</div>

	<div id="content-right">
                <h5>MY TRANSACTION</h5> 
                <div id="transaction">
                <table >                    
                    <tr>
                        <th>Transaction ID</th>
                        <td>3635635</td>
                    </tr>
                    <tr>
                        <th>Ticket Sale Time</th>
                        <td>14:05</td>
                    </tr>
                    <tr>
                        <th>Movie</th>
                        <td>HELLO </td>
                    </tr>
                    <tr>
                        <th>House</th>
                        <td>SUN</td>
                    </tr>
                    <tr>
                        <th>Movie Start Time</th>
                        <td>14:05</td>
                    </tr>                    
                    <tr>
                        <th>Total price</th>
                        <td>$ 150</td>
                    </tr>  
                    <tr>
                        <td colspan="2">
                            <form name="transaction">
                                <input type="submit" value="Cancel Transaction" class="button" />                                
                            </form>
                        </td>
                    </tr>
                </table>
            </div>
  	     
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
