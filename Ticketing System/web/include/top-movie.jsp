<%-- 
    Document   : top-movie
    Created on : Apr 25, 2013, 4:14:37 PM
    Author     : Siuyan
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="top" class="box">
            <h2>TOP 3 Movie</h2>
                <c:forEach items="${movieInfo}" var="i" begin="1" end="3" varStatus="topMovieLoop">
            
                    <h3>Top <c:out value="${topMovieLoop.index}" /> movie</h3>
                    <h4>${i.name}</h4> 
                
                </c:forEach>
	    </div>
