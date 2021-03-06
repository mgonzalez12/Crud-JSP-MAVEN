<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editar de clientes</title>
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
					<jsp:include page="../comunes/cabecera.jsp" />

					<form
						action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&idCliente=${cliente.idCliente}"
						method="post" class="was-validated">

						<section id="details">
							<div class="container">
								<div class="row">
									<div class="col">
										<div class="card">
											<div class="card-header">
												<h4>Editar Cliente</h4>
											</div>
											<div class="card-body">
												<div class="form-group">
													<label for="nombre">Nombre</label> <input type="text"
														name="nombre" class="form-control" required value="${cliente.nombre}">
												</div>
												<div class="form-group">
													<label for="apellido">Apellido</label> <input type="text"
														name="apellido" class="form-control" required value="${cliente.apellido}">
												</div>
												<div class="form-group">
													<label for="email">Email</label> <input type="email"
														name="email" class="form-control" required value="${cliente.email}">
												</div>
												<div class="form-group">
													<label for="telefono">Telefono</label> <input type="text"
														name="telefono" class="form-control" required value="${cliente.telefono}">
												</div>
												<div class="form-group">
													<label for="saldo">Saldo</label> <input type="text"
														name="saldo" class="form-control" required value="${cliente.saldo}">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</section>


						<jsp:include page="../comunes/botonesEditar.jsp" />
					</form>



				</div>
			</div>

		</div>
	</div>

	<style>
body {
	background-color: #f1f1f1;
}
</style>
</body>
</html>