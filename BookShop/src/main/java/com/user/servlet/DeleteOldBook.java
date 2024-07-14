package com.user.servlet;

import java.io.IOException; 

import com.DAO.BookDAOImpl;
import com.DB.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			 String em = request.getParameter("em");
			 int id = Integer.parseInt(request.getParameter("id"));
			 BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			 boolean f = dao.oldBookDelete(em,"Old",id);
			 HttpSession session = request.getSession();
				if(f)
				{
					session.setAttribute("Success","Successfully remove Old Book.");
					response.sendRedirect("old_book.jsp");
				}
				else
				{
					session.setAttribute("Failed","something error on server");
					response.sendRedirect("old_book.jsp");
				}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
