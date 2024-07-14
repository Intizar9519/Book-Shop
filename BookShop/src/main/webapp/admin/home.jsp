<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnection"%>
<%@ page import="com.entity.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home Page</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: green;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
	User us = (User) session.getAttribute("userObj");
	%>
	<%
	if (us == null) {
		response.sendRedirect("../login.jsp");
	}else {
	%>
	 
	   <div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							--------------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-success"></i><br>
							<h4>All Books</h4>
							--------------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h4>Order</h4>
							--------------------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3">
				<a href="#" data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-danger"></i><br>
							<h4>Logout</h4>
							--------------------
						</div>
					</div>
				</a>
			</div>
			<!--Start Logout Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle"></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<h4>Do you want to Logout?</h4>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
							<a href="../logout" type="button"
								class="btn btn-primary btn-danger">Logout</a>
						</div>
					</div>
				</div>
			</div>
			<!--End Logout Modal -->


		</div>
	</div>
	<% 	
	}
	%>
	
	<div style="margin-top: 190px">
		<%@include file="footer.jsp"%>
	</div>

</body>
</html>