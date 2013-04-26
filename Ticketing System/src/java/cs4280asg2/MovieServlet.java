/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import cs4280asg2.dto.MovieBean;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.naming.NamingException;
/**
 *
 * @author 52168666
 */
public class MovieServlet extends HttpServlet{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, NamingException, SQLException {
	
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/ticketing_system");
	Connection con = ds.getConnection();
        
        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = stmt.executeQuery("SELECT * FROM [Movie]");
        
        while (rs != null && rs.next() != false) {
            int numRow = rs.getRow();
            rs.first();
            MovieBean[] mbs = new MovieBean[numRow];
            for (int i = 0; i < numRow; i++) {
                mbs[i].setId(rs.getInt(1));
                mbs[i].setName(rs.getString(2));
                mbs[i].setDuration(rs.getInt(3));
                mbs[i].setSynposis(rs.getString(7));
                mbs[i].setPosterURL(rs.getString(8));
            }
        }
    }
}
