<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Us Page</title>
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
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center">
				<div class="text-primary">
					<i class="fa-solid fa-envelope fa-4x"></i>
				</div>
				<h3>Admin@gmail.com</h3>
				<br> <br>

				<div class="text-success">
					<i class="fa-solid fa-square-phone fa-4x"></i>
				</div>
				<h3>+871 8698769087</h3>
				<br> <br>

				<div class="text-danger">
					<i class="fa-solid fa-location-dot fa-4x"></i>
				</div>
				<h3>Greater Noida</h3>
				<br> <br> <a href="index.jsp"
					class="btn btn-primary btn-lg">Home</a>
			</div>
		</div>
	</div>

	<%
	}
	%>






	<div class="mb-1">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>