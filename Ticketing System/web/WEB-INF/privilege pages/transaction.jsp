<%-- 
    Document   : transaction
    Created on : Apr 25, 2013, 4:36:57 PM
    Author     : Siuyan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <jsp:useBean id="transInfo" type="java.util.ArrayList" scope="session" />
    <%
    if (session.getAttribute("refundInfo") != null) {
    %>
    <jsp:useBean id="refundInfo" type="java.util.ArrayList" scope="session" />
    <%
       }
    %>
    <%@ include file="/include/header.jspf"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="/include/loginSuccessMember.jsp"%>
	    <%@ include file="/include/user-nav.jsp"%>
	</div>

	<div id="content-right">
                <h5>MY TRANSACTION</h5>
		<c:forEach items="${transInfo}" var="trans">
                <div id="transaction">
                <table >                    
                    <tr>
                        <th>Transaction ID</th>
                        <td>${trans.trans_id}</td>
                    </tr>
                    <tr>
                        <th>Transaction Sale Time</th>
                        <td>${trans.sale_time}</td>
                    </tr>
                    <tr>
                        <th>Movie</th>
                        <td>${trans.movie_name}</td>
                    </tr>
                    <tr>
                        <th>House</th>
                        <td>${trans.house_name}</td>
                    </tr>
                    <tr>
                        <th>Movie Start Time</th>
                        <td>${trans.movie_start}</td>
                    </tr>
		    <tr>
                        <th>No of tickets</th>
                        <td>${trans.vacancy_sold}</td>
                    </tr> 
                    <tr>
                        <th>Total price</th>
                        <td>${trans.total_price}</td>
                    </tr>  
                    <tr>
                        <td colspan="2">
                            <form name="transaction" method="post" action="RefundRequest">
				<c:choose>
				<c:when test="${trans.refundable == true}">
				    <input type="hidden" value="trans" name="refundReq" />
				    <input type="hidden" value="${memberInfo.id}" name="reqCustID" />
				    <input type="submit" value="Cancel Transaction" class="button" />
				</c:when>
				<c:otherwise>
				    <input type="submit" value="Cancel Transaction" class="button" disabled="disabled"/>
				</c:otherwise>
				</c:choose>
			    </form>
                        </td>
                    </tr>
                </table>
            </div>
  	     </c:forEach>
        </div>
    </div>
    <%@ include file="/include/footer.jsp"%>
</div>
</body>
</html>
