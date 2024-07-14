<%@ page import="com.DAO.*"%>
<%@ page import="com.DB.DBConnection"%>
<%@ page import="com.entity.*"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
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
	String str1 = (String) session.getAttribute("NoSelect");
	if (str1 != null) {
		out.println("<h3 class='text-center text-danger'>" + str1 + "</h3>");
		session.removeAttribute("NoSelect");
	}
	String str2 = (String) session.getAttribute("Failed");
	if (str2 != null) {
		out.println("<h3 class='text-center text-danger'>" + str2 + "</h3>");
		session.removeAttribute("Failed");
	}
	String str3 = (String) session.getAttribute("Success");
	if (str3 != null) {
		out.println("<h3 class='text-center text-success'>" + str3 + "</h3>");
		session.removeAttribute("Success");
	}
	%>



	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">

						<h3 class="text-center text-success">Your Selected Item</h3>

						<table class="table table-hover bg-white">
							<thead>
								<tr>
									<th scope="col">BookName</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								Double totalPrice = 0.00;
								CartDAOImpl dao = new CartDAOImpl(DBConnection.getConnection());
								List<Cart> list = dao.getBookByUser(user.getId());

								for (Cart c : list) {
									totalPrice = c.getTotal_price();
								%>
								<tr>
									<td><%=c.getBookName()%></td>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a
										href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-small btn-danger">Remove</a></td>
								</tr>
								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for Order</h3>
						<form action="order" method="post">
							<input type="hidden" name="id" value="<%=user.getId()%>">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										name="name" value="<%=user.getName()%>" class="form-control"
										id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										name="email" value="<%=user.getEmail()%>" class="form-control"
										id="inputPassword4" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile Number</label> <input
										type="number" name="mobile" value="<%=user.getPhno()%>"
										class="form-control" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										name="address" value="<%=user.getAddress()%>"
										class="form-control" id="inputPassword4" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										name="landmark" class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input type="text"
										name="city" value="<%=user.getCity()%>" class="form-control"
										id="inputPassword4" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										name="state" class="form-control" id="inputEmail4" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin Code</label> <input type="text"
										name="pincode" class="form-control" id="inputPassword4"
										required>
								</div>
							</div>

							<div class="form-group">
								<label>Payment Mode</label> <select class="form-control"
									name="payment">
									<option value="noselect">--Select--</option>
									<option value="cod">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>


						</form>
					</div>
				</div>
			</div>


		</div>
	</div>

	<%
	}
	%>





</body>
</html>