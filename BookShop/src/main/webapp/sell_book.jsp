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
<title>Sell Books</title>
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
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">

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

						<form action="add_old_book" method="post"
							enctype="multipart/form-data">
							<input type="hidden" value="<%=user.getEmail()%>" name="user">

							<h3 class="text-center text-primary">Sell Books</h3>
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" name="name" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" name="authorName" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" name="price" class="form-control" name="price"
									id="exampleInputPassword1">
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo</label> <input
									type="file" name="bookImage" class="form-control-file"
									id="exampleFormControlFile1">
							</div>

							<button type="submit" class="btn btn-primary">Sell Book</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>

<div class="mb-1">
<%@include file="all_component/footer.jsp" %>
</div>
</body>
</html>