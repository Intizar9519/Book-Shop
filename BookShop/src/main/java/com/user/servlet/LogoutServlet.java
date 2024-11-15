package com.user.servlet;

import java.io.IOException; 

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;   
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session1 = request.getSession();
			session1.removeAttribute("userObj");
			
			HttpSession session2 = request.getSession();
			session2.setAttribute("Logout", "Logout Successfully...");  
			response.sendRedirect("login.jsp");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
