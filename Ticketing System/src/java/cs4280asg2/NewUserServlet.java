/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

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
import javax.sql.DataSource;

/**
 *
 * @author PCHC
 */
public class NewUserServlet extends HttpServlet {
    Context initCtx = null;
    Context envCtx = null;
    DataSource ds = null;
    Connection con = null;
    ResultSet rs = null;
    RequestDispatcher rd = null;
    CallableStatement addsection = null;
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
	   
            String userName= request.getParameter("sign-UserName").toString();
            String name= request.getParameter("sign-Name").toString();
	    int phoneNo= Integer.parseInt(request.getParameter("Phone").toString());
            String address= request.getParameter("addr").toString();
            String email= request.getParameter("sign-Email").toString();
            String password= request.getParameter("signPassword").toString();
            int creditcard= Integer.parseInt(request.getParameter("creditCard").toString());
            
            
	    String procedureAddUser = "{ call addNewUser(?, ?, ?, ?, ?, ?, ?) }";

	    addsection = con.prepareCall(procedureAddUser);

	    
	    addsection.setString(1, userName);
            addsection.setString(2, name);
            addsection.setInt(3, phoneNo);
            addsection.setString(4, address);
            addsection.setString(5, email);
            addsection.setString(6,password);
            addsection.setInt(7,creditcard);

	    addsection.execute();

            rd = getServletContext().getRequestDispatcher("/index.jsp");
            
	    rd.forward(request, response);
	    return;
	} catch (NamingException e) {
	    e.printStackTrace();
	} catch (SQLException se) {
	    se.printStackTrace();
	} finally {
	    try{
		con.close();
		addsection.close();

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
