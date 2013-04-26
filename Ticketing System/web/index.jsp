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
<link rel="stylesheet" type="text/css" media="all" href="css/movie.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/form.css" />
<link rel="stylesheet" type="text/css" media="all" href="css/common.css" />
<script type="text/javascript">
    
</script>
</head>
    
<body>
<div id="container">
    <%
	if (session.getAttribute("loginStatus") == "member") {
    %>
	<%@ include file="include/header.jsp"%>
    <%
	}
	else if (session.getAttribute("loginStatus") == "staff"){
    %>
	<%@ include file="include/header.jsp"%>
    <%
	}
	else {
    %>
	<%@ include file="include/header.jsp"%>
    <%
	}
    %>
        
    <div id="content2">
	<div id="content-left">
	<%
	    if (session.getAttribute("loginStatus") != "failed" && session.getAttribute("loginStatus") != null) {
	%>
	    <%@ include file="include/loginSuccess.jsp"%>
	<%
	    }
	    else {
	%>
	    <%@ include file="include/login.jsp"%>
	<%
	    }
	%>
	    <%@ include file="include/quick-booking.jsp"%>
            <%@ include file="include/top-movie.jsp"%>	    
	</div>

	<div id="content-right">
            <h5>NOW SHOWING</h5>            			
	    <div class="movie-big">
 		<img src="image/fixed/movie-big1.jpg" alt="movie1" />
		<div class="movie-big-text">Scary Movie</div>
            </div>
					
            <div class="movie">
		<img src="image/fixed/movie1.jpg" alt="movie1" />
                    <div class="movie-text">Scary Movie</div>
	    </div>
                    
	    <div class="movie">
		<img src="image/fixed/movie1.jpg" alt="movie1" />
                    <div class="movie-text">Scary Movie</div>
	    </div>
        </div>
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
