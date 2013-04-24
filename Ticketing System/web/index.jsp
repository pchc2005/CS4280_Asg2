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

</head>
    
<body>
<div id="container">	
    <%@ include file="include/header.jsp"%>
        
    <div id="content2">
	<div id="content-left">
	    <div class="box">
 		<h2>LOGIN</h2>
		    <form name="login" action="login" method="post">
  			<p>
			    <input type="radio" name="member-type" value="Member" />
			    <label for="member-type">Member</label>
			    <input type="radio" name="staff-type" value="Staff" />
			    <label for="staff-type">Staff</label>
			    <br /><br />
			    <label for="UserName">User Name:</label>
			    <input type="text" name="UserName" /><br/>
			    <label for="Password">Password:</label>
			    <input type="password" name="Password" /><br/><br/>
			    <input type="submit" value="Submit" class="button" />
			    <input type="reset" onclick="formReset()" value="Reset" class="button" />
			</p>
		    </form>
		    <p id="sign_up"><a href="#">Sign up now!</a></p>
	    </div>
	    <div class="box">
		<h2>BOOK NOW</h2>
                <form name="booking" action="login" method="get">
                    <label for="movie">Please choose the Movie you want:</label>
                    <select name="movie">
                        <option value="movie1">movie1</option>
                        <option value="movie2">movie2</option>
                        <option value="movie3">movie3</option>
                    </select>
		    <br/><br/>
                    <label for="house">Please choose the House:</label>
                    <select name="house">
                        <option value="house1">house1</option>
                        <option value="house2">house2</option>
                        <option value="house3">house3</option>
                    </select>
		    <br/><br/>
		    <label for="day">Please choose the Day:</label>
		    <select name="day">
			<option value="day1">day1</option>
                        <option value="day2">day2</option>
                        <option value="day3">day3</option>
                    </select>
                    <br/><br/>
                    <label for="time">Please choose the Time:</label>
                    <select name="time">
                        <option value="time1">time1</option>
                        <option value="time2">time2</option>
                        <option value="time3">time3</option>
                    </select> 
                    <br/><br/> 
                    <input type="submit" value="Book Now!" class="button" />
                    <input type="reset" onclick="formReset()" value="Reset" class="button" />
		</form>
	    </div>
	    <div class="box">
                <h2>TOP 10 Movie</h2>
                <h3>Top1 movie</h3>
                <h4>Hello World!</h4>
                <h3>Top2 movie</h3>
                <h4>Hello World2!</h4>
                <h3>Top3 movie</h3>
                <h4>Hello World3!</h4>
                <h3>Top4 movie</h3>
                <h4>Hello World4!</h4>
                <h3>Top5 movie</h3>
                <h4>Hello World5!</h4>
                <h3>Top6 movie</h3>
                <h4>Hello World6!</h4>
                <h3>Top7 movie</h3>
                <h4>Hello World7!</h4>
                <h3>Top8 movie</h3>
                <h4>Hello World8!</h4>
                <h3>Top9 movie</h3>
                <h4>Hello World9!</h4>
                <h3>Top10 movie</h3>
                <h4>Hello World10!</h4>
	    </div>
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
