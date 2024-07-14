package com.user.servlet;

import java.io.IOException;  
import java.sql.Connection;

import com.DAO.*;
import com.DB.DBConnection;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
	{
		
		try {
			// get data from login.jsp page
			String myEmail = request.getParameter("email");
		    String myPass = request.getParameter("password");
			
			UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());
			HttpSession session = request.getSession();
			
			if("admin@gmail.com".equals(myEmail) && "admin".equals(myPass))
		    {
				User us = new User();
				us.setName("Admin");
				session.setAttribute("userObj",us);
				response.sendRedirect("admin/home.jsp");
		    }
			else 
			{
	            User us = dao.login(myEmail,myPass);
	            if(us!=null)
	            {
	            	session.setAttribute("userObj",us);
					response.sendRedirect("index.jsp");
	            }
	            else
	            {
	            	session.setAttribute("Failed","Email and Password Invailid.");
					response.sendRedirect("login.jsp");
	            }
	             
            }
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
