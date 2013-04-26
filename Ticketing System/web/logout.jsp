<%-- 
    Document   : logout
    Created on : Apr 26, 2013, 5:37:56 PM
    Author     : PCHC
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
