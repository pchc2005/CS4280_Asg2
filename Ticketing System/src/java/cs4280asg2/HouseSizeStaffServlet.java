/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

import cs4280asg2.dto.SessionHouseBean;
import cs4280asg2.dto.UnavaiSeatsBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class HouseSizeStaffServlet extends HttpServlet {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;
    CallableStatement cstmt = null;
    CallableStatement checkSeats = null;
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
	    String procedureGetSession = "{ call getHouseSizeBySectID(?) }";
	    String procedureCheckSeats = "{ call getUnavailableSeats(?) }";
	    cstmt = con.prepareCall(procedureGetSession, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    String[] strSectID = (String[]) request.getAttribute("movieSession");
	    int[] reqSectID;
	    for (int i = 0; i < strSectID.length; i++) {
		reqSectID = Integer.parseInt(request.getParameter("section").toString());
	    }
	    
	    cstmt.setInt(1, reqSectID);
	    rs = cstmt.executeQuery();
	    rs.first();
	    SessionHouseBean shb = new SessionHouseBean();
	    shb.setSession_id(rs.getInt(1));
	    shb.setHouse_row(rs.getInt(2));
	    shb.setHouse_col(rs.getInt(3));
	    session.setAttribute("sessionHouseName", rs.getString(4));
	    session.setAttribute("sessionMovieID", rs.getInt(5));
	    shb.setDiscount(rs.getDouble(6));
	    
	    checkSeats = con.prepareCall(procedureCheckSeats, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    checkSeats.setInt(1, reqSectID);
	    rs = checkSeats.executeQuery();
	    
	    int numRow = 0;
	    if (rs != null && rs.last() != false) {
		numRow = rs.getRow();
		rs.first();
		ArrayList<UnavaiSeatsBean> unavaiSeatsInfo = new ArrayList<UnavaiSeatsBean>();
		for (int i = 0; i < numRow; i++) {
		    UnavaiSeatsBean unavaiSeats = new UnavaiSeatsBean();
		    String row = String.valueOf(Character.toChars('A' + rs.getInt(1)));
		    String col = rs.getString(2);
		    unavaiSeats.setSeat(row + col);
		    //unavaiSeats.setRow(rs.getInt(1));
		    //unavaiSeats.setCol(rs.getInt(2));
		    unavaiSeatsInfo.add(unavaiSeats);
		    rs.next();
		}
		session.setAttribute("unavaiSeatsInfo", unavaiSeatsInfo);
		session.setAttribute("unavaiSeatsNo", numRow);
	    }
	    
	    session.setAttribute("unavaiSeatsNo", numRow);
	    session.setAttribute("sessionHouseSize", shb);
	    session.setAttribute("sessionID", reqSectID);
	    rd = getServletContext().getRequestDispatcher("/booking_next.jsp");
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
		checkSeats.close();
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
