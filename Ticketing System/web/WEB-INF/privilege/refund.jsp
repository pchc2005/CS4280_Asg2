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
<link rel="stylesheet" type="text/css" media="all" href="css/my-detail.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/refund.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />

</head>
    
<body>
<div id="container">
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <jsp:useBean id="refundInfo" type="java.util.ArrayList" scope="session"/>
    <%@ include file="/include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="/include/loginSuccessStaff.jsp"%>
	    <%@ include file="/include/refund-nav.jsp"%>                
	</div>

	<div id="content-right">
	    <h5>REFUND CONFIRMATION</h5>
		<c:choose>
		<c:when test="${sessionScope.refundInfo != null}">
                
		<c:forEach var="refund" items="${refundInfo}">
		    
		<c:if test="${refund.is_authorized == false}">
                <div id="refund">
                <table>
                  <tr>
                    <th>Transaction ID:</th>
                    <td>${refund.trans_id}</td>
                  </tr>  
                  <tr>
                    <th>Member Name:</th>
                    <td>${refund.customer_name}</td>
                  </tr>  
                  <tr>
                    <th>Movie Name:</th>
                    <td>${refund.movie_name}</td>
                  </tr>
                  <tr>
                    <th>House Name:</th>
                    <td>${refund.house_name}</td>
                  </tr>
                  <tr>
                    <th>Movie Start Time</th>
                    <td>${refund.movie_start}</td>
                  </tr>
                  <tr>
                    <th>Ticket Sale Time</th>
                    <td>${refund.sale_time}</td>
                  </tr>
                  <tr>
                    <th>Total Refund Price:</th>
                    <td>${refund.total_price}</td>
                  </tr>  
                  <tr>
                    <td colspan="2">
                    <form name="confirm-refund" method="post" action="ProcRefund">
			<input type="hidden" value="${refund.trans_id}" name="reqTransID" />
			<c:remove var="refundInfo" scope="session" />
                        <input type="submit" value="Confirm Refund" class="button" />                            
                    </form>
		    </td>
                  </tr>   
                </table>
                    
		</div>
		  <br/>
		</c:if>
		</c:forEach>
		</c:when>
		<c:otherwise>
		    <c:out value="<p>No refund request now!</p>" />
		</c:otherwise>
		  </c:choose>
	</div>
    </div>
    <%@ include file="/include/footer.jsp"%>
</div>
</body>
</html>
