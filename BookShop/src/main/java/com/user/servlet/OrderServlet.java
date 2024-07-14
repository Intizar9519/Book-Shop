package com.user.servlet;

import java.io.IOException; 
import java.util.*;

import com.DAO.BookOrderDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnection;
import com.entity.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			HttpSession session = request.getSession();
			
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String phone = request.getParameter("mobile");
			String address = request.getParameter("address");
			String landmark = request.getParameter("landmark");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String pincode = request.getParameter("pincode");
			String payment = request.getParameter("payment");
			
			String fullAdd = address+","+landmark+","+city+","+state+","+pincode;
			// System.out.println(id+" "+name+" "+email+" "+phone+" "+address+" "+landmark+" "+city+" "+state+" "+pincode+" "+payment);
			
			CartDAOImpl dao = new CartDAOImpl(DBConnection.getConnection());
			
			List<Cart> list = dao.getBookByUser(id);
			if(list.isEmpty())
			{
				session.setAttribute("NoSelect","Add Items");
			     response.sendRedirect("cart.jsp");
			}
			else
			{
				BookOrderDAOImpl dao2 = new BookOrderDAOImpl(DBConnection.getConnection());
				int i = dao2.getOrderNo();
				Book_Order o = null;
				
				ArrayList<Book_Order> orderList = new ArrayList<Book_Order>();
				for(Cart c : list)
				{
					o = new Book_Order();
					o.setOrderId("BOOK-ORD-00"+i);
					o.setUserName(name);
					o.setEmail(email);
					o.setPhone(phone);
					o.setAddress(fullAdd);
					o.setBookName(c.getBookName());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+" ");
					o.setPaymentType(payment);
					orderList.add(o);
					i++;
					
				}
				
				
				
				if("noselect".equals(payment))
				{ 
					 session.setAttribute("NoSelect","Please Choose Payment Type.");
				     response.sendRedirect("cart.jsp");
				}
				else
				{
					boolean f = dao2.saveOrder(orderList);
					if(f)
					{
						 session.setAttribute("NoSelect","Please Choose Payment Type.");
					     response.sendRedirect("order_success.jsp");
					}
					else
					{
						 session.setAttribute("NoSelect","Your Order Failed.");
					     response.sendRedirect("order_success.jsp");
					}
				}
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();	
		}
	}

}
