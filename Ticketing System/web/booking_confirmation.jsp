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
<link rel="stylesheet" type="text/css" media="all" href="css/booking.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />
<script type="text/javascript">

</script>
</head>
    
<body>
<div id="container">	
    <jsp:useBean id="staffInfo" class="cs4280asg2.dto.StaffBean" scope="session"/>
    <%@ include file="include/header.jsp"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/login.jsp"%>
	    <%@ include file="include/quick-booking.jsp"%>
            <%@ include file="include/top-movie.jsp"%>	    
	</div>

	<div id="content-right">
            <h5>CONFIRMATION</h5> 
            <div id="movie-confirm">
                <table >
                    <tr>
                        <th colspan="2"><br/>BOOKING DETAIL<br/><br/></th>
                    </tr>
                    <tr>
                        <th>Transaction ID</th>
                        <td>HELLO </td>
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
                        <th>Time</th>
                        <td>14:05</td>
                    </tr>
                    <tr>
                        <th rowspan="4">Price</th>
                        <td>$ 100 * 1</td>
                    </tr>
                    <tr>
                        <td>$ 70 * 1</td>
                    </tr>
                    <tr>
                        <td>$ 60 * 0</td>
                    </tr>
                    <tr>
                        <td>$ 65 * 1</td>
                    </tr>
                    <tr>
                        <th>Total price</th>
                        <td>$ 150</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                        <form name="booking-confirm">
                            <input type="submit" value="Submit" class="button" />
                            <input type="reset" onclick="formReset()" value="Cancel" class="button" />
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
