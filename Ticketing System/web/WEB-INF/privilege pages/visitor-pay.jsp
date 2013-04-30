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
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/payment.css" />
<script type="text/javascript">
    function sendform()
    {
        if(document.getElementById("creditcard").value==''){
            alert('Please enter the credit card number!!!');  
            return false;
        }
        else{
            alert('Payment Successful!');
            document.getElementById("form-pay").action="index.jsp";
        }
    }
</script>
</head>
    
<body>
<div id="container">	
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session" />
    <%@ include file="/include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%
	    if (session.getAttribute("loginStatus") == "member" && 
		session.getAttribute("loginStatus") != null) {
	%>
	    <%@ include file="/include/loginSuccessMember.jsp"%>
	    <%@ include file="/include/quick-booking.jsp"%>
            <%@ include file="/include/top-movie.jsp"%>
	<%
	    }
	    else if (session.getAttribute("loginStatus") == "staff" &&
		     session.getAttribute("loginStatus") != null) {
	%>
	    <%@ include file="/include/loginSuccessStaff.jsp"%>
	<%
		if (staffInfo.getRole().equals("Officer")) {
	%>
		<%@ include file="/include/quick-booking.jsp"%>
	<%
		}
	    }
	    else {
	%>
	    <%@ include file="/include/login.jsp"%>
	    <%@ include file="/include/quick-booking.jsp"%>
            <%@ include file="/include/top-movie.jsp"%>
	<%
	    }
	%>
        </div>

	<div id="content-right">
            <h5>Payment</h5> 
            <div id="payment">
                <form id="form-pay" action="" onsubmit="return sendform()">
                    <label>Total price:</label>
                    <input type="text" name="price" disabled="disabled" value="$<c:out value="${sessionScope.total}" />"></input>  <br/>
                    <label>Credit card number:</label>
                    <input id="creditcard" type="text" name="creditCard"></input><br/>
                    <input class="pay" type="submit" value="Confirm Payment" ></input>
                    
                </form>
		
            </div>
        </div>
    </div>
    <%@ include file="/include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
