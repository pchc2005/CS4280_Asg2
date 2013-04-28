/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

import cs4280asg2.dto.CustomerBean;
import cs4280asg2.dto.SaleBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
public class BuyTicketMemberServlet extends HttpServlet {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;
    CallableStatement cstmtSale = null;
    CallableStatement cstmtRecord = null;
    CallableStatement cstmtVacancy = null;
    CallableStatement getNewSales = null;
    public static final String DATE_FORMAT_NOW = "yyyy-MM-dd HH:mm:ss";
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
	    HttpSession session = request.getSession(false);
	    Calendar cal = Calendar.getInstance();
	    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
	    String currentTime = sdf.format(cal.getTime());
	    String procedureInsertSale = "{ call BuyTicketSale(?, ?) }";
	    String procedureInsertVacancy = "{ call BuyTicketVacancy(?, ?) }";
	    String procedureInsertRecord = "{ call BuyTicketRecord(?, ?, ?, ?) }";
	    String procedureGetNewSale = "{ call getNewSale(?) }";
	    
	    cstmtSale = con.prepareCall(procedureInsertSale, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    cstmtSale.setString(1, currentTime);
	    String sectID = session.getAttribute("sessionID").toString();
	    int reqSectID = Integer.parseInt(sectID);
	    cstmtSale.setInt(2, reqSectID);
	    cstmtSale.execute();
	    
	    getNewSales = con.prepareCall(procedureGetNewSale, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    getNewSales.setInt(1, reqSectID);
	    rs = getNewSales.executeQuery();
	    
	    int numRow = 0;
	    
	    if (rs != null && rs.last() != false) {
		numRow = rs.getRow();
		rs.first();
	    }
	    
	    SaleBean sb = new SaleBean();
	    sb.setSale_id(rs.getInt(1));
	    sb.setSale_time(rs.getString(2));
	    sb.setSection_id(rs.getInt(3));
	    int newSale_id = rs.getInt(1);
	    int seatsCount = Integer.parseInt(session.getAttribute("seatsCount").toString());
	    cstmtVacancy = con.prepareCall(procedureInsertVacancy);
	    cstmtVacancy.setInt(1, newSale_id);
	    cstmtVacancy.setInt(2, seatsCount);
	    cstmtVacancy.execute();
	    
	    String[] seats = (String[]) session.getAttribute("seats");
	    int cust_id;
	    if (session.getAttribute("loginStatus") != null && session.getAttribute("loginStatus") != "failed") {
		CustomerBean cb = (CustomerBean) session.getAttribute("memberInfo");
		cust_id = cb.getId();
	    }
	    else {
		cust_id = 0;
	    }
	    
	    for (int i = 0; i < seatsCount; i++) {
		cstmtRecord = con.prepareCall(procedureInsertRecord);
		String currSeat = seats[i];
		int row = currSeat.substring(0, 1).charAt(0)-'A';
		int col = Integer.parseInt(currSeat.substring(1));
		if (cust_id != 0) {
		    cstmtRecord.setInt(1, cust_id);
		}
		else {
		    cstmtRecord.setNull(1, java.sql.Types.INTEGER);
		}
		cstmtRecord.setInt(2, newSale_id);
		cstmtRecord.setInt(3, row);
		cstmtRecord.setInt(4, col);
		cstmtRecord.execute();
	    }
	    
	    if (session.getAttribute("loginStatus") == "failed" || session.getAttribute("loginStatus") == null) {
		rd = getServletContext().getRequestDispatcher("/index.jsp");
	    }
	    else if (session.getAttribute("loginStatus") == "staff"){
		rd = getServletContext().getRequestDispatcher("/ticketPrint.jsp");
	    }
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
		cstmtSale.close();
		cstmtRecord.close();
		cstmtVacancy.close();
		getNewSales.close();
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
