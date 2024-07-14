<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.entity.BookDetails"%>
<%@ page import="com.DB.DBConnection"%>
<%@ page import="java.lang.Number"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admins:Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body style="background-color: #f0f2f2;">
	<%@include file="navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						<%
						String str2 = (String) session.getAttribute("Failed");
						if (str2 != null) {
							out.println("<p class='text-center text-danger'>" + str2 + "</p>");
							session.removeAttribute("Failed");
						}
						String str3 = (String) session.getAttribute("Success");
						if (str3 != null) {
							out.println("<p class='text-center text-success'>" + str3 + "</p>");
							session.removeAttribute("Success");
						}
						%>
						
						<%
						  int id = Integer.parseInt(request.getParameter("id"));
						  BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
						  BookDetails b = dao.getBookById(id);
						%>
						<form action="../editbooks" method="post">
						    <input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" name="name" class="form-control"
									value="<%=b.getBookName()%>" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" name="authorName" class="form-control"
									value="<%=b.getAuthorName()%>" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" name="price" class="form-control" name="price"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>

							<div class="form-group">
								<label>Book Categories*</label> <select class="form-control"
									name="bookCategory">
									<option selected>--select--</option>
									<option value="Old">Old Book</option>
									<option value="New">New Book</option>
								</select>
							</div>

							<div class="form-group">
								<label>Book Status*</label> <select class="form-control"
									name="status">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>
								</select>
							</div>

							<button type="submit" class="btn btn-primary">Update</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>