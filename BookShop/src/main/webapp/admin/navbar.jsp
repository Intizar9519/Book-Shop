<%@ page import="com.DAO.BookDAOImpl"%>
<%@ page import="com.DB.DBConnection"%>
<%@ page import="com.entity.*"%>
<%@ page import="java.util.List"%>
<div class="container-fluid"
	style="height: 10px; background-color: #303f9f"></div>

<div class="container-fluid p-3 bg-light">
	<div class="row">
		<div class="col-md-3">
			<h3 style="color: #00a900;">
				<i class="fa-solid fa-book"></i> BookShop
			</h3>
		</div>
		<div class="col-md-3">
			<%
			User u = (User) session.getAttribute("userObj");
			%>
			<%
			if (u != null) {
			%>
			<a href="#" class="btn btn-success"><i
				class="fa-solid fa-user-plus"></i> <%=u.getName()%></a> 
				
			<a class="btn btn-danger text-white" data-toggle="modal"
				data-target="#exampleModalCenter"> <i
				class="fa-solid fa-arrow-right-from-bracket"></i> Logout</a>

			<!--Start Logout Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle"></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<h4>Do you want to Logout?</h4>
							<button type="button" class="btn btn-primary"
								data-dismiss="modal">Close</button>
							<a href="../logout" type="button"
								class="btn btn-primary btn-danger">Logout</a>
						</div>
					</div>
				</div>
			</div>
			<!--End Logout Modal -->
			<%
			} else {
			%>
			<a href="../login.jsp" class="btn btn-success"> <i
				class="fa-solid fa-right-to-bracket"></i> Login
			</a> <a href="../register.jsp" class="btn btn-primary"> <i
				class="fa-solid fa-user-plus"></i> Register
			</a>
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
			<li class="nav-item active"><a class="nav-link" href="home.jsp">Admin-Home<span
					class="sr-only">(current)</span></a></li>
		</ul>

	</div>
</nav>