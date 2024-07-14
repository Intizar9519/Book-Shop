package com.user.servlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnection;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update_profile")
public class UpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("phno");
			String password = request.getParameter("password");
			
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phone);
		    HttpSession session = request.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnection.getConnection());
			boolean f = dao.checkPassword(id, password);
			if(f)
			{
				boolean f2 = dao.updateProfile(user);
				if(f2)
				{
					session.setAttribute("Success", "Profile Update Successfully...");
					response.sendRedirect("edit_profile.jsp");
				}
				else
				{
					session.setAttribute("Failed", "Something wrong on server...");
					response.sendRedirect("edit_profile.jsp");
				}
			}
			else
			{
				session.setAttribute("Error", "Your Password is incorrect");
				response.sendRedirect("edit_profile.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}	