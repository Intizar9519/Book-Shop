<%@ page import="com.DAO.BookOrderDAOImpl"%>
<%@ page import="com.DB.DBConnection"%>
<%@ page import="com.entity.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2">
	<%@include file="all_component/navbar.jsp"%>


	<%
	User user = (User) session.getAttribute("userObj");
	%>
	<%
	if (user == null) {
		response.sendRedirect("login.jsp");
	} else {
	%>
	<div class="container">
		<h3 class="text-success text-center mt-2">Your Orders</h3>
		<table class="table table-hover bg-white mt-4">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookOrderDAOImpl dao = new BookOrderDAOImpl(DBConnection.getConnection());
				List<Book_Order> list = dao.getBook(user.getEmail());
				for (Book_Order b : list) {
				%>
				<tr>
					<th scope="row"><%=b.getOrderId()%></th>
					<td><%=b.getUserName()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>

				<%
				}
				%>

			</tbody>
		</table>

	</div>

	<%
	}
	%>

	<div style="margin-top: 170px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>