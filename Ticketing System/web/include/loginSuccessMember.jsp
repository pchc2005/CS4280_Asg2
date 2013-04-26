<%-- 
    Document   : loginSuccess
    Created on : Apr 24, 2013, 9:30:32 PM
    Author     : PCHC
--%>
<jsp:useBean id="memberInfo" class="cs4280asg2.dto.CustomerBean" scope="session"/>

<div id="login" class="box">
    <h2>LOGIN</h2>
    <p>Hello, <jsp:getProperty name="memberInfo" property="name" />!</p>
    <p>Your loyalty point is <jsp:getProperty name="memberInfo" property="loyalty_pt" />.</p>
    <form method="post" action="logout.jsp">
	<input type="submit" value="Logout"/>
    </form>
</div>
