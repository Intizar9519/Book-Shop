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
<title>Online Book Application</title>
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

	<div class="container-fluid back-img">
		<h2 class="text-center text-white">Online Book Shopping</h2>
	</div>

	<!-- Start Recent Book -->
	<div class="container">
		<h3 class="text-center mt-2 ">Recent Book</h3>
		<div class="row">
			<!-- 1st Element -->
			<%
			BookDAOImpl dao1 = new BookDAOImpl(DBConnection.getConnection());
			List<BookDetails> list1 = dao1.getRecentBook();
			for (BookDetails b1 : list1) {
			%>
			<div class="col-md-3">
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
			<a href="all_recent_books.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
		</div>

	</div>
	<!-- End Recent Book -->
	<hr>

	<!-- Start New Book -->
	<div class="container">
		<h3 class="text-center">New Book</h3>
		<div class="row">
			<!-- 1st Element -->
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnection.getConnection());
			List<BookDetails> list2 = dao2.getNewBook();
			for (BookDetails b2 : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b2.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b2.getBookName()%></p>
						<p><%=b2.getAuthorName()%></p>
						<p>
							Categories:<%=b2.getBookCategory()%></p>
						<div class="row">
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm p-1 ml-2"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b2.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm p-1 ml-2"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>
							<a href="view_books.jsp?bid=<%=b2.getBookId()%>"
								class="btn btn-success btn-sm p-1 ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm p-1 ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b2.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-2">
			<a href="all_new_books.jsp" class="btn btn-danger btn-sm text-white mt-2">View All</a>
		</div>

	</div>
	<!-- End New Book -->
	<hr>

	<!-- Start Old Book -->
	<div class="container">
		<h3 class="text-center">Old Book</h3>
		<div class="row">
			<!-- 1st Element -->
			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnection.getConnection());
			List<BookDetails> list3 = dao3.getOldBook();
			for (BookDetails b3 : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="books/<%=b3.getPhoto()%>"
							style="width: 150px; height: 200px;" class="img-thumblin">
						<p><%=b3.getBookName()%></p>
						<p><%=b3.getAuthorName()%></p>
						<p>
							Categories:<%=b3.getBookCategory()%></p>
						<div class="row">
							<%
							if (user == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm p-1 ml-2"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							} else {
							%>
							<a href="cart?bid=<%=b3.getBookId()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm p-1 ml-2"><i
								class="fa-solid fa-cart-plus"></i> Add Cart</a>
							<%
							}
							%>
							    <a
								href="view_books.jsp?bid=<%=b3.getBookId()%>"
								class="btn btn-success btn-sm p-1 ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm p-1 ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b3.getPrice()%></a>
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


	<div class="mb-1">
	   <%@include file="all_component/footer.jsp"%>
	</div>


</body>
</html>