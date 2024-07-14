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
<title>All Old Books</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("image/book.jpg");
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #fcf7f7;
}
</style>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("userObj");
	%>
	<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center mt-2 ">All Old Books</h3>
		<div class="row">
			<!-- 1st Element -->
			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBConnection.getConnection());
			List<BookDetails> list1 = dao1.getAllOldBook();
			for (BookDetails b1 : list1) {
			%>
			<div class="col-md-3 mt-4">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b1.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b1.getBookName()%></p>
						<p><%=b1.getAuthorName()%></p>
						<p>
							Categories:<%=b1.getBookCategory()%></p>
						<div class="row">
						    <%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm p-1 ml-2"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b1.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm p-1 ml-2"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>
							 
								<a href="view_books.jsp?bid=<%=b1.getBookId()%>"
								class="btn btn-success btn-sm p-1 ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm p-1 ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b1.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

		<div class="text-center mt-2">
			<a href="all_old_books.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
		</div>

	</div>
	<!-- End Old Book -->