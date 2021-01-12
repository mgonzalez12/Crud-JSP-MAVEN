<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de clientes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
</head>
<body>

	<div class="container mt-5">
		<div class="row">
			<div class="card">
				<div class="card-body">
					<jsp:include  page="comunes/cabecera.jsp" />
					<section id="actions" class="py-4 mb-4 bg-light">
						<div class="container">
							<div class="row">
								<div class="col-md-3">
									<a href="#" class="btn btn-primary btn-block"
										data-bs-toggle="modal" data-bs-target="#agregarClienteModal">
										 <i class="fas fa-plus"></i>Agregar Cliente 
									 </a>
								</div>
							</div>
						</div>
					</section>
					
					<jsp:include page="comunes/listadoCliente.jsp" /> 
					
					<jsp:include page="/agregarCliente.jsp" /> 
				</div>
			</div>

		</div>
	</div>

<style>
body{background-color:#f1f1f1;}
</style>
</body>
</html>