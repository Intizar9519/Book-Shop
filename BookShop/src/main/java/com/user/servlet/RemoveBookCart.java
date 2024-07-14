package com.user.servlet;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DB.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/remove_book")
public class RemoveBookCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		int cid = Integer.parseInt(request.getParameter("cid"));
		CartDAOImpl dao = new CartDAOImpl(DBConnection.getConnection());
		boolean f = dao.deleteBook(bid,uid,cid);
		HttpSession session = request.getSession();
		if(f)
		{
			session.setAttribute("Success","Successfully remove from the Cart");
			response.sendRedirect("cart.jsp");
		}
		else
		{
			session.setAttribute("Failed","something error on server");
			response.sendRedirect("cart.jsp");
		}
		
	}

}
