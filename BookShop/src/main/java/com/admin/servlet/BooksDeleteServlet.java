package com.admin.servlet;

import java.io.IOException;  
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.DAO.BookDAOImpl;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			boolean f = dao.deleteBooks(id);
			
			HttpSession session = request.getSession();
			if(f)
			{
				session.setAttribute("Success", "Book Delete Successfully...");
				response.sendRedirect("admin/all_books.jsp");
			}
			else
			{
				session.setAttribute("Failed", "Something went wrong on server...");
				response.sendRedirect("admin/all_books.jsp");
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
