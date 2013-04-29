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
import cs4280asg2.dto.StaffBean;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author PCHC
 */
public class LoginServlet extends HttpServlet {
	Context initCtx = null;
	Context envCtx = null;
	DataSource ds = null;
	Connection con = null;
	ResultSet rs = null;
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
	    String userName = request.getParameter("UserName");
	    String password = request.getParameter("Password");
	    String loginType = request.getParameter("login-type");
	    String procedureGetMemberInfo = "{ call getMemberInfoByLoginName(?) }";
	    String procedureGetStaffInfo = "{ call getStaffInfoByLoginName(?) }";
	    
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
		    cstmt = con.prepareCall(procedureGetMemberInfo, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    cstmt.setString(1, userName);
		    rs = cstmt.executeQuery();
		    rs.first();
		    CustomerBean memberInfo = new CustomerBean();
		    memberInfo.setId(rs.getInt(1));
		    memberInfo.setLogin_name(rs.getString(2));
		    memberInfo.setName(rs.getString(3));
		    memberInfo.setPhone_no(rs.getInt(4));
		    memberInfo.setAddr(rs.getString(5));
		    memberInfo.setEmail(rs.getString(6));
		    memberInfo.setPassword(rs.getString(7));
		    memberInfo.setCreditcard(rs.getString(8));
		    memberInfo.setLoyalty_pt(rs.getInt(9));
		    session.setAttribute("loginStatus", "member");
		    session.setAttribute("memberInfo", memberInfo);
		}
		else {
		    session.setAttribute("loginStatus", "failed");
		}
		rd = getServletContext().getRequestDispatcher("/index.jsp");
		rd.forward(request, response);
		return;
	    }
	    else if (loginType.equals("Staff")) {
		if (result) {
		    cstmt = con.prepareCall(procedureGetStaffInfo, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
		    cstmt.setString(1, userName);
		    rs = cstmt.executeQuery();
		    rs.first();
		    StaffBean staffInfo = new StaffBean();
		    staffInfo.setLogin_name(rs.getString(1));
		    staffInfo.setPassword(rs.getString(2));
		    staffInfo.setRole(rs.getString(3));
		    session.setAttribute("loginStatus", "staff");
		    session.setAttribute("staffInfo", staffInfo);
		}
		else {
		    session.setAttribute("loginStatus", "failed");
		}
		if (rs.getString(3).equals("Officer")) {
		    rd = getServletContext().getRequestDispatcher("/index.jsp");
		}
		else {
		    rd = getServletContext().getRequestDispatcher("/management.jsp");
		}
		rd.forward(request, response);
		return;
	    }
	}
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
