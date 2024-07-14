package com.user.servlet;

import java.io.IOException;      

import com.DAO.UserDAOImpl;
import com.DB.DBConnection;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			// data get from users or register.jsp page 
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phno = request.getParameter("phno");
			String password = request.getParameter("password");
			String check = request.getParameter("check");
			
			// data set into the database or User.java class 
			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			user.setPassword(password);
			
			// Message print Using HttpSession on register.jsp page
			HttpSession session = request.getSession();
			
			if(check!=null)
			{
				// Execute the data on database
				UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());
				
				boolean f2 = dao.checkUser(email);
				if(f2)
				{
					boolean f = dao.userRegister(user);
					if(f)
					{
						// Message Print on console using system.out.println(); method
						// System.out.println("User Register Successfully...");
						session.setAttribute("Success", "User Register Successfully...");
						response.sendRedirect("register.jsp");
					}
					else {
						// System.out.println("Something went wrong on server...");
						session.setAttribute("Failed", "Something went wrong on server...");
						response.sendRedirect("register.jsp");
					}
				}
				else
				{
					session.setAttribute("Failed", "User already Exist try another email id.");
					response.sendRedirect("register.jsp");
				}
			}
			else
			{
				// System.out.println("Please check terms & Conditions.");
				session.setAttribute("Error", "Please check terms & Conditions.");
				response.sendRedirect("register.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
