
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
<link rel="stylesheet" type="text/css" media="all" href="css/my-detail.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/refund.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <%@ include file="include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/loginSuccessStaff.jsp"%>
	    <%@ include file="include/refund-nav.jsp"%>                
	</div>

	<div id="content-right">
                <h5>REFUND CONFIRMATION</h5>    
                <div id="refund">
                <table>
                  <tr>
                    <th>Transaction ID:</th>
                    <td>521655496</td>
                  </tr>  
                  <tr>
                    <th>Member Name:</th>
                    <td>Chan Tsz Fung</td>
                  </tr>  
                  <tr>
                    <th>Movie Name:</th>
                    <td>Hello Kitty</td>
                  </tr> 
                  <tr>
                    <th>Total Refund Price:</th>
                    <td>$100</td>
                  </tr>  
                  <tr>
                    <td colspan="2">
                    <form name="confirm-refund">
                            <input type="submit" value="Confirm Refund" class="button" />                            
                    </form></th>
                  </tr>   
                </table>
                    
   	     </div>
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
</body>
</html>
