/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

import cs4280asg2.dto.RefundBean;
import cs4280asg2.dto.TransactionBean;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
public class RefundRequestServlet extends HttpServlet {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;
    CallableStatement addRefund = null;
    CallableStatement delSaleRecVac = null;
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
	    String procedureAddRefund = "{ call addRefund(?, ?, ?, ?, ?, ?, ?, ?, ?) }";
	    String procedureDelSaleRecVac = "{ call delSaleRecVac(?) }";
	    HttpSession sess = request.getSession(true);
	    String custName = request.getParameter("reqCustName");
	    TransactionBean tb = (TransactionBean) sess.getAttribute("refundReq");
	    
	    addRefund = con.prepareCall(procedureAddRefund, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    addRefund.setInt(1, tb.getTrans_id());
	    addRefund.setString(2, tb.getSale_time());
	    addRefund.setString(3, tb.getHouse_name());
	    addRefund.setString(4, tb.getMovie_name());
	    addRefund.setString(5, tb.getMovie_start());
	    addRefund.setInt(6, tb.getVacancy_sold());
	    addRefund.setDouble(7, tb.getTotal_price());
	    addRefund.setBoolean(8, false);
	    addRefund.setString(9, custName);
	    
	    addRefund.execute();
	    
	    delSaleRecVac = con.prepareCall(procedureDelSaleRecVac);
	    delSaleRecVac.setInt(1, tb.getTrans_id());
	    delSaleRecVac.execute();
	    
            rd = getServletContext().getRequestDispatcher("/MyTrans");
            
	    rd.forward(request, response);
	    return;
	} catch (NamingException e) {
	    e.printStackTrace();
	} catch (SQLException se) {
	    se.printStackTrace();
	} finally {
	    try{
		con.close();
		addRefund.close();

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
