<%@page import="model.ProductServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
	
	

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.5.0.min.js"></script>
<script src="Components/Product.js"></script>



<style type="text/css">
html {
	position: relative;
	min-height: 100%;
}

body {
	padding-top: 4.5rem;
	margin-bottom: 4.5rem;
}

.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 3.5rem;
	line-height: 3.5rem;
	background-color: #ccc;
}

.nav-link:hover {
	transition: all 0.4s;
}

.nav-link-collapse:after {
	float: right;
	content: '\f067';
	font-family: 'FontAwesome';
}

.nav-link-show:after {
	float: right;
	content: '\f068';
	font-family: 'FontAwesome';
}

.nav-item ul.nav-second-level {
	padding-left: 0;
}

.nav-item ul.nav-second-level>.nav-item {
	padding-left: 20px;
}

@media ( min-width : 992px) {
	.sidenav {
		position: absolute;
		top: 0;
		left: 0;
		width: 230px;
		height: calc(100vh - 3.5rem);
		margin-top: 3.5rem;
		background: #343a40;
		box-sizing: border-box;
		border-top: 1px solid rgba(0, 0, 0, 0.3);
	}
	.navbar-expand-lg .sidenav {
		flex-direction: column;
	}
	.content-wrapper {
		margin-left: 230px;
	}
	.footer {
		width: calc(100% - 230px);
		margin-left: 230px;
	}
}
</style>

</head>
<body style="background-color: #f0f0f0">

	<!-- Navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top bg-dark">
		<a class="navbar-brand" href="#">GadgetBadget</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav mr-auto sidenav" id="navAccordion">
				<li class="nav-item ml-3"><a class="nav-link"
					href="AdminPanel.jsp">Home </a></li>
				<li class="nav-item ml-3"><a class="nav-link nav-link-collapse"
					href="#" id="hasSubItems" data-toggle="collapse"
					data-target="#collapseSubItems2" aria-controls="collapseSubItems2"
					aria-expanded="false">User Details</a></li>
				<li class="nav-item ml-3"><a
					class="nav-link nav-link-collapse" href="#" id="hasSubItems"
					data-toggle="collapse" data-target="#collapseSubItems3"
					aria-controls="collapseSubItems3" aria-expanded="false">Project
						Details<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active ml-3"><a
					class="nav-link nav-link-collapse" href="#" id="hasSubItems"
					data-toggle="collapse" data-target="#collapseSubItems4"
					aria-controls="collapseSubItems4" aria-expanded="false">Product
						Details<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item ml-3"><a
					class="nav-link nav-link-collapse" href="#" id="hasSubItems"
					data-toggle="collapse" data-target="#collapseSubItems3"
					aria-controls="collapseSubItems3" aria-expanded="false">Funder
						Details<span class="sr-only">(current)</span>
				</a></li>
			</ul>
			<form class="form-inline ml-auto mt-2 mt-md-0">
				<li class="mr-3" style="list-style-type: none;"><a
					style="text-decoration: none; color: white" data-toggle="modal"
					data-target="#exampleModal" class="nav-lin" href=""></span> Sign Up</a></li>
				<li style="list-style-type: none;"><a
					style="text-decoration: none; color: white" class="nav-lin" href=""></span>
						Login</a></li>
			</form>
		</div>
	</nav>

	<main class="content-wrapper">
		<div class="container-fluid">
			<section class="mt-3">
				<div class="container">
					<h2 class="mb-3">Add Product Details</h2>
					<form class="row g-3 needs-validation" id="Product" name="Product">
						<input type="hidden" id="product_Id" name="product_Id">
						<div class="col-md-6 mb-3">
							<label for="validationCustom01" class="form-label">Product
								Name</label> <input type="text" class="form-control" id="product_Name"
								name="product_Name" placeholder="Product Name">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationCustom02" class="form-label">Product
								Category</label> <input type="text" class="form-control"
								id="product_Category" name="product_Category" placeholder="Product Category">
						</div>
						<div class="col-md-6 mb-3">
							<label for="validationCustom03" class="form-label">Price</label>
							<input type="text" class="form-control" id="product_Price" name="product_Price" placeholder="Price">
						</div>
						<div class="col-md-6">
							<label for="validationCustom04" class="form-label">
								Description</label>
							<textarea id="product_Description" name="product_Description" type="text"
								class="md-textarea form-control" rows="5"
								placeholder="Description"></textarea>
						</div>
						
						<!-- <div class="col-md-6 mb-3">
							<label for="validationCustom03" class="form-label">Select</label>
							<select class="form-select form-control"
								aria-label="Default select example">
								<option selected>Open this select menu</option>
								<option value="1">One</option>
								<option value="2">Two</option>
								<option value="3">Three</option>
							</select>
						</div> -->

						<div class="mt-3 ml-3">
							<div id="alertSuccess" class="alert alert-success"></div>
							<div id="alertError" class="alert alert-danger"></div>
						</div> 
						

						<div class="col-12 mt-3 mb-5">
							<button class="btn btn-primary float-right" id="btnSave" name="btnSave" type="button">Save
								Product</button>
							
						</div>
					</form>

					<br> 
			
			<div class="container" id="ProductGrid">
				<fieldset>
					<legend><b>View Order Details</b></legend>
					<form method="post" action="Product.jsp" class="table table-striped">
						<%
						    ProductServlet Product = new ProductServlet();
							out.print(Product.readProducts());
						%>
					</form>
					<br>
				</fieldset>
			</div>

				</div>
			</section>
		</div>
	</main>

	<footer class="footer bg-dark">
		<div class="container">
			<div class="text-center text-light">
				<span>Create by , <span style="color: #87CEEB;">PAF Team</span>
					2021
				</span>
			</div>
		</div>
	</footer>
	<!-- Navbar -->

	<!-- login modal -->

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Sign Up</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>

<script src="Components/project.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('.nav-link-collapse').on('click', function() {
				$('.nav-link-collapse').not(this).removeClass('nav-link-show');
				$(this).toggleClass('nav-link-show');
			});
		});
	</script>

</body>
</html>