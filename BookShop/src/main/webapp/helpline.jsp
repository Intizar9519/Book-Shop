<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helpline Page</title>
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
				<div class="text-success">
					<i class="fa-solid fa-square-phone fa-5x"></i>
				</div>
				<h3>24*7 Service</h3>
				<h4>Help Line Number</h4>
				<h5>+871 8698769023</h5>
				<a href="index.jsp" class="btn btn-primary">Home</a>
			</div>
		</div>
	</div>

	<%
	}
	%>


	<div style="margin-top: 110px">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>