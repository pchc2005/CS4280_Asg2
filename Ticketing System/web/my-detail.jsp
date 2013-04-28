<%-- 
    Document   : my-detail
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
<link rel="stylesheet" type="text/css" media="all" href="css/my-detail.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session"/>
    <jsp:useBean id="movieHouseInfo" type="java.util.ArrayList" scope="application"/>
    <jsp:useBean id="movieInfo" type="java.util.ArrayList" scope="application"/>
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/loginSuccessMember.jsp"%>
	    <%@ include file="include/user-nav.jsp"%>                
	</div>

	<div id="content-right">
                <h5>MY DETAIL</h5>    
                <div id="detail">
                <table>
                  <tr>
                    <th>Actual Name:</th>
                    <td>${memberInfo.name}</td>
                  </tr>
                  <tr>
                    <th>Login Name:</th>
                    <td>${memberInfo.login_name}</td>
                  </tr>                  
                  <tr>
                    <th>Email:</th>
                    <td>${memberInfo.email}</td>
                  </tr>
                  <tr>
                    <th>Phone Number:</th>
                    <td>${memberInfo.phone_no}</td>
                  </tr>
                  <tr>
                    <th>Credit Card:</th>
                    <td>${memberInfo.creditcard}</td>
                  </tr>
                  <tr>
                    <th>Address:</th>
                    <td>${memberInfo.addr}</td>
                  </tr>
                  <tr>
                    <th>Loyalty Point:</th>
                    <td>${memberInfo.loyalty_pt}</td>
                  </tr>
                </table>
   	     </div>
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
