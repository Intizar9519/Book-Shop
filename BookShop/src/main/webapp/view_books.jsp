<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnection"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>
	
	<%
	User user = (User) session.getAttribute("userObj");
	%>
	
    <%
        int bid = Integer.parseInt(request.getParameter("bid"));
        BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
        BookDetails b = dao.getBookById(bid);
    %>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="books/<%=b.getPhoto()%>" style="height: 180px; width: 150px;"><br>
				<h4 class="mt-3">
					Book Name: <span class="text-success"><%=b.getBookName()%></span>
				</h4>
				<h4>
				    Author Name: <span class="text-success"><%=b.getAuthorName()%></span>
				</h4>
				<h4>
				    Category: <span class="text-success"><%=b.getBookCategory() %></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookName()%></h2>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary">
				<i class="fa-solid fa-envelope"></i> Email:<%=b.getUserEmail()%></h5>
				
				<div class="row">

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-money-bill-wave fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-rotate-left fa-3x"></i>
						<p>Return Available</p>
					</div>

					<div class="col-md-4 text-danger text-center p-2">
						<i class="fa-solid fa-truck-fast fa-3x"></i>
						<p>Free Shipping</p>
					</div>

				</div>
				<div class="text-center p-3">
				            <%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-primary"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-primary"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>
					 
						<a href="#" class="btn btn-danger">
						<i class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>