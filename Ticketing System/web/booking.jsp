<%-- 
    Document   : movie
    Created on : Apr 25, 2013, 3:38:17 PM
    Author     : Siuyan
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

</head>
    
<body>
<div id="container">	
    <%@ include file="include/header.jsp"%>
        
    <div id="content2">
	<div id="content-left">
	    <%@ include file="include/login.jsp"%>
	    <%@ include file="include/quick-booking.jsp"%>
            <%@ include file="include/top-movie.jsp"%> 
            
        </div>
	<div id="content-right">
                <h5>Booking Detail</h5> 
              <div id="movie-booking">
                	
               	<table>
                      <tr>
                        <th>Movie Name:</th>
                        <td>Peter Cheung</td>
                      </tr>
                      <tr>
                        <th>House:</th>
                        <td>Sun</td>
                      </tr> 
                      <tr>
                        <th>Time:</th>
                        <td>12:05</td>
                      </tr>
                      <tr>
                        <th>Price:</th>
                        <td>$100</td>
                      </tr> 
                      <tr>
                        <th>Price Discount:</th>
                        <td>Student-$50, Elderly-$60</td>
                      </tr> 
                 </table>
                 <p>Please choose the seat(s) below:</p>
                 <p>XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX</p>
                 <p>
                       
                        <form name="movie-booking" class="ticket">
                                <input type="submit" value="Submit" class="button" />
                        </form>
                 </p>
              </div>
              
  		
            </div>
        <div/>
        
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>

