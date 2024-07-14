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
<title>User: Old Book</title>
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
		<h3 class="text-success text-center mt-2">Your Old Book</h3>
		<table class="table table-hover bg-white mt-4">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				String email = user.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
				List<BookDetails> list = dao.getBookByOld(email, "Old");
				for (BookDetails b1 : list) {
				%>
				<tr>
					<td><%=b1.getBookName()%></td>
					<td><%=b1.getAuthorName()%></td>
					<td><%=b1.getPrice()%></td>
					<td><%=b1.getBookCategory()%></td>
					<td><a
						href="delete_old_book?em=<%=email%>&&id=<%=b1.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>

				</tr>

				<%
				}
				%>

			</tbody>
		</table>

	</div>

	<%
	}
	%>




	<div class="mb-1">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>