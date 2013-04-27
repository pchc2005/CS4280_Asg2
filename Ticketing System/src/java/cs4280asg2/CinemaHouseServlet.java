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
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    
    public void init(ServletConfig config) throws ServletException {  
	super.init(config);
        System.out.println("CinemaHouseServlet init");
	try {
	    initCtx = new InitialContext();
	    envCtx = (Context)initCtx.lookup("java:comp/env");
	    ds = (DataSource)envCtx.lookup("jdbc/ticketing_system");
	    con = ds.getConnection();
	    ServletContext service = config.getServletContext();
	    String procedureGetMovie = "{ call getMovieHouseDetails }";
	    cstmt = con.prepareCall(procedureGetMovie, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    rs = cstmt.executeQuery();
	    int numRow = 0;
	    
	    if (rs != null && rs.last() != false) {
		numRow = rs.getRow();
		rs.first();
	    }
	    ArrayList<CinemaHouseBean> movieHouseInfo = new ArrayList<CinemaHouseBean>();
	    for (int i = 0; i < numRow; i++) {
		CinemaHouseBean movieHouse = new CinemaHouseBean();
		movieHouse.setId(rs.getInt(1));
		movieHouse.setName(rs.getString(2));
		movieHouse.setSize(rs.getString(3));
		movieHouse.setPrice_ratio(rs.getDouble(4));
		movieHouse.setRow(rs.getInt(5));
		movieHouse.setCol(rs.getInt(6));
		movieHouse.setCapacity(rs.getInt(7));
		movieHouseInfo.add(movieHouse);
		rs.next();
	    }
	    service.setAttribute("movieHouseInfo", movieHouseInfo);
	    //service.setAttribute("movieHouseInfo2", movieHouseInfo[1]);
	    //service.setAttribute("movieHouseInfo3", movieHouseInfo[2]);
	    //service.setAttribute("movieHouseInfo4", movieHouseInfo[3]);
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
