<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f0f1f2;">
	<%@include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-4">
				<div class="card mt-3">
					<div class="card-body">
						<h4 class="text-center">Login Page</h4>
						<%
						String logout = (String) session.getAttribute("Logout");
						if (logout != null) {
							out.println("<p class='text-center text-danger'>" + logout + "</p>");
							session.removeAttribute("Logout");
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
						<form action="login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="password" class="form-control"
									id="exampleInputPassword1">
							</div>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<div style="margin-top: 130px">
<%@include file="all_component/footer.jsp" %>
</div>
</body>
</html>