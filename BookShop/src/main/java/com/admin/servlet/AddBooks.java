package com.admin.servlet;

import java.io.File; 
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnection;
import com.entity.BookDetails;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add_books")
@MultipartConfig
public class AddBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
	{
		try 
		{
			String name = request.getParameter("name");
			String author = request.getParameter("authorName");
			String price = request.getParameter("price");
			String category = request.getParameter("bookCategory");
			String status = request.getParameter("status");
			Part part = request.getPart("bookImage");
			String fileName = part.getSubmittedFileName();
			
			BookDetails bookDetails = new BookDetails(name,author,price,category,status,fileName,"admin");
			
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			
			/*
			String path = getServletContext().getRealPath("");
			System.out.println(path);
			*/
			
			
			boolean f = dao.addBooks(bookDetails);
			
			HttpSession session = request.getSession();
			
			if(f)
			{
				String path = getServletContext().getRealPath("")+"books";
				File file = new File(path);
				System.out.println(file);
				part.write(path + File.separator + fileName);
				
				session.setAttribute("Success", "Book information add Successfully...");
				response.sendRedirect("admin/all_books.jsp");
			}
			else
			{
				session.setAttribute("Failed", "Something went wrong on server...");
				response.sendRedirect("admin/all_books.jsp");
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
