/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

import cs4280asg2.dto.TransactionBean;
import cs4280asg2.dto.RefundBean;
import cs4280asg2.dto.CustomerBean;
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
public class MyTransServlet extends HttpServlet {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;
    CallableStatement getTrans = null;
    CallableStatement getRefund = null;
    public final static long SECOND_MILLIS = 1000;
    public final static long MINUTE_MILLIS = SECOND_MILLIS*60;
    public final static long HOUR_MILLIS = MINUTE_MILLIS*60;
    public final static long DAY_MILLIS = HOUR_MILLIS*24;
    public final static long YEAR_MILLIS = DAY_MILLIS*365;
    
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
	    String procedureGetTrans = "{ call getSaleDetails(?) }";
	    String procedureGetRefund = "{ call getRefundDetails(?) }";
	    HttpSession sess = request.getSession(true);
	    CustomerBean cb = (CustomerBean) sess.getAttribute("memberInfo");
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    int custID = cb.getId();
	    String custName = cb.getName();
	    
	    getTrans = con.prepareCall(procedureGetTrans, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    getTrans.setInt(1, custID);
	    rs = getTrans.executeQuery();
	    int numRow = 0;
	    
	    if (rs != null && rs.last() != false) {
		numRow = rs.getRow();
		rs.first();
	    }
	    ArrayList<TransactionBean> transInfo = new ArrayList<TransactionBean>();
	    for (int i = 0; i < numRow; i++) {
		TransactionBean tb = new TransactionBean();
		boolean refundable = false;
		String sale_time = rs.getString(2);
		String movie_start = rs.getString(5);
		Date sale = sdf.parse(sale_time);
		Date start = sdf.parse(movie_start);
		Calendar calSale = Calendar.getInstance();
		calSale.setTime(sale);
		Calendar calStart = Calendar.getInstance();
		calStart.setTime(start);
		Calendar calNow = Calendar.getInstance();
		Date now = calNow.getTime();
		int result = start.compareTo(now);
		if (result > 0) {
		    //movie start time greater than sale time
		    long diff = start.getTime()- now.getTime();
		    long diffHours = diff / (60*60*1000);
		    if (diffHours >= 3) {
			refundable = true;
		    }
		}
		else {
		    refundable = false;
		}
		tb.setTrans_id(rs.getInt(1));
		tb.setSale_time(rs.getString(2));
		tb.setHouse_name(rs.getString(3));
		tb.setMovie_name(rs.getString(4));
		tb.setMovie_start(rs.getString(5));
		tb.setVacancy_sold(rs.getInt(6));
		tb.setTotal_price(rs.getDouble(7));
		tb.setRefundable(refundable);
		transInfo.add(tb);
		rs.next();
	    }
	    
	    sess.setAttribute("transInfo", transInfo);
	    
	    getRefund = con.prepareCall(procedureGetRefund, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
	    getRefund.setString(1, custName);
	    rs = getRefund.executeQuery();
	    if (rs != null && rs.last() != false) {
		numRow = rs.getRow();
		rs.first();
	    }
	    else {
		numRow = 0;
	    }
	    if (numRow != 0) {
		ArrayList<RefundBean> refundInfo = new ArrayList<RefundBean>();
		for (int i = 0; i < numRow; i++) {
		    RefundBean rb = new RefundBean();
		    rb.setTrans_id(rs.getInt(1));
		    rb.setSale_time(rs.getString(2));
		    rb.setHouse_name(rs.getString(3));
		    rb.setMovie_name(rs.getString(4));
		    rb.setMovie_start(rs.getString(5));
		    rb.setVacancy_sold(rs.getInt(6));
		    rb.setTotal_price(rs.getDouble(7));
		    rb.setIs_authorized(rs.getBoolean(8));
		    rb.setCustomer_name(rs.getString(9));
		    refundInfo.add(rb);
		    rs.next();
		}
		sess.setAttribute("refundInfo", refundInfo);
	    }
            rd = getServletContext().getRequestDispatcher("/WEB-INF/privilege/transaction.jsp");
            
	    rd.forward(request, response);
	    return;
	} catch (NamingException e) {
	    e.printStackTrace();
	} catch (SQLException se) {
	    se.printStackTrace();
	} catch (ParseException pe) {
	    pe.printStackTrace();
	} finally {
	    try{
		con.close();
		getTrans.close();

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
