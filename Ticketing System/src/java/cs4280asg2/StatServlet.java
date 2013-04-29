/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

import cs4280asg2.dto.StatBean;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 *
 * @author PCHC
 */
public class StatServlet extends HttpServlet {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;
    CallableStatement cstmt = null;
    String pattern = "yyyy/MM/dd kk:mm:ss";
    SimpleDateFormat format = new SimpleDateFormat(pattern);
    
    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	try {
	    initCtx = new InitialContext();
	    envCtx = (Context)initCtx.lookup("java:comp/env");
	    ds = (DataSource)envCtx.lookup("jdbc/ticketing_system");
	    con = ds.getConnection();
	    HttpSession session = request.getSession(true);
	    String procedureStat = "{ call getStatDetails(?) }";
	    cstmt = con.prepareCall(procedureStat, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            
            /*input*/
	    int reqMovieID = Integer.parseInt(request.getParameter("movieID").toString());
	    cstmt.setInt(1, reqMovieID );
            
	    rs = cstmt.executeQuery();
	    int numRow = 0;
	    
	    if (rs != null && rs.last() != false) {
		numRow = rs.getRow();
		rs.first();
	    }
	    ArrayList<StatBean> statInfo = new ArrayList<StatBean>();
	    for (int i = 0; i < numRow; i++) {
		StatBean sb = new StatBean();
		sb.setSection_id(rs.getInt(1));
		sb.setMovie_house(rs.getString(2));
		sb.setMovie_start(rs.getString(3));
		sb.setTotal_sales(rs.getInt(4));
		statInfo.add(sb);
		rs.next();
	    }
	    session.setAttribute("statInfo", statInfo);
	    
            
            rd = getServletContext().getRequestDispatcher("/statistics.jsp");
            
	    rd.forward(request, response);
	    return;
	} catch (NamingException e) {
	    e.printStackTrace();
	} catch (SQLException se) {
	    se.printStackTrace();
	} finally {
	    try{
		con.close();
		rs.close();
		cstmt.close();
	    } catch (SQLException se) {
		se.printStackTrace();
	    }
	}
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
	return "Short description";
    }// </editor-fold>
}
