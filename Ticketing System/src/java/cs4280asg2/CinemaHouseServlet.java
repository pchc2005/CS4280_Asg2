/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

import cs4280asg2.dto.CinemaHouseBean;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class CinemaHouseServlet extends HttpServlet {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;
    CallableStatement cstmt = null;
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
	    String procedureGetMovie = "{ call getMovieHouseDetails }";
	    cstmt = con.prepareCall(procedureGetMovie, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    rs = cstmt.executeQuery();
	    int numRow = 0;
	    CinemaHouseBean[] movieHouseInfo = new CinemaHouseBean[numRow];
	    if (rs != null && rs.last() != false) {
		numRow = rs.getRow();
		rs.beforeFirst();
	    }
	    for (int i = 0; i < numRow && rs != null && rs.next() != false; i++) {
		movieHouseInfo[i].setId(rs.getInt(1));
		movieHouseInfo[i].setName(rs.getString(2));
		movieHouseInfo[i].setSize(rs.getString(3));
		movieHouseInfo[i].setPrice_ratio(rs.getDouble(4));
		movieHouseInfo[i].setRow(rs.getInt(5));
		movieHouseInfo[i].setCol(rs.getInt(6));
		movieHouseInfo[i].setCapacity(rs.getInt(7));
	    }
	    session.setAttribute("MovieHouseInfo", movieHouseInfo);
	    rd = getServletContext().getRequestDispatcher("/index.jsp");
	    rd.forward(request, response);
	    return;
	} catch (NamingException e) {
	    e.printStackTrace();
	} catch (SQLException se) {
	    se.printStackTrace();
	}   finally {
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
