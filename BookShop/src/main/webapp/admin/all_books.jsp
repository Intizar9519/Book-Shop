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
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 class="text-center">Hello Admin</h3>
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
	<table class="table table-hover">
		<thead class="bg-primary">
			<tr>
			    <th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Book Categories</th>
				<th scope="col">Book Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		<%
		   BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
		   List<BookDetails> list = dao.getAllBooks();
		   for(BookDetails b : list)
		   {
		%>
			<tr>
				<td><%=b.getBookId()%></td>
				<td><img src="../books/<%=b.getPhoto()%>" style="height:50px; width:50px;"></td>
				<td><%=b.getBookName() %></td>
				<td><%=b.getAuthorName() %></td>
				<td><%=b.getPrice() %></td>
				<td><%=b.getBookCategory() %></td>
				<td><%=b.getStatus() %></td>
				<td>
				  <a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
				  <a href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
				</td>
			</tr>   
	    <% 
		   }
		
		%>
			
		
		</tbody>
	</table>


<div class="mb-1">
<%@include file="footer.jsp" %>
</div>
</body>
</html>