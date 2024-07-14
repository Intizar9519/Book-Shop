package com.admin.servlet;

import java.io.IOException;  
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.DB.DBConnection;
import com.entity.BookDetails;
import com.DAO.BookDAOImpl;

import jakarta.servlet.annotation.WebServlet;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String author = request.getParameter("authorName");
			String price = request.getParameter("price");
			String category = request.getParameter("bookCategory");
			String status = request.getParameter("status");
			
			BookDetails b = new BookDetails();
			b.setBookId(id);
			b.setBookName(name);
			b.setAuthorName(author);
			b.setBookCategory(category);
			b.setStatus(status);
			b.setPrice(price);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session = request.getSession();
			if(f)
			{
				session.setAttribute("Success", "Book information Update Successfully...");
				response.sendRedirect("admin/all_books.jsp");
			}
			else
			{
				session.setAttribute("Failed", "Something went wrong on server...");
				response.sendRedirect("admin/all_books.jsp");
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
