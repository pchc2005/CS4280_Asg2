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
<link rel="stylesheet" type="text/css" media="all" href="css/movie-detail.css" />
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
                <h5>MOVIE</h5> 
              <div class="movie-detail">
                	<h6>HELLO HELLO KITTY</h6>
               	<table>
                      <tr>
                        <th>Director:</th>
                        <td>Peter Cheung</td>
                      </tr>
                      <tr>
                        <th>Casting:</th>
                        <td>Chan Tsz Fung, Ivan Law</td>
                      </tr>                      
                 </table>
                 <p>
                        <img src="image/movie/DrugWar.jpg" alt="movie" /><br /><br />
                        <form name="ticket" class="ticket">
                                <select>
                                  <option value="1">24/5 12:05(Mon) House-Sun $70</option>
                                  <option value="2">25/5 12:50(Tue) House-Sun $70</option>
                                </select> 
                                <input type="submit" value="Submit" class="button" />
                        </form>
                 </p>
              </div>
              <div class="movie-detail">
                	<h6>HELLO HELLO KITTY</h6>
               	<table>
                      <tr>
                        <th>Director:</th>
                        <td>Peter Cheung</td>
                      </tr>
                      <tr>
                        <th>Casting:</th>
                        <td>Chan Tsz Fung, Ivan Law</td>
                      </tr>                      
                 </table>
                 <p>
                        <img src="image/movie/DrugWar.jpg" alt="movie" /><br /><br />
                        <form name="ticket" class="ticket">
                                <select>
                                  <option value="1">24/5 12:05(Mon) House-Sun $70</option>
                                  <option value="2">25/5 12:50(Tue) House-Sun $70</option>
                                </select> 
                                <input type="submit" value="Submit" class="button" />
                        </form>
                 </p>
              </div>
              <div class="movie-detail">
                	<h6>HELLO HELLO KITTY</h6>
               	<table>
                      <tr>
                        <th>Director:</th>
                        <td>Peter Cheung</td>
                      </tr>
                      <tr>
                        <th>Casting:</th>
                        <td>Chan Tsz Fung, Ivan Law</td>
                      </tr>                      
                 </table>
                 <p>
                        <img src="image/movie/DrugWar.jpg" alt="movie" /><br /><br />
                        <form name="ticket" class="ticket">
                                <select>
                                  <option value="1">24/5 12:05(Mon) House-Sun $70</option>
                                  <option value="2">25/5 12:50(Tue) House-Sun $70</option>
                                </select> 
                                <input type="submit" value="Submit" class="button" />
                        </form>
                 </p>
              </div>
              <div class="movie-detail">
                	<h6>HELLO HELLO KITTY</h6>
               	<table>
                      <tr>
                        <th>Director:</th>
                        <td>Peter Cheung</td>
                      </tr>
                      <tr>
                        <th>Casting:</th>
                        <td>Chan Tsz Fung, Ivan Law</td>
                      </tr>                      
                 </table>
                 <p>
                        <img src="image/movie/DrugWar.jpg" alt="movie" /><br /><br />
                        <form name="ticket" class="ticket">
                                <select>
                                  <option value="1">24/5 12:05(Mon) House-Sun $70</option>
                                  <option value="2">25/5 12:50(Tue) House-Sun $70</option>
                                </select> 
                                <input type="submit" value="Submit" class="button" />
                        </form>
                 </p>
              </div>
  		
            </div>
        
    </div>
    <%@ include file="include/footer.jsp"%>
</div>
    
    
    	
</body>
</html>
