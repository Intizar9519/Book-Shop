package com.user.servlet;

import java.io.IOException; 

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnection;
import com.entity.BookDetails;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int bid = Integer.parseInt(request.getParameter("bid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			BookDetails b = dao.getBookById(bid);
			
			Cart c = new Cart();
			c.setBid(bid);
			c.setUid(uid);
			c.setBookName(b.getBookName());
			c.setAuthor(b.getAuthorName());
			c.setPrice(Double.parseDouble(b.getPrice()));
			c.setTotal_price(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao2 = new CartDAOImpl(DBConnection.getConnection());
			boolean f = dao2.addCart(c);
			
			HttpSession session = request.getSession();
			
			if(f) 
			{
				session.setAttribute("addCart", "Book Added to Cart");
				response.sendRedirect("all_recent_books.jsp");
			}
			else 
			{
				session.setAttribute("Failed", "Somthing Error On Server");
				response.sendRedirect("all_recent_books.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}

}
