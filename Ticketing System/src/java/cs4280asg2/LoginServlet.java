/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package cs4280asg2;

import cs4280asg2.service.LoginService;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import cs4280asg2.dto.CustomerBean;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author PCHC
 */
public class LoginServlet extends HttpServlet {

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
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/ticketing_system");
	Connection con = ds.getConnection();
	String userName = request.getParameter("UserName");
	String password = request.getParameter("Password");
	String loginType = request.getParameter("login-type");
	PreparedStatement pstmt = con.prepareStatement("SELECT * FROM [Customer] WHERE [login_name] = ?");
	HttpSession session = request.getSession(true);
	if((userName == null ||
	   userName.trim().equals("")) && 
	   (password == null &&
	   password.equals(""))) {
	    session.setAttribute("login", false);
	    response.sendRedirect("index.jsp");
	}
	else {
	    LoginService loginService = new LoginService();
	    RequestDispatcher rd;
	    boolean result = loginService.authenticate(userName, password, loginType);
	    if (loginType.equals("Member")) {
		if (result) {
		    pstmt.setString(1, userName);
		    ResultSet rs = pstmt.executeQuery();
		    
		    CustomerBean memberInfo = new CustomerBean();
		    memberInfo.setLogin_name(rs.getString(2));
		    memberInfo.setName(rs.getString(3));
		    memberInfo.setPhone_no(rs.getInt(4));
		    memberInfo.setAddr(rs.getString(5));
		    memberInfo.setEmail(rs.getString(6));
		    memberInfo.setEmail(rs.getString(7));
		    memberInfo.setCreditcard(rs.getString(8));
		    memberInfo.setLoyalty_pt(rs.getInt(9));
		    session.setAttribute("memberInfo", memberInfo);
		    rd = getServletContext().getRequestDispatcher("/loginSuccess.jsp");
		    rd.forward(request, response);
		    return;
		}
		else {
		    rd = getServletContext().getRequestDispatcher("/index.jsp");
		    rd.forward(request, response);
		    return;
		}
	    }
	    else if (loginType.equals("Staff")) {
		if (result) {
		    session.setAttribute("UserName", userName);
		    response.sendRedirect("loginSuccess.jsp");
		    return;
		}
		else {
		    response.sendRedirect("index.jsp");
		    return;
		}
	    }
	}
	} catch (NamingException e) {
	    e.printStackTrace();
	} catch (SQLException se) {
	    se.printStackTrace();
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
