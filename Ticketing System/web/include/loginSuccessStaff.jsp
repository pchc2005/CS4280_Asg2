<%-- 
    Document   : loginSuccessStaff
    Created on : Apr 26, 2013, 7:33:59 PM
    Author     : PCHC
--%>

<div id="login" class="box">
    <h2>LOGIN</h2>
    <p>Hello, <jsp:getProperty name="staffInfo" property="role" />!</p>
    <form method="post" action="logout.jsp">
	<input type="submit" value="Logout"/>
    </form>
</div>