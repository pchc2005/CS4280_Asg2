<%-- 
    Document   : login
    Created on : Apr 25, 2013, 4:02:33 PM
    Author     : Siuyan
--%>

<div id="login" class="box">
    <h2>LOGIN</h2>
	<form name="login" action="login" method="post">
	    <p>
		<input type="radio" name="member-type" value="Member" />
		<label for="member-type">Member</label>
		<input type="radio" name="staff-type" value="Staff" />
		<label for="staff-type">Staff</label>
		<br /><br />
		<label for="UserName">User Name:</label><br/>
		<input type="text" name="UserName" /><br/>
		<label for="Password">Password:</label>
		<input type="password" name="Password" /><br/><br/>
		<input type="submit" value="Submit" class="button" />
		<input type="reset" onclick="formReset()" value="Reset" class="button" />
	    </p>
    </form>
    <p id="sign_up"><a href="registration.jsp">Sign up now!</a></p>
</div>
