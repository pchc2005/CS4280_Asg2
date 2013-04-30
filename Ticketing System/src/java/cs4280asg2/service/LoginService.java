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
	Context initCtx = null;
	Context envCtx = null;
	DataSource ds = null;
	Connection con = null;
	ResultSet rs = null;
	try {
	    initCtx = new InitialContext();
	    envCtx = (Context)initCtx.lookup("java:comp/env");
	    ds = (DataSource)envCtx.lookup("jdbc/ticketing_system");
	    con = ds.getConnection();
	    String procedureMember = "{ call getPassword(?) }";
	    String procedureStaff = "{ call getPasswordStaff(?) }";
	    String pw = null;
	    CallableStatement cstmt = null;
	    if (userType.equals("Member")) {
		cstmt = con.prepareCall(procedureMember, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	    }
	    else if (userType.equals("Staff")) {
		cstmt = con.prepareCall(procedureStaff, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	    }
	    if (cstmt != null) {
		cstmt.setString(1, userId);
		rs = cstmt.executeQuery();
		rs.first();
		pw = rs.getString(1);
		boolean status = rs.getBoolean(2);
		if (status) {
		    return false;
		}
		else {
		    rs.updateBoolean("login_status", true);
		}
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
	    } finally {
		try{
		    con.close();
		    rs.close();
		} catch (SQLException se) {
		    se.printStackTrace();
		}
	    }
	} 
}
