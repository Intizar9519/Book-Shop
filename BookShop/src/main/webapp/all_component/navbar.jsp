<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnection"%>
<%@ page import="com.entity.*"%>
<%@ page import="com.entity.*"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<%
	User u = (User) session.getAttribute("userObj");
%>
<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3">
			<h3 style="color:#00a900;">
			<i class="fa-solid fa-book"></i> BookShop</h3>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-1" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-success" type="submit">
				<i class="fa-solid fa-magnifying-glass"></i> Search</button>
			</form>
		</div>
         <div class="col-md-3">
		<%
		   if(u!=null)
		   {
		%>
		       
		        <a href="cart.jsp"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
				<a href="#" class="btn btn-success">
				<i class="fa-solid fa-user-plus"></i> <%=u.getName()%></a> 
				<a href="logout" class="btn btn-danger">
				<i class="fa-solid fa-right-from-bracket"></i> Logout</a>
			  
		<%    
		   } 
		   else
		   {
		%>	   
			   
				<a href="login.jsp" class="btn btn-success">
				<i class="fa-solid fa-right-to-bracket"></i> Login</a> 
				<a href="register.jsp" class="btn btn-primary">
				<i class="fa-solid fa-user-plus"></i> Register</a>
			   
		<% 
		   }
		%>
        </div>
	</div>
</div>


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home<span
					class="sr-only">(current)</span></a></li>
			<li class="nav-item active"><a class="nav-link" href="all_recent_books.jsp"><i
					class="fa-solid fa-book-open"></i> Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_new_books.jsp"><i class="fa-solid fa-book-open"></i> New Book</a></li>
			<li class="nav-item active"><a class="nav-link disabled"
				href="all_old_books.jsp"><i class="fa-solid fa-book-open"></i> Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0 active" type="submit">
				<i class="fa-solid fa-gear"></i> Setting
			</a>
			<a href="contact.jsp" class="btn btn-light my-2 my-sm-0 active ml-1" type="submit">
				<i class="fa-solid fa-square-phone"></i> Contact Us
			</a>
		</form>
	</div>
</nav>