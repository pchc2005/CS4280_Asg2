/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author PCHC
 */
public class LoginService {
    
    public boolean authenticate(String userId, String password, String userType){
	try {
	    Context initCtx = new InitialContext();
	    Context envCtx = (Context)initCtx.lookup("java:comp/env");
	    DataSource ds = (DataSource)envCtx.lookup("jdbc/ticketing_system");
	    Connection con = ds.getConnection();
	    String procedureMember = "{ call getPassword(?) }";
	    String procedureStaff = "{ call getPasswordStaff(?) }";
	    String pw = null;
	    CallableStatement cstmt = null;
	    if (userType.equals("Member")) {
		cstmt = con.prepareCall(procedureMember, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    }
	    else if (userType.equals("Staff")) {
		cstmt = con.prepareCall(procedureStaff, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    }
	    if (cstmt != null) {
		cstmt.setString(1, userId);
		ResultSet rs = cstmt.executeQuery();
		rs.first();
		pw = rs.getString(1);
		if (!pw.equals(password)) {
		    return false;
		}
		return true;
	    }
	    else {
		return false;
	    }
	    } catch (NamingException e) {
		return false;
	    } catch (SQLException e) {
		return false;
	    }
	} 
}
