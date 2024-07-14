<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
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
	<%
	String str1 = (String) session.getAttribute("Error");
	if (str1 != null) {
		out.println("<p class='text-center text-danger'>" + str1 + "</p>");
		session.removeAttribute("Error");
	}
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
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-3">
					<div class="card-body">
						<h3 class="text-center text-primary">Edit Profile</h3>
						<form action="update_profile" method="post">
							<input type="hidden" name="id" value="<%=user.getId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Name*</label> <input type="text"
									name="name" value="<%=user.getName()%>" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email"
									value="<%=user.getEmail()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone Number*</label> <input
									type="number" name="phno" value="<%=user.getPhno()%>"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check"> <label
									class="form-check-label" for="exampleCheck1">Agree
									terms and Conditions</label>
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
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
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>