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
<link rel="stylesheet" type="text/css" media="all" href="css/house.css" />
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
                <h5>HOUSE</h5> 
                    <div class="house">
                        <h6>STAR</h6>
                        <table>
                          <tr>
                            <th>Capacity:</th>
                            <td>Big (200)</td>
                          </tr>
                          <tr>
                            <th>Seat:</th>
                            <td>XXXXXXXXXXXXXXXXXXXXX<br />
                              XXXXXXXXXXXXXXXXXXXXX</td>
                          </tr>                      
                     	</table>
                       
                        
                    </div>   
                    <div class="house">
                        <h6>CLOUD</h6>
                        <table>
                          <tr>
                            <th>Capacity:</th>
                            <td>200</td>
                          </tr>
                          <tr>
                            <th>Seat:</th>
                            <td>XXXXXXXXXXXXXXXXXXXXX<br />
                              XXXXXXXXXXXXXXXXXXXXX</td>
                          </tr>                      
                     	</table>
                       
                        
                    </div>  
                    <div class="house">
                        <h6>MOON</h6>
                        <table>
                          <tr>
                            <th>Capacity:</th>
                            <td>200</td>
                          </tr>
                          <tr>
                            <th>Seat:</th>
                            <td>XXXXXXXXXXXXXXXXXXXXX<br />
                              XXXXXXXXXXXXXXXXXXXXX</td>
                          </tr>                      
                     	</table>
                       
                        
                    </div>  
                    <div class="house">
                        <h6>SUN</h6>
                        <table>
                          <tr>
                            <th>Capacity:</th>
                            <td>200</td>
                          </tr>
                          <tr>
                            <th>Seat:</th>
                            <td>XXXXXXXXXXXXXXXXXXXXX<br />
                              XXXXXXXXXXXXXXXXXXXXX</td>
                          </tr>                      
                     	</table>
                       
                        
                    </div>  					
            </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
